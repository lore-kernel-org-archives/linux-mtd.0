Received: from [202.37.96.11] (helo=gatekeeper.tait.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AF39h-0000Or-Un
	for <linux-mtd@lists.infradead.org>; Thu, 30 Oct 2003 03:07:26 +0000
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id h9U367H10080
	for <linux-mtd@lists.infradead.org>; Thu, 30 Oct 2003 16:06:07 +1300
Received: from sunstorm.tait.co.nz (sunstorm.tait.co.nz [172.25.40.9])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id h9U367210074
	for <linux-mtd@lists.infradead.org>; Thu, 30 Oct 2003 16:06:07 +1300
Received: from tait.co.nz ([172.25.107.17])
 by sunstorm.tait.co.nz (iPlanet Messaging Server 5.1 (built May  7 2001))
 with ESMTP id <0HNJ00A8PVA5GG@sunstorm.tait.co.nz> for
 linux-mtd@lists.infradead.org; Thu, 30 Oct 2003 16:06:05 +1300 (NZDT)
Date: Thu, 30 Oct 2003 16:05:31 +1300
From: Robin Gilks <robin.gilks@tait.co.nz>
To: mtd list <linux-mtd@lists.infradead.org>
Message-id: <3FA07FFB.4020403@tait.co.nz>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii; format=flowed
Content-transfer-encoding: 7BIT
Subject: device major/minor attributes corrupt in jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings

Just trying to put a root filesystem into jffs2 and whilst I can mount 
the filesystem and copy my /dev directory into it and it looks OK, when 
I reboot the major/minor numbers have been added together into the minor 
and the major is always 0

Anyone any ideas?

target mpc8xx cross compiled from i386 with gcc-3.3.1
kernel 2.4.22
mtd snapshot of 22-10-03
busybox 1.00-pre3 utils
uclibc 0.9.20 library

-- 
Robin Gilks
Senior Design Engineer          Phone: (+64)(3) 357 1569
Tait Electronics                Fax  :  (+64)(3) 359 4632
PO Box 1645 Christchurch        Email : robin.gilks@tait.co.nz
New Zealand
