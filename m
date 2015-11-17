Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyUMT-0006FO-5t
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2015 00:43:05 +0000
Received: by padhx2 with SMTP id hx2so191715121pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2015 16:42:44 -0800 (PST)
Date: Mon, 16 Nov 2015 16:42:42 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH] MAINTAINERS: brcmnand: Add Broadcom internal mailing-list
Message-ID: <20151117004242.GA896@google.com>
References: <1447716855-6535-1-git-send-email-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1447716855-6535-1-git-send-email-f.fainelli@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 16, 2015 at 03:34:15PM -0800, Florian Fainelli wrote:
> The Broadcom NAND driver is used by many different groups at Broadcom
> now, so use the same mailing-list we use for other areas of the kernel.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e9caa4b28828..da691aad7031 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2450,6 +2450,7 @@ F:	drivers/firmware/broadcom/*
>  BROADCOM STB NAND FLASH DRIVER
>  M:	Brian Norris <computersforpeace@gmail.com>
>  L:	linux-mtd@lists.infradead.org
> +L:	bcm-kernel-feedback-list@broadcom.com
>  S:	Maintained
>  F:	drivers/mtd/nand/brcmnand/
>  

LGTM. Pushed to linux-mtd.git. I'll probably send it upstream this week.

Brian
