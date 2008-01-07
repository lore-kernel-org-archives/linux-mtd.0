Received: from courier.cs.helsinki.fi ([128.214.9.1] helo=mail.cs.helsinki.fi)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JBuPL-0007fK-6T
	for linux-mtd@lists.infradead.org; Mon, 07 Jan 2008 16:00:59 +0000
Date: Mon, 7 Jan 2008 18:00:58 +0200 (EET)
From: "=?ISO-8859-1?Q?Ilpo_J=E4rvinen?=" <ilpo.jarvinen@helsinki.fi>
To: dwmw2@infradead.org
Subject: [PATCH] [MTD] jedec probe: drop unnecessary forward declarations
Message-ID: <Pine.LNX.4.64.0801071800230.31652@kivilampi-30.cs.helsinki.fi>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-696243703-155011127-1199721658=:31652"
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

---696243703-155011127-1199721658=:31652
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT


Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@helsinki.fi>
---
 drivers/mtd/chips/jedec_probe.c |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index 76e4d76..7ce7b0a 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -1791,14 +1791,6 @@ static const struct amd_flash_info jedec_table[] = {
 	}
 };
 
-
-static int cfi_jedec_setup(struct cfi_private *p_cfi, int index);
-
-static int jedec_probe_chip(struct map_info *map, __u32 base,
-			    unsigned long *chip_map, struct cfi_private *cfi);
-
-static struct mtd_info *jedec_probe(struct map_info *map);
-
 static inline u32 jedec_read_mfr(struct map_info *map, __u32 base,
 	struct cfi_private *cfi)
 {
-- 
1.5.0.6


-- 
 i.
---696243703-155011127-1199721658=:31652--
