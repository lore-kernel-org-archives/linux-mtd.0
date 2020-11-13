Return-Path: <SRS0=uMxP=ET=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35BAC55ABD
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 19:29:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20C5420760
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 19:29:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QW59MBUZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="n4+/it8R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20C5420760
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nBIDjl2llwMgqVHJmoifAdWvvVAUh0s3cPF2xvUu02E=; b=QW59MBUZX6izDOTCxHDhHgEX7/
	+7LblKmy9ZZ4rPN9RV/vTjLT6vom1PxqMpjUNqOEzgBCFBEZxx3O6Jc++9s6JOU2yD3DHBI2e9/Lc
	NzwwPWoeP0aGwq6uQfsbYwAFcRDaDb6Msy5GisGQr6Fxel3N+JwbO+oXBnfFncNlbMAQfsiNkmkV0
	UTKNK42J5NFev3RIrieCSTDFbEs8HCvb9kCFNxtJ0gGLhtz9aSQ3bxnUcvrBcEtPTem+nh02JYumG
	L9htEUv/2pnFcfyBcjrWzkXsbloJf46PgMonC/Wc6YcO1+HPYQ2e4gKY6c/mZHTCgd+yytTvn9hz+
	EBTAzP0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdekN-0000kM-M4; Fri, 13 Nov 2020 19:28:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdekJ-0000k0-85
 for linux-mtd@merlin.infradead.org; Fri, 13 Nov 2020 19:28:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=LbzCS5SGqZEc3tdUreNGfKvquK5Jhs31Tt8aaPIaxdA=; b=n4+/it8REPtQkvkceur65UoOtu
 t6G7zibL6ijXAVSz3GHexPr5HLff/POy0loU9uc27PzFNw9bJ/JREB2fYH6ZMOI3LNta9lETQpcu4
 Moxw8pSSSDuWSTcjpvTWe/E3uHh4aCEy8W/cStkdXkuOt0iCJ9DuSn6gBrjDoUVlf/x7Gf7AeoCvT
 VRJ5uXbsyW5fih+fp54BJL8DuxUhRXh3Ni/P48TacxBO/+v5FOAepmVFEGxT5GJ57XbC37NASzGAE
 a1elhgy5phEr+2oR2N7vid/bMuJJDOagjph2k93I5/12TvbunlVlSQ3QEWhJ8IPjRi7ojkjaY41KD
 90eS1oww==;
Received: from [2601:1c0:6280:3f0::662d]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdekG-0006TQ-7P; Fri, 13 Nov 2020 19:28:28 +0000
Subject: Re: [PATCH] mtd: nand: Change dependency between the NAND and ECC
 cores
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
References: <20201113123945.32592-1-miquel.raynal@bootlin.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <085df566-9ee7-2e1c-b787-2a8e4f2383a7@infradead.org>
Date: Fri, 13 Nov 2020 11:28:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201113123945.32592-1-miquel.raynal@bootlin.com>
Content-Language: en-US
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 11/13/20 4:39 AM, Miquel Raynal wrote:
> The NAND ECC core is included in the generic NAND core when it is
> compiled in.
> 
> Different software ECC engines drivers will select the NAND ECC core
> and thus also have a dependency on the NAND core. Using a "depends on"
> between the two leads to possible cases (not real cases, but created
> by robots) where one is still unselected because of the "select does
> not verifies depends on" game:
> 
> WARNING: unmet direct dependencies detected for MTD_NAND_ECC
>   Depends on [n]: MTD [=m] && MTD_NAND_CORE [=n]
>   Selected by [m]:
>   - MTD_NAND_ECC_SW_HAMMING [=y] && MTD [=m]
>   - MTD_NAND_ECC_SW_BCH [=y] && MTD [=m]
> 
> Fix this by using a select instead.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
>  drivers/mtd/nand/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 15ffe1a1b863..b40455234cbd 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -13,7 +13,7 @@ menu "ECC engine support"
>  
>  config MTD_NAND_ECC
>         bool
> -       depends on MTD_NAND_CORE
> +       select MTD_NAND_CORE
>  
>  config MTD_NAND_ECC_SW_HAMMING
>  	bool "Software Hamming ECC engine"
> 


-- 
~Randy

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
