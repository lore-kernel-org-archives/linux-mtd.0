Received: from mail-la0-f44.google.com ([209.85.215.44])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TqTJQ-0006zc-3s
 for linux-mtd@lists.infradead.org; Wed, 02 Jan 2013 18:45:13 +0000
Received: by mail-la0-f44.google.com with SMTP id fr10so6638242lab.17
 for <linux-mtd@lists.infradead.org>; Wed, 02 Jan 2013 10:45:08 -0800 (PST)
Message-ID: <50E48DFD.2030908@mvista.com>
Date: Wed, 02 Jan 2013 22:43:57 +0300
From: Sergei Shtylyov <sshtylyov@mvista.com>
MIME-Version: 1.0
To: Heiko Schocher <hs@denx.de>
Subject: Re: [PATCH v6] ARM: mtd: nand: davinci: add OF support for davinci
 nand controller
References: <1343632944-25971-1-git-send-email-hs@denx.de>
In-Reply-To: <1343632944-25971-1-git-send-email-hs@denx.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Cc: davinci-linux-open-source@linux.davincidsp.com,
 devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>,
 linux-mtd@lists.infradead.org, Scott Wood <scottwood@freescale.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

On 07/30/2012 11:22 AM, Heiko Schocher wrote:

> add OF support for the davinci nand controller.

> Signed-off-by: Heiko Schocher <hs@denx.de>
> Cc: davinci-linux-open-source@linux.davincidsp.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: devicetree-discuss@lists.ozlabs.org
> Cc: linux-mtd@lists.infradead.org
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Cc: Sekhar Nori <nsekhar@ti.com>
> Cc: Wolfgang Denk <wd@denx.de>
> Cc: Scott Wood <scottwood@freescale.com>

[...]

> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
> index d94b03c..f386b3c 100644
> --- a/drivers/mtd/nand/davinci_nand.c
> +++ b/drivers/mtd/nand/davinci_nand.c
[...]
> @@ -518,9 +519,75 @@ static struct nand_ecclayout hwecc4_2048 __initconst = {
>  	},
>  };
>  
> +#if defined(CONFIG_OF)
> +static const struct of_device_id davinci_nand_of_match[] = {
> +	{.compatible = "ti,davinci-nand", },
> +	{},
> +}

   I have only one question: have you ever try to compile this patch with
CONFIG_OF enabled? If you have, you would have noticed:

drivers/mtd/nand/davinci_nand.c:527: error: expected ‘,’ or ‘;’ before ‘extern’

> +MODULE_DEVICE_TABLE(of, davinci_nand_of_match);

   No need to worry now, I'll send out the trivial patch...

WBR, Sergei
