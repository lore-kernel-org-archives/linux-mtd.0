Received: from green.nl.gxn.net ([62.100.30.36])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1555km-0007uA-00
	for <linux-mtd@lists.infradead.org>; Wed, 30 May 2001 14:11:12 +0100
Received: from localhost([127.0.0.1]) (613 bytes) by green.nl.gxn.net
	via sendmail with P:smtp/R:inet_hosts/T:smtp
	(sender: <rini@van-zetten-2.myweb.nl>)
	id <m1555oq-000ljOC@green.nl.gxn.net>
	for linux-mtd@lists.infradead.org; Wed, 30 May 2001 15:15:24 +0200 (MET DST)
	(Smail-3.2.0.106-3 1999-Mar-31 #11 built DST-Sep-7)
Message-Id: <m1555oq-000ljOC@green.nl.gxn.net>
Date: Wed, 30 May 2001 15:15:24 +0200 (MET DST)
To: linux-mtd@lists.infradead.org
From: rini@van-zetten-2.myweb.nl
Subject: doc millennium compiled in kernel
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

Hi all,

When i use the M-System Disk-On-Chip 2000 and Millennnium as a module everything works fine but when i compile it in the kernel i can't use the doc. The messages show the following error :

_DoC_WaitReady called for out-of-line wait
May 30 14:59:16 arv-113 kernel: _DoC_WaitReady timed out.


Anyone knows what to do ?

Rini van Zetten
