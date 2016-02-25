Received: from smtprelay0124.hostedemail.com ([216.40.44.124]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aYzfd-0007Ch-Sx
 for linux-mtd@lists.infradead.org; Thu, 25 Feb 2016 17:25:46 +0000
From: Joe Perches <joe@perches.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: ubi: Add logging functions ubi_msg, ubi_warn and ubi_err
Date: Thu, 25 Feb 2016 09:25:20 -0800
Message-Id: <ec7627e3d80e0ad99557d308b39744886b4b0f40.1456421022.git.joe@perches.com>
In-Reply-To: <56CF115C.6010001@nod.at>
References: <56CF115C.6010001@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Using logging functions instead of macros can reduce overall object size.

$ size drivers/mtd/ubi/built-in.o*
   text	   data	    bss	    dec	    hex	filename
 271620	 163364	  73696	 508680	  7c308	drivers/mtd/ubi/built-in.o.allyesconfig.new
 287638	 165380	  73504	 526522	  808ba	drivers/mtd/ubi/built-in.o.allyesconfig.old
  87728	   3780	    504	  92012	  1676c	drivers/mtd/ubi/built-in.o.defconfig.new
  97084	   3780	    504	 101368	  18bf8	drivers/mtd/ubi/built-in.o.defconfig.old

Signed-off-by: Joe Perches <joe@perches.com>
---

>> I think it'd be better to use and extend the patch I sent
>> for this problem.
>> https://patchwork.ozlabs.org/patch/587057/
>> Add a state check of the ubi pointer in the ubi_<level>
>> functions and do the right thing there.

> Please send such a patch for UBI. :-)

ubifs/ubi, no big diff emirite?

And, OK.  This is a start on it anyway.

 drivers/mtd/ubi/misc.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/ubi/ubi.h  | 16 ++++++++++------
 2 files changed, 59 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/misc.c b/drivers/mtd/ubi/misc.c
index 2a45ac2..989036c 100644
--- a/drivers/mtd/ubi/misc.c
+++ b/drivers/mtd/ubi/misc.c
@@ -153,3 +153,52 @@ int ubi_check_pattern(const void *buf, uint8_t patt, int size)
 			return 0;
 	return 1;
 }
+
+/* Normal UBI messages */
+void ubi_msg(const struct ubi_device *ubi, const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+
+	va_start(args, fmt);
+
+	vaf.fmt = fmt;
+	vaf.va = &args;
+
+	pr_notice(UBI_NAME_STR "%d: %pV\n", ubi->ubi_num, &vaf);
+
+	va_end(args);
+}
+
+/* UBI warning messages */
+void ubi_warn(const struct ubi_device *ubi, const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+
+	va_start(args, fmt);
+
+	vaf.fmt = fmt;
+	vaf.va = &args;
+
+	pr_warn(UBI_NAME_STR "%d warning: %ps: %pV\n",
+		ubi->ubi_num, __builtin_return_address(0), &vaf);
+
+	va_end(args);
+}
+
+/* UBI error messages */
+void ubi_err(const struct ubi_device *ubi, const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+
+	va_start(args, fmt);
+
+	vaf.fmt = fmt;
+	vaf.va = &args;
+
+	pr_err(UBI_NAME_STR "%d error: %ps: %pV\n",
+	       ubi->ubi_num, __builtin_return_address(0), &vaf);
+	va_end(args);
+}
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 2974b67..dadc6a9 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -49,15 +49,19 @@
 /* UBI name used for character devices, sysfs, etc */
 #define UBI_NAME_STR "ubi"
 
+struct ubi_device;
+
 /* Normal UBI messages */
-#define ubi_msg(ubi, fmt, ...) pr_notice(UBI_NAME_STR "%d: " fmt "\n", \
-					 ubi->ubi_num, ##__VA_ARGS__)
+__printf(2, 3)
+void ubi_msg(const struct ubi_device *ubi, const char *fmt, ...);
+
 /* UBI warning messages */
-#define ubi_warn(ubi, fmt, ...) pr_warn(UBI_NAME_STR "%d warning: %s: " fmt "\n", \
-					ubi->ubi_num, __func__, ##__VA_ARGS__)
+__printf(2, 3)
+void ubi_warn(const struct ubi_device *ubi, const char *fmt, ...);
+
 /* UBI error messages */
-#define ubi_err(ubi, fmt, ...) pr_err(UBI_NAME_STR "%d error: %s: " fmt "\n", \
-				      ubi->ubi_num, __func__, ##__VA_ARGS__)
+__printf(2, 3)
+void ubi_err(const struct ubi_device *ubi, const char *fmt, ...);
 
 /* Background thread name pattern */
 #define UBI_BGT_NAME_PATTERN "ubi_bgt%dd"
-- 
2.6.3.368.gf34be46
