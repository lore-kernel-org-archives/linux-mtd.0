Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3550CC48BC3
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Feb 2024 10:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8GQ6rSEis9fSR8jO5O/U5gV4wR4vbEwEe1AAAhH+bIU=; b=HLMmkfxIN8ydPG
	s2CjNjJzTxOvDRPFyFtHBzE8JY8PRuUyJ5iI8TVr3IboOdf3JbjFyDak/C5nrwyPuSBVQQg9+6Dxz
	oAIOQEDOhocXgSbx6OntvXkvZfeE9O1btDEny+GChr/rUUTlpRQM1Jgue5KmJ4qngbEmDbbt6nD0s
	sRpfW9D05W6ALMtxz5QLke0oq7WhfhYjIyfCBiyVFpgzZlJ5c1xJBZXYzxL4He2RWlk8o7tXEEJNW
	2uUgr+0ZtWTqj6DbmSxHsA45KyDFaW3nnX857VYJacliigE6PEBUv8yA/nJPSNX/1zdlJGVC2Ca4G
	H5a/XPx35R8m/eYG68bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rck03-00000000XjY-278d;
	Wed, 21 Feb 2024 10:38:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rck00-00000000XiZ-3aw1
	for linux-mtd@lists.infradead.org;
	Wed, 21 Feb 2024 10:38:50 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41L4KGUU022184;
	Wed, 21 Feb 2024 10:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=eQgXE2HnmbPldfjmzZ6CFMqQA6IzURGK0LKsk3Uwytk=; b=oC
	JEdybuG4yDwR8lC0k0V9/xCaW7eXwbUpjaKNGjcsEX2EtaAd1W04EKaW7jORpOg2
	5fHfokyeh1egbqECKsNdXtvEdUYV9/Ib0Cocl71MRwXOKw9AhOiLzTaPveO91Vf4
	VyJ+978Hy6ADgVMzaOpGV4BYZhszozcnU7h+7RvNWopFDnE+/AVFM1zpuipv1I1B
	BNCu4amNUWq6Glpm2yJiw71HXe2GovPXLM6Rk4LfMr7VBneZyuENUOr9YL4sSTZP
	S0bEO7Ue6NtygCBq2RZYKoGj5QAPtWpu6E5I0Zr0f9/UhHsg+TZXfrgSBzF1izPz
	wogjVPkp/wZmRRoIHC1Q==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wd22rhnrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 10:38:40 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41LAcd7P030110
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 10:38:39 GMT
Received: from [10.216.62.93] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 21 Feb
 2024 02:38:33 -0800
Message-ID: <6035a0d2-f784-c55d-acd5-aa3ffc470246@quicinc.com>
Date: Wed, 21 Feb 2024 16:08:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/5] drivers: mtd: nand: Add qpic_common API file
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <broonie@kernel.org>,
        <robh@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>, <manivannan.sadhasivam@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <quic_srichara@quicinc.com>,
        <quic_varada@quicinc.com>
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
 <20240215134856.1313239-3-quic_mdalam@quicinc.com>
 <CAA8EJpquDwDg+OrZKeJrTWEtokCF7uyHMyzCFK2etSsDip8_6Q@mail.gmail.com>
 <c574c9ab-0a47-2dc8-9ddd-c08f1b770d7e@quicinc.com>
 <CAA8EJprkwv0QstJTveM+06DbMjgBCEVBRhBb5i2QM6LxmmCQug@mail.gmail.com>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <CAA8EJprkwv0QstJTveM+06DbMjgBCEVBRhBb5i2QM6LxmmCQug@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PW6hze-lDCO-9iz0EAnxMZPpRzq_s9t4
X-Proofpoint-GUID: PW6hze-lDCO-9iz0EAnxMZPpRzq_s9t4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=900 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402210082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_023849_070973_47384C20 
X-CRM114-Status: GOOD (  21.99  )
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



