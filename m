Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F22EE7FF4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Sep 2023 13:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zzy3Tq95IzNVy8NdMoLWpkRxEpySVkrxJeFxMManHI0=; b=haQ+XnRKcLRa7r
	lrOnXSOj4YFk7h4SUeYyqjwHOVS8azppYWuEidT+X9R+QDwJpl0Mj0rt4jzqvBY/BqkJ4fqGwNfP1
	y2NoMIP+0Ykh10sjT6jWVH3I8JV7vR4Z1VtFywdcplqPk45iAKLAHlUO2orpud7r1DUXeBFz0Ga2C
	j+eUA06yOzJ1fjjegMGvYopIJ/ggIRWVgZ7ZWgBPptrF1Oven/MPhh+/lE2MJsxdTZwxb0cjfr1GR
	vzbjF07unjkleUwse+Dlqzv+qU3EREOgPO6NmcuObYZCl1aFiH8wsLQaSMrbaEbJ1dzjJ8OapeDsa
	jgP2hFfOpp+y7cRt1s/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfh6V-000cx5-1x;
	Mon, 11 Sep 2023 13:37:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfh6R-000cve-2s
	for linux-mtd@lists.infradead.org;
	Mon, 11 Sep 2023 13:37:26 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38BCf6YN025012;
	Mon, 11 Sep 2023 13:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0ZAOzvzcnnrWBY56bWyJmhc0ZocE2Bz0yU2CRh/7UFs=;
 b=iOMlEeiaksM1iswP2gpGWwvLxKfgMj4c0zlzTk8aJSAdVQDMzITWIgwIaO55bt/CT/wE
 dO9mSTU2uYID7nvOgj/xlv58Ay878Pr5ILLw2X0vvxKWlOS+6K+QLeUM1z193H8HMWj1
 iF11abKgFKaU1enyEw4nOOj920epQC7/IP7TduTu5RNoBfuCdAsrz3o3KoYbGInx6bep
 XxNFr+uCMKVeCbBWpozMEkh6hxCvTR8/saW10mb9/KYcGZXnqL94B8hx71v952HCxk/t
 xOZSOe9Sj4sg/8XQuGidpjZ7lgH5iQug1xDQQxZhSMWDmymJm4hMlxPf2bYfNu47r+1y Wg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t0edmm0fy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 13:37:13 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38BDbCvm006526
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 13:37:13 GMT
Received: from [10.214.66.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 11 Sep
 2023 06:37:07 -0700
Message-ID: <8cdf46d5-62a9-40da-8db4-e888bfd5c8f3@quicinc.com>
Date: Mon, 11 Sep 2023 19:07:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: nand: qcom: Fix the node for nand unmap resource
Content-Language: en-US
To: Pavan Kondeti <quic_pkondeti@quicinc.com>
CC: <mani@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, <quic_charante@quicinc.com>,
        <quic_kaushalk@quicinc.com>
References: <20230907092854.11408-1-quic_bibekkum@quicinc.com>
 <ff77c3ce-d635-4501-8348-5b7adff9a16c@quicinc.com>
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <ff77c3ce-d635-4501-8348-5b7adff9a16c@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ygLYICXV_QF33gQOr2W_9RXe6s5BaYhw
X-Proofpoint-GUID: ygLYICXV_QF33gQOr2W_9RXe6s5BaYhw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_08,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309110124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_063724_045992_EB893607 
X-CRM114-Status: GOOD (  24.57  )
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



On 9/8/2023 3:52 PM, Pavan Kondeti wrote:
> On Thu, Sep 07, 2023 at 02:58:54PM +0530, Bibek Kumar Patro wrote:
>> While unmapping the nand resource in case of err_core_clk
>> the dev node being passed is res_start instead of nand->dma_base
> 
> It is not not dev not but addr argument.
> 
>> (where the iova returned from map operation is stored) causing
>> failure in unmap operation. Hence modifying the unmap operation
>> to pass the nand->base_dma instead of res_start.
>>
> 
> Pls simplify this commit description. I think, it was a simple copy/paste
> mistake. I would write
> 
> "Fix addr argument to dma_unmap_resource() in the error path of probe.
> The addr argument should be dma address not physical address."
> 

Thanks for this suggestion Pavan, this looks simplified and easier to
understand the bug. Incorporated this in next revision.

>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>> ---
>>   drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
>> index f583022755a2..e085a0f588eb 100644
>> --- a/drivers/mtd/nand/raw/qcom_nandc.c
>> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
>> @@ -3322,7 +3322,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
>>   err_aon_clk:
>>   	clk_disable_unprepare(nandc->core_clk);
>>   err_core_clk:
>> -	dma_unmap_resource(dev, res->start, resource_size(res),
>> +	dma_unmap_resource(dev, nandc->base_dma, resource_size(res),
>>   			   DMA_BIDIRECTIONAL, 0);
>>   	dev_err(&pdev->dev, "DEBUG: probe failed for nandc module\n");
>>   	return ret;
> 
> Since you are fixing a bug introduced by a previous commit, you should
> add Fixes tag like below. Refer to Documentation [1].
> 
> Fixes: 7330fc505af4 ("mtd: rawnand: qcom: stop using phys_to_dma()")
> 
> [1] https://docs.kernel.org/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes

Thanks very much for the inputs, addressed this in next revision.

Thanks & regards,
Bibek

> 
> Thanks,
> Pavan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
