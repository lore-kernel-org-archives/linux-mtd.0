Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bC2Il-0005um-Bb
 for linux-mtd@lists.infradead.org; Sun, 12 Jun 2016 10:07:32 +0000
Received: by mail-wm0-x243.google.com with SMTP id k184so8182085wme.2
 for <linux-mtd@lists.infradead.org>; Sun, 12 Jun 2016 03:07:08 -0700 (PDT)
Received: from desktop.wvd.kresin.me (p5DDC653E.dip0.t-ipconnect.de.
 [93.220.101.62])
 by smtp.gmail.com with ESMTPSA id k3sm21561026wjh.7.2016.06.12.03.07.06
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 12 Jun 2016 03:07:06 -0700 (PDT)
From: Mathias Kresin <dev@kresin.me>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: fix wrong format specifiers on mips32
Date: Sun, 12 Jun 2016 12:05:45 +0200
Message-Id: <1465725945-12253-1-git-send-email-dev@kresin.me>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch fixes the follwing compiler warnings:

flash_erase.c: In function 'show_progress':
flash_erase.c:56:22: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'off_t {aka long long int}' [-Wformat=]
  bareverbose(!quiet, "\rErasing %d Kibyte @ %"PRIxoff_t" -- %2i %% complete ",
                      ^
./include/common.h:81:10: note: in definition of macro 'bareverbose'
   printf(fmt, ##__VA_ARGS__);

which are linked to the following buggy numerical output:

Erasing 128 Kibyte @ 0 -- 917504 % complete flash_erase:  Cleanmarker written at 0
Erasing 128 Kibyte @ 0 -- 1048576 % complete flash_erase:  Cleanmarker written at 0

Signed-off-by: Mathias Kresin <dev@kresin.me>

---

In case it might be relevant, I'm cross compiling the mtd-utils on
ubuntu 14.04 x64 using a patched GCC 5.3.0 from the lede project. The
kernel version used on the mips32 target is 4.4.12.

 include/common.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/common.h b/include/common.h
index 8cb3142..ca4c62e 100644
--- a/include/common.h
+++ b/include/common.h
@@ -72,8 +72,13 @@ extern "C" {
 #define PRIxoff_t PRIx64
 #define PRIdoff_t PRId64
 #else
+#if (SIZEOF_LONG >= 8)
 #define PRIxoff_t "l"PRIx32
 #define PRIdoff_t "l"PRId32
+#else
+#define PRIxoff_t "ll"PRIx32
+#define PRIdoff_t "ll"PRId32
+#endif
 #endif
 
 /* Verbose messages */
-- 
1.9.1
