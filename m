Received: from mail-de.keymile.com ([195.8.104.1])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SgWKg-0002jK-1q
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2012 07:25:07 +0000
From: Gerlando Falauto <gerlando.falauto@keymile.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH RFC 1/2] mtd: cfi_cmdset_0002: Micron M29EW bugfix "Correcting
 Erase Suspend Hang Ups"
Date: Mon, 18 Jun 2012 09:24:38 +0200
Message-Id: <1340004279-26496-2-git-send-email-gerlando.falauto@keymile.com>
In-Reply-To: <1340004279-26496-1-git-send-email-gerlando.falauto@keymile.com>
References: <1340004279-26496-1-git-send-email-gerlando.falauto@keymile.com>
Cc: Holger Brunck <holger.brunck@keymile.com>, Leo <leo.costa77@gmail.com>,
 Stefan Bigler <stefan.bigler@keymile.com>,
 Gerlando Falauto <gerlando.falauto@keymile.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From TN-13-07: Patching the Linux Kernel and U-Boot for M29 Flash, page 20:

Some revisions of the M29EW suffer from erase suspend hang ups. In particular, it can
occur when the sequence Erase Confirm -> Suspend -> Program -> Resume
causes a lockup due to internal timing issues. The consequence is that the erase cannot
be resumed without inserting a dummy command after programming and prior to
resuming. [...] The work-around is to issue a dummy write cycle that
writes an F0 command code before the RESUME command.

Signed-off-by: Stefan Bigler <stefan.bigler@keymile.com>
Signed-off-by: Gerlando Falauto <gerlando.falauto@keymile.com>
Cc: Holger Brunck <holger.brunck@keymile.com>
Cc: Leo <leo.costa77@gmail.com>

---
 drivers/mtd/chips/cfi_cmdset_0002.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 23175ed..72f6164 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -761,6 +761,11 @@ static void put_chip(struct map_info *map, struct flchip *chip, unsigned long ad
 
 	switch(chip->oldstate) {
 	case FL_ERASING:
+		/* before resume, insert a dummy 0xF0 cycle for Micron M29EW devices */
+		if ( (cfi->mfr == 0x0089) &&
+		   (((cfi->device_type == CFI_DEVICETYPE_X8) && ((cfi->id & 0xff)== 0x7e))
+			  || ((cfi->device_type == CFI_DEVICETYPE_X16) && (cfi->id == 0x227e))) )
+			map_write(map, CMD(0xF0), chip->in_progress_block_addr);
 		map_write(map, cfi->sector_erase_cmd, chip->in_progress_block_addr);
 		chip->oldstate = FL_READY;
 		chip->state = FL_ERASING;
@@ -904,6 +909,12 @@ static void __xipram xip_udelay(struct map_info *map, struct flchip *chip,
 			local_irq_disable();
 
 			/* Resume the write or erase operation */
+			/* before resume, insert a dummy 0xF0 cycle for Micron M29EW devices */
+			if ( (cfi->mfr == 0x0089) &&
+				 (((cfi->device_type == CFI_DEVICETYPE_X8) && ((cfi->id & 0xff)== 0x7e))
+				  || ((cfi->device_type == CFI_DEVICETYPE_X16) && (cfi->id == 0x227e))) )
+					map_write(map, CMD(0xF0), adr);
+
 			map_write(map, cfi->sector_erase_cmd, adr);
 			chip->state = oldstate;
 			start = xip_currtime();
-- 
1.7.1
