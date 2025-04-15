Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A0CC369B5
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Apr 2025 10:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jPBYyZcqpgaEpGZi981hU/EVGjbNTuSR8AL36GPyig8=; b=Wauq5p5YuADVvr
	5kKtfrx12T1TrfzMy7JYjBapyTsQBa4NALLBG6yRI0HqfY9AFZ/X1kCXmV4nqhSUbobsnJ1JGxvy/
	XCt1tRIFwQsddqgu5O7Q4Xlji6YWYq0T7rO7VIOLzeKfXoS2ygYzE2sxKel/LV8gD+P5MTnY6mp+2
	hiQGaYAgFYbwCJBkGNdMytnmwQWFgpwS8ggYLqxuHW4xQ6FrYLGFmIYW8brtvUbOiegb2IrVk6crb
	9k+wM5HsO9tt2lIhFRhsVK4qFPVJWAkcsZgQUiyff9LmVyWcsY2YW1Doo3CGbjmUrnX/URoWlDdZU
	LUMTfady6wifCmuFXCNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dEK-00000005HBp-24W1;
	Tue, 15 Apr 2025 10:09:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4cvm-00000005D7I-3uIF
	for linux-mtd@lists.infradead.org;
	Tue, 15 Apr 2025 09:50:16 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tN6Y013256
	for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2025 09:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M4otoQvJIRwA1ecqvKYp6bsWtA84oxMKucAKohhg1q0=; b=n7ooqLpY+2RedBiF
	5NSvJWacOMuffRbniHofEtoDq6dGZY+S1W/CDdfUHMEU62NRB+cRmAuqaTQYB0vx
	x92XAVK3IwZfhBhONUpWUW8Ec6T6eHlxFb/z1RYdKaeLTyO4N850gSZ9LFmyvrl3
	i13n6bDJrDLbYWOEbGhLPJYVcp+GsgWeH6BEEZLc/eL3dgGsNY7XqDw1TFXZVSZF
	2yKqoiy/OBARbG/gbJ0mVdC40xTV2XlaPoQ7xzXSObYSOCG2IcOOevN41QHqgPeA
	LDflCl5BHadsFuzI9VKp1sIcQitw1H5lx05gx2iuJ0htubGvhIBpTRKXB6TJZf18
	9bAJRg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6fj2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2025 09:50:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6eeb8a269a7so16604906d6.0
        for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2025 02:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710613; x=1745315413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M4otoQvJIRwA1ecqvKYp6bsWtA84oxMKucAKohhg1q0=;
        b=YJE1WWNvFZJyRzvCySPlOD5OIOHACMbftPZeH9ByPbmRT/vxcSpYZLmqcYjk91SEk7
         JCWCa2T9TK/ZA+0SK0lydC86ATVU/I6T8QsEff+kMg31l38HQOA2438bBXh2gQXx1ghK
         Eee6ovWJ0YwSobi0cpInOuxRhk3SE10q0dPCaizTMiBf1MoH6BXXR/X73xaV0qfDnont
         EfJcqv8o2dt4Jk9KJzdt0nnDNjAD78n248wfZ3t70RfbfWJDiNjzjbVbYkU1gubzAbcD
         WWUSwwWDpQtPuVpRTnTKssRF+s9PR4G2P2qksb+Lym7pbG5ruckaw3jchK14UZI1cvxr
         V7Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVkv/gQrv+88dMd1vPHSx7GZw+vnNw+wNZmcaY/cpMmsK+utu9D6YTLtQWJPQiXyRN9qohX7ejbBEI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyyZO69R1vYEd2N79vqxFskHo7iVkGRwTlqkc0lONo+N+vpdabp
	vjF+LvER1Z3NGMes7QEn4BxBVMEpA5NEDwsJyv0mLITAqEtRzx/pxjKKykck7l9avVdU8sK4Yua
	fRL4L9ErqcqXf3njPX1C4HgXv28dp5bygfNQqyWaOOJXpSs6gPjxiK5c34Cf7dNV1/3xqmVic
X-Gm-Gg: ASbGncuzD62oAMbqpJnkrAIil29oOZkZS/TALg0TYPkx7oZUh7xEtHjjKJNqkrmKMDT
	n5GX5MZsuuU9zwyJCVx6eHDUasnLoCTf7sxuCJ3MB1/d1yn8VcMSFRqypQA8Y8YxZ6XVUpkCu+e
	c7BNh05yFlNKDDV1NK4sZBJAKaUfc1H2n1Pvfbr9ejX2Cf+5KtKXjqDRLSwOJKLfZFCSWIu2TRu
	OOa6SWqZjh/ooXMdm+WHM63ifeSd3dQ1Qg2nA4QlN84VVrO7sxr1DoXe3QoEpoHkFtgNK/BbkzT
	zLo1TXWRporqeWP/iT9WqpOHxwEkoeZRXJeBYKdsSis9/326QZnSgxKiVwOEEqMM5PM=
X-Received: by 2002:a05:620a:4093:b0:7c3:d1b9:e667 with SMTP id af79cd13be357-7c7af1037bfmr965711285a.5.1744710612532;
        Tue, 15 Apr 2025 02:50:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESDG3Y3Ip/L9a2KjUkb5FyT2jIC/j7Y9psd3H/gAlaJPDHjXx117baUVmaFIGk1F2sEIbanA==
X-Received: by 2002:a05:620a:4093:b0:7c3:d1b9:e667 with SMTP id af79cd13be357-7c7af1037bfmr965708885a.5.1744710612124;
        Tue, 15 Apr 2025 02:50:12 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1c02549sm1059959866b.80.2025.04.15.02.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 02:50:11 -0700 (PDT)
Message-ID: <68a48388-f42b-4136-a97f-9d575fb84d42@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 11:50:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: sdx75: Add QPIC BAM support
To: Kaushal Kumar <quic_kaushalk@quicinc.com>, vkoul@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        manivannan.sadhasivam@linaro.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, andersson@kernel.org,
        konradybcio@kernel.org, agross@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
References: <20250415072756.20046-1-quic_kaushalk@quicinc.com>
 <20250415072756.20046-4-quic_kaushalk@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415072756.20046-4-quic_kaushalk@quicinc.com>
X-Proofpoint-ORIG-GUID: Kt2AI2t5mI5TCylpj1ejI8yPQYYNxn8m
X-Proofpoint-GUID: Kt2AI2t5mI5TCylpj1ejI8yPQYYNxn8m
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fe2bd6 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=6fcHxGdBv-_w1aurbSsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_025014_980599_F1A3DBA4 
X-CRM114-Status: GOOD (  14.59  )
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

On 4/15/25 9:27 AM, Kaushal Kumar wrote:
> Add devicetree node to enable support for QPIC BAM DMA controller on
> Qualcomm SDX75 platform.
> 
> Signed-off-by: Kaushal Kumar <quic_kaushalk@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sdx75.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
> index b0a8a0fe5f39..e3a0ee661c4a 100644
> --- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
> @@ -880,6 +880,20 @@
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> +		qpic_bam: dma-controller@1c9c000 {
> +			compatible = "qcom,bam-v1.7.0";

v1.7.4, looks good otherwise

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
