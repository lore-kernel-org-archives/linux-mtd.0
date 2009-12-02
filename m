Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NFqBx-0002kB-Cr
	for linux-mtd@lists.infradead.org; Wed, 02 Dec 2009 14:28:33 +0000
Received: by bwz4 with SMTP id 4so218984bwz.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 02 Dec 2009 06:28:28 -0800 (PST)
MIME-Version: 1.0
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Wed, 2 Dec 2009 19:58:08 +0530
Message-ID: <ce9ab5790912020628n5e91f811haa56b6380a71ab32@mail.gmail.com>
Subject: [RFC] [PATCH] [MTD-UTILS]: flash_lock: fix length being passed
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

This patch fixes the 'length' calculation.
Making it:
+       mtdLockInfo.length = (num_sectors - 1) * mtdInfo.erasesize;
Rather:
-       mtdLockInfo.length = num_sectors * mtdInfo.erasesize;

Say there are 240 blocks present in the device. Then:
offset starts from: 0x0
and full size of device: 0x1E00000

doing: 240 * 0x20000 gives -> 0x1E00000
But last block address should be 0x1DE0000 (which spans for 0x20000
bytes, adding upto size of 0x1E00000)

Signed-off-by: Vimal Singh <vimalsingh@ti.com>
---

--- flash_lock.c.org	2009-11-24 19:33:18.000000000 +0530
+++ flash_lock.c	2009-11-24 19:33:13.000000000 +0530
@@ -71,7 +71,7 @@ int main(int argc, char *argv[])
 	}

 	mtdLockInfo.start = ofs;
-	mtdLockInfo.length = num_sectors * mtdInfo.erasesize;
+	mtdLockInfo.length = (num_sectors - 1) * mtdInfo.erasesize;
 	if(ioctl(fd, MEMLOCK, &mtdLockInfo))
 	{
 		fprintf(stderr, "Could not lock MTD device: %s\n", argv[1]);
@@ -81,4 +81,3 @@ int main(int argc, char *argv[])

 	return 0;
 }
-
