Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66403C87FCA
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Aug 2025 11:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=niRiuvE0ujHXRkOuSxEAZyiVJlP/SzvZi+5txhyE1uY=; b=qB8VelLo25C1rK
	c1wMSfHW41NjVVykGOb/07pMu1gHDiQ8CuNad/smblV+5ER6HCdWbo4MtfMCst0aaE1DE3MAQByVe
	xTRV0URThAly6FX0IhAD0//cfkjPt2RZsMshsT8kYhEMbXNaS7eLFLZbsMrba3cPMVig3hcPW8ZyB
	ryd7L30I634mDxUwL+8AW8st6/FQ2KPOorJLoAItcpRb8iyATFi2Hm1rYmhvrKJILwLQB2cU5wkOb
	H9nT8qPaTQlSUbGrMdCqs6sVuUKBSenCa3xWFjep/7Yz+BSOyw7L82zGnMb7DJvWlqB2cJUH7F9qB
	dQc2bYKhtPLCaDNdV2gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhoNA-00000005bOI-0YQE;
	Fri, 01 Aug 2025 11:56:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhoN8-00000005bNq-1ApN
	for linux-mtd@lists.infradead.org;
	Fri, 01 Aug 2025 11:56:27 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57197hZs001415
	for <linux-mtd@lists.infradead.org>; Fri, 1 Aug 2025 11:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zndqvOkOtBLPZgcibFTCnMvRTtpty67nrf8mHn7tQxk=; b=p9IN4Dd3lbFcTTye
	K+bXpdj2dG96CxiXbECJgun+DGtRDE8rlOyp6Ql1CJxvYR1fbvriulvHrDviZLon
	S3q0IPjExlZdre1IfSHMVcwInjl4mTnfRUJS+Rb1RGKYf7tYaBU/GK94jJWy5DRd
	8EE2uDN4p+bhK7ErBOtFh4UZEb08AH100Gynv5P7iIX5vbblqMFa8RQz8JpYYagD
	hpbgxwLP66N18MFQG2aDS5TcGMWZS5NrZ60UKobFIupPisnWSlY+u5i62k+HPDDO
	rQcE9M7THk+S3BukBuosfQ/0CXy85ViHMY8fgjCdMszRkt0iltJKciXh243RAuOC
	/q0Fag==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nyuc6c5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Fri, 01 Aug 2025 11:56:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-707641946ecso1992196d6.1
        for <linux-mtd@lists.infradead.org>; Fri, 01 Aug 2025 04:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754049384; x=1754654184;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zndqvOkOtBLPZgcibFTCnMvRTtpty67nrf8mHn7tQxk=;
        b=XIK0zVSSiS2Z5jITUChICCA4b+yLm2HV5zwLspJXJxamWiCXoGUFfkZ92T6P2t8+Rt
         yeHaTtmXfmWt+9VOWBq5p+Plp3vqxXiFslpv8D7UhE55CtT/FZgI2+y5tWuET+oDlg22
         ldV6BdS57Qb7RDJrH7Je/ApVITzl0NEy9WWuLBY08iJ/KN2zQrYUxfEo++L3bacygNOh
         KsEFHd0GQN54hlf8g6fqEo8ZFGQBKpSw8J3Zfttc0h7E3eeCk9YaF22UoSIK1L6BkpFv
         1LRhM4vsAPpOl86R4/jnewaca5Uztd1I3gu5O/znGji9XdoZuYaZyMwmG8ozraTlV26i
         NUVg==
X-Forwarded-Encrypted: i=1; AJvYcCUjA/RYfp/CPUmdiPv/snoQaevd0M0gAkchAiFtOBpwkV45/6XF/Um5d2iLMemCoioEQMD+Q/UnCiE=@lists.infradead.org
X-Gm-Message-State: AOJu0YztQu4HLQ7Mgisxlnc9WGjyk6i0mWbY6INDoDwQQ78S16Mf5FFi
	U/V3b6Pq9xoLzXDBtIn65vzhMyzHWrr9H3MnJZGE1kxDLN4sc1Ef7v0hufOACIEYcOTG4XIX7lZ
	HIhsxVqa/VyAQq7P+TIKN7gJsxneLpVh7MOIzpig/oq/lK8he2aVJ1AhCnw8yIvZdLgV/
