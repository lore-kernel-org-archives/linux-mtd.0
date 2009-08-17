Received: from dns.mlb.co.jp ([210.251.64.148] helo=mail.mlb.co.jp)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mcr61-0005Ku-21
	for linux-mtd@lists.infradead.org; Mon, 17 Aug 2009 01:33:16 +0000
Date: Mon, 17 Aug 2009 10:24:08 +0900 (JST)
Message-Id: <20090817.102408.159676517.ito@mlb.co.jp>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: jedec_probe: Fix NEC uPD29F064115 detection.
From: Hiroshi Ito <ito@mlb.co.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

linux v2.6.31-rc6 can not detect NEC uPD29F064115.

uPD29F064115 is a 16 bit device.
datasheet:
  http://www.cn.necel.com/memory/cn/download/M16062EJ2V0DS00.pdf

A problem and fix is described as following commit, which in the main
kernel tree, uPD29F064115 needs same fix.

commit ca6f12c67ed19718cf37d0f531af9438de85b70c
Author: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Date:   Wed Jul 16 00:09:15 2008 +0900

    [MTD] jedec_probe: Fix SST 16-bit chip detection

    The unlock_addr rework in kernel 2.6.25 breaks 16-bit SST chips.  SST
    39LF160 and SST 39VF1601 are both 16-bit only chip (do not have BYTE#
    pin) and new uaddr value is not correct for them.  Add
    MTD_UADDR_0xAAAA_0x5555 for those chips.  Tested with SST 39VF1601
    chip.
    
    Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>


Signed-off-by: Hiroshi Ito <ito@mlb.co.jp>
---
 drivers/mtd/chips/jedec_probe.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index ccc4cfc..0f7065d 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -1156,8 +1156,8 @@ static const struct amd_flash_info jedec_table[] = {
 		.mfr_id		= MANUFACTURER_NEC,
 		.dev_id		= UPD29F064115,
 		.name		= "NEC uPD29F064115",
-		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
-		.uaddr		= MTD_UADDR_0x0555_0x02AA,	/* ???? */
+		.devtypes	= CFI_DEVICETYPE_X16,
+		.uaddr		= MTD_UADDR_0xAAAA_0x5555,
 		.dev_size	= SIZE_8MiB,
 		.cmd_set	= P_ID_AMD_STD,
 		.nr_regions	= 3,
-- 
1.5.6.5

--------
Hiroshi Ito
Media Lab. Inc.,
URL http://www.mlb.co.jp ( Sorry, Japanese only. )
TEL +81-3-5294-7255  FAX +81-3-5294-7256
