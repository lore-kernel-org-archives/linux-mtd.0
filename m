Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cW24Q-0007LH-7K
 for linux-mtd@lists.infradead.org; Tue, 24 Jan 2017 14:27:39 +0000
Date: Tue, 24 Jan 2017 15:27:04 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Richard
 Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/3] mtd: name the mtd device with an optional label
 property
Message-ID: <20170124152704.03598ae5@bbrezillon>
In-Reply-To: <20170124151353.5bbffae0@bbrezillon>
References: <1484573225-19095-1-git-send-email-clg@kaod.org>
 <1484573225-19095-2-git-send-email-clg@kaod.org>
 <20170124151353.5bbffae0@bbrezillon>
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

On Tue, 24 Jan 2017 15:13:53 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> >  	if (mtd->dev.parent) {
> >  		if (!mtd->owner && mtd->dev.parent->driver)
> >  			mtd->owner = mtd->dev.parent->driver->owner;  
> 
> --->8---  
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 13f8052b9ff9..a12b68f941e3 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -385,6 +385,8 @@ static inline void mtd_set_of_node(struct mtd_info *mtd,
>                                    struct device_node *np)
>  {
>         mtd->dev.of_node = np;
> +
> +       of_property_read_string(np, "label", mtd->name);
>  }
>  
>  static inline struct device_node *mtd_get_of_node(struct mtd_info *mtd)

Sorry, I forgot to compile test this change. Here is a valid version:

--->8---
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 13f8052b9ff9..581057f8d9a5 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -24,6 +24,7 @@
 #include <linux/uio.h>
 #include <linux/notifier.h>
 #include <linux/device.h>
+#include <linux/of.h>
 
 #include <mtd/mtd-abi.h>
 
@@ -385,6 +386,8 @@ static inline void mtd_set_of_node(struct mtd_info *mtd,
                                   struct device_node *np)
 {
        mtd->dev.of_node = np;
+
+       of_property_read_string(np, "label", &mtd->name);
 }
 
 static inline struct device_node *mtd_get_of_node(struct mtd_info *mtd)
