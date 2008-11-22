Received: from tesla.selinc.com ([12.110.71.2])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L3grX-00027v-Nh
	for linux-mtd@lists.infradead.org; Sat, 22 Nov 2008 01:00:40 +0000
Received: from edison2.selinc.com (edison2.selinc.com [12.110.71.8])
	by tesla.selinc.com (8.12.11.20060308/8.12.11) with ESMTP id
	mAM10aYX018385
	for <linux-mtd@lists.infradead.org>; Fri, 21 Nov 2008 17:00:38 -0800
To: linux-mtd@lists.infradead.org
Subject: Async DMA question regarding dma_async_memcpy_buf_to_buf
MIME-Version: 1.0
Message-ID: <OF9D544051.87C6E943-ON88257509.00043C77-88257509.00058995@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Fri, 21 Nov 2008 17:00:35 -0800
Content-Type: text/plain; charset="US-ASCII"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have a question about 
.../drivers/dma/dmaengine.c/dma_async_memcpy_buf_to_buf() in 2.6.28-rc2. 
It looks like it always assumes that the source pointer points to data 
coming from the CPU and the destination pointer always points to the DMA 
device.  I say this because of the following two lines from the function:

 479        dma_src = dma_map_single(dev->dev, src, len, DMA_TO_DEVICE);
 480        dma_dest = dma_map_single(dev->dev, dest, len, DMA_FROM_DEVICE
);


As you can see 'src' is mapped DMA_TO_DEVICE indicating the data is going 
from the CPU to the device, and 'dest' is mapped DMA_FROM_DEVICE, 
indicating the opposite direction.  Seems to me this means the function is 
assuming a certain direction (i.e., a write to the device), but there 
isn't a corresponding function for going the other direction.  This leads 
me to believe that the function is intended to operate in either 
direction.  But this is in contradiction to both the mapped directions and 
what I've read in LDD3, ch 15.

The hardware doesn't care (I'm using an MPC8347E), as far as the DMA 
engine is concerned these are just addresses.  All of this goes to cache 
coherency.  The map/unmap functions are supposed to ensure that data is 
copied and caches flushed at the right times to ensure cache coherency. So 
the question is this; is the dma_async_memcpy_buf_to_buf() function 
intended to be bi-directional and is it safe to pass it a 'src' pointer 
that's actually coming from the device, or does there need to be a second 
function for doing a copy from the device to the CPU?

Thanks.

Bruce
