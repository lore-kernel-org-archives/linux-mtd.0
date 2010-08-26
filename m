Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OoYEx-0006f3-44
	for linux-mtd@lists.infradead.org; Thu, 26 Aug 2010 08:55:19 +0000
Received: by iwn40 with SMTP id 40so1566076iwn.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Aug 2010 01:55:17 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 26 Aug 2010 10:55:17 +0200
Message-ID: <AANLkTi=O0S-NWKQqXf3=NC4n_j-Sq91GeNJrWxAhJc7_@mail.gmail.com>
Subject: Bug in omap mtd nand driver
From: Arno Steffen <arno.steffen@googlemail.com>
To: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The setting NAND_NO_SUBPAGE_WRITE in omap_nand_platform_data is not used.
I am using SLC NAND - MT29F1G16ABC , which seems not to support subpages.
I can observe that kernel allows sub-page-writes.
I tried to find out what is happend with the options, but after a
while I get lost in numerous copies of structs ...

Options are still correct in beginning of omap_nand_probe but finally
it ends up in setting its option independent from platform options.
	info->nand.options  |= NAND_SKIP_BBTSCAN;
	if ((gpmc_cs_read_reg(info->gpmc_cs, GPMC_CS_CONFIG1) & 0x3000)
								== 0x1000)
		info->nand.options  |= NAND_BUSWIDTH_16;

This observations are done in a plain vanilla 2.6.33 kernel on an OMAP3 board.

Can someone confirm that and know how to change that in a clean way?
