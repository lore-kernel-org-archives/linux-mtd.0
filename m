Received: from mail.mellanox.co.il ([194.90.237.34] helo=mtlex01.yok.mtl.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Wdvf-0004G1-00
	for <linux-mtd@lists.infradead.org>; Mon, 22 Jul 2002 15:12:51 +0100
Message-ID: <91DB792C7985D411BEC300B40080D29C457DBC@mtvex01.mtv.mtl.com>
From: Roee Friedman <roeef@mellanox.co.il>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Booting from flash in Artesyn PMPPC
Date: Mon, 22 Jul 2002 17:14:25 +0300
MIME-Version: 1.0
Content-Type: text/plain;
	charset="windows-1255"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hello!

I am trying to boot Linux (HardHat 2.0 Pro) from the flash memory of PPC on
Artesyn board. The kernel is loading from the flash without problems, but
then it loos for the root fs.
I have created a file system on /dev/mtdblock2 but it is not good enough for
the kernel. Any tips, pointers, links, documentation of the Artesyn
boot-loader?

Thanks!!
Roee
