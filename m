Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C757DC36012
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Mar 2025 10:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7oQIHuQhiFZsYaYXOAzgYkRiWv+2SSmFD0w+OqHyjsU=; b=j4HolgAYXJcHGu
	NTCcLoj8TQvQxmdWZ7mcHRxBn/FLwxA5/Xr6oTwXDhVffdY2vBQ6NLXGw71xDHiEUDOfmPSI489bP
	OTlFNcihAIZBfeJW43zFD5FDqPgvZw23Hf0INxWVLtiCi6mo7Bu6vMG1thMtU6ge8jxUURberPe6h
	5M+HR1ZPjaDpGPls4d5hlC2wv1VEpATbvyb88M0vWrsXPPZlQLa4E//nNWufmBmTGT88aPyoI4M7j
	GKpQqYYhtkG/bctEYP8XDahd3I2pg+391r/N6HXCmiYtpRHGwpbXOY3rhZjtNLyy83/r6wD1vhHXr
	IasQZ5npi7Va2A2n6Q/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txkmn-0000000AkUO-4Bj1;
	Thu, 27 Mar 2025 10:48:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txklt-0000000AkMV-1Uop
	for linux-mtd@lists.infradead.org;
	Thu, 27 Mar 2025 10:47:38 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jG9m022968;
	Thu, 27 Mar 2025 10:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sxvlf+5nKrGkwwwlg1gs9f8lcwxGMIqqFiOQ1d3saZw=; b=O3DcmHMQ6ERR5FyI
	oTgzGSOPdKem9rm5j7d3oHBx2EfFPYHE+ekueTcIPM7AOC8ybHaGyVWZe6pSJUtm
	rtmomoglKBQYLMWM20khMhQHaxE0WI2Im0ENJxLC4WZJyqqK43sD1FO2aF/pCLsf
	EFfStbg3bRmKsPgfipEplhsyJHDV5ZeeA7c/jLs5jfkEXF46UGghxOVdpM+gzHGF
	g2sB5y9r4tiVBwA6+rIPMfuzJtiyyUYhiCP7tsVZpVI9N+9HOOoki11L8sxOTWxD
	x2O+8WqKj1mLiEAuh6YBrKd9EM+f6EL3iwLWsM80Y5WfH9acoOwmC3xyqUmQTMCZ
	fwZwKg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mb9mvfjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 10:47:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52RAlV8s030993
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 10:47:31 GMT
Received: from [10.216.8.158] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Mar
 2025 03:47:25 -0700
Message-ID: <3a5d75c1-abb5-fbd4-aa22-cf8f9a8d7349@quicinc.com>
Date: Thu, 27 Mar 2025 16:17:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 4/6] ARM: dts: qcom: sdx75: Add QPIC NAND support
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
 <20250313130918.4238-5-quic_kaushalk@quicinc.com>
 <171197fc-05a9-41a2-bd3b-d117a5cb8f63@kernel.org>
From: Kaushal Kumar <quic_kaushalk@quicinc.com>
In-Reply-To: <171197fc-05a9-41a2-bd3b-d117a5cb8f63@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=cs+bk04i c=1 sm=1 tr=0 ts=67e52cc4 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=ZpSJlDRZEPRX5KPLjvEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Uomv3_xzBXZ5jjtk3fi0RuULHmQX01z_
X-Proofpoint-ORIG-GUID: Uomv3_xzBXZ5jjtk3fi0RuULHmQX01z_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 bulkscore=0 mlxlogscore=846 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_034737_523923_A63B19FB 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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

On 3/13/2025 8:20 PM, Krzysztof Kozlowski wrote:
> On 13/03/2025 14:09, Kaushal Kumar wrote:
>> Add devicetree node to enable support for QPIC
>> NAND controller on Qualcomm SDX75 platform.
>> Since there is no "aon" clock in SDX75, a dummy
>> clock is provided.
> Add the clock first.
>
> Please wrap code according to the preferred limit expressed in Kernel
> coding style (checkpatch is not a coding style description, but only a
> tool).  However don't wrap blindly (see Kernel coding style).
Sure, will update in v2.
> Best regards,
> Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
