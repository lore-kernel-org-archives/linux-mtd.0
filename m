From: Jason Liu <jason.hui@linaro.org>
To: <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] mtd: check parts pointer before using it
Date: Wed, 24 Aug 2011 18:53:01 +0800
Message-ID: <1314183181-4197-1-git-send-email-jason.hui@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain
Cc: dedekind1@gmail.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, patches@linaro.org, David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The code has the check for parts but it called after kmemdup,
kmemdup(parts, sizeof(*parts) * nr_parts,...)
if (!parts)
	return -ENOMEM

In fact, we need check parts before safely using it.

Signed-off-by: Jason Liu <jason.hui@linaro.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@intel.com>

---
This patch is based on git://git.infradead.org/users/dedekind/l2-mtd-2.6.git
---
 drivers/mtd/mtdcore.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 09bdbac..ce59ff5 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -465,12 +465,10 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char **types,
 	struct mtd_partition *real_parts;
 
 	err = parse_mtd_partitions(mtd, types, &real_parts, parser_data);
-	if (err <= 0 && nr_parts) {
+	if (err <= 0 && nr_parts && !parts) {
 		real_parts = kmemdup(parts, sizeof(*parts) * nr_parts,
 				     GFP_KERNEL);
 		err = nr_parts;
-		if (!parts)
-			err = -ENOMEM;
 	}
 
 	if (err > 0) {
-- 
1.7.4.1
