Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA99C25B48
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Oct 2023 06:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gTM3QHCPn53urnItuzk8hNW+BmwCHxTVVP6utVm33Rk=; b=lOWmlPjWsesUKY
	b+B0w+WrVFomGiQkIMvgUdTRRFXX6Js4z6XVG4jCM8x/VmszlUZRw+oLcKTH9RzL8A6Tl05fI4o6t
	kE2VL9YKt3rI2+6+bjWB17hhTQgmq9/UA0M2yjilyRbdWaJuuFZCeuqsNZb7sPvfH4sF7ikzyUM2t
	WIFIW+xDd91cd9urK4wW0PvMZD0p9iJTLvszIvyYHhOSbyaF8Q7cupzdYO4/jR6wBDvxfk8mdZs9q
	GqLQNe5OyXipP9/Mu0hFPeM5W5EYKUzLZSQBrMgVtOWuak8WCfzu5etnbSE8z6NUjfiqJi0UiSqBe
	ep/NaSvarJS9qtTkf5Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvtbH-00DlBK-2K;
	Thu, 26 Oct 2023 06:12:11 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvtbC-00DlAM-2f
	for linux-mtd@lists.infradead.org;
	Thu, 26 Oct 2023 06:12:08 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39Q6BjYj074753;
	Thu, 26 Oct 2023 01:11:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698300705;
	bh=UUmCoi9sFG2gDuFW3OlSaYRvhK1O3scFJQltzhb7fyE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=H4SX4had2TqA/rDyNI8f+yNlJESgMdnCkK+oMvBlq2i28a5dITife4wRZHl0Sfqh5
	 7jPLgktJK/5gmSXjCM5gkReG8i+UqZnJps7G+uRJIIZLl0B2h374EFHdFy/Tp3c1G6
	 4Af66N4pbSgkFzGV8snQQi4S25OtLdZa9y8gkQQQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39Q6BjIP098846
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Oct 2023 01:11:45 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 26
 Oct 2023 01:11:45 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 26 Oct 2023 01:11:45 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39Q6BhqZ101067;
	Thu, 26 Oct 2023 01:11:44 -0500
Date: Thu, 26 Oct 2023 11:41:43 +0530
From: Dhruva Gole <d-gole@ti.com>
To: AceLan Kao <acelan.kao@canonical.com>
CC: Tudor Ambarus <tudor.ambarus@linaro.org>,
        Pratyush Yadav
	<pratyush@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Miquel Raynal
	<miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Mika Westerberg
	<mika.westerberg@linux.intel.com>,
        <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] mtd: spi-nor: Improve reporting for software reset
 failures
Message-ID: <20231026061143.bjbgfkyhnnyh2ovb@dhruva>
References: <20231026012017.518610-1-acelan.kao@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231026012017.518610-1-acelan.kao@canonical.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_231207_052320_ADD47B54 
X-CRM114-Status: GOOD (  19.76  )
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

On Oct 26, 2023 at 09:20:17 +0800, AceLan Kao wrote:
> From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
> 
> When the software reset command isn't supported, we now report it
> as an informational message(dev_info) instead of a warning(dev_warn).
> This adjustment helps avoid unnecessary alarm and confusion regarding
> software reset capabilities.
> 
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> ---
> v2. only lower the priority for the not supported failure
> v3. replace ENOTSUPP with EOPNOTSUPP and check the first command only
> v4. move the version information below the '---' line
> ---
>  drivers/mtd/spi-nor/core.c | 5 ++++-
>  drivers/spi/spi-mem.c      | 2 +-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 1b0c6770c14e..42e52af76289 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3252,7 +3252,10 @@ static void spi_nor_soft_reset(struct spi_nor *nor)
>  
>  	ret = spi_mem_exec_op(nor->spimem, &op);
>  	if (ret) {
> -		dev_warn(nor->dev, "Software reset failed: %d\n", ret);
> +		if (ret == -EOPNOTSUPP)
> +			dev_info(nor->dev, "Software reset enable command doesn't support: %d\n", ret);

Does "Software reset command isn't supported:" make more sense?

> +		else
> +			dev_warn(nor->dev, "Software reset failed: %d\n", ret);
>  		return;
>  	}
>  
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index edd7430d4c05..93b77ac0b798 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -323,7 +323,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>  		return ret;
>  
>  	if (!spi_mem_internal_supports_op(mem, op))
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;

Reviewed-by: Dhruva Gole <d-gole@ti.com>

>  
>  	if (ctlr->mem_ops && ctlr->mem_ops->exec_op && !spi_get_csgpiod(mem->spi, 0)) {
>  		ret = spi_mem_access_start(mem);
> -- 
> 2.34.1
> 
> 


-- 
Best regards,
Dhruva Gole <d-gole@ti.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
