Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C03EC5475B
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Mar 2024 12:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9M27Igk/TVDpHMloVkJkTeL5zGd49D9vbuT48byGSqo=; b=iSVId4T3gdj6LH
	QoQi9Rx3gmZ36OhyNvVAhTQVITLtlF2DZwwx3kQawRbBkJloWOwD862KNXbnHFrVMqo4aQbIrWMZb
	Cy8POIgv/eFu/LRLVNeoV4XSpmOTrCMVq0r7S9AO5jBZqV2rLxda/5HFgJVNzVMfNco1xHicLMhkr
	EYrLBcB5EbwPFc3sChlWrpWkqp0xecaTlDBCFEYsi4PEjM8TpmsXkRc8ZB0S19fZvdBYzfPYNjb1n
	lNwU3CoWJuNkdqwnGfSYhC5WD5whTSgFC7mnirL87a/ihF+2217sAyzV5IjwWUSs2NyrIhBX+TQKc
	nNrd1gtrw0WVgwne1n9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riZLK-000000098Oe-0FhU;
	Fri, 08 Mar 2024 12:28:54 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riZLH-000000098KQ-109K
	for linux-mtd@lists.infradead.org;
	Fri, 08 Mar 2024 12:28:53 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 428Ab1A9022424;
	Fri, 8 Mar 2024 13:28:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=XKGlTKcB76WSjtXRqXEchAI0+D7g3eog2GfYhv6SP0w=; b=F7
	9ItZ//pH3XOIFsfaA5nfafDjMMKeb+f1J2VeEjrkzBsgTmpM4VW2YfA4ffeqsa5f
	KF8DAmuqgBpfbp+bSWBrf6XIAsZyLzDfVNADg+SUTdEZtlcqT7Ky3YpnebQ20RnX
	t5orRYdY0thEwv9V85y6oJycWkA/41SkqKp3FzwdMhqZo1JX7msQmtxtC5v6C/2F
	xsap+lYLs7qzeQ7fze4DuiwjtkBv+UTHk2QFldxQr+5E12nlDQ2DXlQLrPZyk9Vw
	klCxcmFMm1teU4oFK/vkmnV3Yrn7xWT7RLEUAV3EShzf7Wk6fyLOlwhk6ClBI9VU
	Ycd0KgbE1VGr+xjhy84w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wkuvj4mv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Mar 2024 13:28:21 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3577C4002D;
	Fri,  8 Mar 2024 13:28:14 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 60B4A26C463;
	Fri,  8 Mar 2024 13:27:01 +0100 (CET)
Received: from [10.201.21.177] (10.201.21.177) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Mar
 2024 13:27:00 +0100
Message-ID: <5f1a8a9f-0f35-4028-9d5e-d5ff624124b8@foss.st.com>
Date: Fri, 8 Mar 2024 13:26:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mtd: rawnand: Constrain even more when continuous
 reads are enabled
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger
	<richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus
	<tudor.ambarus@linaro.org>,
        Pratyush Yadav <pratyush@kernel.org>,
        Michael
 Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>
CC: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
        Jaime Liao <jaimeliao.tw@gmail.com>,
        Alvin Zhou <alvinzhou@mxic.com.tw>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        <eagle.alexander923@gmail.com>, <mans@mansr.com>, <martin@geanix.com>,
        =?UTF-8?Q?Sean_Nyekj=C3=A6r?= <sean@geanix.com>,
        <stable@vger.kernel.org>
References: <20240307115315.1942678-1-miquel.raynal@bootlin.com>
From: Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <20240307115315.1942678-1-miquel.raynal@bootlin.com>
X-Originating-IP: [10.201.21.177]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_08,2024-03-06_01,2023-05-22_02
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_042851_731101_B075F7D0 
X-CRM114-Status: GOOD (  23.30  )
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

Hi Miquel,

On 3/7/24 12:53, Miquel Raynal wrote:
> As a matter of fact, continuous reads require additional handling at the
> operation level in order for them to work properly. The core helpers do
> have this additional logic now, but any time a controller implements its
> own page helper, this extra logic is "lost". This means we need another
> level of per-controller driver checks to ensure they can leverage
> continuous reads. This is for now unsupported, so in order to ensure
> continuous reads are enabled only when fully using the core page
> helpers, we need to add more initial checks.
> 
> Also, as performance is not relevant during raw accesses, we also
> prevent these from enabling the feature.
> 
> This should solve the issue seen with controllers such as the STM32 FMC2
> when in sequencer mode. In this case, the continuous read feature would
> be enabled but not leveraged, and most importantly not disabled, leading
> to further operations to fail.
> 
> Reported-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Fixes: 003fe4b9545b ("mtd: rawnand: Support for sequential cache reads")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Tested-by: Christophe Kerello <christophe.kerello@foss.st.com>

Regards,
Christophe Kerello.

> ---
>   drivers/mtd/nand/raw/nand_base.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 4d5a663e4e05..2479fa98f991 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -3594,7 +3594,8 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
>   	oob = ops->oobbuf;
>   	oob_required = oob ? 1 : 0;
>   
> -	rawnand_enable_cont_reads(chip, page, readlen, col);
> +	if (likely(ops->mode != MTD_OPS_RAW))
> +		rawnand_enable_cont_reads(chip, page, readlen, col);
>   
>   	while (1) {
>   		struct mtd_ecc_stats ecc_stats = mtd->ecc_stats;
> @@ -5212,6 +5213,15 @@ static void rawnand_late_check_supported_ops(struct nand_chip *chip)
>   	if (!nand_has_exec_op(chip))
>   		return;
>   
> +	/*
> +	 * For now, continuous reads can only be used with the core page helpers.
> +	 * This can be extended later.
> +	 */
> +	if (!(chip->ecc.read_page == nand_read_page_hwecc ||
> +	      chip->ecc.read_page == nand_read_page_syndrome ||
> +	      chip->ecc.read_page == nand_read_page_swecc))
> +		return;
> +
>   	rawnand_check_cont_read_support(chip);
>   }
>   

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
