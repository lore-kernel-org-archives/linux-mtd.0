Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QjOl8-0004Xo-21
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2011 04:51:47 +0000
Received: by iwn35 with SMTP id 35so5276965iwn.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Jul 2011 21:51:43 -0700 (PDT)
Subject: Re: [PATCH] MTD: Nand: use MTD_NAND_OMAP2 for OMAP4
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jan Weitzel <j.weitzel@phytec.de>
Date: Wed, 20 Jul 2011 07:53:05 +0300
In-Reply-To: <1310727174-8183-1-git-send-email-j.weitzel@phytec.de>
References: <1310727174-8183-1-git-send-email-j.weitzel@phytec.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1311137590.20738.135.camel@sauron>
Mime-Version: 1.0
Cc: Artem.Bityutskiy@nokia.com, linux-omap@vger.kernel.org,
	linux-mtd@lists.infradead.org, vimalsingh@ti.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-07-15 at 12:52 +0200, Jan Weitzel wrote:
>  config MTD_NAND_OMAP2
>  	tristate "NAND Flash device on OMAP2 and OMAP3"

I guess you need to add OMAP4 to the string above as well.

> -	depends on ARM && (ARCH_OMAP2 || ARCH_OMAP3)
> +	depends on ARM && (ARCH_OMAP2 || ARCH_OMAP3 || ARCH_OMAP4)
>  	help
> -          Support for NAND flash on Texas Instruments OMAP2 and OMAP3 platforms.
> +          Support for NAND flash on Texas Instruments OMAP2, OMAP3 and OMAP4
> +	  platforms.


-- 
Best Regards,
Artem Bityutskiy
