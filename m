Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44ECBC3600B
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Mar 2025 10:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ICQjnUsGiQCcU/3DMQWglKuxvLtd1zU66Cjuup1ATps=; b=av8+xiRAsE3yf/
	duurWlZ6nQlcr+z1wY+lqTAtnY+9CKWkBrOsQ9YHoHspZYSGWNmqeUE4unIi8ACrCSFKQAxlEA5Uw
	HhpiZyqWQPUmEpMNJB0YiGGPRd348z/yfYjQYMcxv7S/25QpbnYQaIZ8V3MZmYQF72ZgqGvNaIFhI
	LBe+TwQADAibHsEo9KVhAR5yfS24g7ba2jFcx7esQPVgvihFY/8w2+Fc+G3mVBqTFyDfWTJKVEh0a
	B8ht4rAJnRpCAwZWOBr4C71y3Ys++JOyjTFi786Dc4jHmzE7Th5PjXf3YUjOtReE0JDLDvOG9SFok
	X4yO4K5Pe60ZhHcKc/Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txkgp-0000000AjDW-1Iia;
	Thu, 27 Mar 2025 10:42:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txkgm-0000000AjDA-3WXY
	for linux-mtd@lists.infradead.org;
	Thu, 27 Mar 2025 10:42:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jE6Q025664;
	Thu, 27 Mar 2025 10:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2bTP77VIBbopHVJGLqe8efeqQT69MD8suXLetTu2DhE=; b=A+OARJ6ksdDpk6Sx
	vpdteBGHejzcgR2thqLQcBzy1BKMiB4pJu2BYCKlmz+LYh3eI4nDi+Fwn1SChEZi
	7COAd3yFz2/gHcsgMwv78ROXynIWE2ba2zmKLWX/8NLTdG5hjUpt54R7FuK0wD99
	shX693HUjGW1xrEacQBwTTp9x4FtpwYgJ4SY7DfjKSTAPKA7lnK9G0AB6oDd7DiJ
	gEhbaxiTB6QyTPY8lad6eNBVP7f34Nhg9Avjv7oKNfOqf+F8zEXyUpIhP7LGj4cy
	XwN+5WwDVrxfuw3EqivoHvK3BZFuekNv0xbj7b80n7JHsBZTeddX34LViNk039NV
	9/+2uA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45n0nurtdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 10:42:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52RAgEBf002499
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 10:42:14 GMT
Received: from [10.216.8.158] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Mar
 2025 03:42:09 -0700
Message-ID: <39c6cbef-d84e-8192-ca60-aec26dfbb5e6@quicinc.com>
Date: Thu, 27 Mar 2025 16:12:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/6] dt-bindings: mtd: qcom,nandc: Document the SDX75 NAND
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, <vkoul@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>
References: <20250313130918.4238-1-quic_kaushalk@quicinc.com>
 <20250313130918.4238-2-quic_kaushalk@quicinc.com>
 <779c824b-d44c-4613-aebf-05c3327df1ea@kernel.org>
From: Kaushal Kumar <quic_kaushalk@quicinc.com>
In-Reply-To: <779c824b-d44c-4613-aebf-05c3327df1ea@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KOslxf3t1a3aoigFLEmfgAZV5Z_xCHoD
X-Authority-Analysis: v=2.4 cv=AcaxH2XG c=1 sm=1 tr=0 ts=67e52b87 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=P-IC7800AAAA:8 a=COk6AnOGAAAA:8 a=Ffv4d3AQL7PL7ZCmIVIA:9
 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: KOslxf3t1a3aoigFLEmfgAZV5Z_xCHoD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=999
 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_034220_891053_9C0CEC2F 
X-CRM114-Status: GOOD (  17.92  )
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

On 3/13/2025 8:18 PM, Krzysztof Kozlowski wrote:
> On 13/03/2025 14:09, Kaushal Kumar wrote:
>> Document the QPIC NAND controller v2.1.1 being used in
>> SDX75 SoC and it uses BAM DMA.
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
Sure, will update in v2.
>> SDX75 NAND controller has DMA-coherent and iommu support
>> so define them in the properties section, without which
>> 'dtbs_check' reports the following error:
>>
>>    nand-controller@1cc8000: Unevaluated properties are not
>>    allowed ('dma-coherent', 'iommus' were unexpected)
> That's a new compatible, so how can you have existing errors? Looks not
> related.
It is not an existing error. It is the error that would come unless the 
new properties are updated. Anyhow sorry for the confusion, will remove 
this in v2.
>> Signed-off-by: Kaushal Kumar <quic_kaushalk@quicinc.com>
>> ---
>>   .../devicetree/bindings/mtd/qcom,nandc.yaml   | 23 ++++++++++++++-----
>>   1 file changed, 17 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
>> index 35b4206ea918..8b77e8837205 100644
>> --- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
>> +++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
>> @@ -11,12 +11,17 @@ maintainers:
>>   
>>   properties:
>>     compatible:
>> -    enum:
>> -      - qcom,ipq806x-nand
>> -      - qcom,ipq4019-nand
>> -      - qcom,ipq6018-nand
>> -      - qcom,ipq8074-nand
>> -      - qcom,sdx55-nand
>> +    OneOf:
> Testing patches before sending is still on todo list for Qualcomm :/.
I had run the "make dt_binding_check". Possibly due to my older version 
of dtschema , it did not get caught. After the schema update, now it is 
getting caught. Will update in v2.
>> +      - items:
>> +          - enum:
>> +              - qcom,sdx75-nand
>> +          - const: qcom,sdx55-nand
>> +      - items:
>> +          - const: qcom,ipq806x-nand
>> +          - const: qcom,ipq4019-nand
>> +          - const: qcom,ipq6018-nand
>> +          - const: qcom,ipq8074-nand
>> +          - const: qcom,sdx55-nand
>>   
>>     reg:
>>       maxItems: 1
>> @@ -31,6 +36,12 @@ properties:
>>         - const: core
>>         - const: aon
>>   
>> +  dma-coherent: true
> Which controllers are DMA coherent?
I will add it under a sdx75 check since it is applicable to sdx75 only.
>
>> +
>> +  iommus:
>> +    minItems: 1
>> +    maxItems: 3
> You need to list the items. Why is this flexible?
Agree, this need not be flexible. Will update in v2.
>
>> +
>>     qcom,cmd-crci:
>>       $ref: /schemas/types.yaml#/definitions/uint32
>>       description:
>
> Best regards,
> Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
