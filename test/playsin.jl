using Base.Test
using Bebop

const duration = 2

const sampRate = 44100f0
# the A above middle C
const musicFreq = 440.0

const t = [1:duration * 44100] / sampRate
const xmono = sin(2 * pi * musicFreq * t)
const xstereo = [xmono'; xmono']

println(size(xstereo))

initialize() do
    openStream(sampRate, 2, Float32) do stream
        writeStream(stream, xstereo)
    end
end
