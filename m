Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QP8SY-0007XP-CB
	for linux-mtd@lists.infradead.org; Wed, 25 May 2011 07:24:51 +0000
Received: by eyh6 with SMTP id 6so2895014eyh.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 May 2011 00:24:48 -0700 (PDT)
Subject: Re: [PATCH][upstream] NAND Machine support for Integrated Flash
	Controller
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dipen Dudhat <Dipen.Dudhat@freescale.com>
In-Reply-To: <1306296011-11348-1-git-send-email-Dipen.Dudhat@freescale.com>
References: <1306296011-11348-1-git-send-email-Dipen.Dudhat@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 25 May 2011 10:20:22 +0300
Message-ID: <1306308022.2785.129.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: scottwood@freescale.com, linux-mtd@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, 2011-05-25 at 09:30 +0530, Dipen Dudhat wrote:
> +	ret = nand_scan_tail(&priv->mtd);
> +	if (ret)
> +		goto err;
> +
> +#ifdef CONFIG_MTD_PARTITIONS

We've just removed this macro, it should be merged upstream soon, but it
is in the mtd tree so far.

> +	/* First look for RedBoot table or partitions on the command
> +	 * line, these take precedence over device tree information */
> +	ret = parse_mtd_partitions(&priv->mtd, part_probe_types, &parts, 0);
> +	if (ret < 0)
> +		goto err;

> +
> +#ifdef CONFIG_MTD_OF_PARTS
> +	if (ret == 0) {
> +		ret = of_mtd_parse_partitions(priv->dev, node, &parts);
> +		if (ret < 0)
> +			goto err;
> +	}
> +#endif

You should invent something to make sure you do not need #ifdef
CONFIG_MTD_OF_PARTS.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
