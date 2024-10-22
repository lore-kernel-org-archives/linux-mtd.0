Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A2ED1715E
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2024 04:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/sfDDIYMNiQaZ4v3D976kCmt16cUzZEbelYcRIyO1ME=; b=25+D/ZcJ2rBYRE
	Da0xcuXV/Bk3jKpKqBuOn/RgZxi884fhLDW9yW5Z6pPxzSZ5rh06U6ochFa6k1sUwXyQgWrDAoQWu
	MqJQq2MuRWiSXU6tnpkg9s1+AaqeGcZQ9D8zy8GwvDPmPIU50XskCQOMg9ZmFno5bhzdOHCZl7N9O
	n+k7nxJ6+uKx/BYI7+KhfruRSR9M3DkqGPkFVjW3tFwgVRx9chN9vZXbxkXBbJ6o2QiTHlkE+sTXb
	SUUPghm7iotnr6ALDv7W8/BxYQU00mhjTo1pOmrLctWrsyQkG7j2d6Fs3UEPzJaDWbWeYinM5WIkj
	Yq5upUH4Z2n9+cXalmEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t36gx-00000009Zsq-2CCt;
	Tue, 22 Oct 2024 04:40:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t36gW-00000009ZoV-2MPB
	for linux-mtd@lists.infradead.org;
	Tue, 22 Oct 2024 04:39:58 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LF7vdw009626;
	Tue, 22 Oct 2024 04:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r6QzmzQaHek9p4OE1LFO1rZiLxLngWirJKOlqZoBv+Q=; b=OQQ4nnyB06FSfWL+
	aEuLCZLrBx2FhPl8wlnYNl05ErIqZKaDyxmyoB0KjwFFMBXws7Avu458bfvRr3ww
	Gco2i/PK+yfkjPQ5tf2pQCdG3uGpia3Njs12cb+sJK6VE96Q+Nc/wF7etchEHVJB
	hvbiTFltOMSkn7Cs7yWoLkDnCHTPm4z9HyCoDt7htLwZFJpjnGQQzsxTmoFG4We4
	gmFpXjqpEHCu41nlg4kmOzkUqh075h+2Ll1HMA+9ep/6GJtLooSirhhHkEw+P6Df
	fcVF57QgO8bjhM0zo1qRZDrkF/cs06V90sczMa2dNrGIVYxrx6y1h9IQlerC7ST3
	zWDa8A==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dkbt35xx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 04:39:50 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49M4dngR026627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 04:39:49 GMT
Received: from [10.151.37.94] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Oct
 2024 21:39:43 -0700
Message-ID: <4c239c07-799c-b910-c6e0-ff717202ceb0@quicinc.com>
Date: Tue, 22 Oct 2024 10:09:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v12 4/8] mtd: nand: Add qpic_common API file
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
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <41db541a-4de1-409b-bfec-7b9456fc200f@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: B7wAcqzBYy_1DaTih_1VAdrhkXLM0nYO
X-Proofpoint-GUID: B7wAcqzBYy_1DaTih_1VAdrhkXLM0nYO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 phishscore=0 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410220029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_213956_757166_FC0D99AD 
X-CRM114-Status: GOOD (  12.61  )
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



On 10/21/2024 11:49 PM, Jeff Johnson wrote:
> On 10/21/24 04:56, Md Sadre Alam wrote:
> ...
>> diff --git a/drivers/mtd/nand/qpic_common.c b/drivers/mtd/nand/qpic_common.c
>> new file mode 100644
>> index 000000000000..570ab59ca12b
>> --- /dev/null
>> +++ b/drivers/mtd/nand/qpic_common.c
>> @@ -0,0 +1,757 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> 
> I'm surprised you aren't adding a 2024 Qualcomm Innovation Center copyright
qpic_common.c file is derived from drivers/mtd/nand/raw/qcom_nandc.c file
so I am retaining the Copyright from the drivers/mtd/nand/raw/qcom_nandc.c file
> ...
>> +MODULE_LICENSE("GPL");
> 
> Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
> description is missing"), a module without a MODULE_DESCRIPTION() will
> result in a warning when built with make W=1. Recently, multiple
> developers have been eradicating these warnings treewide, and very few
> (if any) are left, so please don't introduce a new one :)
> 
> Please add the missing MODULE_DESCRIPTION()
Sorry I missed it. Will add in next revision.

> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
