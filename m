Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RKV4B-000370-A2
	for linux-mtd@lists.infradead.org; Sun, 30 Oct 2011 13:04:48 +0000
Received: by bkat2 with SMTP id t2so147997bka.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 30 Oct 2011 06:04:45 -0700 (PDT)
Subject: Re: [PATCH 1/2] Integrated Flash Controller support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: b35362@freescale.com
Date: Sun, 30 Oct 2011 15:04:41 +0200
In-Reply-To: <1319780403-8680-1-git-send-email-b35362@freescale.com>
References: <1319780403-8680-1-git-send-email-b35362@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1319979883.2126.48.camel@koala>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Probably some PPC mailing list should be CCed? Could you please CC at
least LKML?

On Fri, 2011-10-28 at 13:40 +0800, b35362@freescale.com wrote:
> +config FSL_IFC
> +        bool "Freescale Integrated Flash Controller support"
> +        depends on FSL_SOC
> +        help
> +          Enables reporting of errors from the Freescale integrated
> +          flash controller.  Also contains some common code used by
> +          drivers for specific ifc controller peripherals.

Why this cannot be a module?


> +/*
> + * IFC Controller NAND Machine registers
> + */
> +struct fsl_ifc_nand {
> +	__be32 ncfgr;
> +	u32 res1[0x4];
> +	__be32 nand_fcr0;
> +	__be32 nand_fcr1;
> +	u32 res2[0x8];
> +	__be32 row0;
> +	u32 res3;
> +	__be32 col0;
> +	u32 res4;
> +	__be32 row1;
> +	u32 res5;
> +	__be32 col1;
> +	u32 res6;
> +	__be32 row2;
> +	u32 res7;
> +	__be32 col2;
> +	u32 res8;
> +	__be32 row3;
> +	u32 res9;
> +	__be32 col3;
> +	u32 res10[0x24];

I do not know the HW, but I wonder why some fields are __be32 and some
are u32? What is the logic behind that?
