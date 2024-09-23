Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B76CF9C5B
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 10:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ua+fE4wUA09TQlcBicOPwfYIYSn4n/PPtAaT2wdiAPY=; b=QuOmPzufdCyPI6
	RqQWlNO/x0Ft8soq8HtfZMd51/dka36xGm3ZcvpHBqlP0QT+QA+h9AhiV/YDsEw1cuavl5AawSST5
	uSh5ppdH+cxosy7Opi/ZxZm2i8+ThqCfen7vGu8aE4XQRaQcmxUBTST8Vlp04PkUKHKWU88KotR+b
	zOnZwGwZi54MltSwgEqv6rMmDpQau5dv2tfPgqREVkFlVFErCu6qwUcmY58GoWB39i0x4EHv/4Cqk
	a9DPdHdx49qALe+L6H9Bz7LiMDb7hHUc0dDzq7ZcnsUh78fCNbeJ+Qz1ZQ4jSZSuOSTDvg7+rsMl3
	0Zcys2Jmd3rejTYaGWqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfwl-0000000Gunf-08O3;
	Mon, 23 Sep 2024 10:05:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfwi-0000000Guma-06q8
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 10:05:33 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48MNhLlP007866;
	Mon, 23 Sep 2024 10:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eSxU2k9NCbNUH2pf9Tm0ETZbHPtkd038byigFo8KTng=; b=B5xC5zV7dwltOMj5
	vIuvg1AIUKpFLgKliL4Ii1k+KK+joATUL/rBQ5KXIztaV2f0qOL62jdtuSbFLlVn
	85ZBmbYCtq76U3NCrJ6ZnjFROeIx1iQPy39U6cx1BqZVbVwaIv6KBsdWk7czaW40
	bks0T2ZIsD+a+zmIg4p36UAMZ/aiYQWUJ2eV+JIkuZUoplsDSU9LkIqdKM4bSybf
	/+/z+2pLJ3YtC0QPQmVD1FrbJjxtjkbccnk4XeMZtDa3HBn+aICBjfjf92u0d8QW
	AQxQrb1qRExMDm6mtCoSQQfXFb25RMMo/HdNV59u+Hnzykcdo7w1mT7pAcda2Ny5
	2+dBGQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sn5bmkpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Sep 2024 10:05:14 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48NA5DWX013041
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Sep 2024 10:05:13 GMT
Received: from [10.216.21.87] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Sep
 2024 03:05:06 -0700
Message-ID: <15cc4380-9ca7-c558-2aaf-7cc845c28854@quicinc.com>
Date: Mon, 23 Sep 2024 15:34:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v10 1/8] spi: dt-bindings: Introduce qcom,spi-qpic-snand
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <vkoul@kernel.org>,
        <nikita.shubin@maquefel.me>, <esben@geanix.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <quic_srichara@quicinc.com>,
        <quic_varada@quicinc.com>
References: <20240922113351.2390195-1-quic_mdalam@quicinc.com>
 <20240922113351.2390195-2-quic_mdalam@quicinc.com>
 <k3id2ywyghhmoiekehko7ear2nef5ygmizvkax5s6sdi2zhn5d@yfhgl5xte4dw>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <k3id2ywyghhmoiekehko7ear2nef5ygmizvkax5s6sdi2zhn5d@yfhgl5xte4dw>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fy0GyvuLSc280jdhAX0gFWgmbOmFECCu
X-Proofpoint-GUID: fy0GyvuLSc280jdhAX0gFWgmbOmFECCu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 mlxlogscore=889
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409230074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_030532_220226_6654BD1D 
X-CRM114-Status: GOOD (  16.32  )
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



On 9/23/2024 2:02 AM, Krzysztof Kozlowski wrote:
> On Sun, Sep 22, 2024 at 05:03:44PM +0530, Md Sadre Alam wrote:
>> Document the QPIC-SPI-NAND flash controller present in the IPQ SoCs.
>> It can work both in serial and parallel mode and supports typical
>> SPI-NAND page cache operations.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>> ---
>>
>> Change in [v10]
>>
>> * No change
> 
> ...
> 
>> +title: Qualcomm QPIC NAND controller
>> +
>> +maintainers:
>> +  - Md sadre Alam <quic_mdalam@quicinc.com>
>> +
>> +description:
>> +  The QCOM QPIC-SPI-NAND flash controller is an extended version of
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
> 
> Recently it turned out that Qualcomm generic compatibles are not
> generic... That was odd, but to me it is a clear signal that something
> should not be called generic if it is not generic enough.
> 
> Please switch to soc-specific compatibles (and drop my reviewed-by, so
> this will appear in my review queue).
Ok , will add in next revision.
> 
> Best regards,
> Krzysztof
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
