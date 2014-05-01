Received: from baptiste.telenet-ops.be ([195.130.132.51])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfvvN-0006pR-9h
 for linux-mtd@lists.infradead.org; Thu, 01 May 2014 18:41:38 +0000
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: Fix warning in access_ok() parameter passing
Date: Thu,  1 May 2014 20:40:54 +0200
Message-Id: <1398969654-5672-1-git-send-email-geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On m68k, where access_ok() doesn't cast the address parameter:

drivers/mtd/mtdchar.c: In function 'mtdchar_write_ioctl':
drivers/mtd/mtdchar.c:575:4: warning: passing argument 2 of 'access_ok' makes pointer from integer without a cast [enabled by default]
arch/m68k/include/asm/uaccess_mm.h:17:90: note: expected 'const void *' but argument is of type '__u64'
drivers/mtd/mtdchar.c:576:4: warning: passing argument 2 of 'access_ok' makes pointer from integer without a cast [enabled by default]
arch/m68k/include/asm/uaccess_mm.h:17:90: note: expected 'const void *' but argument is of type '__u64'

The address parameter of access_ok() is really a userspace pointer.
On most architectures, access_ok() is a macro that casts the address
parameter, hiding issues in its users.

Move around and use the existing usr_data and usr_oob temporary variables
to kill the warnings. Add a few "consts", and make more use of the
temporaries while we're at it.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/mtd/mtdchar.c |   20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 7d4e7b9da3a1..a0f54e80670c 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -568,13 +568,18 @@ static int mtdchar_write_ioctl(struct mtd_info *mtd,
 {
 	struct mtd_write_req req;
 	struct mtd_oob_ops ops;
-	void __user *usr_data, *usr_oob;
+	const void __user *usr_data, *usr_oob;
 	int ret;
 
-	if (copy_from_user(&req, argp, sizeof(req)) ||
-			!access_ok(VERIFY_READ, req.usr_data, req.len) ||
-			!access_ok(VERIFY_READ, req.usr_oob, req.ooblen))
+	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
+
+	usr_data = (const void __user *)(uintptr_t)req.usr_data;
+	usr_oob = (const void __user *)(uintptr_t)req.usr_oob;
+	if (!access_ok(VERIFY_READ, usr_data, req.len) ||
+	    !access_ok(VERIFY_READ, usr_oob, req.ooblen))
+		return -EFAULT;
+
 	if (!mtd->_write_oob)
 		return -EOPNOTSUPP;
 
@@ -583,10 +588,7 @@ static int mtdchar_write_ioctl(struct mtd_info *mtd,
 	ops.ooblen = (size_t)req.ooblen;
 	ops.ooboffs = 0;
 
-	usr_data = (void __user *)(uintptr_t)req.usr_data;
-	usr_oob = (void __user *)(uintptr_t)req.usr_oob;
-
-	if (req.usr_data) {
+	if (usr_data) {
 		ops.datbuf = memdup_user(usr_data, ops.len);
 		if (IS_ERR(ops.datbuf))
 			return PTR_ERR(ops.datbuf);
@@ -594,7 +596,7 @@ static int mtdchar_write_ioctl(struct mtd_info *mtd,
 		ops.datbuf = NULL;
 	}
 
-	if (req.usr_oob) {
+	if (usr_oob) {
 		ops.oobbuf = memdup_user(usr_oob, ops.ooblen);
 		if (IS_ERR(ops.oobbuf)) {
 			kfree(ops.datbuf);
-- 
1.7.9.5
