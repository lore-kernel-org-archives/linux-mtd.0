Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UB00W-00061M-VG
 for linux-mtd@lists.infradead.org; Thu, 28 Feb 2013 09:42:33 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] flash_otp_write: fix a buffer overflow on NAND with write
 size > 2048
Date: Thu, 28 Feb 2013 10:42:26 +0100
Message-Id: <1362044546-559-1-git-send-email-u.kleine-koenig@pengutronix.de>
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

I'm not aware of any chip having a write size bigger than 2048 today.
Still checking for that instead of a sleeping problem to bite us maybe
in a few years is easy.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 flash_otp_write.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/flash_otp_write.c b/flash_otp_write.c
index 0aa872e..5114e6b 100644
--- a/flash_otp_write.c
+++ b/flash_otp_write.c
@@ -82,6 +82,12 @@ int main(int argc,char *argv[])
 	else
 		len = 256;
 
+	if (len > sizeof(buf)) {
+		printf("huh, writesize (%d) bigger than buffer (%zu)\n",
+				len, sizeof(buf));
+		return ENOMEM;
+	}
+
 	wrote = 0;
 	while ((size = xread(0, buf, len))) {
 		if (size < 0) {
-- 
1.7.10.4
