Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C5BE77179
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Dec 2024 17:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RvY9SakhyIlrxTAQ+dHFgzsD953ncSJqW7RslzKBcTg=; b=hdNn8zoepXknrW
	W9/uoX1SPgXA+zk4ZU6Jh84LpFSGKOzXAwsSORdM5DHYQDVa3D6ROCJ9e/lQEgykH9nqI9e4yFCEK
	JALwr9B2YeLKRmu+LhAcySfvPrWuprb2E+qGfdxD5zGdHGQNGJ59NLWcHfGJtSsAZT5WlrEOLD2oa
	QcZGwJQ384KizdVr05EbEudYlmjCaTQ5BMmBK1rAJ0kgx9sF0KhVAC2rBDh1JyBtUSKTxzSBfob8w
	zvPFKx1GmpbMF4Aj7nNZIKJX2a7gd2Wi80EefR8VNd8lYDdy+NX/jJYaY6+eeCxciDdNrNd48KK4F
	VSHhB4+q268+oSctqHvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFd6-0000000GwlZ-1tIE;
	Thu, 05 Dec 2024 17:27:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFVh-0000000GvAx-12P7
	for linux-mtd@lists.infradead.org;
	Thu, 05 Dec 2024 17:19:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B59ghoP029886
	for <linux-mtd@lists.infradead.org>; Thu, 5 Dec 2024 17:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b2LZXubXxt0wXoBWUWDvvdcZjo8ptXI01DoAjxRfdtY=; b=lMWjN/ihVKDTbF27
	/9o7ls8/KzeIgN0rOdEyPVBdhVcQTuC+L473GzrXFYcs35I7Q3FPfIx21YWNL4Vi
	gO6K8npY5ApznvQtDKlEGdR/l/G2+JAUO8v/kUhRkbYIdPsib4YB0pKgdVlOdFg+
	yZjU+d1K+4j1x59OdFWROS6sg5X2cKGoW+msfvpOysVSPiNeu5FiRyWEO5TnP6n9
	kyc6JP8a6masegVwmZ32/brPpW7aA8ek9YL+s7hW/TwTlHZkiJj8G0Q8jJXyWU7Y
	MKFwHlKLqG4crLdAEUuPlijtXPDeK2zmLIa9Vhvg0mp3P4B1nGDII8TuBxIdumFw
	41RPqQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ayemasm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Thu, 05 Dec 2024 17:19:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-46680667b3aso2783551cf.2
        for <linux-mtd@lists.infradead.org>; Thu, 05 Dec 2024 09:19:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733419167; x=1734023967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b2LZXubXxt0wXoBWUWDvvdcZjo8ptXI01DoAjxRfdtY=;
        b=Rxj1jC2zfFoYDidzaSeHVSf0YRJ3ORE2TR5so1lBZfZSfmUJ9nQ+peP4/3dcrhLPb3
         DbOrJstgJK0qJdcdt/emEYIpN0offqTLu5bDDNAw3k93x4yqkgos7X7gRD/OrI7Vy7Kf
         A5YeWs8Q7HUtoiKViYvC8dmztgYE6i+g4iy/DegS2KJmLuhOb9YMw2X+zylaTXG3yCCp
         al7obVgXpPYREuwvkeQSKPLaglLVy5OgFE2JghrFiEGMKnYRYdAIIqY6xQqsNY5Y80ni
         E6XIlfy6BNkZQtneHp63LFYVGGcpvK+zGQV/MiumwS1g/X2bq4tJo5mDX06pWolfQSXs
         a5Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXmgu3k1He0AuLrkA5yrJn2waQ5Nt3V4sr0imWpqExOq38JWeLCCK2/9gDIj2W3+bbQmtU5d81hfho=@lists.infradead.org
