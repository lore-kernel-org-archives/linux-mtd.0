Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXaBT-0001lF-AI
 for linux-mtd@lists.infradead.org; Mon, 16 Mar 2015 18:56:16 +0000
Received: by pdbcz9 with SMTP id cz9so65817784pdb.3
 for <linux-mtd@lists.infradead.org>; Mon, 16 Mar 2015 11:55:54 -0700 (PDT)
Message-ID: <55072714.9080104@gmail.com>
Date: Mon, 16 Mar 2015 11:55:16 -0700
From: Florian Fainelli <f.fainelli@gmail.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 3/3] mtd: nand: add NAND driver for Broadcom STB NAND
 controller
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
 <1425691129-1150-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425691129-1150-4-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>,
 Corneliu Doban <cdoban@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-kernel@vger.kernel.org, Jonathan Richardson <jonathar@broadcom.com>,
 Anatol Pomazao <anatol@google.com>, bcm-kernel-feedback-list@broadcom.com,
 Dmitry Torokhov <dtor@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/03/15 17:18, Brian Norris wrote:
> This core originated in Set-Top Box chips (BCM7xxx) but is used in a
> variety of other Broadcom chips, including some BCM63xxx, BCM33xx, and
> iProc/Cygnus. It's been used only on ARM and MIPS SoCs, so restrict it
> to those architectures.
> 
> There are multiple revisions of this core throughout the years, and
> almost every version broke register compatibility in some small way, but
> with some effort, this driver is able to support v4.0, v5.0, v6.x, v7.0,
> and v7.1. It's been tested on v5.0, v6.0, v7.0, and v7.1 recently, so
> there hopefully are no more lurking inconsistencies.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---

Looks good to me, just one nitpick below:

[snip]

> +static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
> +{
> +	static const unsigned int block_sizes_v6[] = { 8, 16, 128, 256, 512, 1024, 2048, 0 };
> +	static const unsigned int block_sizes_v4[] = { 16, 128, 8, 512, 256, 1024, 2048, 0 };
> +	static const unsigned int page_sizes[] = { 512, 2048, 4096, 8192, 0 };
> +
> +	ctrl->nand_version = nand_readreg(ctrl, 0) & 0xffff;
> +
> +	/* Only support v4.0+? */
> +	if (ctrl->nand_version < 0x0400)
> +		return -ENODEV;

It could be nice to have an informative error message here that this is
either:

- an unknown controller revision (> 7.1)
- an older controller revision
- a check against the compatible property, just in case?

[snip]

> +		ctrl->cs_offsets = brcmnand_cs_offsets_v71;
> +	} else {
> +		ctrl->cs_offsets = brcmnand_cs_offsets;
> +
> +		/* pre-v5.0 has a different CS0 offset layout */
> +		if (ctrl->nand_version <= 0x0500)
> +			ctrl->cs0_offsets = brcmnand_cs_offsets_cs0;

Based on this check, should the comment should be "pre-v5.0 and v5.0
have a different CS0 offset layout"?
-- 
Florian
