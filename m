Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ow8sm-0002Pb-Nx
	for linux-mtd@lists.infradead.org; Thu, 16 Sep 2010 07:27:49 +0000
Received: by ewy9 with SMTP id 9so580695ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Sep 2010 00:27:47 -0700 (PDT)
Date: Thu, 16 Sep 2010 11:27:42 +0400
From: Anton Vorontsov <cbouatmailru@gmail.com>
To: Roy Zang <tie-fei.zang@freescale.com>
Subject: Re: [PATCH 1/3 v3] P4080/eLBC: Make Freescale elbc interrupt
	common to elbc devices
Message-ID: <20100916072742.GA3176@oksana.dev.rtsoft.ru>
References: <1284619284-23614-1-git-send-email-tie-fei.zang@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1284619284-23614-1-git-send-email-tie-fei.zang@freescale.com>
Cc: B07421@freescale.com, dedekind1@gmail.com, B25806@freescale.com,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org, dwmw2@infradead.org, B11780@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 16, 2010 at 02:41:22PM +0800, Roy Zang wrote:
[...]
> +static const struct platform_device_id fsl_lbc_match[] = {
> +	{ "fsl,elbc", },
> +	{ "fsl,pq3-localbus", },
> +	{ "fsl,pq2-localbus", },
> +	{ "fsl,pq2pro-localbus", },
> +	{},
> +};
> +
> +static struct platform_driver fsl_lbc_ctrl_driver = {
> +	.driver = {
> +		.name = "fsl-lbc",
> +	},
> +	.probe = fsl_lbc_ctrl_probe,
> +	.id_table = fsl_lbc_match,
> +};

No, it won't work that way (at least not w/o a device constructor
somewhere in fsl_soc.c). Instead, you should write something like

static const struct of_device_id fsl_lbc_match[] = {
	...
};

static struct platform_driver fsl_lbc_ctrl_driver = {
	.driver = {
		.name = "fsl-lbc",
		.of_match_table = fsl_lbc_match;
	}
	...
};

(Note that platform_driver.driver has of_match_table nowadays --
 that's what makes it possible to seamlessly transit from
 of_platform_driver to platform_driver.)

The same applies for the second patch as well.

Thanks,

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
