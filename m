Received: from 206.173.66.57.ptr.us.xo.net ([206.173.66.57]
	helo=zebra.brightstareng.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J510N-0004jb-Qh
	for linux-mtd@lists.infradead.org; Wed, 19 Dec 2007 15:38:49 +0000
From: Ian McDonnell <ian@brightstareng.com>
To: Duke <ezbonites@gmail.com>
Subject: Re: SPI Flash
Date: Wed, 19 Dec 2007 10:17:51 -0500
References: <mailman.54.1197992805.2861.linux-mtd@lists.infradead.org>
In-Reply-To: <mailman.54.1197992805.2861.linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200712191017.51669.ian@brightstareng.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 18 December 2007 10:46, ezbonites@gmail.com wrote:
> Hi all,
> Has anyone use ST's SPI flash and Atmels SPI DataFlash
> suscessfully?
>
> How does the interface look from userspace? Is it still an
> mtdblockX device or is it a spi device node?
> Are these two manufacturers SPI flash compatable?
> How about access speed?
>
> Thanks,
> D.

I found I needed to tweak MTD's cache allocation to make it work
with the atmel DMA'ed SPI. Substitute kmalloc for vmalloc so
the cache buffer is mappable as per the Atmel SPI driver's
requirements.

-imcd


diff -u -I'$Id' -I'$Revision' -r1.1 -r1.2
--- mtdblock.c  13 Aug 2007 04:25:24 -0000      1.1
+++ mtdblock.c  14 Nov 2007 17:36:35 -0000      1.2
@@ -253,7 +253,11 @@
 {
        struct mtdblk_dev *mtdblk = mtdblks[dev->devnum];
        if (unlikely(!mtdblk->cache_data && mtdblk->cache_size)) {
+#ifdef CONFIG_BSE_TWEAKS // BSE fix for dataflash/spi DMA mapping
+               mtdblk->cache_data = kmalloc(mtdblk->mtd->erasesize, GFP_KERNEL);
+#else
                mtdblk->cache_data = vmalloc(mtdblk->mtd->erasesize);
+#endif
                if (!mtdblk->cache_data)
                        return -EINTR;
                /* -EINTR is not really correct, but it is the best match
@@ -315,7 +319,11 @@
                mtdblks[dev] = NULL;
                if (mtdblk->mtd->sync)
                        mtdblk->mtd->sync(mtdblk->mtd);
+#ifdef CONFIG_BSE_TWEAKS // BSE fix for dataflash/spi DMA mapping
+               kfree(mtdblk->cache_data);
+#else
                vfree(mtdblk->cache_data);
+#endif
                kfree(mtdblk);
        }
        DEBUG(MTD_DEBUG_LEVEL1, "ok\n");
