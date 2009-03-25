Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LmQgg-000125-9R
	for linux-mtd@lists.infradead.org; Wed, 25 Mar 2009 10:50:28 +0000
Message-Id: <20090325104836.325599143@denx.de>
Date: Wed, 25 Mar 2009 11:48:36 +0100
From: Wolfgang Grandegger <wg@grandegger.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] Add support for NAND on the socrates board and oob size
	128
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The following patch series adds support for the NAND flash on the
Socrates board (MPC8544) including the required support for an oob
size of 128. 

Please consider these patches for inclusion into the kernel version 2.6.30.

Thanks,

Wolfgang
