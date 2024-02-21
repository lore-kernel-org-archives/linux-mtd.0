Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DD9C48BC3
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Feb 2024 11:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0W0KZUtMUhj2ESq31JTBDe8LFrSwgpKyBJ6Ml1XPMI=; b=Rsd3HLxjSW/Tto
	vwpmSGERXU3nDW/JHS2sMwJA4ARn19dMV9RA3avNQj3R9XMQDgosIIdxLPqw6wR7ZZpuaGqZpvCX2
	92UJItblJY7SBmSxtLwQcrhWWqfAGU9HuubEe462DLCDYxTAJ/bliRueHWiC0EavFSckNlQu42MTf
	G40h+ofV0LiUHsruaPZK99YiXR+5F9H95cz3eAxBQs68ZOCezJ0CWLFyIZlKLeSdlAgcrJE0Z60ic
	/gFK7/cUx7fAPaz93QXNJPOMHEXlXP8yTIAD/mzmb2mDDyhk1wkciIfunuOwfSYvysfyhL4iHB29v
	P1H1ssOjghuoI85BrEzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rckT7-00000000dJS-2VTj;
	Wed, 21 Feb 2024 11:08:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rckT5-00000000dIS-04gB
	for linux-mtd@lists.infradead.org;
	Wed, 21 Feb 2024 11:08:52 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41LB0hP2010690;
	Wed, 21 Feb 2024 11:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=EojJ00F9rrvDlSEynFkxvpGQqZFHkGbZulob50tdVok=; b=Hw
	zAQShoa0IxjzkJnpE4X/s9Ts4WS4t4r6fLx2zo4Sf8xUls51DvKLxuKjBb3orqdc
	ZNEOLnrEM4XFpUV1ymWJEzfIqCy5CG2rhw0qV6aVCpaKcWQLMbRw/bTCFkgyIqTW
	F8PLklMZNMC3z0DeinYB0MdKzmsMOyZyMbPNtyHZZ+t+x1No6nQbpih1Alj9FZ9c
	ZsuHlThBOHTO3lQrbhPr/zfUmhrXNWG3fL+scFAgKeKSynP32TmI19MshaXYLpBR
	q70Ngpu8hgbMc4+S0GK+F+mohtpW+s0UYFeWUJ20kEAcNbXNlvY6OB7Jf0UoI1ki
	BelFtF5YQ1ZBOdmIIVVQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wdfx4g0jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 11:08:43 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41LB8hC7016562
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 11:08:43 GMT
Received: from [10.216.62.93] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 21 Feb
 2024 03:08:37 -0800
Message-ID: <3a044447-375f-8f5d-1d4e-b421ed0a2c1f@quicinc.com>
Date: Wed, 21 Feb 2024 16:38:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 0/5] Add QPIC SPI NAND driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "Manivannan
 Sadhasivam" <manivannan.sadhasivam@linaro.org>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <broonie@kernel.org>,
        <robh@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
 <20240219130412.GC3281@thinkpad>
 <3ad2909d-4ac3-fff3-739d-b12a3408fa0f@quicinc.com>
 <454a7e8d-70f5-4bf5-a3f1-bf9e42672c4c@linaro.org>
 <bfa0edb7-02fd-42dd-2235-0ea34f362515@quicinc.com>
 <d9a49d77-32b1-45d1-b110-5e66155abad3@linaro.org>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <d9a49d77-32b1-45d1-b110-5e66155abad3@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: heR9Ezb94gQFaWmjyfV8D6KObvJhplbf
X-Proofpoint-GUID: heR9Ezb94gQFaWmjyfV8D6KObvJhplbf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 mlxlogscore=815 clxscore=1015 mlxscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402210086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_030851_102853_5B7080A1 
X-CRM114-Status: GOOD (  14.01  )
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



On 2/21/2024 4:31 PM, Krzysztof Kozlowski wrote:
> On 21/02/2024 11:34, Md Sadre Alam wrote:
>>
>>
>> On 2/20/2024 5:06 PM, Krzysztof Kozlowski wrote:
>>> On 20/02/2024 12:32, Md Sadre Alam wrote:
>>>>
>>>>
>>>> On 2/19/2024 6:34 PM, Manivannan Sadhasivam wrote:
>>>>> On Thu, Feb 15, 2024 at 07:18:51PM +0530, Md Sadre Alam wrote:
>>>>>> This series of patches will add initial supports
>>>>>> for QPIC SPI NAND driver.
>>>>>>
>>>>>> Currently this driver support following commands
>>>>>>
>>>>>> -- RESET
>>>>>> -- READ ID
>>>>>> -- BLOCK ERASE
>>>>>> -- PAGE READ
>>>>>> -- PAGE WRITE
>>>>>> -- GET FEATURE
>>>>>> -- SET FEATURE
>>>>>> -- BAD BLOCK CHECK
>>>>>>
>>>>>> This driver has been tested with dd command with read/write page
>>>>>> with multiple file size 1MiB, 10MiB,40MiB etc.
>>>>>> Also tested with "mtd" command like mtd erase, mtd write, mtd verify etc.
>>>>>>
>>>>>
>>>>> This is not the first version isn't it? Where is the changelog describing what
>>>>> has changed since then?
>>>>
>>>>      The earlier patch was the RFC for design review only.
>>>
>>> RFC is state of patch, not version. This is v2 then.
>>>
>>> These RFC postings are really becoming mess. Some people make multiple
>>> RFCs and then post v1 hiding entire previous history... And why even
>>> bother with calling it RFC?
>>
>>    Sorry, I was not aware of this. Shall I post the next one as V3
>>    and add references to the RFC patch and this patch in the cover
>>    letter of V3?
> 
> Yes, like with every posting.
Thank you.
> 
> Best regards,
> Krzysztof
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
