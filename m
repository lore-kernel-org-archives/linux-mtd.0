Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Na6gY-0003ZT-7k
	for linux-mtd@lists.infradead.org; Wed, 27 Jan 2010 12:07:54 +0000
From: Anatolij Gustschin <agust@denx.de>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 0/8] Update support for MPC512x
Date: Wed, 27 Jan 2010 13:07:24 +0100
Message-Id: <1264594052-20317-1-git-send-email-agust@denx.de>
Cc: John Rigby <jcrigby@gmail.com>, dzu@denx.de, linux-usb@vger.kernel.org,
	Grant Likely <grant.likely@secretlab.ca>,
	linux-mtd@lists.infradead.org, rtc-linux@googlegroups.com,
	Dan Williams <dan.j.williams@intel.com>, Anatolij Gustschin <agust@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series brings support for the Freescale MPC512x
processsors up to date:

powerpc/mpc5121: Add machine restart support
rtc: Add MPC5121 Real time clock driver
mtd: Add NAND Flash Controller driver
dma: Add MPC512x DMA driver
powerpc/mpc5121: add USB host support
powerpc/mpc5121: shared DIU framebuffer support
powerpc/mpc5121: update mpc5121ads DTS
powerpc/mpc5121: Add default config for MPC5121ADS

The patches are based on v2.6.33-rc5 and cover the following
items:

- platform, DTS
- DMA
- DIU
- UART (without h/w flow control)
- I2C
- NAND
- RTC

The code has been tested on the Freescale/STX "MPC5121ADS" board
(board rev. 4) with a MPC5121e Rev. 2. No attempt was made to provide
backward compatibility to older silicon revisions or older revisions
of the board.

Changes since v1:
 - MPC5121 FEC support patches are removed from this patch series
   as these were not accepted
 - I2C support path is also removed, the I2C support is addressed
   by another patch series from Wolfgang Grandegger:
       i2c-mpc: add support for the Freescale MPC512x and other fixes
   Appropriate fixes for MPC5121ADS DTS are addressed by DTS patch in
   this patch series
 - Detailed changelog is added to each patch of the series

Cc: Grant Likely <grant.likely@secretlab.ca>
Cc: John Rigby <jcrigby@gmail.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: <rtc-linux@googlegroups.com>
Cc: <linux-mtd@lists.infradead.org>
Cc: <linux-usb@vger.kernel.org>
---
