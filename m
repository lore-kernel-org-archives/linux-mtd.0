Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Ao5WD-0004dD-KG
	for linux-mtd@lists.infradead.org; Tue, 03 Feb 2004 18:43:29 +0000
Sender: ahennessy@mvista.com
Message-ID: <401FEA03.7DCCA6F5@mvista.com>
Date: Tue, 03 Feb 2004 10:35:48 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: andrzej_mialkowski@o2.pl
References: <4018514D.6E4DB38A@mvista.com>
	<20040130225505.8DE4ED0B17@rekin6.o2.pl>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: dwmw2@infradead.org
cc: linux-mtd@lists.infradead.org
Subject: Re: gen probe.c issue
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

andrzej_mialkowski@o2.pl wrote:

> Not understand purpose of this change; do you really have chip that is not fully visible in system?
> Your solution would cause crash at least in two cases:
> 1) if map size is really small for instance 0 or 1 and we are attempting to detect flash. So there must be some reasonable minimal map size value.
> 2) returned size of mtd is calculated from "mtd->size = devsize * cfi->numchips" so you will get mtd size greater than supported by map driver (mapped in virtual memory?!). At least redboot parser will attempt access last sector of map:
> /* Read the start of the last erase block */
>         ret = master->read(master, master->size - master->erasesize,
>                            PAGE_SIZE, &retlen, (void *)buf);
>
> I had somehow similar case when redboot partition were located not at the end of flash. I just modified in map driver detected map size between calls to do_map_probe and parse_mtd_partitions. In your case it might be possible that you need just to lay about map size before calling do_map_probe. For you effect will be same, you will not break others code.
> Andrzej
>
> ---- Wiadomo¶æ Oryginalna ----
> Od: Alice Hennessy <ahennessy@mvista.com>
> Do: linux-mtd@lists.infradead.org
> Data: Wed, 28 Jan 2004 16:18:21 -0800
> Temat: gen_probe.c issue
>
> >Hi,
> >
> >The following patch fixes a problem seen when the map->size is less than
> >the actual chip size.
> >Without the fix,  max_chips gets set to 0.
> >
> >Alice
> >
> >Index: drivers/mtd/chips/gen_probe.c
> >===================================================================
> >RCS file: /home/cvs/mtd/drivers/mtd/chips/gen_probe.c,v
> >retrieving revision 1.14
> >diff -u -r1.14 gen_probe.c
> >--- drivers/mtd/chips/gen_probe.c       8 Nov 2003 00:51:21 -0000
> >1.14
> >+++ drivers/mtd/chips/gen_probe.c       28 Jan 2004 23:58:38 -0000
> >@@ -108,6 +108,9 @@
> >         * Align bitmap storage size to full byte.
> >         */
> >        max_chips = map->size >> cfi.chipshift;
> >+        /* correct for case where map->size is less than chip size */
> >+        if (!max_chips)
> >+                max_chips = 1;
> >        chip_map = kmalloc((max_chips / 8) + ((max_chips % 8) ? 1 : 0),
> >GFP_KERNEL);
> >        if (!chip_map) {
> >                printk(KERN_WARNING "%s: kmalloc failed for CFI chip
> >map\n", map->name);
> >
> >
> >
> >______________________________________________________
> >Linux MTD discussion mailing list
> >http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >

I believe it's ok to set up partitions for a flash and not have all the flash visible.  Perhaps
a better way to do this would be to just make another partition and make the protected part
read only.   But I believe not making the whole flash visible is also acceptable.
BTW, I don't use redboot partitioning with this flash.

David,  if you think it's bad practice,  I will change my mapping file instead.

Alice
