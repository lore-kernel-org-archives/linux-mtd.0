Received: from mgw2.diku.dk ([130.225.96.92])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qdk0d-0002Ti-AY
	for linux-mtd@lists.infradead.org; Mon, 04 Jul 2011 14:20:24 +0000
From: Julia Lawall <julia@diku.dk>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] drivers/mtd/lpddr/lpddr_cmds.c: eliminate double free
Date: Mon,  4 Jul 2011 16:20:17 +0200
Message-Id: <1309789217-22947-1-git-send-email-julia@diku.dk>
Cc: Joakim Tjernlund <joakim.tjernlund@transmode.se>,
	Lucas De Marchi <lucas.demarchi@profusion.mobi>,
	Stefani Seibold <stefani@seibold.net>,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, Tadashi Abe <tabe@mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Julia Lawall <julia@diku.dk>

The only call to lpddr_cmdset is in the function defined in lpddr_probe
drivers/mtd/lpddr/qinfo_probe.c.  If the result of calling lpddr_cmdset is
NULL, this function frees lpddr.  So lpddr should not be freed in
lpddr_cmdset.

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/mtd/lpddr/lpddr_cmds.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
index 65655dd..b7f265e 100644
--- a/drivers/mtd/lpddr/lpddr_cmds.c
+++ b/drivers/mtd/lpddr/lpddr_cmds.c
@@ -89,7 +89,6 @@ struct mtd_info *lpddr_cmdset(struct map_info *map)
 	shared = kmalloc(sizeof(struct flchip_shared) * lpddr->numchips,
 						GFP_KERNEL);
 	if (!shared) {
-		kfree(lpddr);
 		kfree(mtd);
 		return NULL;
 	}
