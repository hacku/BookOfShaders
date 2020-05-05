{
    name = "02 - Uniforms",

    options =
    {
        USE_COLOR = { true },
        USE_LIGHTING = { true },
        STANDARD = { true },
        PHYSICAL = { true },
        USE_ENVMAP = { false, {"envMap"} },
        SELECTION_MODE = { true },
    },

    properties =
    {
        {"envMap", "cubeTexture", "nil" },
        {"_time", "float", "0.0" },
    },

    pass =
    {
        base = "Surface",

        blendMode = "disabled",
        depthWrite = true,
        depthFunc = "lessEqual",
        renderQueue = "solid",
        colorMask = {"rgba"},
        cullFace = "back",

        vertex =
        [[
            void vertex(inout Vertex v, out Input o)
            {
            }
        ]],

        surface =
        [[
            uniform float _time;
            
            void surface(in Input IN, inout SurfaceOutput o)
            {
                o.emissive = 1.0;
                float sin_6 = sin((7.7667 * _time));
                float sin_7 = sin((_time * 4.5257));
                float sin_5 = sin((_time * 0.78587));
                o.diffuse = (vec4(sin_6, 0.0, 0.0, 0.0)+vec4(0.0, sin_7, 0.0, 0.0)+vec4(0.0, 0.0, sin_5, 0.0)).rgb;
                o.roughness = 0.32468;
                o.metalness = 0.0;
                o.emission = vec3(0.0, 0.0, 0.0);
                o.opacity = 1.0;
                o.occlusion = 1.0;
            }
        ]]
    }
}
