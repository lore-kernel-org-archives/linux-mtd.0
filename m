Return-Path: <SRS0=cUeG=NX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 219FEC432BE
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 16:00:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C176E61090
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 16:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C176E61090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYT2j2RzvJi63r7xtPXD1F0Cb3WnVbTd5UUn1pXwmPQ=; b=EHSnrdbSTcrfDuwxbLkg+CXrrD
	AlisvLMJlyybrF2OAgj8IEyGgSzt4nztRBfSCU8VJBpkOYoCkTHEtReHr6WUjBdlZhdonj5UoVU2z
	4rB4RdSlYy+pv/bU8ojRu1jieDPDsNExIkHsNAZ4VdkIzqCNB60XHbYypCFfMVzQM5kzrOZ49FtQ1
	gHihakjiwmrOHNqzagfszI59/CVo8DWRFaeNOnCHjO19aOYEMFsAV8M5j2eAG1Ifq1EwcZnaOHmOA
	AV2F3QlKLv88vFr4zgXccGe0ri4qyawpEkIh5cYeXB2PzLuUOaixiSkKRWBj8nbCmSfMpl62X19Jt
	hxvy4BIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLSe6-006RWf-Ol; Wed, 01 Sep 2021 15:59:26 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLSe0-006RVQ-VR; Wed, 01 Sep 2021 15:59:25 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 181Bx9Fe031964;
 Wed, 1 Sep 2021 17:58:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=dmswWeHE+9B8VOaL4IRd+83Q+HDkWTJFmrdLfyJESVU=;
 b=DvW5y29/oN0th7WqLDaVx5i0HPhr/ECi/nufq7qTY6+AkF2Wnj/kjuvutQOsvQnYz2Dw
 6V53UdwqbFX/3Tr8Pa4I7UYtRnP07FpcvBk+Nvnjw55Qj1xqwb9T8fhege24Ct8iknj+
 p4+OjexJP6yzIuJiFDPiqBOMomOefKvZehwH0gn6tgtoHuyyNLljTvu54Rj0o0t165Ye
 X4hRaLucplUAG+IQ+ZAQGDM9ghBMdLoRHrezxaOPDwc611HiL36VS4qcRWMRMoEIzpWA
 p3BrjzVvQlptS2d1U7sHDfBTMlldXCdVQDzxhDg0ZyTiLufNPtOpd3iC71d+Hg0KNfwJ Kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3at5y939y9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 17:58:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0735D10002A;
 Wed,  1 Sep 2021 17:58:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A7E5B231DC7;
 Wed,  1 Sep 2021 17:58:37 +0200 (CEST)
Received: from lmecxl1094.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 1 Sep
 2021 17:58:36 +0200
Subject: Re: [Linux-stm32] [PATCH] mtd: rawnand: stm32_fmc2: Make use of the
 helper function devm_platform_ioremap_resource()
To: Cai Huoqing <caihuoqing@baidu.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
References: <20210901074222.9433-1-caihuoqing@baidu.com>
From: Christophe Kerello <christophe.kerello@foss.st.com>
Message-ID: <a69d1484-fb7a-6da5-3d46-48c49b612d2a@foss.st.com>
Date: Wed, 1 Sep 2021 17:58:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901074222.9433-1-caihuoqing@baidu.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-01_05,2021-09-01_01,2020-04-07_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_085921_527443_6815AD65 
X-CRM114-Status: GOOD (  21.38  )
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



On 9/1/21 9:42 AM, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>   drivers/mtd/nand/raw/stm32_fmc2_nand.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> index 1c277fbb91f2..97b4e02e43e4 100644
> --- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> +++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> @@ -1899,15 +1899,11 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
>   
>   		nfc->data_phys_addr[chip_cs] = res->start;
>   
> -		res = platform_get_resource(pdev, IORESOURCE_MEM,
> -					    mem_region + 1);
> -		nfc->cmd_base[chip_cs] = devm_ioremap_resource(dev, res);
> +		nfc->cmd_base[chip_cs] = devm_platform_ioremap_resource(pdev, mem_region + 1);
>   		if (IS_ERR(nfc->cmd_base[chip_cs]))
>   			return PTR_ERR(nfc->cmd_base[chip_cs]);
>   
> -		res = platform_get_resource(pdev, IORESOURCE_MEM,
> -					    mem_region + 2);
> -		nfc->addr_base[chip_cs] = devm_ioremap_resource(dev, res);
> +		nfc->addr_base[chip_cs] = devm_platform_ioremap_resource(pdev, mem_region + 2);
>   		if (IS_ERR(nfc->addr_base[chip_cs]))
>   			return PTR_ERR(nfc->addr_base[chip_cs]);
>   	}
> 

Reviewed-by: Christophe Kerello <christophe.kerello@foss.st.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
