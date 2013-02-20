Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U8Cjf-0000cu-Un
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2013 16:41:36 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH mtd-utils] Makefile: also build and install flash_otp_lock and
 flash_otp_write
Date: Wed, 20 Feb 2013 17:41:31 +0100
Message-Id: <1361378491-18687-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 .gitignore |    2 ++
 Makefile   |    3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index d4771fb..83ca938 100644
--- a/.gitignore
+++ b/.gitignore
@@ -25,6 +25,8 @@
 /flash_lock
 /flash_otp_dump
 /flash_otp_info
+/flash_otp_lock
+/flash_otp_write
 /flash_unlock
 /flashcp
 /ftl_check
diff --git a/Makefile b/Makefile
index 190db58..3f9c24f 100644
--- a/Makefile
+++ b/Makefile
@@ -19,7 +19,8 @@ TESTS = tests
 MTD_BINS = \
 	ftl_format flash_erase nanddump doc_loadbios \
 	ftl_check mkfs.jffs2 flash_lock flash_unlock \
-	flash_otp_info flash_otp_dump mtd_debug flashcp nandwrite nandtest \
+	flash_otp_info flash_otp_dump flash_otp_lock flash_otp_write \
+	mtd_debug flashcp nandwrite nandtest \
 	jffs2dump \
 	nftldump nftl_format docfdisk \
 	rfddump rfdformat \
-- 
1.7.10.4
