Received: from mail-lb0-x236.google.com ([2a00:1450:4010:c04::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhSXP-00038B-VI
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2015 01:20:00 +0000
Received: by lbos8 with SMTP id s8so616687lbo.0
 for <linux-mtd@lists.infradead.org>; Wed, 30 Sep 2015 18:19:36 -0700 (PDT)
Received: from [192.168.0.100] ([217.71.235.210])
 by smtp.googlemail.com with ESMTPSA id w9sm351624lad.41.2015.09.30.18.19.35
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Sep 2015 18:19:35 -0700 (PDT)
From: Kirill Smirnov <kirill.k.smirnov@gmail.com>
Subject: [PATCH] mtd-utils: serve_image: use proper POSIX_C_SOURCE value
To: linux-mtd@lists.infradead.org
Message-ID: <560C8A27.6060202@gmail.com>
Date: Thu, 1 Oct 2015 04:19:35 +0300
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------070504060408050207060200"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------070504060408050207060200
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

struct addrinfo and friends conform to POSIX.1-2001, not earlier.
This patch fixes linking against latest glibc 2.22

Now email formatting and the generated patch should be OK.

Signed-off-by: Kirill Smirnov <kirill.k.smirnov@gmail.com>
---
serve_image.c | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/serve_image.c b/serve_image.c
index d3794ec..cbcf3b7 100644
--- a/serve_image.c
+++ b/serve_image.c
@@ -1,5 +1,5 @@
#define PROGRAM_NAME "serve_image"
-#define _POSIX_C_SOURCE 199309
+#define _POSIX_C_SOURCE 200112L

#include <time.h>
#include <errno.h>
-- 
2.5.1


--------------070504060408050207060200
Content-Type: text/x-patch;
 name="posix-2001.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="posix-2001.patch"

diff --git a/serve_image.c b/serve_image.c
index d3794ec..cbcf3b7 100644
--- a/serve_image.c
+++ b/serve_image.c
@@ -1,5 +1,5 @@
 #define PROGRAM_NAME "serve_image"
-#define _POSIX_C_SOURCE 199309
+#define _POSIX_C_SOURCE 200112L
 
 #include <time.h>
 #include <errno.h>


--------------070504060408050207060200--
