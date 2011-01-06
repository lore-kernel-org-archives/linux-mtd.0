Message-ID: <4D259B9C.6060409@atmel.com>
Date: Thu, 06 Jan 2011 11:38:20 +0100
From: Nicolas Ferre <nicolas.ferre@atmel.com>
MIME-Version: 1.0
To: Russell King - ARM Linux <linux@arm.linux.org.uk>,
	linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: Hit BUG_ON in dma-mapping.c:425
References: <4D24A108.2080609@atmel.com>
	<20110105165551.GE8638@n2100.arm.linux.org.uk>
In-Reply-To: <20110105165551.GE8638@n2100.arm.linux.org.uk>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Hong XU <hong.xu@atmel.com>, Patrice VILCHEZ <patrice.vilchez@atmel.com>,
	Linux Kernel list <linux-kernel@vger.kernel.org>,
	Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
	Andrew Victor <linux@maxim.org.za>,
	"'linux-arm-kernel@lists.infradead.org'"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(I include MTD mailing-list now)

Le 05/01/2011 17:55, Russell King - ARM Linux :
> On Wed, Jan 05, 2011 at 05:49:12PM +0100, Nicolas Ferre wrote:
>> Hi,
>>
>> While running mtd_stresstest on a dataflash (atmel_spi 
>> + mtd_dataflash drivers) I hit the BUG_ON directive that 
>> is at the beginning of ___dma_single_cpu_to_dev() function.
>> This function is called from the SPI driver that do a 
>> dma_map_single() before DMA operations on the buffer 
>> transmitted from upper layers.
>>
>> It seems that this address is above "high_memory" limit because 
>> it is allocated by vmalloc (in mtd_stresstest.c:285)...
> 
> Well, its telling you is that you're not allowed to DMA to vmalloc
> addresses.  Whether that's the fault of the map driver or not is a
> question for mtd folk.

So you mean that those vmalloc calls should be changed to kmalloc in MTD like this:

--- a/drivers/mtd/tests/mtd_stresstest.c
+++ b/drivers/mtd/tests/mtd_stresstest.c
@@ -26,7 +26,6 @@
 #include <linux/mtd/mtd.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
-#include <linux/vmalloc.h>
 
 #define PRINT_PREF KERN_INFO "mtd_stresstest: "
 
@@ -281,8 +280,8 @@ static int __init mtd_stresstest_init(void)
        bufsize = mtd->erasesize * 2;
 
        err = -ENOMEM;
-       readbuf = vmalloc(bufsize);
-       writebuf = vmalloc(bufsize);
+       readbuf = kmalloc(bufsize, GFP_KERNEL);
+       writebuf = kmalloc(bufsize, GFP_KERNEL);
        offsets = kmalloc(ebcnt * sizeof(int), GFP_KERNEL);
        if (!readbuf || !writebuf || !offsets) {
                printk(PRINT_PREF "error: cannot allocate memory\n");
@@ -313,8 +312,8 @@ static int __init mtd_stresstest_init(void)
 out:
        kfree(offsets);
        kfree(bbt);
-       vfree(writebuf);
-       vfree(readbuf);
+       kfree(writebuf);
+       kfree(readbuf);
        put_mtd_device(mtd);
        if (err)
                printk(PRINT_PREF "error %d occurred\n", err);


I also discovered the same issue while trying to write with "dd" on /dev/mtdblockx

Same vmalloc'ed memory seems to be used in mtdblock_writesect():
mtdblk->cache_data = vmalloc(mtdblk->mbd.mtd->erasesize);

I know that using "dd" on a block device is not the common case but it should work instead of not being able to transmit buffer with DMA... So what it implies to switch this to kmalloc? Is it regression-free to do this?

Best regards,
-- 
Nicolas Ferre
