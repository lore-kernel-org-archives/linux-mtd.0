Received: from mail.windriver.com ([147.11.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ON0TV-0004ca-Ss
	for linux-mtd@lists.infradead.org; Fri, 11 Jun 2010 09:24:31 +0000
From: "Stanley.Miao" <stanley.miao@windriver.com>
To: Artem.Bityutskiy@nokia.com
Subject: Fix mtd-utils bugs
Date: Fri, 11 Jun 2010 17:36:12 +0800
Message-Id: <1276248975-1822-1-git-send-email-stanley.miao@windriver.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Re-send them because I didn't give a email subject in last version.

The "struct nand_oobinfo" is able to record only 32 ECC code positions,which
is not enough for many big NAND chips. Therefore, this structure is replaced
by "struct nand_ecclayout" in linux kernel from the version 2.6.17.
Consequently, the ioctl command changed from MEMGETOOBSEL to ECCGETLAYOUT.

Now update nandwrite to use the new ioctl command ECCGETLAYOUT. In order to
keep compatible with the old linux kernel, a linux version detection function
is added.

YAFFS and JFFS2 has updated and we don't need the arguments "forcelegacy",
"forcejffs2", "forceyaffs" anymore. Now clean them up. 


Stanley.
