Received: from omail02.samsung.co.kr ([203.254.197.74])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15LCQ7-0002py-00
	for <linux-mtd@lists.infradead.org>; Sat, 14 Jul 2001 00:32:28 +0100
Received: from gp_xman. ([101.1.3.10])
	by omail02.samsung.co.kr (8.8.8/8.8.8) with ESMTP id IAA06494
	for <linux-mtd@lists.infradead.org>; Sat, 14 Jul 2001 08:42:12 +0900 (KST)
From: kingseft@samsung.co.kr
Received: from localhost (root@localhost)
	by gp_xman. (8.8.8H1/8.8.8) with ESMTP id IAA15868
	for <linux-mtd@lists.infradead.org>; Sat, 14 Jul 2001 08:40:09 +0900 (KST)
Date: Sat, 14 Jul 2001 08:43:46 +0900
Message-Id: <H00002af04ff19c1@MHS>
Subject: =?EUC-KR?Q?(=C0=E7=C0=FC=BC=DB)_/dev/mtd0_qeustions?=
MIME-Version: 1.0
TO: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline; filename="mail.txt"
	;Creation-Date="Fri, 13 Jul 2001 17:28:45 +0900"
	;Modification-Date="Sat, 14 Jul 2001 08:43:45 +0900"
Content-Transfer-Encoding: 8bit
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

 I got latest MTD source code(2001-07-11 version)
 and set Kernel options.

 when the kernel booted, I found all correct messages from kernel.
 but, when I tyepd MAKEDEV, and then

 mkfs.jffs -d /home/jffs -o /tmp/jffs.image
 and

 cp /tmp/jffs.image /dev/mtd0
 the result message is

 cp: /dev/mtd0  Read-only file system.     <----Here.

 so, I can't proceed next step!!

 Could anyone explain this problem??
 Any comments will help me.. thanks.
