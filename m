Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F44C32774
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Aug 2022 07:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uGDscGmwUNz6TY9Qc1XYBuo/S8iQpiqOwFgSFiUeWCg=; b=jN5CltV38CFMRL
	FATPDAUAyfeZ8mPAMOPwGk7ifC9Hs3sbQ18YwzY1Q7gR6PBGwxQCp/8zw8wkhszbBdn5gbTh5UJ1I
	ow7zcTGV7dGzEaH5SAMUGFGBjNW2gSpnaExxBCNs5gNtMNzFsk9vGm7QNR2hiSTP7NecbzgAm5bFK
	ipmyLnt7fdk2MZA4zm4HjVeYh06y2MIKSvKIM2+CWNyuUABvX38d06EsQCwgkaZFRxI39m8hLvXB0
	r7i7RUzbR2iS6fl1gcvMqfdiY9dahvLBqGJVwT99pha/NFPrdntdZhYgFjLJXe8hX11sSP97Cr/hM
	f+0fe9vurEXK6IqiWRVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQOgS-003cfU-5H; Tue, 23 Aug 2022 07:50:48 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQOfX-003byi-72; Tue, 23 Aug 2022 07:49:54 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27N7I4IW032328;
	Tue, 23 Aug 2022 09:49:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=dr9XcxuypM8CL3EgCI4gKBX4+hvBoN2grFdSFcg0Hc8=;
 b=PP2RvDxXg1E7cuT/as4rWMupNinszVZTq1+A5sqWRPPm+AOPbpFWySEbvbMdIL2MEGuL
 J8XLBM8IdjEOvcETVvEBfq9xSg7ShhcK3DubnkeQYm4jxJJT/I2UNtw6s0UN5zNpc3Mn
 Ad9UTeXzXa7xLTpeXONcQYOrsi4cHgJwzO767JiYvbQS0AfCXKOCMbNxd7X1te7Jhc3E
 JR10PxchjM/HeC5vPtgQ1Bqoaxn948wrzFwPLFE9pWEc0Yybr0f7UvkUZhkUSgTcqciD
 Dpkm0jFgRAyUVuxhI8H/F/o5u7yU2Qg44/aVfd0PbPB2JckAtXxmUPdsNFraSSycWb2y 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j2w2pvm9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Aug 2022 09:49:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 65B2C100034;
	Tue, 23 Aug 2022 09:49:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5729C216ED1;
	Tue, 23 Aug 2022 09:49:39 +0200 (CEST)
Received: from [10.48.0.175] (10.75.127.45) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 23 Aug
 2022 09:49:38 +0200
Message-ID: <3efb5636-1f20-fbc9-8f0f-0047d0165a96@foss.st.com>
Date: Tue, 23 Aug 2022 09:49:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 04/19] mtd: rawnand: stm32_fmc2: Fix dma_map_sg error
 check
Content-Language: en-US
To: Jack Wang <jinpu.wang@ionos.com>, <linux-kernel@vger.kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger
	<richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Cai Huoqing <cai.huoqing@linux.dev>, <linux-mtd@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20220819060801.10443-1-jinpu.wang@ionos.com>
 <20220819060801.10443-5-jinpu.wang@ionos.com>
From: Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <20220819060801.10443-5-jinpu.wang@ionos.com>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_03,2022-08-22_02,2022-06-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_004951_807364_7D8FA241 
X-CRM114-Status: GOOD (  17.97  )
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

Hi Jack,

On 8/19/22 08:07, Jack Wang wrote:
> dma_map_sg return 0 on error, in case of error return -EIO.
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Christophe Kerello <christophe.kerello@foss.st.com>
> Cc: Cai Huoqing <cai.huoqing@linux.dev>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
> ---
>   drivers/mtd/nand/raw/stm32_fmc2_nand.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> index 87c1c7dd97eb..a0c825af19fa 100644
> --- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> +++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> @@ -862,8 +862,8 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
>   
>   	ret = dma_map_sg(nfc->dev, nfc->dma_data_sg.sgl,
>   			 eccsteps, dma_data_dir);
> -	if (ret < 0)
> -		return ret;
> +	if (!ret)
> +		return -EIO;
>   
>   	desc_data = dmaengine_prep_slave_sg(dma_ch, nfc->dma_data_sg.sgl,
>   					    eccsteps, dma_transfer_dir,
> @@ -893,8 +893,10 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
>   
>   		ret = dma_map_sg(nfc->dev, nfc->dma_ecc_sg.sgl,
>   				 eccsteps, dma_data_dir);
> -		if (ret < 0)
> +		if (!ret) {
> +			ret = -EIO;
>   			goto err_unmap_data;
> +		}
>   
>   		desc_ecc = dmaengine_prep_slave_sg(nfc->dma_ecc_ch,
>   						   nfc->dma_ecc_sg.sgl,

Reviewed-by: Christophe Kerello <christophe.kerello@foss.st.com>

Regards,
Christophe Kerello.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
