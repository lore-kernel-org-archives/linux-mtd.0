Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjXiJ-0000Zk-SA
 for linux-mtd@lists.infradead.org; Thu, 21 Nov 2013 17:06:48 +0000
Received: from DeadDuck (unknown [172.20.177.82])
 by nsa.nbspaymentsolutions.com (Postfix) with ESMTP id D9E723FC4AD
 for <linux-mtd@lists.infradead.org>; Thu, 21 Nov 2013 12:08:43 -0500 (EST)
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: linux-mtd@lists.infradead.org
Subject: VF610+ColdFireM54418 controller.
Date: Thu, 21 Nov 2013 12:01:21 -0500
Message-ID: <87siupheou.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


There are some mtd drivers for this NAND flash controller on the web.

Eg,
 https://dev.openwrt.org/browser/trunk/target/linux/coldfire/patches/016-Add-nand-driver-support-for-M54418TWR-board.patch?rev=31546
 https://github.com/Timesys/linux-timesys/blob/3.0-mvf/drivers/mtd/nand/fsl_nfc.c

The device has 9K SRAM for main and spare areas.  The register layout
is,

  off name      desc
   00 NFC_CMD1    Flash command 1
   04 NFC_CMD2    Flash command 2
   08 NFC_CAR     Column address
   0C NFC_RAR     Row address 
   10 NFC_RPT     Flash command repeat
   14 NFC_RAI     Row address increment
   18 NFC_SR1     Flash status 1 *read only*
   1C NFC_SR2     Flash status 2 *read only*
   20 NFC_DMA_CH1 DMA channel 1 address
   24 NFC_DMACFG  DMA configuration
   28 NFC_SWAP    Cach swap
   2C NFC_SECSZ   Sector size
   30 NFC_CFG     Flash configuration
   34 NFC_DMA_CH2 DMA channel 2 address
   38 NFC_ISR     Interrupt status

All registers are 32bit R/W unless noted, from section 31.3 of the
Vybrid NAND chapter.

Is anyone working on support for this chip set?  
Is there an existing driver that can be adapted?  
Is the 'fsl_nfc' name appropriate?  If not, what name?
Is there any reason an updated driver won't be considered for the
mainline?

Thanks,
Bill Pringlemeir.
