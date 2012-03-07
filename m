Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5KUl-000740-JW
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 17:17:48 +0000
Message-ID: <1331140808.3463.28.camel@sauron.fi.intel.com>
Subject: Re: ubi: suspicious calculation in 'ubi_wl_get_peb'
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>, Richard Weinberger
 <rw@linutronix.de>
Date: Wed, 07 Mar 2012 19:20:08 +0200
In-Reply-To: <20120217153828.71eba4e4@pixies.home.jungo.com>
References: <20120217153828.71eba4e4@pixies.home.jungo.com>
Content-Type: multipart/mixed; boundary="=-b+1Dl/zD4Ykw1ehEoVWx"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-b+1Dl/zD4Ykw1ehEoVWx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-02-17 at 15:38 +0200, Shmulik Ladkani wrote:
> -			e = find_wl_entry(&ubi->free, medium_ec);
> +			e = find_wl_entry(&ubi->free, WL_FREE_MAX_DIFF/2)
> 
> Did I get something wrong?

Yeah, I think you are right. Now I am completely convinced we should
remove this "short/long-term" stuff because this did even work
correctly :-)

CCint Richard - I happened to suggest the removal to him earlier today.

What do you think about these untested fixes (also attached):

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Wed, 7 Mar 2012 18:56:29 +0200
Subject: [PATCH 1/2] UBI: fix documentation and improve readability

The "max" parameter of 'find_wl_entry()' was documented incorrectly and
it actually means the maximum possible difference, not the maximum absolute
value. Rename it to "diff" instead, and amend the documentation.

Reported-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/wl.c |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 0696e36..10d7b98 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -350,18 +350,19 @@ static void prot_queue_add(struct ubi_device *ubi, struct ubi_wl_entry *e)
 /**
  * find_wl_entry - find wear-leveling entry closest to certain erase counter.
  * @root: the RB-tree where to look for
- * @max: highest possible erase counter
+ * @diff: highest possible erase counter difference
  *
  * This function looks for a wear leveling entry with erase counter closest to
- * @max and less than @max.
+ * min + @diff, where min is the currently smallest erase counter.
  */
