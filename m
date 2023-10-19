Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD96CDB482
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Oct 2023 12:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mZmdaeZlnIfSaTbI12V2rnLjWN8ql7fF3OlkWF2b/q0=; b=eh1KpTHCvwyl0j
	UrkrkcAhlM7avriJfV+vT4HOJFLchXEtVdsNz6Yj6ooaJt+Bl1xywsIEVIEbHRjnN+FoC7AhpIL7z
	i6SLPcPGiSbdg+JBr2JmDHjGrupjlrLYxNLBsIcYJXV7/NTVM+qlkEVbj60h5lk+v6tKW60F73tFF
	/du9wVCZ/Mi5Pd8poD44//r+x+ql9xjlPxfJdyL1rb8rm6SV+zTSQsFQ7lGEUT52lROE4Tzvty0/7
	a8XrxIcdIk7t/4bt1djjyQD/hXGOwvJgwaI/35FdB+V3ffpRy4CDEMDtYSfKkn8QUjlaXN5wX+l2l
	0hxEeUNGuo5NyW4+jEQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSWe-00HO8c-2Z;
	Thu, 19 Oct 2023 12:53:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSW0-00HNH7-25
	for linux-mtd@lists.infradead.org;
	Thu, 19 Oct 2023 12:52:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8BE69B828DF;
	Thu, 19 Oct 2023 12:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97689C433CC;
	Thu, 19 Oct 2023 12:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697719955;
	bh=yuOr6eC+UVD/IHhv/fixcoalqBvESFwRL92GtxeNa7I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pNnFayKsiffxCOuRCKBeRs5ptNAQMvMDxbA3GN2LaSThQrvAZiASeOSymI0QNje4U
	 6ATHOmk+SUzkTwID1dB+nrE4OplbCrDvSBsGykpQTMkgE0wSZmsjHkb5FUxudGcRjM
	 s6uF9dQgQ989gKDx+90fS6/B7AV5KOcciYeV6AIyzyHXUlXeKykkrI+TFqPJJITl0D
	 uvjQYh/AVgw6Jmvfbc71rZr275c6wvAPHStRa+JDbnJPw4D5UD2DGQB0HjFaJ49j2m
	 6JUQPk7KFnbLo5xUhUQXSTVyzru/XxHk+MswENfOAS3XhXtDl7in3l7qJ0yB4X2yVQ
	 7NrhVeQ2dUrNA==
From: Pratyush Yadav <pratyush@kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <michael@walle.cc>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: Lower the priority of the software reset
 failure message
In-Reply-To: <20231019064547.348446-1-acelan.kao@canonical.com> (AceLan Kao's
	message of "Thu, 19 Oct 2023 14:45:47 +0800")
References: <20231019064547.348446-1-acelan.kao@canonical.com>
Date: Thu, 19 Oct 2023 14:52:33 +0200
Message-ID: <mafs07cnin59q.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_055240_888883_877BF48C 
X-CRM114-Status: GOOD (  19.25  )
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

On Thu, Oct 19 2023, AceLan Kao wrote:

> From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
>
> Not all SPI drivers support soft reset enable and soft reset commands.
> This failure is expected and not critical. Thus, we avoid reporting it
> to regular users to prevent potential confusion regarding power-off issues.

No, failure to soft reset can very much be critical in certain cases.
For example, if you are operating the flash in 8D-8D-8D mode and do not
have the hard reset line connected, the bootloader (or the kernel) would
be unable to detect or operate the flash after a warm reboot.

Perhaps it makes sense to just call it when SNOR_F_BROKEN_RESET is set?
This way you do not unnecessarily call it when you do not need to, and
won't see the error message.

>
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> ---
>  drivers/mtd/spi-nor/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 1b0c6770c14e..7bca8ffcd756 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3252,7 +3252,7 @@ static void spi_nor_soft_reset(struct spi_nor *nor)
>  
>  	ret = spi_mem_exec_op(nor->spimem, &op);
>  	if (ret) {
> -		dev_warn(nor->dev, "Software reset failed: %d\n", ret);
> +		dev_info(nor->dev, "Software reset failed: %d\n", ret);
>  		return;
>  	}
>  
> @@ -3262,7 +3262,7 @@ static void spi_nor_soft_reset(struct spi_nor *nor)
>  
>  	ret = spi_mem_exec_op(nor->spimem, &op);
>  	if (ret) {
> -		dev_warn(nor->dev, "Software reset failed: %d\n", ret);
> +		dev_info(nor->dev, "Software reset failed: %d\n", ret);
>  		return;
>  	}

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
