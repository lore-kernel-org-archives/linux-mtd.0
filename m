Received: from szxga01-in.huawei.com ([119.145.14.64])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vg9Ks-0007L3-Is
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 08:28:36 +0000
From: Caizhiyong <caizhiyong@hisilicon.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] block: cmdline-parser: perfect cmdline format checking
Date: Tue, 12 Nov 2013 08:19:13 +0000
Message-ID: <C3050A4DBA34F345975765E43127F10F1C08B6DD@szxeml512-mbs.china.huawei.com>
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "fengguang.wu@intel.com" <fengguang.wu@intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Karel Zak <kzak@redhat.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>, Joe Perches <joe@perches.com>,
 "Wanglin \(Albert\)" <albert.wanglin@hisilicon.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Cai Zhiyong <caizhiyong@huawei.com>
Date: Tue, 12 Nov 2013 15:50:42 +0800
Subject: [PATCH] block: cmdline-parser: perfect cmdline format checking

 -Fix compile warning with value and function undeclared.
  this reported by <fengguang.wu@intel.com> and
  Randy Dunlap <rdunlap@infradead.org>

 -perfect cmdline format checking, make the error information clear
  for understand, make this lib fully equivalent to the old parser
  in drivers/mtd/cmdlinepart.c

I tested each branch of this patch change, it is ok.

Signed-off-by: Cai Zhiyong <caizhiyong@huawei.com>
---
 block/cmdline-parser.c         | 83 +++++++++++++++++++++++++++++++-------=
----
 include/linux/cmdline-parser.h |  1 +
 2 files changed, 62 insertions(+), 22 deletions(-)

diff --git a/block/cmdline-parser.c b/block/cmdline-parser.c
index 9dbc67e..4833936 100644
--- a/block/cmdline-parser.c
+++ b/block/cmdline-parser.c
@@ -4,12 +4,17 @@
  * Written by Cai Zhiyong <caizhiyong@huawei.com>
  *
  */
+#define pr_fmt(fmt) "cmdline-parser: " fmt
+
 #include <linux/export.h>
 #include <linux/cmdline-parser.h>
+#include <linux/slab.h>
=20
 static int parse_subpart(struct cmdline_subpart **subpart, char *partdef)
 {
 	int ret =3D 0;
+	int lastpart =3D 0;
+	char *partorg =3D partdef;
 	struct cmdline_subpart *new_subpart;
=20
 	*subpart =3D NULL;
@@ -21,10 +26,12 @@ static int parse_subpart(struct cmdline_subpart **subpa=
rt, char *partdef)
 	if (*partdef =3D=3D '-') {
 		new_subpart->size =3D (sector_t)(~0ULL);
 		partdef++;
+		lastpart =3D 1;
 	} else {
 		new_subpart->size =3D (sector_t)memparse(partdef, &partdef);
 		if (new_subpart->size < (sector_t)PAGE_SIZE) {
-			pr_warn("cmdline partition size is invalid.");
+			pr_warn("partition '%s' size '0x%llx' too small.\n",
+				partorg, new_subpart->size);
 			ret =3D -EINVAL;
 			goto fail;
 		}
@@ -42,13 +49,19 @@ static int parse_subpart(struct cmdline_subpart **subpa=
rt, char *partdef)
 		char *next =3D strchr(++partdef, ')');
=20
 		if (!next) {
-			pr_warn("cmdline partition format is invalid.");
+			pr_warn("partition '%s' has no closing ')' found in partition name.\n",
+				partorg);
 			ret =3D -EINVAL;
 			goto fail;
 		}
=20
-		length =3D min_t(int, next - partdef,
-			       sizeof(new_subpart->name) - 1);
+		length =3D (int)(next - partdef);
+		if (length > sizeof(new_subpart->name) - 1) {
+			pr_warn("partition '%s' partition name too long, truncating.\n",
+				partorg);
+			length =3D sizeof(new_subpart->name) - 1;
+		}
+
 		strncpy(new_subpart->name, partdef, length);
 		new_subpart->name[length] =3D '\0';
=20
@@ -68,8 +81,15 @@ static int parse_subpart(struct cmdline_subpart **subpar=
t, char *partdef)
 		partdef +=3D 2;
 	}
=20
+	if (*partdef) {
+		pr_warn("partition '%s' has bad character '%c' after partition.\n",
+			partorg, *partdef);
+		ret =3D -EINVAL;
+		goto fail;
+	}
+
 	*subpart =3D new_subpart;
-	return 0;
+	return lastpart;
 fail:
 	kfree(new_subpart);
 	return ret;
@@ -86,14 +106,13 @@ static void free_subpart(struct cmdline_parts *parts)
 	}
 }
