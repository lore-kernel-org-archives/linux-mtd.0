Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3E3C87FCB
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Aug 2025 11:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n5tjHFICraxT2a4YcnAtSuXJ4Ildjn4wn7tvF3c49DA=; b=Re3y77l8SyJ0EZ
	WuQ800oOh7d+0seNPr7+Pp1aWSHnZ1iFEApOVtPgHutIhUtnoHoGytdRRir0aCuqYr98j2czNEraH
	p7Gxj/YoGdjX9ppItkVXBOHL2Qzo/TJ4KVxxMImB0bhgnZL4qmHSrMbniBiyaEnFXy36951IGJGBT
	BDJ1S+KrRUZjepdBBTvoPT+mJeUnsc4W3kKCOB5aG6s3SC5rcQYg0iBGYwPTyI3Nig7YLlTdtO1Np
	c8k2ot6OQRsVuFSK8UJB3Bro2CBIOrZAMBvUAdhbWbjnhM0R1dD2SJH5EzV96GvB+qejWVFwXm3vd
	lpB7jdZimpU2vB0sVncw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhndC-00000005WX4-19Ko;
	Fri, 01 Aug 2025 11:08:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhnd6-00000005WWf-44PY
	for linux-mtd@lists.infradead.org;
	Fri, 01 Aug 2025 11:08:54 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5719BA2w018879
	for <linux-mtd@lists.infradead.org>; Fri, 1 Aug 2025 11:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZlE3qV+mNzUFwPUF4H6oGbnl6uDJ+rl7UeaU1GTP5vE=; b=Ly1LOp5tDiRfbOpU
	cptFRkB/Awc/tBPOP9meaq7H9uC7/SpkHjGWCSh8aqD98ZPot7EwSPl9fYNJErtf
	ngYFyYtyV+s0aafgcLHAtKV4/dILGPnlqB+uy8sldLgpqt8GokYEK6bZ+V/YMiqK
	54TzJQJC27QhQedkZA5OVV8MopM05ilCLxCmD53j1/9i1B2vbMkwprVRHHptG8oD
	z+AjiiUWhWGs50TfoMcx3WxKptMQSCtzBV+IlbL3Gx05EdAiSdni5eiaRrBoq293
	h+yozGlgNMFTQozg2TX5dW9yh4kqvDQf5JVjusjtP9OFf73qflAUc3FxaAN7Z2a3
	6rVL+w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jwgg584-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Fri, 01 Aug 2025 11:08:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4af0100c0b5so853651cf.2
        for <linux-mtd@lists.infradead.org>; Fri, 01 Aug 2025 04:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754046530; x=1754651330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlE3qV+mNzUFwPUF4H6oGbnl6uDJ+rl7UeaU1GTP5vE=;
        b=VwiMpL29TFknN368b50cXyVIwXX0K3fCWqIXy4EGg2K+vgF4C+JN8bJcFJjCtLUvgC
         3E3X4FFxxqEqb9gvkudVgZSeYndPCjW6E+Vd2lrcBpL6GA30+MmgcXqFfACWq5bgcl17
         QaChjCJhSmhp0qjNd0U5T+iWRpXS10c+Aoy8NFR60H2P2vSKyoYPhrmQ8jJmMUAbJpZS
         Z6U/T7LzpfsFrNlK1GCHSBYGaDHclOXQiX3XW0rdhJThYUhj9UN5WUjxLpNVaq6PS6QW
         MTYdlFMb50L/6oB/Rx2AX8X7+UX1TB7Fd0Dk6e8sI1Vphz1p4SmCq9o5bkdLXE+s/iN4
         fHfA==
X-Forwarded-Encrypted: i=1; AJvYcCUXMDXPWws9rOIV5thG4UBgIUHSJOv/VeXQwohGvITw/+DWO/RrIytXZ9nmWmaIgf9CtZpMOBCX8QA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6F0Ryk9amIurnM7+vGIKDjhokczEDYWuk4Hnd//QeCpwavpW/
	LMeFqGY4vQ5OpwHFxEOixv0ORN2ApRMZDULtYq/BMZ+DXgqeuDKvL+R0M4dicAHGfv92EEHJojp
	nXvDW0xkU291wGbDk2g4BAm3/f53/I6oXyCs3o+6ORJHEibGAm4Kug1AXTCGKSSyEl9cg
X-Gm-Gg: ASbGncsu0Nd/eU5K8TOfFZjHcmDIScPLJYzw7eqzWsitVTLPqZJLLRXpusvEdMtTgSQ
	KblBWs90/RwphV0TEqvTMecfmFrgdJ55OoM68gPGfHj68iz8/Um3sFHna4kd6SY4Bzic3C5GaZz
	zUJCXtceI2KC7Nw2QEdt4sxTwu1h0wYUs4s0EYr5IUX4ydM5D+vhm1Cv0YEAi01bu1KQ71l0bOi
	8YIrs758KPbM+NC+sXExeNeSaSw9I4sICcxO4sfl1WYxlU8iQtE2yaYtquc3fBy02IzvO5mpj4p
	FIP9ydce01dFbB8oBAeHNvqy1tlxSaTV7QDguJQ3qd1e6LVzd/OvUAwWAUpANZm/mdilgxIxQhP
	yMB/5D4peD1pKf+e0jw==
