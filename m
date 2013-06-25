Received: from maa.mxout.managedbiz.net ([59.160.116.128]
 helo=maa.mxout.managedbiz.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UrRJq-0003wM-Lv
 for linux-mtd@lists.infradead.org; Tue, 25 Jun 2013 11:21:56 +0000
Message-ID: <51C97D38.4000605@siennaecad.com>
Date: Tue, 25 Jun 2013 16:51:28 +0530
From: Samba Siva Reddy A <sambasiva.a@siennaecad.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: mtd_dataflash cause udev hang
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am working on the at91sam9x5 boards. I added the DataFLash partitions
on board-sam9x5.c file.

It hangs while booting up the board after Starting udev message and
after that getting the following messages.

Starting udev

udevd (672): /proc/672/oom_adj is deprecated, please use

/proc/672/oom_score_adj

instead.

then these traces come out.

udevd[672]: worker [688] unexpectedly returned with status 0x0100

udevd[672]: worker [688] failed while handling

'/devices/virtual/block/loop0'

udevd[672]: worker [691] unexpectedly returned with status 0x0100

udevd[672]: worker [691] failed while handling

'/devices/virtual/block/loop1'

udevd[672]: worker [692] unexpectedly returned with status 0x0100


1.  Enable and ported the DMA Engine code from 2.6.39 kernel to

      3.2.6 kernel.


2. Added the below code snippet for avoiding the stack overflow

   while writing data to the dataFlash. I attached the file for your

   reference.


   static void *adjust_buffer_location(struct device *dev, void *buf) {

          if (likely(buf < high_memory)) {

           return buf;

           }

           else

           {

                   struct page *pg;

   

                   pg = vmalloc_to_page(buf);

                   if (pg == 0)

                   {

                           dev_err(dev, "failed to vmalloc_to_page\n");

   return NULL;

                   }

           return page_address(pg) + ((size_t)buf & ~PAGE_MASK);

           }

   }

   

   static int

   atmel_spi_dma_map_xfer(struct atmel_spi *as, struct spi_transfer *xfer) {

   

   

       ptr = adjust_buffer_location(dev,(void *)xfer->tx_buf);

                   if(ptr)

                   xfer->tx_dma = dma_map_single(dev,

                                   ptr, xfer->len,

                                   DMA_TO_DEVICE);

                   if (dma_mapping_error(dev, xfer->tx_dma))

                           return -ENOMEM;

           }

           if (xfer->rx_buf) {

                   ptr=adjust_buffer_location(dev, xfer->rx_buf);

                   if(ptr)

                   xfer->rx_dma = dma_map_single(dev,

                                   ptr, xfer->len,

                                   DMA_FROM_DEVICE);

   

   }

Could you please help any one on this issue.

Regards
Samba
