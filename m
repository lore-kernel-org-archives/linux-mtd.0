Received: from smtp6-g21.free.fr ([212.27.42.6])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Niosn-0003sm-UP
	for linux-mtd@lists.infradead.org; Sat, 20 Feb 2010 12:56:34 +0000
Subject: [PATCH 1/6] mtd: cfi_cmdset_0002: remove unused MANUFACTURER_{AMD,
	ATMEL} definitions
To: David Woodhouse <dwmw2@infradead.org>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Sat, 20 Feb 2010 13:57:49 +0100
Message-ID: <20100220125748.14843.70415.stgit@shiryu.yomgui.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove MANUFACTURER_AMD and MANUFACTURER_ATMEL definition from
cfi_cmdset_0002.c as it is unused and a deplicate of CFI_MFR_{AMD,ATMEL}
already in include/linux/mtd/cfi.h.

Signed-off-by: Guillaume Lecerf <glecerf@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index f3600e8..1fe27ea 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -43,8 +43,6 @@
 
 #define MAX_WORD_RETRIES 3
 
-#define MANUFACTURER_AMD	0x0001
-#define MANUFACTURER_ATMEL	0x001F
 #define MANUFACTURER_MACRONIX	0x00C2
 #define MANUFACTURER_SST	0x00BF
 #define SST49LF004B	        0x0060
