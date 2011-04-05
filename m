Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q76iv-0004XK-9O
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 13:55:17 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p35DtBl2005247
	for <linux-mtd@lists.infradead.org>; Tue, 5 Apr 2011 16:55:11 +0300
From: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCHv1 2/5] tests: checkfs: fix linker warnings
Date: Tue,  5 Apr 2011 16:55:51 +0300
Message-Id: <112dd0ed24fca0a1af988a2c99f1258468184d68.1302011698.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <f17ef71846bf870b69b04127ac0d7d924678ebee.1302011698.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <f17ef71846bf870b69b04127ac0d7d924678ebee.1302011698.git.ext-andriy.shevchenko@nokia.com>
References: <1302007944.2760.126.camel@localhost>
	<f17ef71846bf870b69b04127ac0d7d924678ebee.1302011698.git.ext-andriy.shevchenko@nokia.com>
References: <f17ef71846bf870b69b04127ac0d7d924678ebee.1302011698.git.ext-andriy.shevchenko@nokia.com>
Cc: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The sys_errlist[errno] is deprecated. We should use strerror(errno) instead.

Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
---
 tests/checkfs/checkfs.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/checkfs/checkfs.c b/tests/checkfs/checkfs.c
index 6ca2c0e..3224d2b 100644
--- a/tests/checkfs/checkfs.c
+++ b/tests/checkfs/checkfs.c
@@ -167,11 +167,11 @@ int setupSerial (const char *dev) {
 
     fd = open(dev,O_RDWR | O_NDELAY );
     if (fd < 0) {
-        fprintf(stderr, "%s: %s\n", dev, sys_errlist[errno]);
+        fprintf(stderr, "%s: %s\n", dev, strerror(errno));
         exit(1);
     }
     if (tcgetattr(fd, &tios) < 0) {
-        fprintf(stderr,"Could not get terminal attributes: %s",sys_errlist[errno]);
+        fprintf(stderr, "Could not get terminal attributes: %s", strerror(errno));
         exit(1);
     }
 
@@ -197,7 +197,7 @@ int setupSerial (const char *dev) {
     cfsetispeed (&tios, B9600);
 
     if (tcsetattr(fd, TCSAFLUSH, &tios) < 0) {
-        fprintf(stderr,"Could not set attributes: ,%s",sys_errlist[errno]);
+        fprintf(stderr, "Could not set attributes: ,%s", strerror(errno));
         exit(1);
     }
     return fd;
-- 
1.6.3.3
