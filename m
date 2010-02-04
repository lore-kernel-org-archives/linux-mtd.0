Received: from mail.windriver.com ([147.11.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ncvt2-0002fI-Kk
	for linux-mtd@lists.infradead.org; Thu, 04 Feb 2010 07:12:28 +0000
Received: from ALA-MAIL03.corp.ad.wrs.com (ala-mail03 [147.11.57.144])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id o147CLkR025354
	for <linux-mtd@lists.infradead.org>;
	Wed, 3 Feb 2010 23:12:21 -0800 (PST)
From: "Stanley.Miao" <stanley.miao@windriver.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/1] Fix OOB checking problem in nand_base.c
Date: Thu,  4 Feb 2010 15:18:36 +0800
Message-Id: <1265267917-2487-1-git-send-email-stanley.miao@windriver.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

on TI OMAPL138 EVM board, the NAND Flash have 22 bytes free in OOB area.
When yaffs2 writes the 28-byte tags into NAND OOB area, the NAND subsystem
doesn't give any WARNING or ERROR.

Move the checking of validity of oob data from nand_do_write_oob into
nand_write_oob to fix this problem.
