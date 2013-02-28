Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UB00L-0005zL-Ui
 for linux-mtd@lists.infradead.org; Thu, 28 Feb 2013 09:42:23 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] flash_otp_write: fix writing to NAND in presence of partial
 reads
Date: Thu, 28 Feb 2013 10:42:09 +0100
Message-Id: <1362044529-511-1-git-send-email-u.kleine-koenig@pengutronix.de>
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

When doing something like:

	{ printf "\xff"; printf "\xfe"; } | flash_otp_write -u /dev/mtd0 0

flash_otp_write might see only a single byte when reading from stdin for
the first tim. In this case (and without this patch) it pads to
$writesize with '\xff's and writes that out. In the next iteration it
reads the 2nd byte, pads and writes again. So the 2nd byte is written to
offset $writesize instead of 1.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 flash_otp_write.c |   19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/flash_otp_write.c b/flash_otp_write.c
index 41cf1c5..0aa872e 100644
--- a/flash_otp_write.c
+++ b/flash_otp_write.c
@@ -15,6 +15,23 @@
 
 #include <mtd/mtd-user.h>
 
+ssize_t xread(int fd, void *buf, size_t count)
+{
+	ssize_t ret, done = 0;
+
+retry:
+	ret = read(fd, buf + done, count - done);
+	if (ret < 0)
+		return ret;
+
+	done += ret;
+
+	if (ret == 0 /* EOF */ || done == count)
+		return done;
+	else
+		goto retry;
+}
+
 int main(int argc,char *argv[])
 {
 	int fd, val, ret, size, wrote, len;
@@ -66,7 +83,7 @@ int main(int argc,char *argv[])
 		len = 256;
 
 	wrote = 0;
-	while ((size = read(0, buf, len))) {
+	while ((size = xread(0, buf, len))) {
 		if (size < 0) {
 			perror("read()");
 			return errno;
-- 
1.7.10.4
