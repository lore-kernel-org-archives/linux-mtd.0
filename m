Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mojal-0007TI-Ts
	for linux-mtd@lists.infradead.org; Fri, 18 Sep 2009 19:58:07 +0000
Message-Id: <200909181951.n8IJppQ1023875@imap1.linux-foundation.org>
Subject: [patch 12/13] mtd: jedec_probe: fix NEC uPD29F064115 detection
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Fri, 18 Sep 2009 12:51:51 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Cc: ito@mlb.co.jp, akpm@linux-foundation.org, linux-mtd@lists.infradead.org,
	David.Woodhouse@intel.com, anemo@mba.ocn.ne.jp
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Hiroshi Ito <ito@mlb.co.jp>

linux v2.6.31-rc6 can not detect NEC uPD29F064115.

uPD29F064115 is a 16 bit device.
datasheet:
  http://www.cn.necel.com/memory/cn/download/M16062EJ2V0DS00.pdf

A problem and fix is described in the following commit, which in the main
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
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/chips/jedec_probe.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -puN drivers/mtd/chips/jedec_probe.c~mtd-jedec_probe-fix-nec-upd29f064115-detection drivers/mtd/chips/jedec_probe.c
--- a/drivers/mtd/chips/jedec_probe.c~mtd-jedec_probe-fix-nec-upd29f064115-detection
+++ a/drivers/mtd/chips/jedec_probe.c
@@ -1156,8 +1156,8 @@ static const struct amd_flash_info jedec
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
_
