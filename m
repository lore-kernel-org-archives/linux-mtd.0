Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E4FC4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Nov 2023 11:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wULVgSJD1JBZkULZj0TwAFRO1HKZQT7q1FCFyC7yr5g=; b=BLQm5giifo5ml9Wjr2CPjeNYcm
	C+6YiunHf4zr8cpYbse0kTqMB/v1dwsWFbmweJjnsylFTuupWk2FKAZnYJxP69O7hum61i+FQbrJW
	/dUuixtXNrIatPRVPKjhy5btX8awYJx5JmZg4A101qEA8zZ1Cm8zWiSIJ5rufEHe3SCn85IDGc6S6
	ff/Q1fyirhzJbIoL39TD/qoRzBmYpnL7y++7UMY6prUj45YG/NO9jE9jDF9fbvLu/ZrrGQcUHaNwi
	ZUygDxYhX1qENYRPFvBdmwKEh1QHBJp40Xr6yyUfP282vp0yXYfMV3z7JIL09q3HtkSjoTCPHOCrA
	MktwoXFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qysOk-00BKnA-2m;
	Fri, 03 Nov 2023 11:31:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qysOf-00BKmc-1T
	for linux-mtd@lists.infradead.org;
	Fri, 03 Nov 2023 11:31:33 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A39uAFA024909;
	Fri, 3 Nov 2023 11:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Y8JOeXpkaN/9qOWXaRwWuwLXex9oOmgIsk06K7x2svA=;
 b=dw+BTf+2CuPpJ+EcK3Ns0nrgKW+CsfGSq+YdPy5aS2sjS4DSal/T65ucBwYgpW0Nl8I6
 LxJO6bL1JZt5Uif8IJ1IlvEmfkGfLlhwDVN+X5kEmy7P/gXqIIBgz0YMlKE+f/3wHMHy
 z5ONcI27PyvuViIjpKaVVtxpbNyN8CNVkRgjnpufaxDevjbGx+3YdQmr1pL9E6bs36MC
 SBdohGfWOZEo5rF+1gPnwDkOGxnzB8/y3DqKDOaKlwcJqJ+Db6LfBj3RijOxpSRUQSrM
 E10hGCTs/EhsYj6YlixkaaeV5iNwml3EPFXvlf4mPni8yFiQZMgOvZLs11ACe5Dx/6ly Gg== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u4wmjgamr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Nov 2023 11:31:20 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A3BVJ1i001840
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Nov 2023 11:31:19 GMT
Received: from [10.216.26.1] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 3 Nov
 2023 04:31:14 -0700
Message-ID: <fc8d57ad-d9c9-9db6-122e-00ca9cc915b9@quicinc.com>
Date: Fri, 3 Nov 2023 17:01:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC PATCH 5/5] arm64: dts: qcom: ipq9574: Add support for SPI
 nand
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <agross@kernel.org>,
        <andersson@kernel.org>, <robh+dt@kernel.org>, <conor+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <broonie@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <linux-spi@vger.kernel.org>, <quic_srichara@quicinc.com>,
        <qpic_varada@quicinc.com>
References: <20231031120307.1600689-1-quic_mdalam@quicinc.com>
 <20231031120307.1600689-6-quic_mdalam@quicinc.com>
 <8be3b4f4-f3d1-41c8-bd4a-90adf1a02ea6@linaro.org>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <8be3b4f4-f3d1-41c8-bd4a-90adf1a02ea6@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BYboVtFXiK2hGQ90Qzd1aAcM57amnlk_
X-Proofpoint-GUID: BYboVtFXiK2hGQ90Qzd1aAcM57amnlk_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-03_11,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=999 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311030096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_043129_615834_7027AFAB 
X-CRM114-Status: GOOD (  18.87  )
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



On 10/31/2023 8:57 PM, Konrad Dybcio wrote:
> On 31.10.2023 13:03, Md Sadre Alam wrote:
>> Add support for QPIC SPI NAND for IPQ9574
>>
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts | 56 ++++++++++-----------
>>   arch/arm64/boot/dts/qcom/ipq9574.dtsi       | 30 ++++++++++-
>>   2 files changed, 57 insertions(+), 29 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
>> index 1bb8d96c9a82..5e4200edb873 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
>> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
>> @@ -15,48 +15,48 @@ / {
>>   	compatible = "qcom,ipq9574-ap-al02-c7", "qcom,ipq9574";
>>   };
>>   
>> -&sdhc_1 {
>> -	pinctrl-0 = <&sdc_default_state>;
>> -	pinctrl-names = "default";
>> -	mmc-ddr-1_8v;
>> -	mmc-hs200-1_8v;
>> -	mmc-hs400-1_8v;
>> -	mmc-hs400-enhanced-strobe;
>> -	max-frequency = <384000000>;
>> -	bus-width = <8>;
>> -	status = "okay";
>> -};
> How is removing SDHCI related to adding support for SPI NAND flash?
> You must explain your changes in the commit message.
>


