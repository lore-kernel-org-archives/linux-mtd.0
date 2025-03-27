Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CEDC3600C
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Mar 2025 10:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oCuhe8tQTYbkz1fLKDaMzK26mxFgyc3wWsMA5uW2Vwc=; b=qM/LuUJOTwByje
	cuSwbAUA3l7fmV+uiSigQxJqH73IKgdRHXlEpXnfysNS1YJaT0HJKimJN4f1GJqKTHbzS+y1yCbyY
	bbYqnbvR+KQaG7g7MtrLKcaK5lBviDp5IsWd6HMseiFj4GwMfg0NwX07Nj1Yw+jnhzEGOS21ZBEqQ
	jA+H+2+9BBRPmowqMlE58gsTbyzJEatQJojUtvA0bnvXEKxcM+jKEB4WplzY6NtsNl/f63g7sTsZp
	wETlnw/od9AILjUadT5vWFr+7avrHV70jPEMUqer5woW91PDakfURZTCxLN0AVinGy07BtnOkLsOR
	V/JepGdRObydcY8GnwoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txkn1-0000000Akc4-0cdD;
	Thu, 27 Mar 2025 10:48:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txkmy-0000000Akaj-3PCL
	for linux-mtd@lists.infradead.org;
	Thu, 27 Mar 2025 10:48:46 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jDYV021236;
	Thu, 27 Mar 2025 10:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Sa3Jp59j+nUS0BBJ7tDNKCvGHJtrIiMy92xIjdAp58=; b=FNnzccvKsjR/FWHM
	oVNHkzsem5cY0+Bv10R04JCQi+vWBQZS9YwpHG4VtYJ1Y75ItDwe6ovzR4yz5lJH
	1195XP95UVoe5qdKPIPhYn9wESDbkdwyRkShov6vKb2+gtvjNw/N7C1xMKTJ7XZK
	uoZqPO9qXHErVsT9+IT9Q47N5WnoBsNWVXKf5WJcLWQCHqjZzCbSg+WMlNKDhlW8
	oKpOSrQJu/7qGabcTWK13fnEtuNasHdqNzIFraaoU0+R20lkDvBTVGJI3FnNzrh/
	UmVPbN71v4pSW15eZ0V5S1fCGHQyK8pEyBqm5pysPchLNMt7/7l7KUdk7C9GfVxs
	lRZF6g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kyr9p1n7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 10:48:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52RAmc3g032487
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 10:48:38 GMT
Received: from [10.216.8.158] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Mar
 2025 03:48:32 -0700
Message-ID: <26463cdf-f041-0dc3-dae2-cf5a91a35373@quicinc.com>
Date: Thu, 27 Mar 2025 16:18:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 4/6] ARM: dts: qcom: sdx75: Add QPIC NAND support
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <vkoul@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>
References: <20250313130918.4238-1-quic_kaushalk@quicinc.com>
 <20250313130918.4238-5-quic_kaushalk@quicinc.com>
 <2fb1ddf6-0fca-4bf6-9970-728448f893d2@oss.qualcomm.com>
From: Kaushal Kumar <quic_kaushalk@quicinc.com>
In-Reply-To: <2fb1ddf6-0fca-4bf6-9970-728448f893d2@oss.qualcomm.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jTS8CBuhR1iTeoq5vhCh9qTtN6uYx0NY
X-Authority-Analysis: v=2.4 cv=UblRSLSN c=1 sm=1 tr=0 ts=67e52d07 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=ZpSJlDRZEPRX5KPLjvEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: jTS8CBuhR1iTeoq5vhCh9qTtN6uYx0NY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 mlxscore=0 impostorscore=0
 adultscore=0 clxscore=1015 mlxlogscore=726 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_034844_976367_A39AEF32 
X-CRM114-Status: GOOD (  10.70  )
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



On 3/13/2025 8:06 PM, Konrad Dybcio wrote:
> On 3/13/25 2:09 PM, Kaushal Kumar wrote:
>> Add devicetree node to enable support for QPIC
>> NAND controller on Qualcomm SDX75 platform.
>> Since there is no "aon" clock in SDX75, a dummy
>> clock is provided.
> Alter the bindings not to require it then, instead
>
> [...]
Will update in v2.
>
>>   
>> +		qpic_nand: nand-controller@1cc8000 {
>> +			compatible = "qcom,sdx75-nand", "qcom,sdx55-nand";
>> +			reg = <0x0 0x01cc8000 0x0 0x10000>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			clocks = <&rpmhcc RPMH_QPIC_CLK>,
>> +				 <&nand_clk_dummy>;
>> +			clock-names = "core", "aon";
>> +
>> +			dmas = <&qpic_bam 0>,
>> +			       <&qpic_bam 1>,
>> +			       <&qpic_bam 2>;
>> +			dma-names = "tx", "rx", "cmd";
> Please make dma-names a vertical list, just like dmas
Sure, will update in v2.
>
> Konrad


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
