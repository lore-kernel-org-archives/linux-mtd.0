Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXtnm-0004jy-Av
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2011 12:07:15 +0000
Received: by laah2 with SMTP id h2so509879laa.36
 for <linux-mtd@lists.infradead.org>; Tue, 06 Dec 2011 04:07:12 -0800 (PST)
Subject: Re: pxa2xx-flash.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anders =?ISO-8859-1?Q?M=F8rk-Pedersen?= <amp@frogne.dk>
Date: Tue, 06 Dec 2011 14:07:10 +0200
In-Reply-To: <4EDC7B590200008E00014334@mail.frogne.dk>
References: <4EDC7B590200008E00014334@mail.frogne.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1323173231.2163.6.camel@koala>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-12-05 at 08:05 +0100, Anders Mørk-Pedersen wrote:
> I have done as you instructed and created a patch for "git am" and
> attached it to this mail.
> 
> I've also sent a copy to: Dmitry Eremin-Solenikov
> <dbaryshkov@gmail.com>

Hi, I've just noticed that I already have this patch in my tree
which fixes your problem:

commit 84c692b1f408be52eb0f8ad2ce130b7800130a0c
Author: Jonathan Cameron <jic23@cam.ac.uk>
Date:   Fri Nov 11 17:06:20 2011 +0000

    mtd: pxa2xx-flash.c: It used to fall back to provided table.
    
    Make this work again.
    
    Signed-off-by: Jonathan Cameron <jic23@cam.ac.uk>
    Acked-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
    Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@intel.com>

diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c
index 411a17d..2a25b67 100644
--- a/drivers/mtd/maps/pxa2xx-flash.c
+++ b/drivers/mtd/maps/pxa2xx-flash.c
@@ -98,7 +98,7 @@ static int __devinit pxa2xx_flash_probe(struct platform_device *pdev)
        }
        info->mtd->owner = THIS_MODULE;
 
-       mtd_device_parse_register(info->mtd, probes, 0, NULL, 0);
+       mtd_device_parse_register(info->mtd, probes, 0, flash->parts, flash->nr_parts);
 
        platform_set_drvdata(pdev, info);
        return 0;

Artem.
