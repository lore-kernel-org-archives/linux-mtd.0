Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N3n44-0005C0-Pu
	for linux-mtd@lists.infradead.org; Fri, 30 Oct 2009 08:42:37 +0000
Received: by bwz4 with SMTP id 4so3633358bwz.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 30 Oct 2009 01:42:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <ce9ab5790910292320x2eef0550pdc3fde5d616ea361@mail.gmail.com>
References: <ce9ab5790910292320x2eef0550pdc3fde5d616ea361@mail.gmail.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Fri, 30 Oct 2009 14:12:11 +0530
Message-ID: <ce9ab5790910300142q6062c47p935ae967955f89f@mail.gmail.com>
Subject: Re: [PATCH 0/3] NAND: OMAP: Fix and clean NAND driver
To: Linux MTD <linux-mtd@lists.infradead.org>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Looping Linux-omap mailing list.


From: Vimal Singh <vimalsingh@ti.com>
Date: Fri, 30 Oct 2009 11:34:14 +0530
Subject: [PATCH 0/3] NAND: OMAP: Fix and clean NAND driver

This patch series addresses some of the issues in omap nand driver.

Vimal Singh (3):
 Fixing compilation warning for 'nand/omap2.c'
 NAND: OMAP: Fixing omap nand driver, compiled as module
 NAND: OMAP: Simplifying HWECC and removing unnecessary macros

 drivers/mtd/nand/omap2.c |  315 ++++++++++++++++------------------------------
 1 files changed, 108 insertions(+), 207 deletions(-)

--
Regards,
Vimal Singh