X-Gm-Gg: ASbGncsadpTbH9GddrgyamFBaWEoUI9lfzs8OUlDnr9+OiRhoI8Vf3TPGnK/kZP8gtQ
	EZLTcs8qzh2f0bdkkA2tqU4s9Pdp16WObvTao7dNiLvQQV222eXK/lt5LtyjJ8dtIh8/L6n+a7f
	sf3ar85rri6Yx4gYh/3wEjt+DxA4tQRi7IxLQet8NEPx7G2TzwtoplRYbbKFfdyHWYYdYfmDjWA
	X0etmb2d6jhlBqbx0KT7/SgvMb5+CGtqWB6GI17CVGEBHo35hGwYCrY72XpnlCbQfa7MteJBMBP
	aKon+FgA0CPYNfZzxntNGD20RYMP+lws8hEsU9VHeC2N9HTAcWq1CA2JLUlVt5faylzxNmF2FWe
	WH8xBKadjwdByalxuAQ==
X-Received: by 2002:a05:622a:311:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4aedb9a1268mr83455851cf.2.1754049383882;
        Fri, 01 Aug 2025 04:56:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJrDwZ4CqsLIhFn16pVJy0wpKGA9BP8YTsdrizbhvNE1Pr9Ax5WAkfuilF6IXeAquepVZw3g==
X-Received: by 2002:a05:622a:311:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4aedb9a1268mr83455581cf.2.1754049383412;
        Fri, 01 Aug 2025 04:56:23 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a313esm277885066b.32.2025.08.01.04.56.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 04:56:22 -0700 (PDT)
Message-ID: <72d5f805-1637-4c82-af25-e78b978c5799@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 13:56:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: spi-qpic-snand: fix calculating of ECC OOB regions'
 properties
To: Gabor Juhos <j4g8y7@gmail.com>, Mark Brown <broonie@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250731-qpic-snand-oob-ecc-fix-v1-1-29ba1c6f94e5@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250731-qpic-snand-oob-ecc-fix-v1-1-29ba1c6f94e5@gmail.com>
X-Proofpoint-GUID: 8vkttQdOQsiQkSt2UmNtZDBc8QWWyGtQ
X-Proofpoint-ORIG-GUID: 8vkttQdOQsiQkSt2UmNtZDBc8QWWyGtQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA4NyBTYWx0ZWRfXzUWOfyXoksod
 MfpG5ln5oaSm6/rXHaEoK4Om57cpmHqLa+LELg9WtHgRxTh1rehFaxk1frqwlUjvkTXhDxGJCU2
 oPiL9rSNGWh4fadEll0ZfT/QW+NTa7BIIFw2GNwf0VHXny2QMFk5VXiyBeUgZaYcXXZPZZ5pUvl
 YJisrofxdERaqgQFoqkCYCmJUtbdhChl3oZylm35FfxCRe6SycroG0HuiokXwH3WFZ0KUXRwPoW
 twZwQIrw/0JOgFjCLUH4BN4b7fKkYSWGw/MJNy2GaRkmTtTd/eqVSe/5jjoOg3mIJnWdeCpYSy0
 yGz5i+gLT71Qz8H8ecApXPyGwdNG5hfgyXK3WLynTgRDglWA2dDqx5CKcDLDnl4azWXBCCaQpiS
 8r6dTkWJzGi9b+E/wB61Q7BOshH0CxTHq6VKBs2x+E3PWdSFizJ0KIC/mfGZ92zTPiRBrryQ
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=688cab69 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=KpljTfsc1uQhhnHPe74A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_03,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1011 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_045626_328377_12765719 
X-CRM114-Status: GOOD (  24.33  )
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

On 7/31/25 8:11 PM, Gabor Juhos wrote:
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
>  drivers/spi/spi-qpic-snand.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
> index 0cfa0d960fd3c245c2bbf4f5e02d0fc0b13e7696..37ddc48d2c17264499f821d235835c4ff5982873 100644
> --- a/drivers/spi/spi-qpic-snand.c
> +++ b/drivers/spi/spi-qpic-snand.c
> @@ -213,8 +213,16 @@ static int qcom_spi_ooblayout_ecc(struct mtd_info *mtd, int section,
>  	if (section > 1)
>  		return -ERANGE;
>  
> -	oobregion->length = qecc->ecc_bytes_hw + qecc->spare_bytes;
> -	oobregion->offset = mtd->oobsize - oobregion->length;
> +	if (!section) {
> +		oobregion->offset = 0;
> +		oobregion->length = qecc->bytes * (qecc->steps - 1) +
> +				    qecc->bbm_size;
> +	} else {
> +		oobregion->offset = qecc->bytes * (qecc->steps - 1) +
> +				    qecc->bbm_size +
> +				    qecc->steps * 4;
> +		oobregion->length = mtd->oobsize - oobregion->offset;
> +	}

How about

if (section == 0) {
} else if (section == 1) {
} else { return -ERANGE }

?

FWIW the values match qcom_spi_ooblayout_free(), so the commit seems
sane

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
