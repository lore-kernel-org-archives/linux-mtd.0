Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRzzv-0008FB-BL
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2011 04:59:11 +0000
Received: by gwb1 with SMTP id 1so266675gwb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Jun 2011 21:59:03 -0700 (PDT)
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] UBIFS FAQ: kernel version 2.6.40 -> 3.0
Date: Thu,  2 Jun 2011 00:59:00 -0400
Message-Id: <1306990740-7741-1-git-send-email-mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

---
 faq/ubifs.xml |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/faq/ubifs.xml b/faq/ubifs.xml
index 06ae05b..3348da4 100644
--- a/faq/ubifs.xml
+++ b/faq/ubifs.xml
@@ -629,7 +629,7 @@ time. But this happens only once, and the "free space fixup" procedure then
 unsets the "fixup" UBIFS superblock flag.</p>
 
 <p>This option is supported if you are running a kernel version
-<code>2.6.40</code> or higher, or if you have pulled the changes from a UBIFS
+<code>3.0</code> or higher, or if you have pulled the changes from a UBIFS
 <a href="../doc/ubifs.html#L_source">back-port tree</a>.  Note that
 <code>ubiformat</code> is still the preferred flashing method if the image is
 not being flashed for the first time, since it preserves existing erase
-- 
1.7.4.1
