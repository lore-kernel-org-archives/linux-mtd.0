Received: from mms3.broadcom.com ([216.31.210.19])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oln30-0003m0-36
	for linux-mtd@lists.infradead.org; Wed, 18 Aug 2010 18:07:35 +0000
From: "Brian Norris" <norris@broadcom.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 0/2] Deprecate ECCGETLAYOUT
Date: Wed, 18 Aug 2010 11:06:44 -0700
Message-ID: <1282154806-9420-1-git-send-email-norris@broadcom.com>
In-Reply-To: <4C5CA4A1.1040000@broadcom.com>
References: <4C5CA4A1.1040000@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Sneha Narnakaje <nsnehaprabha@ti.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	Brian Norris <norris@broadcom.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The following two patches are implementations of two different
strategies to deprecate the ioctl ECCGETLAYOUT. This ioctl is not
very useful and imposes restrictions on expanding the corresponding
kernel struct nand_ecclayout. Either patch will leave functionality
intact but allow the kernel-space layouts to expand in the future.

Strategy 1: Create new struct nand_ecclayout_l and convert all kernel
  code to use this struct.
Strategy 2: Rename old struct nand_ecclayout_user and modify
  nand_ecclayout to be used in the kernel only.

Either strategy employs a new function that will shrink the larger
layout to fit the size of the old one.

Please let me know if either of these will have unintended
consequences. I believe I have tested these sufficiently in both
simulation and hardware.

Thanks,
Brian

Brian Norris (2):
  mtd: nand: Expand nand_ecc_layout, deprecate ioctl ECCGETLAYOUT
  mtd: nand: Expand nand_ecc_layout, deprecate ioctl ECCGETLAYOUT
