Received: from mail.tuke.sk ([147.232.3.3] ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19J6CE-0002a7-Up
	for <linux-mtd@lists.infradead.org>; Fri, 23 May 2003 07:38:31 +0100
Received: from smtp.tuke.sk (dot.tuke.sk [147.232.16.16])
	(using TLSv1 with cipher EDH-RSA-DES-CBC3-SHA (168/168 bits))
	(No client certificate requested)
	by mail.tuke.sk (Postfix) with ESMTP id 1F5E21670CF
	for <linux-mtd@lists.infradead.org>;
	Fri, 23 May 2003 08:38:19 +0200 (CEST)
Received: from alfa.intrak.tuke.sk (alfa.intrak.tuke.sk [147.232.152.3])
	by smtp.tuke.sk (Postfix) with ESMTP id 16F04B3B49
	for <linux-mtd@lists.infradead.org>;
	Fri, 23 May 2003 08:35:30 +0200 (CEST)
Date: Fri, 23 May 2003 08:38:20 +0200
To: linux-mtd@lists.infradead.org
Message-ID: <20030523063820.GH13272@intrak.sk>
Mime-Version: 1.0
Content-Disposition: inline
From: stolc@intrak.sk (Oskar Stolc)
Content-Type: text/plain; charset=us-ascii
Subject: DiskOnChip MD2202-D256
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,


I'm just trying to install DiskOnChip MD2202-D256 flash disk on my
2.4.21-rc2 linux. While loading modul by command
	'modprobe docprobe'
	
these messages occurred on my screen:

DiskOnChip Millenium found at address 0xE0000
Unknown flash chip found: 21 21
Please report to dwmw2@infradead.org
Unknown flash chip found: 21 21
Please report to dwmw2@infradead.org
Unknown flash chip found: A1 A1
Please report to dwmw2@infradead.org
No flash chips recognised.

This flash disk was formated by DOS command:
	dformat /win:e000 /s:doc514.exb

and that enabled C:\ disk under DOS.

DiskOnChip is a part of ICOP-6070 PC/104 Embedded CPU module.

Is there some HOWTO showing me how to install this DOC in Linux?

Is this DOC supported by MTD drivers in 2.4.21-rc2 kernel?

Thanks,

Oskar
