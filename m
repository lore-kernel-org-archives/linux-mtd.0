Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B94BD149E7
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2024 19:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8hGDUGLjd/174yzyXpsqFpFDJxNdgwP4ejGC7WNNhz8=; b=4BcNi+Vkjru1pJ
	znN7ShlLtiaXp9iWX338TOZPymsx5LwBdrrfrGQP2bgZH8IuGUDXWUppG0QSHoEycKsTrEU2Xq4VT
	OkJHIudDkchu9Tx4pPPR5OSl0vQyp18cjWqv4yRH2Ez2qMszoN/GXb0eLwPNAb1TqEDKevtilgHF/
	bYuOdqBiEE+jFwd+y+NeuV1aI6jJLJd4hGLFJ+joE5x73MLaG6lo3UOaO36F9KC3iqxEh7uKstqmK
	FbMTpBQvMH6AWo5ERgBCPPXggRkknrUSk4PM2s6e6Fd8ZY44ByU3bqqRYjQlwL49Fg4jpbfhiZnHL
	yAuVeLi/HQZRF3LG0N+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4PkY-00000004uid-3AKV;
	Fri, 25 Oct 2024 19:13:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4P2b-00000004o52-3wai
	for linux-mtd@lists.infradead.org;
	Fri, 25 Oct 2024 18:28:07 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PAoKw8006951;
	Fri, 25 Oct 2024 18:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aeiIjuiCiGELOTopIbo//bFGGETMmV3/7Vt9PUQCGes=; b=ccnyI1/pESHfxTj4
	rE6uXuGv6QJh7vDzeWCAAWpgG4NwA9BM/xR1AHNbGYf/zgYVfZ4YWyameaCJsQak
	ZKsq8SldZDHOR7+D5lcZQD3nzxlfPNzukq7ShECkaB4XjrcNIhcmqh+YrXlR4B90
	okW/dvrE0yHVySq7Snza/XR+GdnzwaoqZN5FOFuXK/KgqjYMqXYohXSH+BKpwkY5
	JFsrmpFl8y7WXzG6OwPxOHqpgZnAeGhMWzX89dxBHdtV6SrLtVHJEfxmcuv4rdel
	WaZOdwL6mAb8aA1v6nklThvvuO6SUChjmd7HP64mlT6Nf9vdJC7YLUxJViRQ2TUr
	kqftHQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42g9x6hdgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 18:27:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PIRmIl000467
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 18:27:48 GMT
Received: from [10.48.242.80] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 11:27:47 -0700
Message-ID: <dcdd870b-c4b8-4bb8-9c08-82474cc4d872@quicinc.com>
Date: Fri, 25 Oct 2024 11:27:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 4/8] mtd: nand: Add qpic_common API file
To: Md Sadre Alam <quic_mdalam@quicinc.com>, <broonie@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20241021115620.1616617-1-quic_mdalam@quicinc.com>
 <20241021115620.1616617-5-quic_mdalam@quicinc.com>
 <41db541a-4de1-409b-bfec-7b9456fc200f@quicinc.com>
 <4c239c07-799c-b910-c6e0-ff717202ceb0@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <4c239c07-799c-b910-c6e0-ff717202ceb0@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5w8o4jkyHpExRaVzhFBXGbmxhFScf2MC
X-Proofpoint-ORIG-GUID: 5w8o4jkyHpExRaVzhFBXGbmxhFScf2MC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1015 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=885 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_112806_137913_13E8133A 
X-CRM114-Status: GOOD (  11.34  )
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

On 10/21/2024 9:39 PM, Md Sadre Alam wrote:
> 
> 
> On 10/21/2024 11:49 PM, Jeff Johnson wrote:
>> On 10/21/24 04:56, Md Sadre Alam wrote:
>> ...
>>> diff --git a/drivers/mtd/nand/qpic_common.c b/drivers/mtd/nand/qpic_common.c
>>> new file mode 100644
>>> index 000000000000..570ab59ca12b
>>> --- /dev/null
>>> +++ b/drivers/mtd/nand/qpic_common.c
>>> @@ -0,0 +1,757 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2016, The Linux Foundation. All rights reserved.
>>
>> I'm surprised you aren't adding a 2024 Qualcomm Innovation Center copyright
> qpic_common.c file is derived from drivers/mtd/nand/raw/qcom_nandc.c file
> so I am retaining the Copyright from the drivers/mtd/nand/raw/qcom_nandc.c file

If you have a derived file then you should retain the copyright of the
original but then also add current copyright for all changes made on top of
the original file.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