-static struct ubi_wl_entry *find_wl_entry(struct rb_root *root, int max)
+static struct ubi_wl_entry *find_wl_entry(struct rb_root *root, int diff)
 {
 	struct rb_node *p;
 	struct ubi_wl_entry *e;
+	int max;
 
 	e = rb_entry(rb_first(root), struct ubi_wl_entry, u.rb);
-	max += e->ec;
+	max = e->ec + diff;
 
 	p = root->rb_node;
 	while (p) {
-- 
1.7.9.1

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Wed, 7 Mar 2012 19:08:36 +0200
Subject: [PATCH 2/2] UBI: fix eraseblock picking criteria

The 'find_wl_entry()' function expects the maximum difference as the second
argument, not the maximum absolute value. So the "unknown" eraseblock picking
was incorrect, as Shmulik Ladkani spotted. This patch fixes the issue.

Reported-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: stable@kernel.org
---
 drivers/mtd/ubi/wl.c |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 10d7b98..051cb3a 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -390,7 +390,7 @@ static struct ubi_wl_entry *find_wl_entry(struct rb_root *root, int diff)
  */
 int ubi_wl_get_peb(struct ubi_device *ubi, int dtype)
 {
-	int err, medium_ec;
+	int err;
 	struct ubi_wl_entry *e, *first, *last;
 
 	ubi_assert(dtype == UBI_LONGTERM || dtype == UBI_SHORTTERM ||
@@ -437,10 +437,8 @@ retry:
 		if (last->ec - first->ec < WL_FREE_MAX_DIFF)
 			e = rb_entry(ubi->free.rb_node,
 					struct ubi_wl_entry, u.rb);
-		else {
-			medium_ec = (first->ec + WL_FREE_MAX_DIFF)/2;
-			e = find_wl_entry(&ubi->free, medium_ec);
-		}
+		else
+			e = find_wl_entry(&ubi->free, WL_FREE_MAX_DIFF/2);
 		break;
 	case UBI_SHORTTERM:
 		/*
-- 
1.7.9.1

-- 
Best Regards,
Artem Bityutskiy

--=-b+1Dl/zD4Ykw1ehEoVWx
Content-Disposition: attachment;
	filename="0001-UBI-fix-documentation-and-improve-readability.patch"
Content-Type: text/x-patch;
	name="0001-UBI-fix-documentation-and-improve-readability.patch";
	charset="UTF-8"
Content-Transfer-Encoding: 7bit

>From 369897e5f49052f78dea2f02a498390cd2459d43 Mon Sep 17 00:00:00 2001
Message-Id: <369897e5f49052f78dea2f02a498390cd2459d43.1331140361.git.artem.bityutskiy@linux.intel.com>
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Wed, 7 Mar 2012 18:56:29 +0200
Subject: [PATCH 1/2] UBI: fix documentation and improve readability

The "max" parameter of 'find_wl_entry()' was documented incorrectly and
it actually means the maximum possible difference, not the maximum absolute
value. Rename it to "diff" instead, and amend the documentation.

Reported-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/wl.c |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 0696e36..10d7b98 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -350,18 +350,19 @@ static void prot_queue_add(struct ubi_device *ubi, struct ubi_wl_entry *e)
 /**
  * find_wl_entry - find wear-leveling entry closest to certain erase counter.
  * @root: the RB-tree where to look for
- * @max: highest possible erase counter
+ * @diff: highest possible erase counter difference
  *
  * This function looks for a wear leveling entry with erase counter closest to
- * @max and less than @max.
+ * min + @diff, where min is the currently smallest erase counter.
  */
-static struct ubi_wl_entry *find_wl_entry(struct rb_root *root, int max)
+static struct ubi_wl_entry *find_wl_entry(struct rb_root *root, int diff)
 {
 	struct rb_node *p;
 	struct ubi_wl_entry *e;
+	int max;
 
 	e = rb_entry(rb_first(root), struct ubi_wl_entry, u.rb);
-	max += e->ec;
+	max = e->ec + diff;
 
 	p = root->rb_node;
 	while (p) {
-- 
1.7.9.1


--=-b+1Dl/zD4Ykw1ehEoVWx
Content-Disposition: attachment; filename="0002-UBI-fix-eraseblock-picking-criteria.patch"
Content-Type: text/x-patch; name="0002-UBI-fix-eraseblock-picking-criteria.patch";
	charset="UTF-8"
Content-Transfer-Encoding: 7bit

>From b874a16e244d21ce2e6b7d1ab81538f5b0a5968d Mon Sep 17 00:00:00 2001
Message-Id: <b874a16e244d21ce2e6b7d1ab81538f5b0a5968d.1331140361.git.artem.bityutskiy@linux.intel.com>
In-Reply-To: <369897e5f49052f78dea2f02a498390cd2459d43.1331140361.git.artem.bityutskiy@linux.intel.com>
References: <369897e5f49052f78dea2f02a498390cd2459d43.1331140361.git.artem.bityutskiy@linux.intel.com>
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Wed, 7 Mar 2012 19:08:36 +0200
Subject: [PATCH 2/2] UBI: fix eraseblock picking criteria

The 'find_wl_entry()' function expects the maximum difference as the second
argument, not the maximum absolute value. So the "unknown" eraseblock picking
was incorrect, as Shmulik Ladkani spotted. This patch fixes the issue.

Reported-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: stable@kernel.org
---
 drivers/mtd/ubi/wl.c |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 10d7b98..051cb3a 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -390,7 +390,7 @@ static struct ubi_wl_entry *find_wl_entry(struct rb_root *root, int diff)
  */
 int ubi_wl_get_peb(struct ubi_device *ubi, int dtype)
 {
-	int err, medium_ec;
+	int err;
 	struct ubi_wl_entry *e, *first, *last;
 
 	ubi_assert(dtype == UBI_LONGTERM || dtype == UBI_SHORTTERM ||
@@ -437,10 +437,8 @@ retry:
 		if (last->ec - first->ec < WL_FREE_MAX_DIFF)
 			e = rb_entry(ubi->free.rb_node,
 					struct ubi_wl_entry, u.rb);
-		else {
-			medium_ec = (first->ec + WL_FREE_MAX_DIFF)/2;
-			e = find_wl_entry(&ubi->free, medium_ec);
-		}
+		else
+			e = find_wl_entry(&ubi->free, WL_FREE_MAX_DIFF/2);
 		break;
 	case UBI_SHORTTERM:
 		/*
-- 
1.7.9.1


--=-b+1Dl/zD4Ykw1ehEoVWx--
