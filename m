Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YRedv-0007qf-Aj
 for linux-mtd@lists.infradead.org; Sat, 28 Feb 2015 10:29:09 +0000
Received: by pdbnh10 with SMTP id nh10so3478065pdb.3
 for <linux-mtd@lists.infradead.org>; Sat, 28 Feb 2015 02:28:46 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 4/5] UBI: fix check for "too many bytes"
Date: Sat, 28 Feb 2015 02:23:28 -0800
Message-Id: <1425119009-28634-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425119009-28634-1-git-send-email-computersforpeace@gmail.com>
References: <1425119009-28634-1-git-send-email-computersforpeace@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The comparison from the previous line seems to have been erroneously
(partially) copied-and-pasted onto the next. The second line should be
checking req.bytes, not req.lnum.

Coverity CID #139400

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/ubi/cdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index d647e504f9b1..7691a2a015cb 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -455,7 +455,7 @@ static long vol_cdev_ioctl(struct file *file, unsigned int cmd,
 		/* Validate the request */
 		err = -EINVAL;
 		if (req.lnum < 0 || req.lnum >= vol->reserved_pebs ||
-		    req.bytes < 0 || req.lnum >= vol->usable_leb_size)
+		    req.bytes < 0 || req.bytes >= vol->usable_leb_size)
 			break;
 
 		err = get_exclusive(desc);
-- 
2.1.0