X-Received: by 2002:a05:622a:a20d:b0:4ab:608f:6d03 with SMTP id d75a77b69052e-4aedb94315fmr68387461cf.1.1754046530021;
        Fri, 01 Aug 2025 04:08:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHupyCwnbCrxlapDopTrC4Nh8m4/FCiCTtKv/hxGs3Ym6bz49WKmPYNy5lMAm01SKcOzpjC7g==
X-Received: by 2002:a05:622a:a20d:b0:4ab:608f:6d03 with SMTP id d75a77b69052e-4aedb94315fmr68387141cf.1.1754046529583;
        Fri, 01 Aug 2025 04:08:49 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a076aecsm270172066b.9.2025.08.01.04.08.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 04:08:49 -0700 (PDT)
Message-ID: <b2e4d6b1-25bc-4b2e-ae54-6588f1573131@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 13:08:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: spi-qpic-snand: use correct CW_PER_PAGE value for
 OOB write
To: Gabor Juhos <j4g8y7@gmail.com>, Mark Brown <broonie@kernel.org>,
        Md Sadre Alam <quic_mdalam@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250801-qpic-snand-oob-cwpp-fix-v1-1-f5a41b86af2e@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250801-qpic-snand-oob-cwpp-fix-v1-1-f5a41b86af2e@gmail.com>
X-Authority-Analysis: v=2.4 cv=WvgrMcfv c=1 sm=1 tr=0 ts=688ca043 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=OccjHAaS2H3VFpHfxMgA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: w8yXanwJBKmJkgHAm9vMeWO5MQ5RKn9q
X-Proofpoint-GUID: w8yXanwJBKmJkgHAm9vMeWO5MQ5RKn9q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA3OSBTYWx0ZWRfX4vWJqfCs5qsk
 eDmAqFuuCjXNeHXZxnUCtWb+nQG7Wpl/1iMK/UINfHGDZha8dwtPKeTkrJ/UE/rpFM1lXqRtWLJ
 GF8UVF4rdQLCK+faRHFoRbLPWoCgLcz6RUfXi/AqYEKCdcZwe0idr130jX01NhWSuLJdvEmRkq1
 fmTBRFDxz/SxdIkADB71fzQhXnLKF1xEVUJPLX4GLabl1/U0VwnvmCaGq5wzQ277phnixG7oKhH
 4Qi9j6eOgNVdUY25N8IjwVVtym/aWIFSQa7L/z+YTO0czx7bVN9ARH9VOehFjWuIE509AC3DpzU
 a1Gu01oVEEGdlBLzU492WBKNlkXV53+SqG19UbfubyctPPrXdgrcj3bwLnER7kepoFogZBxa+N1
 BeD1NdHiuUAfzNGk7J1+CcD6IRzRpxgoBXQl11f/NCZE+SQs5ZbnQPiDlfCx/rwHWxMGXqCZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_03,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_040853_023945_D6C2737F 
X-CRM114-Status: GOOD (  26.58  )
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

On 8/1/25 9:58 AM, Gabor Juhos wrote:
> The qcom_spi_program_oob() function uses only the last codeword to write
> the OOB data into the flash, but it sets the CW_PER_PAGE field in the
> CFG0 register as it would use all codewords.
> 
> It seems that this confuses the hardware somehow, and any access to the
> flash fails with a timeout error after the function is called. The problem
> can be easily reproduced with the following commands:
> 
>     # dd if=/dev/zero bs=2176 count=1 > /tmp/test.bin
>     1+0 records in
>     1+0 records out
>     # flash_erase /dev/mtd4 0 0
>     Erasing 128 Kibyte @ 0 -- 100 % complete
>     # nandwrite -O /dev/mtd4 /tmp/test.bin
>     Writing data to block 0 at offset 0x0
>     # nanddump -o /dev/mtd4 >/dev/null
>     ECC failed: 0
>     ECC corrected: 0
>     Number of bad blocks: 0
>     Number of bbt blocks: 0
>     Block size 131072, page size 2048, OOB size 128
>     Dumping data starting at 0x00000000 and ending at 0x00020000...
>     [   33.197605] qcom_snand 79b0000.spi: failure to read oob
>     libmtd: error!: MEMREADOOB64 ioctl failed for mtd4, offset 0 (eraseblock 0)
>             error 110 (Operation timed out)
>     [   35.277582] qcom_snand 79b0000.spi: failure in submitting cmd descriptor
>     libmtd: error!: cannot read 2048 bytes from mtd4 (eraseblock 0, offset 2048)
>             error 110 (Operation timed out)
>     nanddump: error!: mtd_read
> 
> Change the code to use the correct CW_PER_PAGE value to avoid this.
> 
> Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
>  drivers/spi/spi-qpic-snand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
> index 0cfa0d960fd3c245c2bbf4f5e02d0fc0b13e7696..5216d60e01aab26f927baaea24296571a77527cb 100644
> --- a/drivers/spi/spi-qpic-snand.c
> +++ b/drivers/spi/spi-qpic-snand.c
> @@ -1196,7 +1196,7 @@ static int qcom_spi_program_oob(struct qcom_nand_controller *snandc,
>  	u32 cfg0, cfg1, ecc_bch_cfg, ecc_buf_cfg;
>  
>  	cfg0 = (ecc_cfg->cfg0 & ~CW_PER_PAGE_MASK) |
> -	       FIELD_PREP(CW_PER_PAGE_MASK, num_cw - 1);
> +	       FIELD_PREP(CW_PER_PAGE_MASK, 0);

FWIW I'm just a fly-by reviewer for this driver, but the docs say:

The value is the number of codewords per page minus one
"NOTE: This field must be cleared for block erase operation"

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
