Received: from mail-de.keymile.com ([195.8.104.1])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SgWKg-0002jP-2i
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2012 07:25:07 +0000
From: Gerlando Falauto <gerlando.falauto@keymile.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH RFC 2/2] mtd: cfi_cmdset_0002: Micron M29EW bugfix "Resolving
 the Delay After Resume Issue"
Date: Mon, 18 Jun 2012 09:24:39 +0200
Message-Id: <1340004279-26496-3-git-send-email-gerlando.falauto@keymile.com>
In-Reply-To: <1340004279-26496-1-git-send-email-gerlando.falauto@keymile.com>
References: <1340004279-26496-1-git-send-email-gerlando.falauto@keymile.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset=UTF-8
Content-Transfer-Encoding: 8bit
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

>From TN-13-07: Patching the Linux Kernel and U-Boot for M29 Flash, page 22:

Some revisions of the M29EW (for example, A1 and A2 step revisions) are affected by a
problem that could cause a hang up when an ERASE SUSPEND command is issued after
an ERASE RESUME operation without waiting for a minimum delay. The result is that
once the ERASE seems to be completed (no bits are toggling), the contents of the Flash
memory block on which the erase was ongoing could be inconsistent with the expected
values (typically, the array value is stuck to the 0xC0, 0xC4, 0x80, or 0x84 values), causing
a consequent failure of the ERASE operation.
The occurrence of this issue could be high, especially when file system operations on the
Flash are intensive. As a result, it is recommended that a patch be applied. Intensive file
system operations can cause many calls to the garbage routine to free Flash space (also
by erasing physical Flash blocks) and as a result, many consecutive SUSPEND and
RESUME commands can occur.
The problem disappears when a delay is inserted after the RESUME command by using
the udelay () function available in Linux.

The DELAY value must be tuned based on the customer’s platform. The maximum value
that fixes the problem in all cases is 500us. But, in our experience, a delay of 30μs to 50μs
is sufficient in most cases.
We have chosen 500us because this latency is acceptable.

Signed-off-by: Stefan Bigler <stefan.bigler@keymile.com>
Signed-off-by: Gerlando Falauto <gerlando.falauto@keymile.com>
Cc: Holger Brunck <holger.brunck@keymile.com>
Cc: Leo <leo.costa77@gmail.com>

---
 drivers/mtd/chips/cfi_cmdset_0002.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 72f6164..7fb24dc 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -767,6 +767,10 @@ static void put_chip(struct map_info *map, struct flchip *chip, unsigned long ad
 			  || ((cfi->device_type == CFI_DEVICETYPE_X16) && (cfi->id == 0x227e))) )
 			map_write(map, CMD(0xF0), chip->in_progress_block_addr);
 		map_write(map, cfi->sector_erase_cmd, chip->in_progress_block_addr);
+		/* Resolving the Delay After Resume Issue see Micron TN-13-07 */
+		/* Worstcase delay must be 500us but 30-50us should be ok as well
+		   nbigls has choosen 500us because this latency is acceptable */
+		udelay(500);
 		chip->oldstate = FL_READY;
 		chip->state = FL_ERASING;
 		break;
-- 
1.7.1
