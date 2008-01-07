Received: from courier.cs.helsinki.fi ([128.214.9.1] helo=mail.cs.helsinki.fi)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JBuOr-0007fK-I8
	for linux-mtd@lists.infradead.org; Mon, 07 Jan 2008 16:00:36 +0000
Date: Mon, 7 Jan 2008 18:00:17 +0200 (EET)
From: "=?ISO-8859-1?Q?Ilpo_J=E4rvinen?=" <ilpo.jarvinen@helsinki.fi>
To: dwmw2@infradead.org
Subject: [PATCH] [MTD] JEDEC probe: kill some inline bloat
Message-ID: <Pine.LNX.4.64.0801071759000.31652@kivilampi-30.cs.helsinki.fi>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-696243703-408610384-1199721617=:31652"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---696243703-408610384-1199721617=:31652
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT

$ codiff $OBJ.old $OBJ
drivers/mtd/chips/jedec_probe.c:
  cfi_jedec_setup  | -320
  jedec_probe_chip | -7073
 2 functions changed, 7393 bytes removed, diff: -7393

drivers/mtd/chips/jedec_probe.c:
  jedec_reset | +1151
 1 function changed, 1151 bytes added, diff: +1151

drivers/mtd/chips/jedec_probe.o:
 3 functions changed, 1151 bytes added, 7393 bytes removed, diff: -6242

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@helsinki.fi>
---
 drivers/mtd/chips/jedec_probe.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index a67b23b..76e4d76 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -1821,8 +1821,7 @@ static inline u32 jedec_read_id(struct map_info *map, __u32 base,
 	return result.x[0] & mask;
 }
 
-static inline void jedec_reset(u32 base, struct map_info *map,
-	struct cfi_private *cfi)
+static void jedec_reset(u32 base, struct map_info *map, struct cfi_private *cfi)
 {
 	/* Reset */
 
-- 
1.5.0.6

---696243703-408610384-1199721617=:31652--
