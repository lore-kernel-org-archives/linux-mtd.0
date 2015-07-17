Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZG32J-0005ug-Do
 for linux-mtd@lists.infradead.org; Fri, 17 Jul 2015 10:38:36 +0000
From: Colin King <colin.king@canonical.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Aaron Sierra <asierra@xes-inc.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Fabian Frederick <fabf@skynet.be>, Joe Schultz <jschultz@xes-inc.com>,
 linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: fix null pointer deference when kzalloc returns null
Date: Fri, 17 Jul 2015 11:37:52 +0100
Message-Id: <1437129472-13099-1-git-send-email-colin.king@canonical.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Colin Ian King <colin.king@canonical.com>

static analysis by smatch caught the following error:

drivers/mtd/maps/physmap_of.c:135 of_get_probes()
   error: potential null dereference 'res'.  (kzalloc returns null)

Check for failed kzalloc and return -ENOMEM in of_flash_probe if
this occurs.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/maps/physmap_of.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 774b32f..3e614e9 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -130,6 +130,8 @@ static const char * const *of_get_probes(struct device_node *dp)
 			count++;
 
 	res = kzalloc((count + 1)*sizeof(*res), GFP_KERNEL);
+	if (!res)
+		return NULL;
 	count = 0;
 	while (cplen > 0) {
 		res[count] = cp;
@@ -311,6 +313,10 @@ static int of_flash_probe(struct platform_device *dev)
 
 	ppdata.of_node = dp;
 	part_probe_types = of_get_probes(dp);
+	if (!part_probe_types) {
+		err = -ENOMEM;
+		goto err_out;
+	}
 	mtd_device_parse_register(info->cmtd, part_probe_types, &ppdata,
 			NULL, 0);
 	of_free_probes(part_probe_types);
-- 
2.1.4
