Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88C8D5B870
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2024 04:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PbynONAHuc35m/u8SOrsFgECl50Ac5KACocsLHZXwKw=; b=N8eZLN7Dlohj5z
	//1EBMDW28RVrdiQHhQS2XceQKOfxOxQ1YVOP8fiYrn9a9BKCPt6F1EiSpBuo7LgXdS7flSX0h5JX
	3qdInv/FCT+PCqrqC0qtltMfhpVhU2QT0fvnRoBo2qc8dPRmwM3u1GpsWdv9v7iepKc598isFgJNt
	C1hnMFU+3q7CgoTVR0YFwayUEFMQgcvO3su34dSuV824AIZ9vwvzFDbz1/Bsr9UOqNntVmybv1t0e
	qir+vAPm9W5e703nDQFdgVZqPKAXYK9K4arL+DD2LY+1LU+u9YBYNGQDQVZauVPO+Se/6m4s8oW99
	qH/yoyaH5TR+dH5V0XCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5df0-0000000DAEt-3sRk;
	Tue, 29 Oct 2024 04:16:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5dey-0000000DAEP-00CS
	for linux-mtd@lists.infradead.org;
	Tue, 29 Oct 2024 04:16:49 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SIFADo010194;
	Tue, 29 Oct 2024 04:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kWAg+RtxfDkBXJrBxaZJA2nuf2JO7cnYiwXzb8lU/Lo=; b=ZVJCnqAER0rYPNNU
	MYJRyl8RPHbsjfwhxJntLx95blYm9x3o7RNqrIVPJXCUIpT/p9mv/7tVmmslP39I
	2BbE+NMHSnD5vLMPDflXW2yCfnRmA6QmB7ERrVdBF6AHj7+Rn0WPiEN1ssUr3Z+o
	cOJuF1UU4tKeCzpbaXWPQkX/6o00DnkUf0d7QcmX6AMslS6oQLQCZyu3PCv+Xicj
	fLrD1L1jBaH9phM64B2wP0kRgqd3uAQtWeFPVoivFO2J6ndyYfS8WPfu9mJjOO1s
	0Y3ibwDzdQQ0DH9SdUeYhzJv0PmXuo8TsGTdpe2I/T2thQLOUeLThrOmZg9083mK
	STSvEg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gsq8f52y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 04:16:41 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49T4Gf2P006827
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 04:16:41 GMT
Received: from [10.151.37.94] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Oct
 2024 21:16:36 -0700
Message-ID: <f56d0181-2796-e185-f2b4-c9cea8bf8daf@quicinc.com>
Date: Tue, 29 Oct 2024 09:46:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v12 4/8] mtd: nand: Add qpic_common API file
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <broonie@kernel.org>,
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
 <dcdd870b-c4b8-4bb8-9c08-82474cc4d872@quicinc.com>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <dcdd870b-c4b8-4bb8-9c08-82474cc4d872@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VkcB9iZLWmYReGgSOPJeTo8msJPCaB6V
X-Proofpoint-ORIG-GUID: VkcB9iZLWmYReGgSOPJeTo8msJPCaB6V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=925 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410290031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_211648_079136_A1A6FA44 
X-CRM114-Status: GOOD (  11.88  )
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



On 10/25/2024 11:57 PM, Jeff Johnson wrote:
> On 10/21/2024 9:39 PM, Md Sadre Alam wrote:
>>
>>
>> On 10/21/2024 11:49 PM, Jeff Johnson wrote:
>>> On 10/21/24 04:56, Md Sadre Alam wrote:
>>> ...
>>>> diff --git a/drivers/mtd/nand/qpic_common.c b/drivers/mtd/nand/qpic_common.c
>>>> new file mode 100644
>>>> index 000000000000..570ab59ca12b
>>>> --- /dev/null
>>>> +++ b/drivers/mtd/nand/qpic_common.c
>>>> @@ -0,0 +1,757 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/*
>>>> + * Copyright (c) 2016, The Linux Foundation. All rights reserved.
>>>
>>> I'm surprised you aren't adding a 2024 Qualcomm Innovation Center copyright
>> qpic_common.c file is derived from drivers/mtd/nand/raw/qcom_nandc.c file
>> so I am retaining the Copyright from the drivers/mtd/nand/raw/qcom_nandc.c file
> 
> If you have a derived file then you should retain the copyright of the
> original but then also add current copyright for all changes made on top of
> the original file.
Ok, will update in next revision.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
