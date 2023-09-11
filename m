Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B133AEE7FF4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Sep 2023 12:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mZjEf48XEQz08X6AgSTB1lFYUSiH0T4fzbogZ8jLIV0=; b=HAwBjIDUm8XnjQ
	ZKGobS8rfc20h/y0DunwBPumOeJUaZZC+4joj6YPiHcCE/9SHbqwLaCyNB8ozbdY/dyDW0GzesYKg
	AvWaoxFWsoAuc0nfZfDuWGn5k37mcs0V4DLeL54u/bnt16Fqyi9bKh5sJZR51fm0HbW4iWBxAN3NB
	SRlD4Kro83AyoYAFFiJB37ohbuOo0SHhYIAZLef24MO+hQRubr5b8c1MPdU375/4lhH4Eak5RFuyM
	JdOh284GLsbkJAyZVhXvoZq2c3F5Y3ZWpQfqRqz8WecGgpoKk4QWCPIV46x8qPnrWVuT8UOHDClgs
	uj/OyxQegQNzD+OO0LBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfgJa-000VlC-0c;
	Mon, 11 Sep 2023 12:46:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfgJV-000Vki-2u
	for linux-mtd@lists.infradead.org;
	Mon, 11 Sep 2023 12:46:51 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38B9AHUG027134;
	Mon, 11 Sep 2023 12:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=F2GqWFAwwo6RJV4S/9uYLYRwfMTagSoppG6D6MLjYww=;
 b=ZfCKNloy/JB5eSY+bMKm0AlzOxyDu7aecCh3pbc+SLooIKHqUQXJywgXDdeuX2iXfngi
 FyUQMJQm2wiTpavDYhmsajlCY+NYUh5ZjsHyxFu8mbImuybR9RUvyYwEiJ1DWDCX9GEX
 UEraAOqxgy7nNIVJxFA8LSyP8aOVOrz57wLMMoMvDeTGbJoIapf9U04qzA92fqfQmFoL
 Dm+XL5XHPsUQbUFdS29/wMpaAVyRlzt/11xgqpVRv4jEeabbNSsLo1BarsVtQlN/fGxE
 uNIAiCOtAmTei22mr4MJHoByO345hq8eK1c07C+ozos1ccK0HbmzXM4IjhYGRlQhhlg/ HQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t0h3ducse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 12:46:34 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38BCkXw5014435
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 12:46:33 GMT
Received: from [10.214.66.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 11 Sep
 2023 05:46:28 -0700
Message-ID: <7a69b1e7-7b08-433b-b201-f36ce93c7761@quicinc.com>
Date: Mon, 11 Sep 2023 18:16:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: nand: qcom: Fix the node for nand unmap resource
Content-Language: en-US
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_charante@quicinc.com>, <quic_kaushalk@quicinc.com>
References: <20230907092854.11408-1-quic_bibekkum@quicinc.com>
 <20230909060327.GA5847@thinkpad>
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <20230909060327.GA5847@thinkpad>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8meB8A5DaHBM3mmj4I2wkeBP_UI2314i
X-Proofpoint-ORIG-GUID: 8meB8A5DaHBM3mmj4I2wkeBP_UI2314i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 phishscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309110115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_054650_092769_773AD35B 
X-CRM114-Status: GOOD (  21.04  )
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



On 9/9/2023 11:33 AM, Manivannan Sadhasivam wrote:
> On Thu, Sep 07, 2023 at 02:58:54PM +0530, Bibek Kumar Patro wrote:
>> While unmapping the nand resource in case of err_core_clk
>> the dev node being passed is res_start instead of nand->dma_base
>> (where the iova returned from map operation is stored) causing
>> failure in unmap operation. Hence modifying the unmap operation
>> to pass the nand->base_dma instead of res_start.
>>
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
> 
> This error indicates that you are sending the patch against downstream tree.
> That's not appropriate. Please send your patches against mainline/mtd-next
> instead and also validate properly.
> 
> - Mani

This patch is created against upstream tree only,
These debug prints got added from a conflicting patch
created for debugging.
apologies for this mistake. Will revise this and send
a new patch set.

regards,
Bibek


> 
>>   	return ret;
>> -- 
>> 2.17.1
>>
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