On 2/20/2024 9:37 PM, Dmitry Baryshkov wrote:
> On Tue, 20 Feb 2024 at 17:59, Md Sadre Alam <quic_mdalam@quicinc.com> wrote:
>>
>>
>>
>> On 2/15/2024 8:30 PM, Dmitry Baryshkov wrote:
>>> On Thu, 15 Feb 2024 at 15:53, Md Sadre Alam <quic_mdalam@quicinc.com> wrote:
>>>>
>>>> Add qpic_common.c file which hold all the common
>>>> qpic APIs which will be used by both qpic raw nand
>>>> driver and qpic spi nand driver.
>>>>
>>>> Co-developed-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>>> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>>>> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>>>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>>>> ---
>>>>    drivers/mtd/nand/Makefile            |    1 +
>>>>    drivers/mtd/nand/qpic_common.c       |  786 +++++++++++++++++
>>>>    drivers/mtd/nand/raw/qcom_nandc.c    | 1226 +-------------------------
>>>>    include/linux/mtd/nand-qpic-common.h |  488 ++++++++++
>>>>    4 files changed, 1291 insertions(+), 1210 deletions(-)
>>>>    create mode 100644 drivers/mtd/nand/qpic_common.c
>>>>    create mode 100644 include/linux/mtd/nand-qpic-common.h
>>>>
>>>> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
>>>> index 19e1291ac4d5..131707a41293 100644
>>>> --- a/drivers/mtd/nand/Makefile
>>>> +++ b/drivers/mtd/nand/Makefile
>>>> @@ -12,3 +12,4 @@ nandcore-$(CONFIG_MTD_NAND_ECC) += ecc.o
>>>>    nandcore-$(CONFIG_MTD_NAND_ECC_SW_HAMMING) += ecc-sw-hamming.o
>>>>    nandcore-$(CONFIG_MTD_NAND_ECC_SW_BCH) += ecc-sw-bch.o
>>>>    nandcore-$(CONFIG_MTD_NAND_ECC_MXIC) += ecc-mxic.o
>>>> +obj-y += qpic_common.o
>>>> diff --git a/drivers/mtd/nand/qpic_common.c b/drivers/mtd/nand/qpic_common.c
>>>> new file mode 100644
>>>> index 000000000000..4d74ba888028
>>>> --- /dev/null
>>>> +++ b/drivers/mtd/nand/qpic_common.c
>>>> @@ -0,0 +1,786 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * QPIC Controller common API file.
>>>> + * Copyright (C) 2023  Qualcomm Inc.
>>>> + * Authors:    Md sadre Alam           <quic_mdalam@quicinc.com>
>>>> + *             Sricharan R             <quic_srichara@quicinc.com>
>>>> + *             Varadarajan Narayanan   <quic_varada@quicinc.com>
>>>
>>> This is a bit of an exaggeration. You are moving code, not writing new
>>> code. Please retain the existing copyrights for the moved code.
>> Ok
>>>
>>>> + *
>>>> + */
>>>> +
>>>> +#include <linux/mtd/nand-qpic-common.h>
>>>> +
>>>> +struct qcom_nand_controller *
>>>> +get_qcom_nand_controller(struct nand_chip *chip)
>>>> +{
>>>> +       return container_of(chip->controller, struct qcom_nand_controller,
>>>> +                           controller);
>>>> +}
>>>> +EXPORT_SYMBOL(get_qcom_nand_controller);
>>>
>>> NAK for adding functions to the global export namespace without a
>>> proper driver-specific prefix.
>> Ok, will fix in next patch
>>>
>>> Also, a bunch of the code here seems not so well thought. It was fine
>>> for an internal interface, but it doesn't look so good as a common
>>> wrapper. Please consider defining a sensible common code module
>>> interface instead.
>>
>>    QPIC controller will support both raw NAND as well Serial nand interface.
>>    This common API file was the part of raw NAND driver , since for serial
>>    nand most of the APIs from raw nand driver will be re-used that's why i
>>    have created this common API file, so that QPIC serial nand driver
>>    drivers/spi/spi-qpic-snand.c and QPIC raw NAND driver
>>    drivers/mtd/nand/raw/qcom_nandc.c can used these common APIs.
>>
>>    Could you please suggest how I should handle this in batter way.
> 
> Yes. Start by designing common accessor functions that form a
> sufficient and complete API to access the hardware functionality. A
> set of functions blindly moved from the existing driver usually do not
> make such an API, because usually nobody cares enough about the driver
> internals. It should be something that external user (NAND, SPI, etc)
> can use without looking into the actual implementation of these
> functions.
  Thanks for suggestion. Will make the Common API more generic and
  post in next patch.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