=20
-static int parse_parts(struct cmdline_parts **parts, const char *bdevdef)
+static int parse_parts(struct cmdline_parts **parts, char *bdevdef)
 {
 	int ret =3D -EINVAL;
 	char *next;
 	int length;
 	struct cmdline_subpart **next_subpart;
 	struct cmdline_parts *newparts;
-	char buf[BDEVNAME_SIZE + 32 + 4];
=20
 	*parts =3D NULL;
=20
@@ -102,14 +121,21 @@ static int parse_parts(struct cmdline_parts **parts, =
const char *bdevdef)
 		return -ENOMEM;
=20
 	next =3D strchr(bdevdef, ':');
-	if (!next) {
-		pr_warn("cmdline partition has no block device.");
+	if (!next || next =3D=3D bdevdef) {
+		pr_warn("partition '%s' has no block device.\n", bdevdef);
 		goto fail;
 	}
=20
-	length =3D min_t(int, next - bdevdef, sizeof(newparts->name) - 1);
+	length =3D (int)(next - bdevdef);
+	if (length > sizeof(newparts->name) - 1) {
+		pr_warn("partition '%s' device name too long, truncating.\n",
+			bdevdef);
+		length =3D sizeof(newparts->name) - 1;
+	}
+
 	strncpy(newparts->name, bdevdef, length);
 	newparts->name[length] =3D '\0';
+
 	newparts->nr_subparts =3D 0;
=20
 	next_subpart =3D &newparts->subpart;
@@ -117,23 +143,25 @@ static int parse_parts(struct cmdline_parts **parts, =
const char *bdevdef)
 	while (next && *(++next)) {
 		bdevdef =3D next;
 		next =3D strchr(bdevdef, ',');
+		if (next)
+			*next =3D '\0';
=20
-		length =3D (!next) ? (sizeof(buf) - 1) :
-			min_t(int, next - bdevdef, sizeof(buf) - 1);
-
-		strncpy(buf, bdevdef, length);
-		buf[length] =3D '\0';
-
-		ret =3D parse_subpart(next_subpart, buf);
-		if (ret)
+		ret =3D parse_subpart(next_subpart, bdevdef);
+		if (ret < 0) {
 			goto fail;
+		} else if (ret > 0 && next) {
+			pr_warn("no partitions allowed after a fill-up partition.\n");
+			ret =3D -EINVAL;
+			goto fail;
+		}
=20
 		newparts->nr_subparts++;
 		next_subpart =3D &(*next_subpart)->next_subpart;
 	}
=20
 	if (!newparts->subpart) {
-		pr_warn("cmdline partition has no valid partition.");
+		pr_warn("block device '%s' has no valid partition.\n",
+			newparts->name);
 		ret =3D -EINVAL;
 		goto fail;
 	}
@@ -192,7 +220,7 @@ int cmdline_parts_parse(struct cmdline_parts **parts, c=
onst char *cmdline)
 	}
=20
 	if (!*parts) {
-		pr_warn("cmdline partition has no valid partition.");
+		pr_warn("no found valid partition.\n");
 		ret =3D -EINVAL;
 		goto fail;
 	}
@@ -237,11 +265,22 @@ int cmdline_parts_set(struct cmdline_parts *parts, se=
ctor_t disk_size,
 		else
 			from =3D subpart->from;
=20
-		if (from >=3D disk_size)
+		if (subpart->name[0] =3D=3D '\0')
+			snprintf(subpart->name, sizeof(subpart->name),
+				 "partition%03d", slot);
+
+		if (from >=3D disk_size) {
+			pr_warn("partition '%s' offset exceeds device '%s' size '0x%llx', ignor=
ing.\n",
+				subpart->name, parts->name, disk_size);
 			break;
+		}
=20
-		if (subpart->size > (disk_size - from))
+		if (subpart->size > (disk_size - from)) {
+			if (subpart->size !=3D (sector_t)(~0ULL))
+				pr_warn("partition '%s' size exceeds device '%s' size '0x%llx', trunca=
ting.\n",
+					subpart->name, parts->name, disk_size);
 			subpart->size =3D disk_size - from;
+		}
=20
 		from +=3D subpart->size;
=20
diff --git a/include/linux/cmdline-parser.h b/include/linux/cmdline-parser.=
h
index 43b65a9..c6491b2 100644
--- a/include/linux/cmdline-parser.h
+++ b/include/linux/cmdline-parser.h
@@ -8,6 +8,7 @@
 #define CMDLINEPARSEH
=20
 #include <linux/blkdev.h>
+#include <linux/fs.h>
=20
 /* partition flags */
 #define PF_RDONLY                   0x01 /* Device is read only */
--=20
1.8.1.5
