From: Huang Shijie <b32955@freescale.com>
To: <s.hauer@pengutronix.de>
Subject: [PATCH v8 2/4] ARM: mxs: add new a pad control
Date: Wed, 24 Aug 2011 15:07:21 +0800
Message-ID: <1314169643-23425-3-git-send-email-b32955@freescale.com>
In-Reply-To: <1314169643-23425-1-git-send-email-b32955@freescale.com>
References: <1314169643-23425-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
	w.sang@pengutronix.de, linux-arm-kernel@lists.infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

add a new pad control which is used in some rare cases,
such as gpmi-nand device.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 arch/arm/mach-mxs/include/mach/iomux.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-mxs/include/mach/iomux.h b/arch/arm/mach-mxs/include/mach/iomux.h
index 7abdf58..1b6f55a 100644
--- a/arch/arm/mach-mxs/include/mach/iomux.h
+++ b/arch/arm/mach-mxs/include/mach/iomux.h
@@ -93,6 +93,7 @@ typedef u32 iomux_cfg_t;
 
 /* generic pad control used in most cases */
 #define MXS_PAD_CTRL	(MXS_PAD_4MA | MXS_PAD_3V3 | MXS_PAD_NOPULL)
+#define MXS_PAD_CTRL_12MA	(MXS_PAD_12MA | MXS_PAD_3V3 | MXS_PAD_NOPULL)
 
 #define MXS_IOMUX_PAD(_bank, _pin, _muxsel, _ma, _vol, _pull)		\
 		(((iomux_cfg_t)(_bank) << MXS_PAD_BANK_SHIFT) |		\
-- 
1.7.0.4
