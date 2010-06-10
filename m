Received: from mail.windriver.com ([147.11.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OMdal-0004ZW-KD
	for linux-mtd@lists.infradead.org; Thu, 10 Jun 2010 08:58:28 +0000
From: "Stanley.Miao" <stanley.miao@windriver.com>
To: Artem.Bityutskiy@nokia.com
Subject: The "struct nand_oobinfo" is able to record only 32 ECC code
	positions, which
Date: Thu, 10 Jun 2010 17:09:51 +0800
Message-Id: <1276160994-7599-1-git-send-email-stanley.miao@windriver.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now update nandwrite to use the new ioctl command ECCGETLAYOUT. In order to
keep compatible with the old linux kernel, a linux version detection function
is added.

YAFFS and JFFS2 has updated and we don't need the arguments "forcelegacy",
"forcejffs2", "forceyaffs" anymore. Now clean them up. 


Stanley.
