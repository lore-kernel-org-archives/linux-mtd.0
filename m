Received: from [80.239.140.166] (helo=rekin6.o2.pl)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AmhZz-00015D-WE
	for linux-mtd@lists.infradead.org; Fri, 30 Jan 2004 22:57:41 +0000
From: andrzej_mialkowski@o2.pl
To: =?iso-8859-2?Q?Alice_Hennessy?= <ahennessy@mvista.com>
Date: Fri, 30 Jan 2004 23:55:05 +0100
Content-Type: text/plain; charset="iso-8859-2";
Content-Transfer-Encoding: 8bit
In-Reply-To: <4018514D.6E4DB38A@mvista.com>
References: <4018514D.6E4DB38A@mvista.com>
Message-Id: <20040130225505.8DE4ED0B17@rekin6.o2.pl>
cc: linux-mtd@lists.infradead.org
Subject: Re: gen_probe.c issue
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Not understand purpose of this change; do you really have chip that is not fully visible in system? 
Your solution would cause crash at least in two cases:
1) if map size is really small for instance 0 or 1 and we are attempting to detect flash. So there must be some reasonable minimal map size value.
2) returned size of mtd is calculated from "mtd->size = devsize * cfi->numchips" so you will get mtd size greater than supported by map driver (mapped in virtual memory?!). At least redboot parser will attempt access last sector of map:
/* Read the start of the last erase block */
	ret = master->read(master, master->size - master->erasesize,
			   PAGE_SIZE, &retlen, (void *)buf);

I had somehow similar case when redboot partition were located not at the end of flash. I just modified in map driver detected map size between calls to do_map_probe and parse_mtd_partitions. In your case it might be possible that you need just to lay about map size before calling do_map_probe. For you effect will be same, you will not break others code.
Andrzej

---- Wiadomo¶æ Oryginalna ----
Od: Alice Hennessy <ahennessy@mvista.com>
Do: linux-mtd@lists.infradead.org
Data: Wed, 28 Jan 2004 16:18:21 -0800
Temat: gen_probe.c issue

>Hi,
>
>The following patch fixes a problem seen when the map->size is less than
>the actual chip size.
>Without the fix,  max_chips gets set to 0.
>
>Alice
>
>Index: drivers/mtd/chips/gen_probe.c
>===================================================================
>RCS file: /home/cvs/mtd/drivers/mtd/chips/gen_probe.c,v
>retrieving revision 1.14
>diff -u -r1.14 gen_probe.c
>--- drivers/mtd/chips/gen_probe.c       8 Nov 2003 00:51:21 -0000
>1.14
>+++ drivers/mtd/chips/gen_probe.c       28 Jan 2004 23:58:38 -0000
>@@ -108,6 +108,9 @@
>         * Align bitmap storage size to full byte.
>         */
>        max_chips = map->size >> cfi.chipshift;
>+        /* correct for case where map->size is less than chip size */
>+        if (!max_chips)
>+                max_chips = 1;
>        chip_map = kmalloc((max_chips / 8) + ((max_chips % 8) ? 1 : 0),
>GFP_KERNEL);
>        if (!chip_map) {
>                printk(KERN_WARNING "%s: kmalloc failed for CFI chip
>map\n", map->name);
>
>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
