Received: from [218.106.114.66] (helo=ycigrnd.mail)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BaP9P-0005NQ-1g
	for linux-mtd@lists.infradead.org; Tue, 15 Jun 2004 21:23:42 -0400
Received: from sloth [192.168.0.225] by ycigrnd.mail [127.0.0.1]
	with SMTP (MDaemon.PRO.v5.0.6.R)
	for <linux-mtd@lists.infradead.org>; Wed, 16 Jun 2004 09:22:55 +0800
Message-ID: <002301c45340$7e44ffc0$e100a8c0@ycigrnd.ycig.com>
From: "leeyang" <leeyang@ycig.com>
To: <linux-mtd@lists.infradead.org>
Date: Wed, 16 Jun 2004 09:23:13 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org
Subject: Is it possible to reduce GC blocks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am kind of short of flash space in my board.
2M total 64k per block
loader 1 block
kernel 11 blocks,mtd 
initrd 14 blocks,mtd ramdisk
configuration section have 6 blocks only with jffs2
but GC will take 5 of 6,only 1 blocks for data!

Is it possible to release 1 or 2 block from gc?
