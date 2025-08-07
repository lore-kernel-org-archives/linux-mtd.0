Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A06C87FCF
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Aug 2025 11:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vt9hWBvrSzyD8sIyegbohJZD/SgqGhpXAFEddyfbKCU=; b=Zi1SaYnk0OJ1wA
	FbzjL+SJnHOyo90W1CtHZMFs/DsXuc0VWvTIfQ7EnLSyLR1lnFDMMZr7MGtvd72BSlmSVYkZEgLa7
	7Epn2Vs4LK+9PqDe8DakrjgUIu0eod3a5IXc49VVuruVRHy7rRJBMEBEORR+g/A7i3ZoYykh0714a
	0ZPZDgEz4fZatcOxpIHTK1+YgXTyN5miun2dS+kU1OhxFBsV/dmJ1DUXYm/KR8zqcnZuD19S9bs61
	Kd2+zEDV39eHeNfiji/VUxl7k7E7akytbhEXmIeCwkTwvxK2t49jP2zfcFZ0MO9fa0nK5vJH996oP
	r7MeavSrjef7TGJYanzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyxs-00000000OrM-3ht7;
	Thu, 07 Aug 2025 11:39:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujypT-00000000Nco-47DI
	for linux-mtd@lists.infradead.org;
	Thu, 07 Aug 2025 11:30:41 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779DFQt020568
	for <linux-mtd@lists.infradead.org>; Thu, 7 Aug 2025 11:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i07QIqXhNjjKtS5Fw1YccCoO4yzv0J/LSujugm/+4jM=; b=HLAGSglUTlZq93XQ
	yRncmEvWj4OIWX3Kjh3HFEb7vVO2YPECaOipD6GBFb6T7UX3hQDO+tG9MT+u/xOz
	U3W/N7seJ7UWrDTs0IF6xRJ+Fj/PBZzc7s74ziAyVAxOG7D6ahQed2wpy0Xod5nD
	byhEfOcrYmR9Rb8lsSESbVmZYz0gDcj9Hdl3Bx0hq24D5/Tt3YWIfFhy1Zoffd9k
	fpBPmV5hbxE3/jWeslSuyqPuuUiPwF0EbJmeaQlbCgrwSGYWpcIHBdbyAifhbI2u
	SdB+C6Ez2WUaITridhA08Wq6/fUF1Zat0uibHCvRdDiSN0htsYSfV3Qcur1Fa4Yh
	RPeMUw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy8e3m8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Thu, 07 Aug 2025 11:30:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e33e133f42so28370385a.3
        for <linux-mtd@lists.infradead.org>; Thu, 07 Aug 2025 04:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754566238; x=1755171038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i07QIqXhNjjKtS5Fw1YccCoO4yzv0J/LSujugm/+4jM=;
        b=VkHlU9FzFTzJ1x8IqEUvgDWJn8V/OI8SEiiICcbriQ0zKo/bqwNDmPSkp9usF0bgP8
         NIjlpl9IBHqIJH3C1EM/IVk+JgJS352FYi49wmrCYjCh5+QhQB9ho6RO66uqM+Zi/iac
         JnAaDd6EIEretl8yTUG7geJgUHIEBPrOtX3hq+UQ64AsUs2ZdcoWaKj6+DlwScNKQYaU
         1K/LICcaBiiv/fBhToVIuKjyNFz3/zJHqqPXS3IH1kFt1Q8Uym7ZMheaRBTnZXGRBbNK
         yi9kHhfFyrT07lQK68nZroVldqCM42u82rKt0PhPVjxOFDUSEwMUCnKi7vx+8RNW6usW
         mAdg==
X-Forwarded-Encrypted: i=1; AJvYcCXC9opBlRcBILCQX9W976ioHEt3O6iO6cCJ8GUzmKBUkghsfODL9u840/Gn+dEjq8wOCFu59G61WdQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwANp8ptDVhYpldeJ1RiO/QYSzv4TgcPAbEJV4Jriiil/NfhlO8
	plV1W4KjucQvLdZk+xVfk3MMh4ddsK1jsNB9Jc6qZMdWi9Tj5Sn+7kXhJG2uM8vFEZQ01TdixcQ
	j/buO58AHiINVd6NGpOK+UZQiIOgCI488VQKVmnOnkvDJ2C+lIKno1p+vbIWNHjLxgpE+
