Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A43C02192
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 08:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YDxWUmZKuabilU9968ZJg2Cj/qWHLh0sb5ilB1rz5g=; b=UMXyyL7ORuFN4LL/VRN8wd2Za4
	6FhmEFIs0+rjZjFAvD0ftBln4xggV8HxLbm7uJEYFg+pA75kt/hwcl6qDF6iQUcer4jv7H46JHs87
	b6VCdGAhXykf4jOqnMJZcd8/GmkvkIjeQnfDFm0r3OC9JBG1vb7WIfAGbt8X0gwH0hOwxOAGh5Ph/
	MFN8O2n3YGv0M8x3BbvUDnUHUOkTpn7Z72cOkUkjY++XavvjjHxgIhyofOpPMEBQJc2/yJin0MTWc
	5ZuSaw18NI9dBTXy9yy4hKzhzFYLMlOA4P45V4m9j5UEuSSlz9i82ivhY00O90EETBceHMLAZhXBj
	MojMLfBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgK5w-00000008t1v-2mOL;
	Fri, 07 Feb 2025 08:52:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJtk-00000008qwJ-1HYy
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 08:39:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8BEB6A40361;
	Fri,  7 Feb 2025 08:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E83B6C4CED1;
	Fri,  7 Feb 2025 08:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738917579;
	bh=JkXN5D2U7NLeqI0IP0jOonEhjbx2JXNOvVZXrZ10IqA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WdWtu5VmRtLR8H/yKw9Z6K9uRACmj63TkIPo+Ss3RAZy3MAhtKo1McpqNmM69zBFz
	 TvFfu7Jq3Jl16wpHmTo78QxEo3HOyUl4rApgM4y9m6hQWWxX9B+jldP13I4Uyx30l2
	 w7Jm2pdqNBKrfy+Lfcan+BjjqUfCuFxYQCwF505cgkdsmx54kJKMnOKiH+WqEqHWF3
	 zQf0y3z6UvGcQ2iyDvqU16FG9bsv04R+UAv13PAZmRrwWCsHINmFvpxcn6QP3kEY/i
	 gW+n0mTOJJsoZM/IHyJS3yKgFJeWZyUfpkLhB9fpwm5MB1TYp/q7WSckokvD04pjrg
	 x+Aj0X0oUSIqQ==
MIME-Version: 1.0
Date: Fri, 07 Feb 2025 09:39:34 +0100
From: Michael Walle <mwalle@kernel.org>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, Cheng Ming Lin
 <chengminglin@mxic.com.tw>
Subject: Re: [PATCH 2/2] mtd: spi-nor: macronix: Add support for Macronix NOR
 Flash
In-Reply-To: <20250207081846.362919-3-linchengming884@gmail.com>
References: <20250207081846.362919-1-linchengming884@gmail.com>
 <20250207081846.362919-3-linchengming884@gmail.com>
Message-ID: <811f5b9d7b2842a3e1293ac6a0bb3b70@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_003940_415887_4678C12A 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Cheng,

> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> 
> Due to incorrect values in the 4-BAIT table for these two flash IDs,
> it is necessary to add these two flash IDs with fixups.

What's the part number of these flashes?

> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -127,6 +127,9 @@ static const struct flash_info macronix_nor_parts[] 
> = {
>  		.size = SZ_128M,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  		.fixups = &macronix_qpp4b_fixups,
> +	}, {

Although we don't have .name anymore, a comment like

/* <partname> */

is recommended.

> +		.id = SNOR_ID(0xc2, 0x20, 0x1c),
> +		.fixups = &macronix_qpp4b_fixups,
>  	}, {
>  		.id = SNOR_ID(0xc2, 0x23, 0x14),
>  		.name = "mx25v8035f",
> @@ -182,6 +185,9 @@ static const struct flash_info macronix_nor_parts[] 
> = {
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  		.fixup_flags = SPI_NOR_4B_OPCODES,
>  		.fixups = &macronix_qpp4b_fixups,
> +	}, {

same same

> +		.id = SNOR_ID(0xc2, 0x25, 0x3b),
> +		.fixups = &macronix_qpp4b_fixups,
>  	}, {
>  		.id = SNOR_ID(0xc2, 0x25, 0x3c),
>  		.name = "mx66u2g45g",

Thanks,
-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
