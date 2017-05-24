Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dDSqx-0006oi-Tf
 for linux-mtd@lists.infradead.org; Wed, 24 May 2017 09:45:16 +0000
Received: by mail-lf0-x241.google.com with SMTP id h4so10426139lfj.3
 for <linux-mtd@lists.infradead.org>; Wed, 24 May 2017 02:44:55 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V5 2/4] mtd: partitions: add support for allocating
 subpartition
Date: Wed, 24 May 2017 11:44:35 +0200
Message-Id: <20170524094437.2174-3-zajec5@gmail.com>
In-Reply-To: <20170524094437.2174-1-zajec5@gmail.com>
References: <20170524094437.2174-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rafał Miłecki <rafal@milecki.pl>

Some flash device partitions can be containers with extra subpartitions
(volumes). When allocating subpartition it should be validated against
its parent but its master pointer has to point flash device. It's needed
to make all callbacks like part_read work as expected. It also has to
have offset calculated correctly.

This patch modifies allocate_partition to detect if provided parent is
an existing partition and sets "master" and "offset" correctly if so.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V5: Introduction of this patch to handle offset in allocate_partition
    and avoid casting const to non-const in mtd_parse_part.
---
 drivers/mtd/mtdpart.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 92acd89e07cb..8a0629449804 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -37,7 +37,13 @@
 static LIST_HEAD(mtd_partitions);
 static DEFINE_MUTEX(mtd_partitions_mutex);
 
-/* Our partition node structure */
+/**
+ * struct mtd_part - our partition node structure
+ *
+ * @mtd: struct holding partition details
+ * @master: pointer to the flash device MTD struct
+ * @offset: partition offset relative to the *flash device*
+ */
 struct mtd_part {
 	struct mtd_info mtd;
 	struct mtd_info *master;
@@ -393,9 +399,18 @@ static struct mtd_part *allocate_partition(struct mtd_info *parent,
 			const struct mtd_partition *part, int partno,
 			uint64_t cur_offset)
 {
+	struct mtd_info *master = parent;
 	struct mtd_part *slave;
+	uint64_t parent_offset = 0;
 	char *name;
 
+	if (mtd_is_partition(parent)) {
+		struct mtd_part *parent_part = mtd_to_part(parent);
+
+		master = parent_part->master;
+		parent_offset = parent_part->offset;
+	}
+
 	/* allocate the partition structure */
 	slave = kzalloc(sizeof(*slave), GFP_KERNEL);
 	name = kstrdup(part->name, GFP_KERNEL);
@@ -493,12 +508,12 @@ static struct mtd_part *allocate_partition(struct mtd_info *parent,
 		slave->mtd._put_device = part_put_device;
 
 	slave->mtd._erase = part_erase;
-	slave->master = parent;
-	slave->offset = part->offset;
+	slave->master = master;
+	slave->offset = parent_offset + part->offset;
 
-	if (slave->offset == MTDPART_OFS_APPEND)
+	if (part->offset == MTDPART_OFS_APPEND)
 		slave->offset = cur_offset;
-	if (slave->offset == MTDPART_OFS_NXTBLK) {
+	if (part->offset == MTDPART_OFS_NXTBLK) {
 		slave->offset = cur_offset;
 		if (mtd_mod_by_eb(cur_offset, parent) != 0) {
 			/* Round up to next erasesize */
@@ -508,7 +523,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *parent,
 			       (unsigned long long)cur_offset, (unsigned long long)slave->offset);
 		}
 	}
-	if (slave->offset == MTDPART_OFS_RETAIN) {
+	if (part->offset == MTDPART_OFS_RETAIN) {
 		slave->offset = cur_offset;
 		if (parent->size - slave->offset >= slave->mtd.size) {
 			slave->mtd.size = parent->size - slave->offset
@@ -536,8 +551,8 @@ static struct mtd_part *allocate_partition(struct mtd_info *parent,
 			part->name);
 		goto out_register;
 	}
-	if (slave->offset + slave->mtd.size > parent->size) {
-		slave->mtd.size = parent->size - slave->offset;
+	if (slave->offset + slave->mtd.size > parent_offset + parent->size) {
+		slave->mtd.size = parent_offset + parent->size - slave->offset;
 		printk(KERN_WARNING"mtd: partition \"%s\" extends beyond the end of device \"%s\" -- size truncated to %#llx\n",
 			part->name, parent->name, (unsigned long long)slave->mtd.size);
 	}
-- 
2.11.0
