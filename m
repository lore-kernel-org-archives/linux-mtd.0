Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1BAC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jan 2022 05:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4fF7GlWI6PM/QBlCUEZN4ZLueEm6ReMMA8hHXz3IwLk=; b=FTGp6bgHMCLjrF
	9z7biwKdAoLCRvYOaynD/tKSSiLPEoYHTs7dMykTTy5znQRPTGOmSKljDJQ69gixhoTlWwYFk2QjP
	p6eN8CVGb6elxG/AihB4BFcF/vN6Ez4oavqxdNqusBHDdv6FMeoXbT5I8AAjCuLJ0fNRN5sME7u6W
	8EjfifVrb5p1A8CM0O+Bp0c87IzpvZLByC/RiSrMeyxA9ZF0OMv/b7ntEu5MCJdkLKZ90YagV5RuS
	hUEgsX9jt2lHkTiRlRzNMfDY7JJcgMXmyiBVjvRUpp4k7ZKnwsnCegd4mzdr/1OgG0aGi5N4I2NNs
	I9v+kEvxbJ1BCzqFmuwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4GHH-008QGm-IZ; Mon, 03 Jan 2022 05:53:03 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4GHE-008QFG-RB
 for linux-mtd@lists.infradead.org; Mon, 03 Jan 2022 05:53:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AE7D0B80AC1;
 Mon,  3 Jan 2022 05:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7799DC36AE9;
 Mon,  3 Jan 2022 05:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641189173;
 bh=efe9x2zqWKqz9Ww5zAplmpJMaFSnp8oSxrb1YNxiTqY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=khztlvo/E2gmtUqHXV8XczAThHrFMvXXbEe/aZ3GqYmciX3cPJ8BVlCFSVcCYeWbn
 fdtf39rppxXID6jaB03uVmxd9L8bRPzeuBq5InTVEwORQy7B55nE9T6ztOBIAnE4Kg
 XXQp0UxUFAMOhBd3ry2oFPc0f3/TBM9p2b/HD/jqfUfJJya1f+YPmyMX3D3t5flolC
 0idQL8/jPLezyUJLUyL62RTxilYDFDBxuwskNDyS/VYCLo4DCnijtElPiVinUoUI/l
 A8Q4MlV9ibuuK//3EK8AWDeEV//RVzoW+WHncdpN/Kb2brdiYjw1MfhJvPqgA7KHDd
 qjKat2dpWZ/3g==
Date: Mon, 3 Jan 2022 11:22:46 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, architt@codeaurora.org,
 bbrezillon@kernel.org, absahu@codeaurora.org, baruch@tkos.co.il
Subject: Re: [PATCH v2 2/2] mtd: parsers: qcom: Don't print error message on
 -EPROBE_DEFER
Message-ID: <20220103055246.GB3581@thinkpad>
References: <20220103030316.58301-1-bryan.odonoghue@linaro.org>
 <20220103030316.58301-3-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220103030316.58301-3-bryan.odonoghue@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220102_215301_042481_E02B9221 
X-CRM114-Status: GOOD (  19.26  )
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

On Mon, Jan 03, 2022 at 03:03:16AM +0000, Bryan O'Donoghue wrote:
> Its possible for the main smem driver to not be loaded by the time we come
> along to parse the smem partition description but, this is a perfectly
> normal thing.
> 
> No need to print out an error message in this case.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
>  drivers/mtd/parsers/qcomsmempart.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
> index 06a818cd2433f..b2a57fe8479fa 100644
> --- a/drivers/mtd/parsers/qcomsmempart.c
> +++ b/drivers/mtd/parsers/qcomsmempart.c
> @@ -75,7 +75,8 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
>  	pr_debug("Parsing partition table info from SMEM\n");
>  	ptable = qcom_smem_get(SMEM_APPS, SMEM_AARM_PARTITION_TABLE, &len);
>  	if (IS_ERR(ptable)) {
> -		pr_err("Error reading partition table header\n");
> +		if (PTR_ERR(ptable) != -EPROBE_DEFER)
> +			pr_err("Error reading partition table header\n");
>  		return PTR_ERR(ptable);
>  	}
>  
> -- 
> 2.33.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
