Received: from va3ehsobe001.messaging.microsoft.com ([216.32.180.11]
	helo=VA3EHSOBE001.bigfish.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P1ETE-00050n-Sb
	for linux-mtd@lists.infradead.org; Thu, 30 Sep 2010 08:26:29 +0000
Received: from mail184-va3 (localhost.localdomain [127.0.0.1])	by
	mail184-va3-R.bigfish.com (Postfix) with ESMTP id 7ED1B158164	for
	<linux-mtd@lists.infradead.org>; Thu, 30 Sep 2010 08:26:26 +0000 (UTC)
Received: from VA3EHSMHS014.bigfish.com (unknown [10.7.14.238])	by
	mail184-va3.bigfish.com (Postfix) with ESMTP id BD77C8E00B8	for
	<linux-mtd@lists.infradead.org>; Thu, 30 Sep 2010 08:26:05 +0000 (UTC)
Received: from de01smr01.freescale.net (de01smr01.freescale.net [10.208.0.31])
	by az33egw01.freescale.net (8.14.3/8.14.3) with ESMTP id
	o8U8PoRh023955	for
	<linux-mtd@lists.infradead.org>; Thu, 30 Sep 2010 01:25:50 -0700 (MST)
Received: from zch01exm21.fsl.freescale.net (zch01exm21.ap.freescale.net
	[10.192.129.205])	by de01smr01.freescale.net (8.13.1/8.13.0) with ESMTP
	id o8U8eU0c025764	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Sep 2010 03:40:31 -0500 (CDT)
From: Mingkai Hu <Mingkai.hu@freescale.com>
To: linuxppc-dev@ozlabs.org, spi-devel-general@lists.sourceforge.net,
	linux-mtd@lists.infradead.org
Subject: [PATCH v3 0/7] refactor spi_mpc8xxx.c and add eSPI controller support
Date: Thu, 30 Sep 2010 16:00:39 +0800
Message-ID: <1285833646-12006-1-git-send-email-Mingkai.hu@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: grant.likely@secretlab.ca, kumar.gala@freescale.com,
	tie-fei.zang@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patchset refactor the file spi_mpc8xxx.c to abstract some common 
code as a lib used by the SPI/eSPI controller driver, move the SPI 
controller driver code to spi_fsl_spi.c, and add the eSPI controller 
support with spi_fsl_espi.c.

Tested on P4080DS and MPC8536DS board based on latest Linux tree.

v3 main changes:
 - Update to the latest kernel base.
 - Change the file spi_mpc8xxx.c to spi_fsl_fsl.c verbatim.
 - Add the SPI flash partition code to the m25p80 probe function.
 - Add a quirks for SPI master to handle the contrains of the controller.

[PATCH v3 1/7] spi/mpc8xxx: rename spi_mpc8xxx.c to spi_fsl_spi.c
[PATCH v3 2/7] spi/mpc8xxx: refactor the common code for SPI/eSPI controller
[PATCH v3 3/7] eSPI: add eSPI controller support
[PATCH v3 4/7] powerpc/of: add eSPI controller dts bindings and DTS modification
[PATCH v3 5/7] mtd: m25p80: add support to parse the SPI flash's partitions
[PATCH v3 6/7] mtd: m25p80: add a read function to read page by page
[PATCH v3 7/7] DTS: add fsl,spi-quirk-trans-len-limit property

Thanks,
Mingkai
