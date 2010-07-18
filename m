Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OaX0d-0002LD-2t
	for linux-mtd@lists.infradead.org; Sun, 18 Jul 2010 16:46:35 +0000
Received: by fxm3 with SMTP id 3so2064147fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 Jul 2010 09:46:34 -0700 (PDT)
Subject: Re: [PATCH] drivers/mtd: remove makefile subdirectory processing
	redundancies
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kyle Spaans <kspaans@uwaterloo.ca>
In-Reply-To: <20100714042509.GA7775@caffeine.csclub.uwaterloo.ca>
References: <20100714042509.GA7775@caffeine.csclub.uwaterloo.ca>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 18 Jul 2010 19:46:30 +0300
Message-Id: <1279471590.16247.57.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-07-14 at 00:25 -0400, Kyle Spaans wrote:
> Remove redundant config checks when the subdirectory's Makefile is already
> conditionally processed. Add more conditional processing when the subdirectory
> can be selected/deselected as a whole.
> 
> Signed-off-by: Kyle Spaans <kspaans@uwaterloo.ca>
> Reviewed-by: Robert P. J. Day <rpjday@crashcourse.ca>
> ---

This does not apply to the mtd-2.6.git tree [1]. Also I spotted that

...
 
> +obj-$(CONFIG_MTD_TESTS)		+= tests/
> +obj-$(CONFIG_MTD_LPDDR)		+= lpddr/
> +obj-$(CONFIG_MTD_NAND)		+= nand/
> +obj-$(CONFIG_MTD_ONENAND)	+= onenand/
>  obj-$(CONFIG_MTD_BI)		+= ubi/

This cannot be right, because we have UBI, not 'BI'.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
