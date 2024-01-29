Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294A3C47422
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jan 2024 13:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mnhdmhYO2rtfeTaynMK5qQi1RV1P89PnC9zOREtQUI8=; b=EtBRE6l3koGcIQ
	TYs7eKIRI6/cd8dAxj/Jqvrn+WcmXqhrBV0AJWB4YKiSGFtMnpBlYxezVHGk8uFzy0ef//xPVZ+Yn
	2c/0SAuhvyu9x2oMhCFT/U4j84LcGh+x1sVe4jgSDDse97Mb4syA+qRo5Og9aeWrVxfTO3pMN/hSM
	9R/uOnVrawSHuWyTkdCbtqAzCkNy2bak3eiOG970uKqG4j1PYTv8Ljke4MfjXlS8nwPrYH1ous0zA
	Bymwn6i66fLN661dKrMoct1XZ7cp5JgMFW4ILRBYP/iDmIF9/Hrp7DSliRompjZSuhTHHE1Of7Igm
	1/rKXkpQUk9o2wQcSiTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rURcf-0000000CqV6-2e2g;
	Mon, 29 Jan 2024 13:24:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rURcd-0000000CqUb-0HBD
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jan 2024 13:24:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 602A76215D;
	Mon, 29 Jan 2024 13:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D84AAC433F1;
	Mon, 29 Jan 2024 13:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706534662;
	bh=6i2dbAfD9PBonlVoQuQ5LLhHF3/c2cTgJ1Up88UEt/Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iUQSmhLpkiefjqCXgafJuu+YYxz/VQxDFLDMiPR1ntBW61Ta/jCTlsnHJd6uRuuLd
	 OuD6nAH0EIIn/I1JGCP8IWv+Z2fqz4MIF4GKoD+TeTDoJGMAFGQbadnoCM1dQFDQAn
	 LQAFaIWZOVhY7BXqg5lSVIgaFy07Ue6u+KefD1opnTjdXWW5R8NIRIRh62ZwZcPHth
	 UlhiMyQJE2MStmnl8CGvTWymAchrFDE0WVp29necz7HXuyIMBc5wDoyr9VuYXLxYs/
	 +Y0Aa3IXzGnYxWKBrKVSn7+IQtxxbI3yCs7VQMEh1j1W5RGAhg0V+ENg1SG7EYoHBs
	 BR9KqbrVmzZFw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org,  michael@walle.cc,  miquel.raynal@bootlin.com,
  richard@nod.at,  jaimeliao@mxic.com.tw,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] mtd: spi-nor: sysfs: hide the flash name if not set
In-Reply-To: <20231215082138.16063-4-tudor.ambarus@linaro.org> (Tudor
	Ambarus's message of "Fri, 15 Dec 2023 10:21:37 +0200")
References: <20231215082138.16063-1-tudor.ambarus@linaro.org>
	<20231215082138.16063-4-tudor.ambarus@linaro.org>
Date: Mon, 29 Jan 2024 14:24:19 +0100
Message-ID: <mafs034ugtgqk.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_052423_188818_F042C106 
X-CRM114-Status: GOOD (  17.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Dec 15 2023, Tudor Ambarus wrote:

> From: JaimeLiao <jaimeliao@mxic.com.tw>
>
> The flash name is not reliable as we saw flash ID collisions.
> Hide the flash name if not set.
>
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> [ta: update commit subject and description]
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor | 3 +++
>  drivers/mtd/spi-nor/sysfs.c                             | 2 ++
>  2 files changed, 5 insertions(+)
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor b/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
> index c800621eff95..6d7be97bf7d1 100644
> --- a/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
> +++ b/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
> @@ -25,6 +25,9 @@ KernelVersion:	5.14
>  Contact:	linux-mtd@lists.infradead.org
>  Description:	(RO) Part name of the SPI NOR flash.
>  
> +		The attribute is not present if the jedec_id founded in
> +		ID table but flash name didn't include in it.

Nitpick: strange sentence construction makes it a bit confusing.
Perhaps:

    The attribute is not present if the JEDEC ID table for the flash
    does not include its name.

> +
>  
>  What:		/sys/bus/spi/devices/.../spi-nor/sfdp
>  Date:		April 2021
> diff --git a/drivers/mtd/spi-nor/sysfs.c b/drivers/mtd/spi-nor/sysfs.c
> index 2dfdc555a69f..96064e4babf0 100644
> --- a/drivers/mtd/spi-nor/sysfs.c
> +++ b/drivers/mtd/spi-nor/sysfs.c
> @@ -78,6 +78,8 @@ static umode_t spi_nor_sysfs_is_visible(struct kobject *kobj,
>  
>  	if (attr == &dev_attr_manufacturer.attr && !nor->manufacturer)
>  		return 0;
> +	if (attr == &dev_attr_partname.attr && !nor->info->name)
> +		return 0;

Do you want to show the name for the "spi-nor-generic" flash? If not
then perhaps drop its name as well?

>  	if (attr == &dev_attr_jedec_id.attr && !nor->info->id && !nor->id)
>  		return 0;

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