X-Gm-Message-State: AOJu0YxCgem+1NrsRA1jWNSffrTx9u0xFtekDmkERm1UCtuaFyPlUZkR
	MeK7V3Z3THQbgrk15VA8X0LyyGFXQfutXPAM3jDVl1lKJvYI7qO0za8UObjebLXPlfibiWqgiW8
	abHlLfaKe36FmBIrAGl2cDtPNakUJbdhrgyjjUB+v6RjngyxEPyMhd9WAqbsGi3tU
X-Gm-Gg: ASbGnctcfzDrUNv8aoBvhIlDTFS0VyTtpdy58YOpbyrfVwLcVajxYopvFx2L+2wgZoa
	DIB75UL8x9lFtjOumQfkxDopuJVvU5C167fc1+KomKUwzGzPvAcYARdDYwMKuXfDnfbB11PbaCF
	3Ivndj+9Dm3LhlCJfuxIWsAlOqvTeWfYp/IXibd69iIZOl5+2Ck87JbUwKHYTqskEORdUuRQlic
	9IJV69G5++IMv5savPlHQb1yHjrkF4bHMeY55DgY51edkMwyyteU7pSKRqLYhot7k46yLReB47x
	BGu1vOHwS3Zc+IYVFHqJbwUPCrEw5sY=
X-Received: by 2002:ac8:5f07:0:b0:461:6599:b9a with SMTP id d75a77b69052e-4670c3742e7mr76163371cf.11.1733419165692;
        Thu, 05 Dec 2024 09:19:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEU+qJE6QKbgG5HlW99mhr99xiUoytBvTGuUz4N/wFy5f4STO28PHZ+UXuC1vGJjl+c0VW2ow==
X-Received: by 2002:ac8:5f07:0:b0:461:6599:b9a with SMTP id d75a77b69052e-4670c3742e7mr76163011cf.11.1733419165176;
        Thu, 05 Dec 2024 09:19:25 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e4db84sm120014166b.41.2024.12.05.09.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 09:19:24 -0800 (PST)
Message-ID: <4c1fe789-5190-465d-bb41-3fe1534d2523@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 18:19:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 7/8] arm64: dts: qcom: ipq9574: Add SPI nand support
To: Md Sadre Alam <quic_mdalam@quicinc.com>, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20241120091507.1404368-1-quic_mdalam@quicinc.com>
 <20241120091507.1404368-8-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241120091507.1404368-8-quic_mdalam@quicinc.com>
X-Proofpoint-GUID: MJPmncjPO0w5SG16H-sjXx8AyJU7US0A
X-Proofpoint-ORIG-GUID: MJPmncjPO0w5SG16H-sjXx8AyJU7US0A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_091929_294456_F582FB32 
X-CRM114-Status: GOOD (  14.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 20.11.2024 10:15 AM, Md Sadre Alam wrote:
> Add SPI NAND support for ipq9574 SoC.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---

[...]

Feel free to put dt patches in a separate series after Miquel picks
up the mtd changes

>  &usb_0_dwc3 {
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index d1fd35ebc4a2..45fb26bc9480 100644

board and dtsi patches should be 2 separate ones

> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -330,6 +330,33 @@ tcsr: syscon@1937000 {
>  			reg = <0x01937000 0x21000>;
>  		};
>  
> +		qpic_bam: dma-controller@7984000 {
> +			compatible = "qcom,bam-v1.7.0";
> +			reg = <0x7984000 0x1c000>;

Please pad the address part to 8 hex digits with leading zeroes

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
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clocks = <&gcc GCC_QPIC_CLK>,
> +				 <&gcc GCC_QPIC_AHB_CLK>,
> +				 <&gcc GCC_QPIC_IO_MACRO_CLK>;
> +			clock-names = "core", "aon", "iom";
> +			dmas = <&qpic_bam 0>,
> +			       <&qpic_bam 1>,
> +			       <&qpic_bam 2>;
> +			dma-names = "tx", "rx", "cmd";

Please make clock/dma names a vertical list, like clocks/dmas

Also, is it okay not to use any of the GCC_QPIC_BCR/
GCC_QPIC_AHB_ARES/GCC_QPIC_ARES resets found in GCC?

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
