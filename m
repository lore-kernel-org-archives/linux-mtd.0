Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC54C54E49
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2024 11:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WbJm963DlW/6oMaNTkYFrkBGcmCRUSIS+XO5s1nNoGk=; b=q9ZWLzMZlEePRt
	ihyst0VjZxJu6WfNb65igpon0mUS5R1V0Yjkt/+A2xsSANjEymSkU26YFt2DegduVtsyrH/3oLe/T
	j1j1zrFgMG/aehk8vdGZjvFBRgrNN4ejBgpbKF5x3OtmsufLcCVwBPBNKByC+d8D2BQJmNnW4JcQh
	pooPvXYl3VZoeNhYv4SQhZLW7YYS0wXDkj9DegooEEHY8C09HzyO5W4mIqE5nWqt0tvHe/k0iJdws
	vlQnGBNioPRTDpPKxjtoc0t9Em1MnUg00dTLs8JyhJTDJoGrDkk7cD17rxJoouV2d1OV/QxOLvUZv
	TpjLkmZfiTOsh1Y5BpvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riBui-00000004Ibq-3nzg;
	Thu, 07 Mar 2024 11:27:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riBug-00000004Iay-0Hts
	for linux-mtd@lists.infradead.org;
	Thu, 07 Mar 2024 11:27:51 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4279Q3r0001475;
	Thu, 7 Mar 2024 11:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=IONUL4mEoZ7Z1Sf9VsHmDh80IkV804uMjF1VYdSA8sY=; b=gS
	mcDYO1wmE2nyv8xEGtsuXLPTdk9gONAKjWVnaRG0lIBfZnbFQREID+kPB3VllAdU
	F39nPDNFQ1kToMWtiwqjHwSWwdOjc2lAZWb/Y9P53nTSDwzSln7RL4i6ebbvFc8X
	/cZ/PH95NY3qY8sT3GkihNR6OSrE3bn+dA0QJ+aR+OdRvAZt2jzXKo7jMiXPws4X
	o/deIvLU8Ee7OIlHO5A9C+4YqdI0ighEb7qwJOmtZ8V5F6WsGEKNNrjS2+DnYxqZ
	iqXYP97FACuNl2ZhbPmo9pmnfwtVjKx2d7qQW9RWq+QFbiL96oVoOqSetkk3Gg83
	pUHPAFEoC64zAlOitj/w==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wqaxd0da4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 11:27:42 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 427BRgA3003248
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Mar 2024 11:27:42 GMT
Received: from [10.201.3.124] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 7 Mar
 2024 03:27:36 -0800
Message-ID: <2c0e928e-e68c-e859-0e7f-c5a457f58175@quicinc.com>
Date: Thu, 7 Mar 2024 16:57:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 1/5] spi: dt-bindings: add binding doc for
 spi-qpic-snand
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <broonie@kernel.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
References: <20240307041726.1648829-1-quic_mdalam@quicinc.com>
 <20240307041726.1648829-2-quic_mdalam@quicinc.com>
 <19d3c024-38aa-4526-b6c1-d9543b41fa2b@linaro.org>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <19d3c024-38aa-4526-b6c1-d9543b41fa2b@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZUUeepn3sA288e4BF4c-IPv7pKV6tn9J
X-Proofpoint-ORIG-GUID: ZUUeepn3sA288e4BF4c-IPv7pKV6tn9J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-07_07,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403070085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_032750_177545_A7948306 
X-CRM114-Status: GOOD (  22.17  )
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



On 3/7/2024 1:16 PM, Krzysztof Kozlowski wrote:
> On 07/03/2024 05:17, Md Sadre Alam wrote:
> 
> There is no commit msg.
Sorry missed it. Will add in next patch
> 
> Subject did not improve. This is a friendly reminder during the review
> process.
Ok
> 
> It seems my or other reviewer's previous comments were not fully
> addressed. Maybe the feedback got lost between the quotes, maybe you
> just forgot to apply it. Please go back to the previous discussion and
> either implement all requested changes or keep discussing them.
> 
> Thank you.

  Sorry, Will re-check all the previous comment and try to fix in
  next patch.
> 
> 
>> Co-developed-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>> ---
>> Change in [v3]
>>
>> * Updated commit message, removed "dt-bindings" from commit
>>    message
>>
>> * Updated compatible name as file name
>>
>> * Added hardware description
>>
>> * Documented clock-name
>>
>> * Moved dma-names property to top
>>
>> * Droped unused label "qpic_nand"
>>
>> * Fixed indentation in example dt node
>>
>> Change in [v2]
>>
>> * Added initial support for dt-bindings
>>
>> Change in [v1]
>>
>> * This patch was not included in [v1]
>>   
>>   .../bindings/spi/qcom,spi-qpic-snand.yaml     | 83 +++++++++++++++++++
>>   1 file changed, 83 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
>> new file mode 100644
>> index 000000000000..3d20a4bc567f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
>> @@ -0,0 +1,83 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/spi/qcom,spi-qpic-snand.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm QPIC NAND controller
>> +
>> +maintainers:
>> +  - Md sadre Alam <quic_mdalam@quicinc.com>
>> +
>> +description: |
> 
> Do not need '|' unless you need to preserve formatting.
Ok will do in next patch.
> 
>> +  The QCOM QPI-SPI-NAND flash controller is an extended version of
>> +  the QCOM QPIC NAND flash controller. It can work both in serial
>> +  and parallel mode. It supports typical SPI-NAND page cache
>> +  operations in single, dual or quad IO mode with pipelined ECC
>> +  encoding/decoding using the QPIC ECC HW engine.
>> +
>> +allOf:
>> +  - $ref: /schemas/spi/spi-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,spi-qpic-snand
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 3
> 
> Drop
Ok will do in next patch.
> 
>> +    maxItems: 3
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core
>> +      - const: aon
>> +      - const: iom
> 
> Missing blank line
Ok will do in next patch.
> 
>> +  dmas:
>> +    items:
>> +      - description: tx DMA channel
>> +      - description: rx DMA channel
>> +      - description: cmd DMA channel
>> +
>> +  dma-names:
>> +    items:
>> +      - const: tx
>> +      - const: rx
>> +      - const: cmd
>> +
> 
> 
> Best regards,
> Krzysztof
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
