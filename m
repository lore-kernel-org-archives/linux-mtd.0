Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAtYX-00029X-1n
 for linux-mtd@lists.infradead.org; Fri, 12 Oct 2018 09:16:26 +0000
Date: Fri, 12 Oct 2018 11:16:03 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: sa1100: avoid VLA in sa1100_setup_mtd
Message-ID: <20181012111603.0d03e043@bbrezillon>
In-Reply-To: <20181010184533.691620-1-arnd@arndb.de>
References: <20181010184533.691620-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Arnd,

On Wed, 10 Oct 2018 20:44:50 +0200
Arnd Bergmann <arnd@arndb.de> wrote:

> Enabling -Wvla found another variable-length array with randconfig
> testing:
> 
> drivers/mtd/maps/sa1100-flash.c: In function 'sa1100_setup_mtd':
> drivers/mtd/maps/sa1100-flash.c:224:10: error: ISO C90 forbids variable length array 'cdev' [-Werror=vla]
> 
> As far as I can tell, there is an upper bound on the number of resources
> that can be passed, based on the number of CS lines on the bus.
> In practice, all boards we support have either one or two resources,
> but using six to be on the safe side has no extra cost.

Why not dynamically allocate cdev instead? That removes any kind of
guessing on the max value, and it shouldn't hurt much since this code is
in the probe path.

--->8---
diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-flash.c
index 784c6e1a0391..fd5fe12d7461 100644
--- a/drivers/mtd/maps/sa1100-flash.c
+++ b/drivers/mtd/maps/sa1100-flash.c
@@ -221,7 +221,14 @@ static struct sa_info *sa1100_setup_mtd(struct platform_device *pdev,
                info->mtd = info->subdev[0].mtd;
                ret = 0;
        } else if (info->num_subdev > 1) {
-               struct mtd_info *cdev[nr];
+               struct mtd_info **cdev;
+
+               cdev = kmalloc_array(nr, sizeof(*cdev), GFP_KERNEL);
+               if (!cdev) {
+                       ret = -ENOMEM;
+                       goto err;
+               }
+
                /*
                 * We detected multiple devices.  Concatenate them together.
                 */
@@ -230,6 +237,7 @@ static struct sa_info *sa1100_setup_mtd(struct platform_device *pdev,
 
                info->mtd = mtd_concat_create(cdev, info->num_subdev,
                                              plat->name);
+               kfree(cdev);
                if (info->mtd == NULL) {
                        ret = -ENXIO;
                        goto err;
