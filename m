Received: from userp1040.oracle.com ([156.151.31.81])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqEXM-0002I8-BV
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2016 06:44:28 +0000
Date: Wed, 13 Apr 2016 09:41:55 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [patch] UBI: silence an unintialized variable warning
Message-ID: <20160413064155.GD8092@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

My static checker complains that "val" is uninitialized when kstrtoint()
fails.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index c4cb15a..f101a49 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -352,7 +352,8 @@ static ssize_t dfs_file_write(struct file *file, const char __user *user_buf,
 	} else if (dent == d->dfs_emulate_power_cut) {
 		if (kstrtoint(buf, 0, &val) != 0)
 			count = -EINVAL;
-		d->emulate_power_cut = val;
+		else
+			d->emulate_power_cut = val;
 		goto out;
 	}
 
