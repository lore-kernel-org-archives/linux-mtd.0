Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6785BC07CA9
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Nov 2023 08:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EiPBQlXSZCRdY9XyeQzxNrHOAKyrGm0UiMXkvgEkkUk=; b=zK7OCYJiU3dEe37cpAgWFz8s1W
	rOGR6riKibt/fTUz44yGa2jC05BaOjdIQpwyK5aBZ3mWPEvpwS51F6ofarCativCpNicCTay4lMiX
	Ka8S+qQV9TFVrTB4bJTiKNYl09iNKz2xYJVP5vsUWmxSDXWNawMjW4nLFWUkgT1JYDJCVMBMUW8Bx
	WLhX+IN2Yaq2ZeL2iN6BbT7Y0SEk/XQsSdkmG4F3kF+gOFDz1uM8ptEzCO3NMFN0qoX/VrMI87UHA
	H9wbDJTqQQuIOo1RagLFZFSgM66eqdoWSoEhq2VGhkXeS26oY7B2mHeXobJ6zzJgiRsHgpM07RHWf
	FNT0i0Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7tkl-004aIL-0D;
	Tue, 28 Nov 2023 08:47:35 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7tkj-004aHL-02
	for linux-mtd@lists.infradead.org;
	Tue, 28 Nov 2023 08:47:34 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id E2CF36E;
	Tue, 28 Nov 2023 09:47:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1701161249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B/FGvUrY1T+u4h3eD8cuv8IgBGuuyis0jyMyILTG5Cs=;
	b=omIgNta8GaYBjwrBX8v6awEENxnGYsQM/8IyIay2A7m4msZtcUozD/UUm49ThMV/vAZkci
	LC7XPI+nffCV4X4RH5dIgY9pXwuLSsV4w/N6kZ/KXp7voyAmZlzKVlvcA62h7f3THJU1hJ
	898RUgUrd3gLjvBoHdPfFptncr3yIGMXYmhwv57RmcgopcQ6k5cPMvUUhPlMGY+31LYCyN
	3CNHdOzUSlA4fVkKqS1wsLiN1ix91UnCe3DoqVOt4VJyxoY/KCpVPFmhRrQIvKNQlWeyrh
	H/5umPg9aIPG1sZuFX2BHGI0fm+ol8eb5dxzgVzPKkdIQXkd3R6eZ8XhUGJoAw==
MIME-Version: 1.0
Date: Tue, 28 Nov 2023 09:47:28 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: miquel.raynal@bootlin.com, jaimeliao.tw@gmail.com,
 jaimeliao@mxic.com.tw, pratyush@kernel.org, richard@nod.at,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: stop printing superfluous debug info
In-Reply-To: <20231127165908.1734951-1-tudor.ambarus@linaro.org>
References: <20231127165908.1734951-1-tudor.ambarus@linaro.org>
Message-ID: <42c96d63d1ea4f7e8f16a3c8eb0a4cf1@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_004733_200726_FE0558F0 
X-CRM114-Status: GOOD (  17.20  )
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

Hi,

> The mtd data can be obtain with the mtd ioctls and the SPI NOR
> flash name can be determined interrogating the sysfs entries.
> Stop polluting the kernel log.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> ---
>  drivers/mtd/spi-nor/core.c | 19 -------------------
>  1 file changed, 19 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 25a64c65717d..6de76fd009d1 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3517,25 +3517,6 @@ int spi_nor_scan(struct spi_nor *nor, const char 
> *name,
>  	/* No mtd_info fields should be used up to this point. */
>  	spi_nor_set_mtd_info(nor);
> 
> -	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
> -			(long long)mtd->size >> 10);

I'd lower this to dev_dbg() and print the jedec id. It might come in
handy for a quick glance during bootup if debug is enabled.

> -
> -	dev_dbg(dev,
> -		"mtd .name = %s, .size = 0x%llx (%lldMiB), "
> -		".erasesize = 0x%.8x (%uKiB) .numeraseregions = %d\n",
> -		mtd->name, (long long)mtd->size, (long long)(mtd->size >> 20),
> -		mtd->erasesize, mtd->erasesize / 1024, mtd->numeraseregions);
> -
> -	if (mtd->numeraseregions)
> -		for (i = 0; i < mtd->numeraseregions; i++)
> -			dev_dbg(dev,
> -				"mtd.eraseregions[%d] = { .offset = 0x%llx, "
> -				".erasesize = 0x%.8x (%uKiB), "
> -				".numblocks = %d }\n",
> -				i, (long long)mtd->eraseregions[i].offset,
> -				mtd->eraseregions[i].erasesize,
> -				mtd->eraseregions[i].erasesize / 1024,
> -				mtd->eraseregions[i].numblocks);
>  	return 0;

Part of this is already available through the spi-nor debugfs, although 
not
the actual mtd properties. These I think, should go into the mtdcore
itself if really needed. Either through dev_dbg() or debugfs.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
