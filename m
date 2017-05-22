Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dChvn-0001J2-To
 for linux-mtd@lists.infradead.org; Mon, 22 May 2017 07:39:10 +0000
Date: Mon, 22 May 2017 09:38:35 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "andrew@lunn.ch" <andrew@lunn.ch>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH 3/4] mtd: mchp23k256: add partitioning support
Message-ID: <20170522093835.70f7f110@bbrezillon>
In-Reply-To: <31c94577108c42c1b51d410081d97eb5@svr-chch-ex1.atlnz.lc>
References: <20170517053908.26138-1-chris.packham@alliedtelesis.co.nz>
 <20170517053908.26138-4-chris.packham@alliedtelesis.co.nz>
 <20170517172911.5f926712@bbrezillon>
 <31c94577108c42c1b51d410081d97eb5@svr-chch-ex1.atlnz.lc>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Chris,

On Mon, 22 May 2017 04:52:34 +0000
Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:

> On 18/05/17 03:29, Boris Brezillon wrote:
> > Hi Chris,
> > 
> > On Wed, 17 May 2017 17:39:07 +1200
> > Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:
> >   
> >> Setting the of_node for the mtd device allows the generic mtd code to
> >> setup the partitions. Additionally we must specify a non-zero erasesize
> >> for the partitions to be writeable.
> >>
> >> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> >> ---
> >>   drivers/mtd/devices/mchp23k256.c | 5 +++++
> >>   1 file changed, 5 insertions(+)
> >>
> >> diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp23k256.c
> >> index 2542f5b8b63f..02c6b9dcbd3e 100644
> >> --- a/drivers/mtd/devices/mchp23k256.c
> >> +++ b/drivers/mtd/devices/mchp23k256.c
> >> @@ -143,6 +143,7 @@ static int mchp23k256_probe(struct spi_device *spi)
> >>   
> >>   	data = dev_get_platdata(&spi->dev);
> >>   
> >> +	mtd_set_of_node(&flash->mtd, spi->dev.of_node);
> >>   	flash->mtd.dev.parent	= &spi->dev;
> >>   	flash->mtd.type		= MTD_RAM;
> >>   	flash->mtd.flags	= MTD_CAP_RAM;
> >> @@ -151,6 +152,10 @@ static int mchp23k256_probe(struct spi_device *spi)
> >>   	flash->mtd._read	= mchp23k256_read;
> >>   	flash->mtd._write	= mchp23k256_write;
> >>   
> >> +	flash->mtd.erasesize = PAGE_SIZE;
> >> +	while (flash->mtd.size & (flash->mtd.erasesize - 1))
> >> +		flash->mtd.erasesize >>= 1;
> >> +  
> > 
> > Can we fix allocate_partition() to properly handle the
> > master->erasesize == 0 case instead of doing that?
> >   
> 
> Do you mean something like this?

I had something slightly different in mind (see below).

> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index ea5e5307f667..0cd20ed6b374 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -577,6 +577,7 @@ static struct mtd_part *allocate_partition(struct 
> mtd_info *master,
>                          part->name);
>          }
>          if ((slave->mtd.flags & MTD_WRITEABLE) &&
> +           master->erasesize != 0 &&
>              mtd_mod_by_eb(slave->mtd.size, &slave->mtd)) {
>                  slave->mtd.flags &= ~MTD_WRITEABLE;
> 
> 
> I'm happy to submit this as a formal patch but it could potentially 
> affect a number of devices. Whereas the snippet I initially added is 
> consistent with drivers/mtd/chips/map_ram.c.

Well, if you're duplicating a workaround that's a good sign this should
actually be handled in the core.

> 
> For now I'll leave v2 as-is but I can send a v3 if needed.
> 

--->8---
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index ea5e5307f667..378ff4a9174e 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -393,7 +393,9 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
                        const struct mtd_partition *part, int partno,
                        uint64_t cur_offset)
 {
+       int wr_alignment = master->erasesize ? : master->writesize;
        struct mtd_part *slave;
+       u32 remainder;
        char *name;
 
        /* allocate the partition structure */
@@ -499,10 +501,12 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
        if (slave->offset == MTDPART_OFS_APPEND)
                slave->offset = cur_offset;
        if (slave->offset == MTDPART_OFS_NXTBLK) {
+               u64 tmp = cur_offset;
+
                slave->offset = cur_offset;
-               if (mtd_mod_by_eb(cur_offset, master) != 0) {
-                       /* Round up to next erasesize */
-                       slave->offset = (mtd_div_by_eb(cur_offset, master) + 1) * master->erasesize;
+               remainder = do_div(tmp, wr_alignment);
+               if (remainder) {
+                       slave->offset += wr_alignment - remainder;
                        printk(KERN_NOTICE "Moving partition %d: "
                               "0x%012llx -> 0x%012llx\n", partno,
                               (unsigned long long)cur_offset, (unsigned long long)slave->offset);
@@ -567,19 +571,22 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
                slave->mtd.erasesize = master->erasesize;
        }
 
-       if ((slave->mtd.flags & MTD_WRITEABLE) &&
-           mtd_mod_by_eb(slave->offset, &slave->mtd)) {
+       tmp = slave->offset;
+       remainder = do_div(tmp, wr_alignment);
+       if ((slave->mtd.flags & MTD_WRITEABLE) && remainder) {
                /* Doesn't start on a boundary of major erase size */
                /* FIXME: Let it be writable if it is on a boundary of
                 * _minor_ erase size though */
                slave->mtd.flags &= ~MTD_WRITEABLE;
-               printk(KERN_WARNING"mtd: partition \"%s\" doesn't start on an erase block boundary -- force read-only\n",
+               printk(KERN_WARNING"mtd: partition \"%s\" doesn't start on an erase/write block boundary -- force read-only\n",
                        part->name);
        }
-       if ((slave->mtd.flags & MTD_WRITEABLE) &&
-           mtd_mod_by_eb(slave->mtd.size, &slave->mtd)) {
+
+       tmp = slave->mtd.size;
+       remainder = do_div(tmp, wr_alignment);
+       if ((slave->mtd.flags & MTD_WRITEABLE) && remainder) {
                slave->mtd.flags &= ~MTD_WRITEABLE;
-               printk(KERN_WARNING"mtd: partition \"%s\" doesn't end on an erase block -- force read-only\n",
+               printk(KERN_WARNING"mtd: partition \"%s\" doesn't end on an erase/write block -- force read-only\n",
                        part->name);
        }
 
