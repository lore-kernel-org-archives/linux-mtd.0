Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14TiJu-0001Mm-00
	for mtd-list@infradead.org; Fri, 16 Feb 2001 10:40:58 +0000
Received: from roma.axis.se ([193.13.178.2])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14TiJs-0001Mg-00
	for mtd@infradead.org; Fri, 16 Feb 2001 10:40:57 +0000
Received: from klatt.axis.se (klatt.axis.se [10.0.5.41])
	by roma.axis.se (8.9.3/8.9.3) with ESMTP id LAA05458
	for <mtd@infradead.org>; Fri, 16 Feb 2001 11:40:00 +0100 (MET)
Message-ID: <E6FE4E054F02D511818E00025558B61D429E2F@cluster01.axis.se>
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: mtdpart.o
Date: Fri, 16 Feb 2001 11:40:14 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Why was mtdpart.o removed from obj-$(CONFIG_MTD) in kernel/Makefile?

< obj-$(CONFIG_MTD)		+= mtdcore.o mtdpart.o
---
> obj-$(CONFIG_MTD)		+= mtdcore.o

I've got a problem since it was removed: How can I include mtdpart.o in my kernel if I wan't to do a do_cfi_probe() and then add partitions with add_mtd_partitions()?

/Jonas


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
