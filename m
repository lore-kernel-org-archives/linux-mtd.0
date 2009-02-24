Received: from exprod7og109.obsmtp.com ([64.18.2.171])
	by bombadil.infradead.org with smtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lc0gc-0007eJ-9Q
	for linux-mtd@lists.infradead.org; Tue, 24 Feb 2009 17:03:17 +0000
Received: from milmhbs0.lsil.com (mhbs.lsil.com [147.145.1.30])
	by mail0.lsil.com (8.12.11/8.12.11) with ESMTP id n1OH3BbL015211
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Feb 2009 09:03:11 -0800 (PST)
Received: from PALHUB01.lsi.com (palhub01.lsi.com [128.94.213.114])
	by milmhbs0.lsil.com (8.12.11/8.12.11) with ESMTP id n1OH3EKa024719
	for <linux-mtd@lists.infradead.org>; Tue, 24 Feb 2009 09:03:14 -0800
Message-ID: <49A4284D.3040700@lsi.com>
Date: Tue, 24 Feb 2009 11:03:09 -0600
From: John Jacques <john.jacques@lsi.com>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>
Subject: JFFS2 and SMP
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Reply-To: john.jacques@lsi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With linux 2.6.21 and ARM's patch-2.6.21-arm1 patch, I was able to use
JFFS2 file systems on  NAND device without any problems.  With either
ARM patch for 2.6.24 kernel_src_patch-2.6.24-arm2 or
kernel_src_patch-2.6.24-arm3), creating a small partition and writing a
single file (a kernel image) to it fails, within one or two tries, as
follows.

Data CRC 1659d2d9 != calculated CRC e07bc570 for node at 005a4a38
cp: writing `/mnt/linux.img': Input/output error

With only one core enabled, but still using the SMP kernel that fails
above, there are no failures (at least with a script running the test
over the weekend).

Enabling JFFS2 debugging adds nothing to the above error output.

Any ideas?
