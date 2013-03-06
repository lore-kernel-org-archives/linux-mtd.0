Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UDAt4-0001hQ-DS
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2013 09:43:51 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH v2] flash_otp_write: fix format string warning
Date: Wed,  6 Mar 2013 10:43:40 +0100
Message-Id: <1362563020-14003-1-git-send-email-u.kleine-koenig@pengutronix.de>
In-Reply-To: <1362561546.21850.24.camel@sauron>
References: <1362561546.21850.24.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This fixes
	flash_otp_write.c: In function 'main':
	flash_otp_write.c:61:2: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'off_t' [-Wformat]

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---

Notes:
    Changes since (implicit) v1, sent with
    Message-Id: <1361378469-18631-1-git-send-email-u.kleine-koenig@pengutronix.de>:
    
     - Use PRIdoff_t helper as suggested by Artem

 flash_otp_write.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/flash_otp_write.c b/flash_otp_write.c
index d407ebb..f360a3e 100644
--- a/flash_otp_write.c
+++ b/flash_otp_write.c
@@ -15,6 +15,8 @@
 
 #include <mtd/mtd-user.h>
 
+#include "common.h"
+
 int main(int argc,char *argv[])
 {
 	int fd, val, ret, size, wrote, len;
@@ -58,7 +60,8 @@ int main(int argc,char *argv[])
 		return errno;
 	}
 
-	printf("Writing OTP user data on %s at offset 0x%lx\n", argv[2], offset);
+	printf("Writing OTP user data on %s at offset 0x%" PRIdoff_t "\n",
+			argv[2], offset);
 
 	if (mtdInfo.type == MTD_NANDFLASH)
 		len = mtdInfo.writesize;
-- 
1.8.2.rc2
