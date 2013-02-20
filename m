Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U8CjP-0000YK-D5
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2013 16:41:20 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH mtd-utils] flash_otp_write: fix format string warning
Date: Wed, 20 Feb 2013 17:41:09 +0100
Message-Id: <1361378469-18631-1-git-send-email-u.kleine-koenig@pengutronix.de>
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

This fixes
	flash_otp_write.c: In function 'main':
	flash_otp_write.c:61:2: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'off_t' [-Wformat]

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 flash_otp_write.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/flash_otp_write.c b/flash_otp_write.c
index d407ebb..41cf1c5 100644
--- a/flash_otp_write.c
+++ b/flash_otp_write.c
@@ -58,7 +58,7 @@ int main(int argc,char *argv[])
 		return errno;
 	}
 
-	printf("Writing OTP user data on %s at offset 0x%lx\n", argv[2], offset);
+	printf("Writing OTP user data on %s at offset 0x%lx\n", argv[2], (unsigned long)offset);
 
 	if (mtdInfo.type == MTD_NANDFLASH)
 		len = mtdInfo.writesize;
-- 
1.7.10.4
