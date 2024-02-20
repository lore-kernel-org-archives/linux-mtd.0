Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D65C48BC4
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Feb 2024 12:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BIx92STsZuAW44Zt1rI11Z6SqGRwN0dCMFzN0uboiNU=; b=cBbuzzqY4iR2oV
	P0dBDoJBPSiKZKyRS6+9o7xIh7FIF56jIdgAp3QCw/UUyBi9hR6itDLTlDNN5nLYndeQzIDfIDQpG
	d1IVyv855K2It14FBf8Y3AKtbThcig9zolAw4Dq4cejoilEDVjvGo1X3k16Mc4C+LFBHACFg7mMIs
	5gpA80mD3HSRBmwg7ZYz2TDb2t6oQs4aQ8MIlXSBCkcWr/Y9bF3nIbbx4cu0hkUmJGL/5KlhKmVAQ
	HjCLHmYhHZzFJ0pzwDn1a0Yz/hc+0UmTJIr64Kuybr17kz+kfYLUyawy2OmSa8oQB0COTd791JJ00
	ECuBu5QDTNE3m3iHY5xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcOtm-0000000EbJP-2vGC;
	Tue, 20 Feb 2024 12:06:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcOtj-0000000EbIF-2BKJ
	for linux-mtd@lists.infradead.org;
	Tue, 20 Feb 2024 12:06:57 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41KAteL1004369;
	Tue, 20 Feb 2024 12:06:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=3Un3DywxvOe0E6Au+Vjnmv8pOY2C5ymlgd6WWC4EYZo=; b=Kw
	14HRUBbgb9LFrT62fSnlquI3rQRjJ11RaNMx24MuvUGkDMfqifKQYJ+jWquj9mGm
	/9GDXhuIYTFaxH8sl00mn0+aBzOEiKYWMNp7R2TWN9kUWrpHgdvFaM273JhT7CQP
	pZdVBfgO9VzgUgAzp+TTYuo3OfPrEPk7nFr3gJCevHfn5HSI1To2+gddB9TkwoW9
	24KTHpwWG/DO6n6IH8OVg1CYwdTDZxvliB53sxT0Gg0YPdhckN31JYkfOCW435rr
	U/tseWfZA7VwHX0lzaJdfXfM6ZR66f3vgv02Kuj5RzYAXklPrJQJjra7OEnV2yjB
	LHH9VhcmVKSFfxmMDbOQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wct3eg75b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Feb 2024 12:06:50 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41KC6mqI004735
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Feb 2024 12:06:49 GMT
Received: from [10.216.16.129] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 20 Feb
 2024 04:06:43 -0800
Message-ID: <0dae7231-6bd1-b7fc-4a5e-b0787b0adaba@quicinc.com>
Date: Tue, 20 Feb 2024 17:36:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/5] spi: dt-bindings: add binding doc for spi-qpic-snand
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <broonie@kernel.org>,
        <robh@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>, <manivannan.sadhasivam@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <quic_srichara@quicinc.com>,
        <quic_varada@quicinc.com>
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
 <20240215134856.1313239-2-quic_mdalam@quicinc.com>
 <20240215-upon-anime-af032e49e84d@spud>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20240215-upon-anime-af032e49e84d@spud>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bz2KTbBLMa6vU1xmmZGH03T_QBaLtLKk
X-Proofpoint-GUID: bz2KTbBLMa6vU1xmmZGH03T_QBaLtLKk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1011 mlxscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402200087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_040655_768083_ED9B45A1 
X-CRM114-Status: GOOD (  15.60  )
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



On 2/15/2024 7:54 PM, Conor Dooley wrote:
> On Thu, Feb 15, 2024 at 07:18:52PM +0530, Md Sadre Alam wrote:
>> Add device-tree binding documentation for QCOM QPIC-SNAND-NAND Flash
>> Interface.
>>
>> Co-developed-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>> ---
>>   .../bindings/spi/qcom,spi-qpic-snand.yaml     | 82 +++++++++++++++++++
>>   1 file changed, 82 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
>> new file mode 100644
>> index 000000000000..fa7484ce1319
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
>> @@ -0,0 +1,82 @@
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
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,ipq9574-snand
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 2
>> +    maxItems: 3
>> +
>> +  clock-names:
>> +    minItems: 2
>> +    maxItems: 3
>> +
>> +allOf:
>> +  - $ref: /schemas/spi/spi-controller.yaml#
>> +  - if:
> 
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,ipq9574-snand
>> +
>> +    then:
>> +      properties:
>> +        dmas:
>> +          items:
>> +            - description: tx DMA channel
>> +            - description: rx DMA channel
>> +            - description: cmd DMA channel
>> +
>> +        dma-names:
>> +          items:
>> +            - const: tx
>> +            - const: rx
>> +            - const: cmd
> 
> None of this complexity here is needed, you have only one device in this
> binding and therefore can define these properties at the top level.

  Thanks for reviewing, Will fix this in next patch.
> 
> Cheers,
> Conor.
> 
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
>> +    qpic_nand: spi@79b0000 {
>> +        compatible = "qcom,ipq9574-snand";
>> +        reg = <0x1ac00000 0x800>;
>> +
>> +        clocks = <&gcc GCC_QPIC_CLK>,
>> +                 <&gcc GCC_QPIC_AHB_CLK>,
>> +                 <&gcc GCC_QPIC_IO_MACRO_CLK>;
>> +        clock-names = "core", "aon", "iom";
>> +
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        flash@0 {
>> +            compatible = "spi-nand";
>> +            reg = <0>;
>> +            #address-cells = <1>;
>> +            #size-cells = <1>;
>> +            nand-ecc-engine = <&qpic_nand>;
>> +            nand-ecc-strength = <4>;
>> +            nand-ecc-step-size = <512>;
>> +            };
>> +        };
>> -- 
>> 2.34.1
>>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
