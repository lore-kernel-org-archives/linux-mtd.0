Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65499C4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Nov 2023 12:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVq+R9QaCUbpL3OhjhNWYpL/aPdaF+cVJXck5GL7h5I=; b=CUH35+8IaW/0CrZMxuJMweaibS
	GOj4rkOcM6CqKYS4+gdIEa3AO72hI3KnfxMdkI5RVhbO0O9/LU8W8PGtA+LRiC7Wz066Dzx+GAO8o
	C/j+JxwAk2d5l0ThE3c8+bg3b5GOX2ycT3PipyxHgG8Mb+gC4Xhk3R7pVEbLfUEkIUu14R8EtcO2L
	4//ByL5gW1sfyRdfm6M179KHwhF5nwtc+ozzFTjpdbPDgEeU0sbzvAyD1fevvQImQ0DjolkviDSqQ
	DE+yU4HbinLMLKaxfAdyDuL7m4fJ11uVnd6JG/W6cc3QAN+JfDos/cOEoTHmOO3UEbGpUFZ0tHyp9
	yvjIW9UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyszp-00BNdS-0q;
	Fri, 03 Nov 2023 12:09:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyszk-00BNcw-1o
	for linux-mtd@lists.infradead.org;
	Fri, 03 Nov 2023 12:09:52 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A3BlnOY002841;
	Fri, 3 Nov 2023 12:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=V2pdtGj/iIbW52w7Kx2JnIkYqEZfNBiVIgWaGjqf1ls=;
 b=PsF25plVgcgKcivthlphME6a6N413c7RM2euAjB++Z/twnjEu9o/vcU1q7S3r8Yl7Nhn
 WxpWtH3sGOMo08MHZ6FpTavd3EZg2A/huDu9Jfb/jE7bnbmTi3NoC1D8ztVYYU6J4oMl
 7yaDiHSPZU/Fbb2/SQpOLHyOmzDzHnqVBaID0Rn4Qei7GPuon8mZ1EkWthY1RoPQ8aqO
 K5Qtb5Q9BmdmK0uWlE6dwr3LGDUP/LGaodHClsQx99775OxnzsneSzZPpzmk2cpZV9Qk
 8HJVk8QOZFDnOIy3RGwo6Ka5Mvl5zlMElSou8DgkY74wNrA4V6hnJwyKyL2oJI489+Oz Yw== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u47d532et-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Nov 2023 12:09:39 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A3C9c9D018111
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Nov 2023 12:09:38 GMT
Received: from [10.216.26.1] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 3 Nov
 2023 05:09:32 -0700
Message-ID: <d25c0c3a-1866-9807-6796-7c8eecc6e1cb@quicinc.com>
Date: Fri, 3 Nov 2023 17:39:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC PATCH 2/5] arm64: dts: qcom: ipq9574: Add ecc engine support
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, <agross@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <conor+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <broonie@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <linux-spi@vger.kernel.org>, <quic_srichara@quicinc.com>,
        <qpic_varada@quicinc.com>
References: <20231031120307.1600689-1-quic_mdalam@quicinc.com>
 <20231031120307.1600689-3-quic_mdalam@quicinc.com>
 <47cf6dd2-dcfa-468b-9bcb-3af32f6d9c4b@linaro.org>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <47cf6dd2-dcfa-468b-9bcb-3af32f6d9c4b@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vivYDfkcpu7bpvP4CVobDsvIMEafS8hs
X-Proofpoint-ORIG-GUID: vivYDfkcpu7bpvP4CVobDsvIMEafS8hs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-03_12,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=934 bulkscore=0 adultscore=0 mlxscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311030101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_050948_720123_A89E48A9 
X-CRM114-Status: GOOD (  14.54  )
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



On 10/31/2023 10:42 PM, Krzysztof Kozlowski wrote:
> On 31/10/2023 13:03, Md Sadre Alam wrote:
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq9574.dtsi | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> index 5f83ee42a719..b44acb1fac74 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> @@ -336,6 +336,11 @@ sdhc_1: mmc@7804000 {
>>   			status = "disabled";
>>   		};
>>   
>> +		bch: qpic_ecc {
>> +			compatible = "qcom,ipq9574-ecc";
> 
> NAK. There are so many wrong things with it... Let's start with missing
> checkpatch. Then with unndeeded label. Then with not allowed underscores
> in node names.
> Finally:
>> +			status = "ok";
> 
> Drop.
> 
Ok
> 
> 
> Best regards,
> Krzysztof
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
