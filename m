Received: from mail-px0-f200.google.com ([209.85.216.200])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NRxc1-0006hs-7P
	for linux-mtd@lists.infradead.org; Tue, 05 Jan 2010 00:49:34 +0000
Received: by pxi38 with SMTP id 38so5000842pxi.28
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Jan 2010 16:49:27 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 5 Jan 2010 11:49:27 +1100
Message-ID: <a64f67eb1001041649u500f3a6bx40d443c4a3415f1b@mail.gmail.com>
Subject: JFFS2 - speed up while booting
From: linux newbie <linux.newbie79@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am using linux version (linux.2.6.31) on my embedded ARM based target.

We are using JFFS2 filesystem to read/write data to NAND flash
(32MBytes) and our root file system resides in it.

It takes long time during kernel booting, if we have root file system
in NAND, but its very fast if we place our file system in SDRAM.

Is there any way to speed up the booting process?

Eagerly waiting for your valuable suggestion.

Thanking You
