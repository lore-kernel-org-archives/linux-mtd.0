Received: from mail.dif.dk ([193.138.115.101])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C9VZp-00012G-KM
	for linux-mtd@lists.infradead.org; Mon, 20 Sep 2004 17:20:03 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.dif.dk (Postfix) with ESMTP id ACE06FFC5B
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Sep 2004 23:34:50 +0200 (CEST)
Received: from mail.dif.dk ([127.0.0.1])
	by localhost (saerimmer [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP
	id 09346-04 for <linux-mtd@lists.infradead.org>;
	Mon, 20 Sep 2004 23:34:49 +0200 (CEST)
Received: from diftmgw2.backbone.dif.dk (diftmgw2.backbone.dif.dk
	[10.227.136.246]) by mail.dif.dk (Postfix) with ESMTP id 243EEFF441
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Sep 2004 23:34:49 +0200 (CEST)
Date: Mon, 20 Sep 2004 23:26:38 +0200 (CEST)
From: Jesper Juhl <juhl-lkml@dif.dk>
To: David Woodhouse <dwmw2@redhat.com>
Message-ID: <Pine.LNX.4.61.0409202320270.2729@dragon.hygekrogen.localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH] attempt to fix warnings in dilnetpc.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

I see these warnings when building 2.6.9-rc2-bk5 allyesconfig :

  CC      drivers/mtd/maps/dilnetpc.o
drivers/mtd/maps/dilnetpc.c: In function `init_dnpc':
drivers/mtd/maps/dilnetpc.c:406: warning: assignment makes pointer from integer without a cast
drivers/mtd/maps/dilnetpc.c:416: warning: long unsigned int format, pointer arg (arg 2)
drivers/mtd/maps/dilnetpc.c:416: warning: long unsigned int format, pointer arg (arg 2)

Here's a patch to attempt to fix those. I don't have the hardware, so all 
I could do was read the code, think about it and then compile test my 
changes. I hope I got it right.

Signed-off-by: Jesper Juhl <juhl-lkml@dif.dk>

diff -up linux-2.6.9-rc2-bk5-orig/drivers/mtd/maps/dilnetpc.c linux-2.6.9-rc2-bk5/drivers/mtd/maps/dilnetpc.c
--- linux-2.6.9-rc2-bk5-orig/drivers/mtd/maps/dilnetpc.c	2004-08-14 07:36:32.000000000 +0200
+++ linux-2.6.9-rc2-bk5/drivers/mtd/maps/dilnetpc.c	2004-09-20 23:19:34.000000000 +0200
@@ -403,7 +403,7 @@ static int __init init_dnpc(void)
 	printk(KERN_NOTICE "DIL/Net %s flash: 0x%lx at 0x%lx\n", 
 		is_dnp ? "DNPC" : "ADNP", dnpc_map.size, dnpc_map.phys);
 
-	dnpc_map.virt = (unsigned long)ioremap_nocache(dnpc_map.phys, dnpc_map.size);
+	dnpc_map.virt = (unsigned long *)ioremap_nocache(dnpc_map.phys, dnpc_map.size);
 
 	dnpc_map_flash(dnpc_map.phys, dnpc_map.size);
 
@@ -413,7 +413,7 @@ static int __init init_dnpc(void)
 	}
 	simple_map_init(&dnpc_map);
 
-	printk("FLASH virtual address: 0x%lx\n", dnpc_map.virt);
+	printk("FLASH virtual address: 0x%lx\n", (unsigned long)dnpc_map.virt);
 
 	mymtd = do_map_probe("jedec_probe", &dnpc_map);
 


Please CC me on replies.