X-Gm-Gg: ASbGncsH4tQQD/JoItkq8k3cziPOUkbuQg+DoptI7zVKIBODzHuklPD/AAGjjhARJmD
	VfWqaMsioY29Dkg4FHpePGIyi6rpvWDRHYLw5VkGUhScBrEGmcMznKd9UoC34r/PlLMhpv3Geg3
	vuX3sFEQowNy7m1TZQlHP+qCtBgfH3vh//wD9S4jVo50BXFJYDpMlsVqSQArWDs3Mu2opAe5pKS
	IxhgxxSlWGDAubTKH0xDISWGqauNq9sqXrCCZ4FR24W2FE/U1FdUIc2D68oJbq52nwTD7hgpTIa
	ydSUwZkpKs6Qnv4Mxja6qUWK/S8lXh8Yt1jL1FWLIIUihQ+4DAOojJalJgqrZrjoq2e1y3Lj6Uq
	JhfCmhv+TIBQK4L1uvA==
X-Received: by 2002:a05:6214:1c81:b0:709:8842:56f5 with SMTP id 6a1803df08f44-70988425dfbmr20817726d6.3.1754566237868;
        Thu, 07 Aug 2025 04:30:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnXnONHbLA12/95Kl68dFu09ciwfUyG+iTcQrE/PkzMq5QqD4Es4erSTnNv0lGdP5+u6x8zQ==
X-Received: by 2002:a05:6214:1c81:b0:709:8842:56f5 with SMTP id 6a1803df08f44-70988425dfbmr20817256d6.3.1754566237129;
        Thu, 07 Aug 2025 04:30:37 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f16062sm11590909a12.18.2025.08.07.04.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 04:30:36 -0700 (PDT)
Message-ID: <4d2140ee-f757-425c-8014-3909873e7de3@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 13:30:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] spi: spi-qpic-snand: fix calculating of ECC OOB
 regions' properties
To: Gabor Juhos <j4g8y7@gmail.com>, Mark Brown <broonie@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250805-qpic-snand-oob-ecc-fix-v2-1-e6f811c70d6f@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250805-qpic-snand-oob-ecc-fix-v2-1-e6f811c70d6f@gmail.com>
X-Proofpoint-GUID: WHxAL5QjLFc2ss2IFKUsyuQ5x6rtxyn2
X-Proofpoint-ORIG-GUID: WHxAL5QjLFc2ss2IFKUsyuQ5x6rtxyn2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX7JRqM6uJQ1bL
 TT9j/m0GuZm8mfRu7oXUH8Kfqgqd5GxWiIDerMYZPNoYXzyEQ/oqQzMkSPReBU9cVOf/AsOFtK6
 0+RsuOsuBj8xxbFcf+4AOHjAsWsTJgts+Ua4j0DNdvKL6HHcRNMK+jv1H8MghJwEdZgnA20vBId
 A+fal0XYfuLgZH7GIG30PnyqX/ao4yI+sjhJfvTO4mmSk68b/fD7XgLSwuNb+0t4M6mNbgSyL71
 5x5uSl/hoyxsEjTtzBKI1YZZdxiVCdObClK18A60idLA4e334YEAHAxgutNlIGRyOgTStviF3DQ
 f76k0LHqoIHGrOeTY6P+po2YO43QKyx23c5hEqQK5vk0Qd2WNXTTu/YWurrrpZ+4Ve3T2LtOEI0
 ostZ8Dt0
X-Authority-Analysis: v=2.4 cv=GrlC+l1C c=1 sm=1 tr=0 ts=68948e5f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=Al3NFTvqZ0TCkL53jQIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_043040_025996_C501A1A2 
X-CRM114-Status: GOOD (  14.70  )
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

On 8/5/25 6:05 PM, Gabor Juhos wrote:
> The OOB layout used by the driver has two distinct regions which contains
> hardware specific ECC data, yet the qcom_spi_ooblayout_ecc() function sets
> the same offset and length values for both regions which is clearly wrong.
> 
> Change the code to calculate the correct values for both regions.
> 
> For reference, the following table shows the computed offset and length
> values for various OOB size/ECC strength configurations:
> 
>                               +-----------------+-----------------+
>                               |before the change| after the change|
>   +-------+----------+--------+--------+--------+--------+--------+
>   |  OOB  |   ECC    | region | region | region | region | region |
>   |  size | strength | index  | offset | length | offset | length |
>   +-------+----------+--------+--------+--------+--------+--------+
>   |  128  |     8    |    0   |   113  |   15   |    0   |   49   |
>   |       |          |    1   |   113  |   15   |   65   |   63   |
>   +-------+----------+--------+--------+--------+--------+--------+
>   |  128  |     4    |    0   |   117  |   11   |    0   |   37   |
>   |       |          |    1   |   117  |   11   |   53   |   75   |
>   +-------+----------+--------+--------+--------+--------+--------+
>   |   64  |     4    |    0   |    53  |   11   |    0   |   37   |
>   |       |          |    1   |    53  |   11   |   53   |   11   |
>   +-------+----------+--------+--------+--------+--------+--------+
> 
> Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
