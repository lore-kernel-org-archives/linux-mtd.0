Received: from mail-wi0-f169.google.com ([209.85.212.169])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtMS1-0006An-Kb
 for linux-mtd@lists.infradead.org; Tue, 25 Nov 2014 20:11:10 +0000
Received: by mail-wi0-f169.google.com with SMTP id r20so13253360wiv.2
 for <linux-mtd@lists.infradead.org>; Tue, 25 Nov 2014 12:10:42 -0800 (PST)
Message-ID: <5474E1DB.1090207@vanguardiasur.com.ar>
Date: Tue, 25 Nov 2014 17:08:59 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: Aaron Sierra <asierra@xes-inc.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2] mtd: fsl_upm: Support NAND ECC DTS properties
References: <1854666513.5578.1415473916534.JavaMail.zimbra@xes-inc.com>
In-Reply-To: <1854666513.5578.1415473916534.JavaMail.zimbra@xes-inc.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: Jordan Friendshuh <jfriendshuh@xes-inc.com>, devicetree@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/08/2014 04:11 PM, Aaron Sierra wrote:
[..]
> +
> +	/* We know mode is either NAND_ECC_SOFT or NAND_ECC_SOFT_BCH */
> +	if (strength < 0 && mode == NAND_ECC_SOFT_BCH) {
> +		dev_err(fun->dev,
> +			"ECC BCH mode requires nand-ecc-strength property");
> +		ret = -EINVAL;
> +		goto err;
> +	} else if (strength == 0) {
> +		dev_err(fun->dev, "ECC strength of 0 bits is unsupported");
> +		ret = -EINVAL;
> +		goto err;
> +	} else if (strength == 1 && mode == NAND_ECC_SOFT_BCH) {
> +		dev_err(fun->dev, "ECC BCH mode requires > 1-bit strength");
> +		ret = -EINVAL;
> +		goto err;
> +	} else if (strength > 1 && mode == NAND_ECC_SOFT) {
> +		dev_warn(fun->dev,
> +			"Forcing ECC BCH due to %d-bit strength\n", strength);
> +		mode = NAND_ECC_SOFT_BCH;
> +	}
> +	fun->chip.ecc.mode = mode;
> +	fun->chip.ecc.strength = strength;
> +

Aside from my comment about the lack of ECC specification in the
binding, I think the above is wrong.

You don't have hardware ECC, but software ECC (either hamming or BCH).
So, you don't need to specify any nand_ecc_ctrl.strength (i.e.
ecc.strength above).

It'll be set by the NAND core and override any value you set
See nand_scan_tail.

So, I'd say you just need to specify the nand-ecc-mode in the devicetree
binding.

The nand-ecc-strength and nand-ecc-step-size are meant for controllers
with hardware ECC support.
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
