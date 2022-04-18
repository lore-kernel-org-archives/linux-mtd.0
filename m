Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66B6C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Apr 2022 05:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jVtDwEuMtZvhXCKzIzlFrmXPeYy/MrLyvi9r72q28fc=; b=flESrZbxS1BkcX
	KT8NvSs5ERfKlUdMjY2sH25nooHlySHGQNxeVqpqsTtT6CnsD86qfuaa0xtsR6jOZYZFbjgWM32vS
	B3OsjjtuhEDCGpSTH33Klg9qr3D6CJeMO0EYtYcXdjjEJK3QqpVXWljsULnv6yq9JutVBY2+HAMlD
	Pm6hV5Pi9hHEL9hG52T7Q+BVwzJEn+Z1YgM6WG+M7Nh/L1ghHwhVknm7/Tf0TYFBvt6Q6vBoOoZG7
	Y51DKXY85EvzhWTJVt4luBp1tWVcchu+IvkMi+3W/Uof9rJpIGzBheuk6PtNBJkJFe2grrIQOqD4u
	jywoBFQTWo7UlPiDzRJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngJy9-00FfgF-NU; Mon, 18 Apr 2022 05:30:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngJy5-00Fffq-UN
 for linux-mtd@lists.infradead.org; Mon, 18 Apr 2022 05:30:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6BB8F60F8A;
 Mon, 18 Apr 2022 05:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D06C385A1;
 Mon, 18 Apr 2022 05:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650259831;
 bh=WWUJM0Dq3fdCcxIjJvR0UhznAAHwcINexYWtspu+OSE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vQ4MYWSTb/xP0BUP7nWdGk8YeYZqKdAjokw01TOAPwM8IbkHR6HbSNwQHgQe9Qn7F
 aHs70sVgZO+NUlZUhq0e25QYd6DCwneXCxGwnlZOo9tLbkfLAOwwVw9jtLCFC6TRs9
 D9POlsREQ62UUj7pXSLsPs/ckSvkzq9wJSvPJ9gY80B3FA+4DqCmYViI7uKqz4SDGJ
 vwxv0APY7TRs/GZLmsPRrzLEO4Ipv5M+bo3BR6hZBSeYFttHqjkVarywKiRd8V0UWS
 Y37qSU+f7RcZi/s1yLTAE4JUASF5BaAvEfe0K7zg4p65SMq/yfLFml536WHrhbK5da
 lVGai4KlstFMA==
Date: Mon, 18 Apr 2022 11:00:24 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: mani@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 konrad.dybcio@somainline.org, quic_srichara@quicinc.com,
 stable@vger.kernel.org
Subject: Re: [PATCH V3] mtd: rawnand: qcom: fix memory corruption that causes
 panic
Message-ID: <20220418053024.GA7431@thinkpad>
References: <1650259141-20923-1-git-send-email-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1650259141-20923-1-git-send-email-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_223034_093853_4264CDFF 
X-CRM114-Status: GOOD (  28.67  )
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

On Mon, Apr 18, 2022 at 10:49:01AM +0530, Md Sadre Alam wrote:
> This patch fixes a memory corruption that occurred in the
> nand_scan() path for Hynix nand device.
> 
> On boot, for Hynix nand device will panic at a weird place:
> | Unable to handle kernel NULL pointer dereference at virtual
>   address 00000070
> | [00000070] *pgd=00000000
> | Internal error: Oops: 5 [#1] PREEMPT SMP ARM
> | Modules linked in:
> | CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.17.0-01473-g13ae1769cfb0
>   #38
> | Hardware name: Generic DT based system
> | PC is at nandc_set_reg+0x8/0x1c
> | LR is at qcom_nandc_command+0x20c/0x5d0
> | pc : [<c088b74c>]    lr : [<c088d9c8>]    psr: 00000113
> | sp : c14adc50  ip : c14ee208  fp : c0cc970c
> | r10: 000000a3  r9 : 00000000  r8 : 00000040
> | r7 : c16f6a00  r6 : 00000090  r5 : 00000004  r4 :c14ee040
> | r3 : 00000000  r2 : 0000000b  r1 : 00000000  r0 :c14ee040
> | Flags: nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM Segment none
> | Control: 10c5387d  Table: 8020406a  DAC: 00000051
> | Register r0 information: slab kmalloc-2k start c14ee000 pointer offset
>   64 size 2048
> | Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
> | nandc_set_reg from qcom_nandc_command+0x20c/0x5d0
> | qcom_nandc_command from nand_readid_op+0x198/0x1e8
> | nand_readid_op from hynix_nand_has_valid_jedecid+0x30/0x78
> | hynix_nand_has_valid_jedecid from hynix_nand_init+0xb8/0x454
> | hynix_nand_init from nand_scan_with_ids+0xa30/0x14a8
> | nand_scan_with_ids from qcom_nandc_probe+0x648/0x7b0
> | qcom_nandc_probe from platform_probe+0x58/0xac
> 
> The problem is that the nand_scan()'s qcom_nand_attach_chip callback
> is updating the nandc->max_cwperpage from 1 to 4.This causes the
> sg_init_table of clear_bam_transaction() in the driver's
> qcom_nandc_command() to memset much more than what was initially
> allocated by alloc_bam_transaction().
> 
> This patch will update nandc->max_cwperpage 1 to 4 after nand_scan()
> returns, and remove updating nandc->max_cwperpage from
> qcom_nand_attach_chip call back.

The above statement is still wrong.

> 
> Cc: stable@vger.kernel.org
> Fixes: 6a3cec64f18c ("mtd: rawnand: qcom: convert driver to nand_scan()")
> Reported-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> ---
> [V3]
>  * Updated commit message Fixes, Cc, Reported-by

Missing the previous changelogs.

Thanks,
Mani

> 
>  drivers/mtd/nand/raw/qcom_nandc.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index 1a77542..048b255 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -2651,10 +2651,23 @@ static int qcom_nand_attach_chip(struct nand_chip *chip)
>  	ecc->engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
>  
>  	mtd_set_ooblayout(mtd, &qcom_nand_ooblayout_ops);
> +	/* Free the initially allocated BAM transaction for reading the ONFI params */
> +	if (nandc->props->is_bam)
> +		free_bam_transaction(nandc);
>  
>  	nandc->max_cwperpage = max_t(unsigned int, nandc->max_cwperpage,
>  				     cwperpage);
>  
> +	/* Now allocate the BAM transaction based on updated max_cwperpage */
> +	if (nandc->props->is_bam) {
> +		nandc->bam_txn = alloc_bam_transaction(nandc);
> +		if (!nandc->bam_txn) {
> +			dev_err(nandc->dev,
> +				"failed to allocate bam transaction\n");
> +			return -ENOMEM;
> +		}
> +	}
> +
>  	/*
>  	 * DATA_UD_BYTES varies based on whether the read/write command protects
>  	 * spare data with ECC too. We protect spare data by default, so we set
> @@ -2955,17 +2968,6 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
>  	if (ret)
>  		return ret;
>  
> -	if (nandc->props->is_bam) {
> -		free_bam_transaction(nandc);
> -		nandc->bam_txn = alloc_bam_transaction(nandc);
> -		if (!nandc->bam_txn) {
> -			dev_err(nandc->dev,
> -				"failed to allocate bam transaction\n");
> -			nand_cleanup(chip);
> -			return -ENOMEM;
> -		}
> -	}
> -
>  	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
>  	if (ret)
>  		nand_cleanup(chip);
> -- 
> 2.7.4
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
