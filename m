Received: from milas.spb.ru ([195.131.115.140])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AI2JC-0000cr-2u
	for <linux-mtd@lists.infradead.org>; Fri, 07 Nov 2003 08:49:34 +0000
Received: from shc.home (38ppp4.telegraph.spb.ru [213.158.4.38])
	by milas.spb.ru (8.12.10/8.12.8) with SMTP id hA78mHuG008840
	for <linux-mtd@lists.infradead.org>; Fri, 7 Nov 2003 11:48:18 +0300
Date: Fri, 7 Nov 2003 11:49:47 +0300
From: Alexander Shiyan <shc@milas.spb.ru>
To: linux-mtd@lists.infradead.org
Message-Id: <20031107114947.19f4f33b.shc@milas.spb.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Mount jffs2 partition on Doc2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, All.

I tryed to create and use jffs2 partition on Doc2000.
Whats I do wrong:
./eraseall -j /dev/mtd0
mount -t jffs2 /dev/mtdblock0 /mnt/doc

"echo > /mnt/doc/bla-bla" will result to "No space left on device"...
