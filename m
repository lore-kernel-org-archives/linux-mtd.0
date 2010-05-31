Received: from ey-out-1920.google.com ([74.125.78.150])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OJ5ax-0004Jo-S4
	for linux-mtd@lists.infradead.org; Mon, 31 May 2010 14:04:00 +0000
Received: by ey-out-1920.google.com with SMTP id 13so145934eye.26
	for <linux-mtd@lists.infradead.org>;
	Mon, 31 May 2010 07:03:58 -0700 (PDT)
Date: Mon, 31 May 2010 16:03:38 +0200
From: Dan Carpenter <error27@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [patch] mtd: return success on blktrans_ioctl()
Message-ID: <20100531140337.GV5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>, kernel-janitors@vger.kernel.org,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	linux-mtd@lists.infradead.org, Ben Hutchings <bhutchings@solarflare.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There was a break missing so we returned -ENOTTY on success instead of
zero.  This was introduced by 048d8719956: "mtd: blktrans: Hotplug fixes"

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 03e19c1..a6bb586 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -245,6 +245,7 @@ static int blktrans_ioctl(struct block_device *bdev, fmode_t mode,
 	switch (cmd) {
 	case BLKFLSBUF:
 		ret = dev->tr->flush ? dev->tr->flush(dev) : 0;
+		break;
 	default:
 		ret = -ENOTTY;
 	}
