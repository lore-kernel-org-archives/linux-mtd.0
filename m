Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0947DC48260
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Feb 2024 15:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3kyoJEVOY8FOCTUAhnxDRE3G+SDyyjkoSyhnxNpZEIo=; b=pcuKXZOEkuPQSN
	jEZE2m2+QAcuoEBLYBGB/s2rcH3E6uxyCpj/BqszVuLROHA+PqehD41JQQPiko462cjKNqahes5n8
	df9qmx/BrX0wiI8wUcMkY4blDcNwH4lwKHgjEqBHhRi5Egty+HAOoLE7331HzOD3O6P4r5v1gEcpB
	bgvmlusakgql4nr1UCjSlg9TzjkGVjspmLKEHGMC9AChP7xwR5gNgEUuIAFSssnEUQSpyDkxJkAQi
	04Mi5Pd3j/WaY1JFhyKbSyoAskwmbtgBrCJd4g/zLp7rLX+HSaIU8va+lhg22J4EOvBhIg3ZKY8tb
	bs2GIihMyJPnRu34gCzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb0NA-00000002sTo-0Q8G;
	Fri, 16 Feb 2024 15:43:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb0N7-00000002sTD-0cFk
	for linux-mtd@lists.infradead.org;
	Fri, 16 Feb 2024 15:43:30 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41GDbtS4011487;
	Fri, 16 Feb 2024 15:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=/TClJqpS+bBvRR6l6kjde6YHarFGL/FBzIBPSKAJuFU=; b=h8
	h2bYkCIh7hvXynXnyL5ltpS4Qc4WFGnjfggzmLwCP1+suiPjkCCWiGp0k+OC+BwE
	rlZ0rdJnGQV15WB6KqFmoV2CU25o30GknvrMLzhdPuPusKRrH7/VRlx7uXxXTtKo
	3s6HGQlBJEsc9T/Qcvas8R4BpEFGTDjCp6hCENoM6nt7gc4ycJeT8Jd3r8p3K0Sd
	bYz3bPv6kC1nR/2aqQmnsO9IxzXoGlNxIbNAnb6Lu5YRmMrc7en0GSDHd+j01xTy
	b7L+MhxVOWztPO5sqLvJ/Y7b5LkPRQ4f4nsivBp+scZUz69SqtzNMXajEaqelQEv
	BUDeHcuoCRS2kvfvAvpA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w9bfs4ckq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 15:43:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41GFhNnQ001001
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 15:43:23 GMT
Received: from [10.216.32.60] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 16 Feb
 2024 07:43:16 -0800
Message-ID: <ea840faa-e628-4f2f-a7ea-aa222f58f820@quicinc.com>
Date: Fri, 16 Feb 2024 21:13:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: ipq9574: Disable eMMC node
Content-Language: en-US
To: Md Sadre Alam <quic_mdalam@quicinc.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
 <20240215134856.1313239-6-quic_mdalam@quicinc.com>
From: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
In-Reply-To: <20240215134856.1313239-6-quic_mdalam@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BwJAlB4SoQosnOFzkFqSNVWefWffVrEn
X-Proofpoint-GUID: BwJAlB4SoQosnOFzkFqSNVWefWffVrEn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_15,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 adultscore=0 mlxscore=0 impostorscore=0 mlxlogscore=718
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402160126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_074329_359948_03DB741E 
X-CRM114-Status: GOOD (  12.43  )
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



On 2/15/2024 7:18 PM, Md Sadre Alam wrote:
> Disable eMMC node for rdp433, since rdp433 default boot mode
> is norplusnand.
> 
> Co-developed-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>


Single line of change is developed by 3 authors?


> ---
>   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> index 1bb8d96c9a82..e33e7fafd695 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> @@ -24,7 +24,7 @@ &sdhc_1 {
>   	mmc-hs400-enhanced-strobe;
>   	max-frequency = <384000000>;
>   	bus-width = <8>;
> -	status = "okay";
> +	status = "disabled";
>   };
>   
>   &tlmm {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
