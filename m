Received: from repulse.teligenthost.com ([207.155.249.3])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14zUuc-00079U-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 May 2001 03:50:14 +0100
From: "Bao C. Ha" <baoha@sensoria.com>
To: <linux-mtd@lists.infradead.org>
Subject: Booting from JFFS2
Date: Mon, 14 May 2001 19:54:32 -0700
Message-ID: <000501c0dcea$5ea40780$326c020a@SENSORIA>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

I would like to partition the Flash into two: (1) boot loader and 
(2) JFFS2.  Can I put the kernel, zImage, and fs.gz on JFFS2, 
and boot the kernel from there?  I would like to boot the kernel,
mount the fs.gz as cramfs, and mount the JFFS2 under /flash
as a writable storage.  Linux will be running exclusively in 
RAM.

Thanks.
Bao
