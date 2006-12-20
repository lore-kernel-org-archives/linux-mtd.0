Received: from mta069a.interbusiness.it ([85.37.17.69])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Gx3KP-0002t6-5i
	for linux-mtd@lists.infradead.org; Wed, 20 Dec 2006 10:26:01 -0500
Received: from gianlinux.eptar.com (massimo.eptar.com [192.168.143.6])
	by eptar.com (8.11.6/8.9.3) with ESMTP id kBKFMh432763
	for <linux-mtd@lists.infradead.org>; Wed, 20 Dec 2006 16:22:43 +0100
From: Gianluca <gianlucarenzi@eptar.com>
To: MTD List <linux-mtd@lists.infradead.org>
Subject: Adding a second ChipSelect to Samsung s3c2410 driver
Date: Wed, 20 Dec 2006 16:23:44 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200612201623.44341.gianlucarenzi@eptar.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
I am working on a Samsung SMDK S3C2442 eval board made by Meritech Ltd.
It is based on S3C2440 core with NAND Flash and SDRAM, all embedded into the same SoC,
running at 300Mhz.
This board has an external NAND chip too. The internal nand flash chip select is connected
with microprocessor nFCE chip select line coming from internal NAND Controller,
and the external flash chip select is routed to nGCS5/GPA16 pin.

This NAND mtd/nand driver is working and it is using the s3c2410.c, but it uses only the nFCE as
chip select. Which is the cleanest way to add another chip select (in this case an GPIO line) to this
driver, without breaking the whole word?

Kindest regards,
---
Gianluca Renzi
