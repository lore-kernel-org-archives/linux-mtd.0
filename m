Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SbvPH-0004HA-GW
 for linux-mtd@lists.infradead.org; Tue, 05 Jun 2012 15:10:52 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: [PATCH 5/5] UBI: fastmap: more tiny TODOs
Date: Tue,  5 Jun 2012 18:11:59 +0300
Message-Id: <1338909119-5188-6-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1338909119-5188-1-git-send-email-dedekind1@gmail.com>
References: <1338909119-5188-1-git-send-email-dedekind1@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 TODO                      |    2 ++
 drivers/mtd/ubi/fastmap.c |    7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/TODO b/TODO
index 17e30b6..a944159 100644
--- a/TODO
+++ b/TODO
@@ -9,3 +9,5 @@ to the ubi-utils.git repository, to a separate branch at the beginning
    test UBI + fastmap with it.
 3. Test the autoresize feature
 4. Test 'ubi_flush()'
+5. Test that the same UBI image works fine on both LE and BE machines. I guess
+   we can do this using sime kind of emulators?
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index f938507..d446fc3 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -455,6 +455,9 @@ out:
  * @fm_raw: the fastmap it self as byte array
  * @fm_size: size of the fastmap in bytes
  */
+/* TODO: please, make all pointers like 'fm_raw' of type void. It is indeed a
+ * pointer to data blob, it is not a pointer to a string of characters. Note,
+ * that in pointer arithmetics void * is the same as char *. */
 static int ubi_attach_fastmap(struct ubi_device *ubi,
 			      struct ubi_attach_info *ai,
 			      char *fm_raw, size_t fm_size)
@@ -503,6 +506,10 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 	if (fm_pos >= fm_size)
 		goto fail_bad;
 
+	/* TODO: this is difficult to read. Can we please have instead an
+	 * aggregate data structure? I did not think hard on it may be you have
+	 * a good reason for this difficult style, but on the first glance it
+	 * does not look like. And where are all the endiness stuff?  */
 	fmhdr = (struct ubi_fm_hdr *)(fm_raw + fm_pos);
 	fm_pos += sizeof(*fmhdr);
 	if (fm_pos >= fm_size)
-- 
1.7.10
