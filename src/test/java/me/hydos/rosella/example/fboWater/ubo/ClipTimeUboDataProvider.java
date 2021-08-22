package me.hydos.rosella.example.fboWater.ubo;

import me.hydos.rosella.scene.object.RenderObject;
import me.hydos.rosella.ubo.UboDataProvider;
import org.joml.Vector4f;
import org.lwjgl.glfw.GLFW;

import java.nio.ByteBuffer;

public class ClipTimeUboDataProvider extends ClipPlaneUboDataProvider {

    private float time = 0;

    public ClipTimeUboDataProvider(Vector4f clippingPlane) {
        super(clippingPlane);
    }

    @Override
    public void update(ByteBuffer data, RenderObject renderObject) {
        super.update(data, renderObject);
        super.writeFloat(time, data);
        time += Math.sin(GLFW.glfwGetTime() / 10000f);
    }

    @Override
    public int getSize() {
        return super.getSize() +
                Float.BYTES;// Time
    }
}
