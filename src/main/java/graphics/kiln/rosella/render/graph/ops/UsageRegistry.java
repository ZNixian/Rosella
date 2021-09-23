package graphics.kiln.rosella.render.graph.ops;

import graphics.kiln.rosella.render.graph.resources.BufferReference;
import graphics.kiln.rosella.render.graph.resources.ImageReference;

public interface UsageRegistry {

    void registerBufferUsage(BufferReference buffer, int stuff);
    
    void registerImageUsage(ImageReference image, int stuff);
}
