Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE004.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P5cMg-00034B-Pe
	for linux-mtd@lists.infradead.org; Tue, 12 Oct 2010 10:45:51 +0000
Received: from mail137-tx2 (localhost.localdomain [127.0.0.1])	by
	mail137-tx2-R.bigfish.com (Postfix) with ESMTP id 8893FAE8151	for
	<linux-mtd@lists.infradead.org>; Tue, 12 Oct 2010 10:45:48 +0000 (UTC)
Received: from TX2EHSMHS012.bigfish.com (unknown [10.9.14.241])	by
	mail137-tx2.bigfish.com (Postfix) with ESMTP id 6227B1A70056	for
	<linux-mtd@lists.infradead.org>; Tue, 12 Oct 2010 10:45:48 +0000 (UTC)
Received: from az33smr01.freescale.net (az33smr01.freescale.net
	[10.64.34.199])	by az33egw02.freescale.net (8.14.3/8.14.3) with ESMTP
	id o9CAjk9J007242	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Oct 2010 03:45:46 -0700 (MST)
Received: from zch01exm21.fsl.freescale.net (zch01exm21.ap.freescale.net
	[10.192.129.205])	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP
	id o9CAjiFq025881	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Oct 2010 05:45:45 -0500 (CDT)
From: Mingkai Hu <Mingkai.hu@freescale.com>
To: <linuxppc-dev@ozlabs.org>, <spi-devel-general@lists.sourceforge.net>,
	<linux-mtd@lists.infradead.org>
Subject: [PATCH v4 0/5] refactor spi_mpc8xxx.c and add eSPI controller support
Date: Tue, 12 Oct 2010 18:18:29 +0800
Message-ID: <1286878714-13090-1-git-send-email-Mingkai.hu@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: grant.likely@secretlab.ca, david-b@pacbell.net, kumar.gala@freescale.com,
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

v4 main change:
 - Update to the latest kernel base(Linux 2.6.36-rc7).
 - Add support to the transaction that the length is grater than 0xFFFF
   in the eSPI controller's driver.
 - Some changes according to Grant and Anton's comments.

Tested on P4080DS and MPC8536DS board.

[PATCH v4 1/5] spi/mpc8xxx: rename spi_mpc8xxx.c to spi_fsl_spi.c
[PATCH v4 2/5] spi/mpc8xxx: refactor the common code for SPI/eSPI controller
[PATCH v4 3/5] eSPI: add eSPI controller support
[PATCH v4 4/5] powerpc/of: add eSPI controller dts bindings and DTS modification
[PATCH v4 5/5] mtd: m25p80: add support to parse the partitions by OF node

Thanks,
Mingkai