its my mistake will fix in V1

>> -
>>   &tlmm {
>> -	sdc_default_state: sdc-default-state {
>> -		clk-pins {
>> +	qspi_nand_pins: qspi_nand_pins {
> node names (between : and {) must not include underscores, use
> hyphens instead

ok

> 
>> +		spi_clock {
>>   			pins = "gpio5";
>> -			function = "sdc_clk";
>> +			function = "qspi_clk";
>>   			drive-strength = <8>;
>>   			bias-disable;
>>   		};
>>   
>> -		cmd-pins {
>> +		qspi_cs {
>>   			pins = "gpio4";
>> -			function = "sdc_cmd";
>> +			function = "qspi_cs";
>>   			drive-strength = <8>;
>>   			bias-pull-up;
>>   		};
>>   
>> -		data-pins {
>> -			pins = "gpio0", "gpio1", "gpio2",
>> -			       "gpio3", "gpio6", "gpio7",
>> -			       "gpio8", "gpio9";
>> -			function = "sdc_data";
>> +		qspi_data {
>> +			pins = "gpio0", "gpio1", "gpio2";
>> +			function = "qspi_data";
>>   			drive-strength = <8>;
>>   			bias-pull-up;
>>   		};
>>   
>> -		rclk-pins {
>> -			pins = "gpio10";
>> -			function = "sdc_rclk";
>> -			drive-strength = <8>;
>> -			bias-pull-down;
>> -		};
>> +	};
>> +};
>> +
>> +&qpic_bam {
>> +	status = "okay";
>> +};
>> +
>> +&qpic_nand {
>> +	status = "okay";
> status should come last
>> +	pinctrl-0 = <&qspi_nand_pins>;
>> +	pinctrl-names = "default";
>> +	spi_nand: spi_nand@0 {
> no underscores in node names
> missing newline between properties and subnodes

ok

> 
>> +		compatible = "spi-nand";
>> +		nand-ecc-engine = <&qpic_nand>;
>> +		reg = <0>;
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		nand-ecc-strength = <4>;
>> +		nand-ecc-step-size = <512>;
>> +		spi-max-frequency = <8000000>;
>>   	};
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> index b44acb1fac74..f9c21373f5e6 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> @@ -336,10 +336,38 @@ sdhc_1: mmc@7804000 {
>>   			status = "disabled";
>>   		};
>>   
>> +		qpic_bam: dma@7984000 {
>> +			compatible = "qcom,bam-v1.7.0";
>> +			reg = <0x7984000 0x1c000>;
>> +			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&gcc GCC_QPIC_AHB_CLK>;
>> +			clock-names = "bam_clk";
>> +			#dma-cells = <1>;
>> +			qcom,ee = <0>;
>> +			status = "disabled";
>> +		};
> You're modifying the SoC and board devicetrees in one go, this won't fly

Will fix in V1

> 
>> +
>> +		qpic_nand: spi@79b0000 {
>> +			compatible = "qcom,ipq9574-nand";
>> +			reg = <0x79b0000 0x10000>;
> 
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
> these two properties usually go below status, at the end

Ok

> 
>> +			clocks = <&gcc GCC_QPIC_CLK>,
>> +			<&gcc GCC_QPIC_AHB_CLK>,
>> +			<&gcc GCC_QPIC_IO_MACRO_CLK>;
> Indentation here is messy

Will fix in V1

> 
>> +			clock-names = "core", "aon", "io_macro";
> one per line, please
Ok
> 
>> +			dmas = <&qpic_bam 0>,
>> +				<&qpic_bam 1>,
>> +				<&qpic_bam 2>;
> ditto
Ok
> 
>> +			dma-names = "tx", "rx", "cmd";
> ditto
Ok
> 
>> +			nand-ecc-engine = <&bch>;
>> +			status = "disabled";
>> +		};
>> +
>>   		bch: qpic_ecc {
>>   			compatible = "qcom,ipq9574-ecc";
>>   			status = "ok";
>> -		}
>> +		};
> This means the previous dt patch would not compile

Will fix in V1


Regards
Alam.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
