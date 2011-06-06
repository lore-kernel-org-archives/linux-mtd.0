Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTR7s-0002yK-Dq
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 04:09:17 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 5/5] flash_{lock,
	unlock}: fix off-by-one error for "entire device" length
Date: Mon,  6 Jun 2011 00:09:14 -0400
Message-Id: <1307333354-26583-5-git-send-email-vapier@gentoo.org>
In-Reply-To: <1307333354-26583-1-git-send-email-vapier@gentoo.org>
References: <1307333354-26583-1-git-send-email-vapier@gentoo.org>
Cc: Vimal Singh <vimalsingh@ti.com>, Vimal Singh <vimal.newwork@gmail.com>,
	Steven Miao <realmz6@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Steven Miao <realmz6@gmail.com>

This basically reverts commit 43feb39f35a9ee0ed3 which changed the full
length calculation to be one less than one sector.  I don't understand
the logic in the commit message where it states that the length should
be one sector smaller as this results in misbehavior at runtime.

For example, with a mtd device with total size 0x400000 and erase block
size of 0x20000 (which gives us a total of 32 sectors), this new logic
results in:
	mtdLockInfo.start = 0;
	mtdLockInfo.length = 0x3e0000; /* (32 - 1) * 0x20000 */

Calling MEMLOCK/MEMUNLOCK on the device with this range leaves the last
sector unchanged which is certainly not what we want.  So drop this -1
part of the calculation.

To look at it another way, if we only attempt to lock one sector, this
calculation would end up with the .length set to 0.  Calling MEMLOCK
with a length of 0 does not lock the sector as this simple code shows:
	int main(int argc, char *argv[]) {
		erase_info_t e0 = { 0, 0 }, e1 = { 0, 0x20000 };
		int fd = open(argv[1], O_RDONLY);
		ioctl(fd, MEMUNLOCK, &e1);
		printf("%i\n", ioctl(fd, MEMISLOCKED, &e1));
		ioctl(fd, MEMLOCK, &e0);
		printf("%i\n", ioctl(fd, MEMISLOCKED, &e1));
	}
MEMISLOCKED returns 0 both times.  If we change the argument to MEMLOCK
to e1, then MEMISLOCKED returns 1.

CC: Vimal Singh <vimal.newwork@gmail.com>
CC: Vimal Singh <vimalsingh@ti.com>
Signed-off-by: Steven Miao <realmz6@gmail.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 flash_unlock.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/flash_unlock.c b/flash_unlock.c
index 3d7dd53..9fb089a 100644
--- a/flash_unlock.c
+++ b/flash_unlock.c
@@ -77,11 +77,11 @@ int main(int argc, char *argv[])
 	if (argc > 3) {
 		count = strtol(argv[3], NULL, 0);
 		if (count == -1)
-			mtdLockInfo.length = mtdInfo.size - mtdInfo.erasesize;
+			mtdLockInfo.length = mtdInfo.size;
 		else
 			mtdLockInfo.length = mtdInfo.erasesize * count;
 	} else
-		mtdLockInfo.length = mtdInfo.size - mtdInfo.erasesize;
+		mtdLockInfo.length = mtdInfo.size;
 	if (mtdLockInfo.start + mtdLockInfo.length > mtdInfo.size)
 		errmsg_die("range is more than device supports: %#x + %#x > %#x",
 			mtdLockInfo.start, mtdLockInfo.length, mtdInfo.size);
-- 
1.7.5.3
