Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D17FC48260
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Feb 2024 15:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AbyZ2h4mjmLZjteDuUHFkiqc3ylY1qXxp6eggWSEnQo=; b=dcsGs1gajjouHf
	3+r7HHsgMgZHQcptqwIeeRtTjUgAWFhKs1P3M0eJHW2vtS1fkX69cwC8ze6piDAunO/djP88ko2yR
	u7MfhlKSK3Khrs6tX47dMpaDhN/Jjq9ctyAWFZL/GnFySHwX9GFW1axYz02KliH3GzqP9Kss2VcFu
	c2sEhkBJF16pbBj+ZxRIYwWbu3OAzOvqj6SWEEwEM5Wv2SrL6nJhJVWe1a6oRfI5OdDnWvE+OJYn3
	n5FEQj+UaIzArmcSv6S5LvXE8NtxFZKDYnKYCVdMZc5LhZV2ly1s41go2VuGlp0WCkQaOY0Lcxk9I
	/1JXJFjGheX7c9CyPNig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb0KY-00000002rfF-1Iww;
	Fri, 16 Feb 2024 15:40:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb0KU-00000002rdj-2nJN
	for linux-mtd@lists.infradead.org;
	Fri, 16 Feb 2024 15:40:48 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41GDZ8Bd031229;
	Fri, 16 Feb 2024 15:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=kahaCjahMWDF4y8yM8htOlv1FY4glQMHTdWBNdyHkcY=; b=Yl
	NB43Kty1huwQOtg+YPiq+vqus3647/GsmwEiqhSDmK0UJQwtrkkpqjgLDhWpBoME
	5nu0VpVJPYl66kvhxE8DyVLS4xMHg5isfvLp00aiXO3Lz13If/gpLBYs7+RBvTWq
	8m+6W+eBoBEpTmZDtQ0MMuI/rxJkO34CYQTb7rc9Z4EuMS309LIzHLRw/7EUJQv1
	JJVhe8XtX86U2L1qomwhOCXKDkpOH5wjFYn2Gf+NvDiAKoQpETKQZx+fb4vWGg73
	iQ3MC5lYQRUexIA9GFlv0ttenIr03UIV0HeilVZ93s2kBKiVPBPsavcuDJqHix47
	zLYC8kTivDmMVTi88v/Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w9wxf1ekg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 15:40:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41GFeejx005904
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 15:40:40 GMT
Received: from [10.216.32.60] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 16 Feb
 2024 07:40:33 -0800
Message-ID: <17c6b3df-2acd-45e2-8167-02c629b1e972@quicinc.com>
Date: Fri, 16 Feb 2024 21:10:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: ipq9574: Add SPI nand support
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
 <20240215134856.1313239-5-quic_mdalam@quicinc.com>
From: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
In-Reply-To: <20240215134856.1313239-5-quic_mdalam@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3KcsEsejO-HkA8HjskYi5QH3C9VhFz_j
X-Proofpoint-ORIG-GUID: 3KcsEsejO-HkA8HjskYi5QH3C9VhFz_j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_15,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402160125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_074046_877255_1F625549 
X-CRM114-Status: GOOD (  12.83  )
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
> Add SPI NAND support for ipq9574 SoC.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---
>   .../boot/dts/qcom/ipq9574-rdp-common.dtsi     | 43 +++++++++++++++++++
>   arch/arm64/boot/dts/qcom/ipq9574.dtsi         | 27 ++++++++++++
>   2 files changed, 70 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> index 91e104b0f865..5b54a027fa5d 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> @@ -139,6 +139,49 @@ gpio_leds_default: gpio-leds-default-state {
>   		drive-strength = <8>;
>   		bias-pull-up;
>   	};
> +
> +	qpic_snand_default_state: qpic-snand-default-state {
> +		clock-pins {
> +			pins = "gpio5";
> +			function = "qspi_clk";
> +			drive-strength = <8>;
> +			bias-disable;
> +		};
> +
> +		cs-pins {
> +			pins = "gpio4";
> +			function = "qspi_cs";
> +			drive-strength = <8>;
> +			bias-disable;
> +		};
> +
> +		data-pins {
> +			pins = "gpio0", "gpio1", "gpio2";


As per the pinctrl driver[1], there are 4 data pins.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pinctrl/qcom/pinctrl-ipq9574.c#n296


> +			function = "qspi_data";
> +			drive-strength = <8>;
> +			bias-disable;
> +		};
> +	};
> +};
> +
> +&qpic_bam {
> +	status = "okay";
> +};
> +
> +&qpic_nand {
> +	pinctrl-0 = <&qpic_snand_default_state>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "spi-nand";
> +		reg = <0>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		nand-ecc-engine = <&qpic_nand>;
> +		nand-ecc-strength = <4>;
> +		nand-ecc-step-size = <512>;
> +	};
>   };
>   
>   &usb_0_dwc3 {
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 7f2e5cbf3bbb..d963dd2035dd 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -319,6 +319,33 @@ tcsr: syscon@1937000 {
>   			reg = <0x01937000 0x21000>;
>   		};
>   
> +		qpic_bam: dma-controller@7984000 {


Nodes should be ordered by unit address in ascending order. So please 
move these nodes to the right place.


> +			compatible = "qcom,bam-v1.7.0";
> +			reg = <0x7984000 0x1c000>;


address should be padded to 8 bytes.

> +			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_QPIC_AHB_CLK>;
> +			clock-names = "bam_clk";
> +			#dma-cells = <1>;
> +			qcom,ee = <0>;
> +			status = "disabled";
> +		};
> +
> +		qpic_nand: spi@79b0000 {
> +			compatible = "qcom,ipq9574-snand";
> +			reg = <0x79b0000 0x10000>;


Ditto..

> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clocks = <&gcc GCC_QPIC_CLK>,
> +			<&gcc GCC_QPIC_AHB_CLK>,
> +			<&gcc GCC_QPIC_IO_MACRO_CLK>;


Fix the alignment.

> +			clock-names = "core", "aon", "iom";
> +			dmas = <&qpic_bam 0>,
> +				<&qpic_bam 1>,
> +				<&qpic_bam 2>;


Here as well.


> +			dma-names = "tx", "rx", "cmd";
> +			status = "disabled";
> +		};
> +
>   		sdhc_1: mmc@7804000 {
>   			compatible = "qcom,ipq9574-sdhci", "qcom,sdhci-msm-v5";
>   			reg = <0x07804000 0x1000>,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
