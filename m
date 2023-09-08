Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CDAEE57EF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 10:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+JW44N9egUGZTZ1nvg65knNQHA/7v7+0dVtyhmpvhmA=; b=1iLUDzYH1aMfyD
	wWNUY1dL/3W8egf+DtxZ1sxJhfKVggr/Czu1SxTvxt/5p71k1kNmoxqkxRnyCYyYP6pKiz6GSS0EH
	zBsT0OWgPDBzm5AMmoJqjIsvV3tWlJ0n2YVNeHLpW4TeXTVrvTtGgWmCuBD8+iO8qeSWH5d89dvaX
	fcis7uDy8LyB9/QAdC2C08hK16v3c9M6uTEw4wovpwCaS2sqlIZQmAX+zF6ARTO3mby6FxHWWuTZy
	b+RLui4dpD8YxPHnfza7YxmmNSBWyaHmQXtLJ+bWrdAIaM8DLIeN4jQ78uC1hFKKXjpZb37Z/FYvT
	i+GX95bGEPBsdqfhFggw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYdg-00DXWS-29;
	Fri, 08 Sep 2023 10:23:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYdd-00DXRU-0L
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:22:58 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3889kc3U027822;
	Fri, 8 Sep 2023 10:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=9nZFEAV0AeHreRBRxKAyau56XXjNe94bEf0a+siu2Bk=;
 b=WGpGfZwZupSgW4T17hiV2WY0vpVOB9JZMXb96PQMhHr57qryniaIV4QpsvWhdRXVIpM1
 bKpKkNcxVOGosRxG05LpUTsWLM2WYYmu0p1qKiKw/dVF0unxJmoJfmAuy6zJp7udta5p
 hIJsklH0fQbwUOYsSP4lodguCy4VpXJMpayohxeX7Oiksm6prDIvby/mZPMLgESM0au3
 nUEsOWOlYm+IuScRyv2dKBboUHjscggjx5kluuOMfNsFLaiyWpheVfG5Lwy9ENYAGmiJ
 puEtS2MQrNqnmt3o+zkDsQJacujKkGZvA+xSSHhHUJasAeAU+4hA/q+7brEV1w91c49Y Kw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3syfj2jb3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 10:22:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 388AMlh8003373
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Sep 2023 10:22:47 GMT
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 8 Sep 2023 03:22:42 -0700
Date: Fri, 8 Sep 2023 15:52:39 +0530
From: Pavan Kondeti <quic_pkondeti@quicinc.com>
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
CC: <mani@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, <quic_charante@quicinc.com>,
        <quic_kaushalk@quicinc.com>
Subject: Re: [PATCH] mtd: nand: qcom: Fix the node for nand unmap resource
Message-ID: <ff77c3ce-d635-4501-8348-5b7adff9a16c@quicinc.com>
References: <20230907092854.11408-1-quic_bibekkum@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230907092854.11408-1-quic_bibekkum@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DYbq0Ijztn-nkGYiY9lrL4ApwxS6FMud
X-Proofpoint-GUID: DYbq0Ijztn-nkGYiY9lrL4ApwxS6FMud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_07,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1011 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309080095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_032257_155089_97A7C67A 
X-CRM114-Status: GOOD (  20.91  )
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

On Thu, Sep 07, 2023 at 02:58:54PM +0530, Bibek Kumar Patro wrote:
> While unmapping the nand resource in case of err_core_clk
> the dev node being passed is res_start instead of nand->dma_base

It is not not dev not but addr argument.

> (where the iova returned from map operation is stored) causing
> failure in unmap operation. Hence modifying the unmap operation
> to pass the nand->base_dma instead of res_start.
> 

Pls simplify this commit description. I think, it was a simple copy/paste
mistake. I would write

"Fix addr argument to dma_unmap_resource() in the error path of probe.
The addr argument should be dma address not physical address."

> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index f583022755a2..e085a0f588eb 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -3322,7 +3322,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
>  err_aon_clk:
>  	clk_disable_unprepare(nandc->core_clk);
>  err_core_clk:
> -	dma_unmap_resource(dev, res->start, resource_size(res),
> +	dma_unmap_resource(dev, nandc->base_dma, resource_size(res),
>  			   DMA_BIDIRECTIONAL, 0);
>  	dev_err(&pdev->dev, "DEBUG: probe failed for nandc module\n");
>  	return ret;

Since you are fixing a bug introduced by a previous commit, you should
add Fixes tag like below. Refer to Documentation [1].

Fixes: 7330fc505af4 ("mtd: rawnand: qcom: stop using phys_to_dma()")

[1] https://docs.kernel.org/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes

Thanks,
Pavan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
