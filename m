Received: from mail-qy0-f177.google.com ([209.85.216.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OtQVK-00059r-9k
	for linux-mtd@lists.infradead.org; Wed, 08 Sep 2010 19:40:26 +0000
Received: by qyk8 with SMTP id 8so479950qyk.15
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Sep 2010 12:40:21 -0700 (PDT)
Date: Wed, 8 Sep 2010 21:39:56 +0200
From: Dan Carpenter <error27@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [patch] mtd: sanity check input
Message-ID: <20100908193956.GB3463@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	linux-mtd@lists.infradead.org, Ben Hutchings <bhutchings@solarflare.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If "ur_idx" is wrong we could go past the end of the array.  The
"ur_idx" comes from root so it's not a huge deal, but adding a sanity
check makes the code more robust.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index a825002..9c00549 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -513,6 +513,9 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 		if (get_user(ur_idx, &(ur->regionindex)))
 			return -EFAULT;
 
+		if (ur_idx >= mtd->numeraseregions)
+			return -EINVAL;
+
 		kr = &(mtd->eraseregions[ur_idx]);
 
 		if (put_user(kr->offset, &(ur->offset))
