Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NFqE0-0003qC-9G
	for linux-mtd@lists.infradead.org; Wed, 02 Dec 2009 14:30:41 +0000
Received: by bwz4 with SMTP id 4so221120bwz.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 02 Dec 2009 06:30:35 -0800 (PST)
MIME-Version: 1.0
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Wed, 2 Dec 2009 20:00:14 +0530
Message-ID: <ce9ab5790912020630s160fee35r340d02ae9f41bcfb@mail.gmail.com>
Subject: [RFC] [PATCH] [MTD-UTILS]: flash_unlock: enhancing for unlocking of
	specified number of blocks
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch enhances the flash_unlock utility to be able to do
unlocking for specified blocks range.
This patch also fixes calculation of 'length' as in previous patch.

Say there are 240 blocks present in the device. Then:
offset starts from: 0x0
and full size of device: 0x1E00000

doing: 240 * 0x20000 gives -> 0x1E00000
But last block address should be 0x1DE0000 (which spans for 0x20000
bytes, adding up to size of 0x1E00000)

Signed-off-by: Vimal Singh <vimalsingh@ti.com>
---

--- a/flash_unlock.c	2009-11-24 19:33:18.000000000 +0530
+++ b/flash_unlock.c	2009-11-24 19:36:18.000000000 +0530
@@ -21,13 +21,14 @@ int main(int argc, char *argv[])
 	int fd;
 	struct mtd_info_user mtdInfo;
 	struct erase_info_user mtdLockInfo;
+	int count;

 	/*
 	 * Parse command line options
 	 */
-	if(argc != 2)
+	if(argc < 2)
 	{
-		fprintf(stderr, "USAGE: %s <mtd device>\n", argv[0]);
+		fprintf(stderr, "USAGE: %s <mtd device> <offset in hex> <block
count in decimal number>\n", argv[0]);
 		exit(1);
 	}
 	else if(strncmp(argv[1], "/dev/mtd", 8) != 0)
@@ -50,8 +51,18 @@ int main(int argc, char *argv[])
 		exit(1);
 	}

-	mtdLockInfo.start = 0;
-	mtdLockInfo.length = mtdInfo.size;
+	if (argc > 2)
+		mtdLockInfo.start = strtol(argv[2], NULL, 0);
+	else
+		mtdLockInfo.start = 0;
+
+	if (argc > 3) {
+		count = strtol(argv[3], NULL, 0);
+		mtdLockInfo.length = mtdInfo.erasesize * count;
+	} else {
+		mtdLockInfo.length = mtdInfo.size - mtdInfo.erasesize;
+	}
+
 	if(ioctl(fd, MEMUNLOCK, &mtdLockInfo))
 	{
 		fprintf(stderr, "Could not unlock MTD device: %s\n", argv[1]);
@@ -61,4 +72,3 @@ int main(int argc, char *argv[])

 	return 0;
 }
-
