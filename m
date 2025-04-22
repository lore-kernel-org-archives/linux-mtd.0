Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F591C369CB
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Apr 2025 09:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YBqJOaSAyP6g4n4eUi39GOnXXsYrbEVj+YM4tL1Pi6o=; b=T2i8scfTfVnAgw
	vUXxFxLJBBLM7HeSdu4Ya1AgEe+kFgfBYwbyRKYyuSOqpiKoLYxo6CLp0o67ABzg33Rnbgt+A658s
	Nqb7gAmeCKbVS7tU1O4XtpI1Uq4VupBmvXTA9mnWJ0THhjxstReBEJCsWmolX2yGWrHnfcWeHfyNb
	u+xgGI4fwRNPowxHJtExcfRn0AsRLvI94bvEXxHeCfnNkczHIlNrlf6++QuOZf2s+nfaJidaTZAKD
	Dx2Z/j2zLdxCmUHAQ6t50nFi08R2P4JY7g+5fUVsov0S7xMnZCPHgJ+M8C2cjpB45RAdGJ3zKIW9s
	/pRAy4V4WDPVs7hkwu+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79VV-00000006TGv-2vZl;
	Tue, 22 Apr 2025 09:01:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u793X-00000006KGA-0zLs
	for linux-mtd@lists.infradead.org;
	Tue, 22 Apr 2025 08:32:41 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M4OjGc006443;
	Tue, 22 Apr 2025 08:32:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YYbsaB//72owVvHfmFOaZEketf2iik/PzXc+Wi3iH14=; b=OJBmLnMzEdMhEPeI
	2I3pXD5cUU97Uo34qsuOAB0bCyITrMMUlUh+i4VOrQyijEEjC3oYgClfs0AOriU5
	rVPRCXnE8dOQOTIDdb16UkOyG98VuGpBQxsfGAblwdx1Z/SgfENPchDVtQsHojz+
	oo4vTpPkWAG+5htsapGf+Q3CuaiAJnRvn2g5aMF/swS1bAj7/9texQBtQjpdX6lv
	rsA87QOplUbc9FXW5zQirlwpuOe4ulmVGaNokDM7RXtvnY86jyn2MkGqz6GLuwO6
	k3huLA0vnoj4rCp+Nkncvhv9ckpxIXJCVeMp2a98pKgl0lCl3S92WQiArRrvE0rh
	BPEiYA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 464426pmtx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 08:32:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53M8WVDJ006787
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 08:32:31 GMT
Received: from [10.218.18.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Apr
 2025 01:32:26 -0700
Message-ID: <9ad0d6ec-1391-5c41-24cd-7add0d3b1e08@quicinc.com>
Date: Tue, 22 Apr 2025 14:02:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: sdx75: Add QPIC BAM support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <vkoul@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>
References: <20250415072756.20046-1-quic_kaushalk@quicinc.com>
 <20250415072756.20046-4-quic_kaushalk@quicinc.com>
 <68a48388-f42b-4136-a97f-9d575fb84d42@oss.qualcomm.com>
Content-Language: en-US
From: Kaushal Kumar <quic_kaushalk@quicinc.com>
In-Reply-To: <68a48388-f42b-4136-a97f-9d575fb84d42@oss.qualcomm.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rHOX6qJnXPjGnITH3nhT2nOPxGeo3gMW
X-Proofpoint-GUID: rHOX6qJnXPjGnITH3nhT2nOPxGeo3gMW
X-Authority-Analysis: v=2.4 cv=IP8CChvG c=1 sm=1 tr=0 ts=68075420 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=mRvqLfeVl_ZLl3yoDasA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=919 spamscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_013239_287518_5CED8282 
X-CRM114-Status: GOOD (  10.73  )
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

On 4/15/2025 3:20 PM, Konrad Dybcio wrote:
> On 4/15/25 9:27 AM, Kaushal Kumar wrote:
>> Add devicetree node to enable support for QPIC BAM DMA controller on
>> Qualcomm SDX75 platform.
>>
>> Signed-off-by: Kaushal Kumar <quic_kaushalk@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sdx75.dtsi | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
>> index b0a8a0fe5f39..e3a0ee661c4a 100644
>> --- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
>> @@ -880,6 +880,20 @@
>>   			qcom,bcm-voters = <&apps_bcm_voter>;
>>   		};
>>   
>> +		qpic_bam: dma-controller@1c9c000 {
>> +			compatible = "qcom,bam-v1.7.0";
> v1.7.4, looks good otherwise
Ack. v1.7.4 is backward compatible with v1.7.0 supported by the driver. 
I will update this in next patch version.
> Konrad
- Kaushal

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
