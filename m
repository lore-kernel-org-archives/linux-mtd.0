Received: from mailout-de.gmx.net ([213.165.64.22] helo=mail.gmx.net)
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PAzs2-0006yJ-CT
	for linux-mtd@lists.infradead.org; Wed, 27 Oct 2010 06:52:27 +0000
Date: Wed, 27 Oct 2010 08:52:29 +0200 (CEST)
From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
To: linux-mtd@lists.infradead.org
Subject: commit 432dc821 breaks machines
Message-ID: <Pine.LNX.4.64.1010270842580.7190@axis700.grange>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: H Hartley Sweeten <hartleys@visionengravers.com>,
	linux-embedded <linux-embedded@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

commit 432dc821c90114f9b0e00f6752a700e937516ade
Author: H Hartley Sweeten <hartleys@visionengravers.com>
Date:   Thu Aug 19 18:18:21 2010 -0700

    mtd: cleanup Kconfig dependencies

breaks machines by undefining macros like CONFIG_MTD_MAP_BANK_WIDTH_*. 
Previously the Kconfig entries like

config MTD_MAP_BANK_WIDTH_1
	bool "Support  8-bit buswidth" if MTD_CFI_GEOMETRY
	default y

meant, that if MTD_CFI_GEOMETRY is not selected, this config entry is not 
_displayed_, and default selections are used. Now, with that "if" removed 
and all these Kconfig entries put under a common

if MTD_CFI_GEOMETRY

none of these options get selected by default. Please, revert or otherwise 
fix this part.

Thanks
Guennadi
---
Guennadi Liakhovetski, Ph.D.
Freelance Open-Source Software Developer
http://www.open-technology.de/
