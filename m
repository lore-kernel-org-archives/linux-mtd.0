Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14QakD-0002sv-00
	for mtd-list@infradead.org; Wed, 07 Feb 2001 19:59:13 +0000
Received: from spr2.ibd.com
	([209.249.61.20] helo=imap.ultradevices.com ident=root)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14QakB-0002sm-00
	for mtd@infradead.org; Wed, 07 Feb 2001 19:59:12 +0000
Message-ID: <3A81A974.C24B9792@ultradevices.com>
Date: Wed, 07 Feb 2001 12:00:52 -0800
From: Mark Hoy <mhoy@ultradevices.com>
MIME-Version: 1.0
To: mtd <mtd@infradead.org>, jffs-dev <jffs-dev@axis.com>
Subject: Arcom Media GX board
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

We've recently received some Arcom SBC-Geode-GX1 boards for some
in-house
Linux prototypes. They happen to have  a fairly old version (Oct.) of
the mtd.
(mtdcore.c,v 1.17 2000/09/14) and jffs (jffs_fm.c,v 1.18 2000/08/21
10:41:45).

1. I was wondering if anyone has put used these systems and/or upgraded
to a
more recent version of jffs/mtd.

2.Any major issues I should worry about in upgrading?

3.Any major issues in staying with what I currently have? (The startup
time of
checking the flashfile system is annoying, but I can live with it if I
have to).

Thanks in advance.

Mark Hoy
UltraDevices



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
