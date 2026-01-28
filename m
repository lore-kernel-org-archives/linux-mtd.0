Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E74D25B77
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Jan 2026 13:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k+W6lYBZwzmEf2SZmfEPtT1X5qAhJ4AHwie2bzfhKlc=; b=vQKOUFDfDNF5WU
	8dtdDfrutn9AVyCua21pzW4vx3DW5+ohiXtePrHu/uoFPr4czBjxRSL3rFJn839LUnvLbkm1zBr3i
	m0NL5/BUmHo6BO3SLc5QJl8wYnRGgw+I6dcgfhJn/W+TxmfUHGkFPHT1n3aC2U9Vae7woWQsHR9n6
	4M3NJ+Ww9hweBKU8Px400yZlktSyVIgN9ataKee2SIM8HYg6GOtCpOVXeLyAA2+gsC0wr/4pfYoFs
	S7zUzvQGr1AuidG55k9un5tA0emOPcrQOWXPBszKy52xMgogRYUW5mKth/LGO8bnf4ryhVMEMjmLf
	zHUfUZR+IZZlsp+oqsEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5ll-0000000G5Xp-2Koh;
	Wed, 28 Jan 2026 13:39:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5lh-0000000G5XP-2tOi
	for linux-mtd@lists.infradead.org;
	Wed, 28 Jan 2026 13:39:39 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92VjQ254569
	for <linux-mtd@lists.infradead.org>; Wed, 28 Jan 2026 13:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O0osrPFbOmiLuUfjxs6qOPLzwDxoVeeFwe/w5K5EmiY=; b=AqvPLrUXHLL3QCAK
	DyR2H42rHtAQGvGHUchvEeAneNPKtcrsyejkuFdT4Iw9QiIi6MgefzzHMtdHkmnd
	ln+bXy/ngfBwiwR4K055lRzgVep+6clClhNIgVkgUP5o9L1gOJ3ov/hOl04laSAO
	wj4s4x9Ttpsz37VOBpabOgOtzF4vsCv0EYXdvK4J2Tf7Ym91CGIEnBvXG1jlIlvr
	T6PJs9CzL99BlgRX4hGnKnf6G0lTkFPOYfmDJznldaKeDNyS6JVDF7N5JH3vGgHO
	cyUmaTgxLX8ro1k7KwrD7k5lgW/x8RFY9Bp9LbmusE579YAbF2wfgVg4U6/PG59p
	fFY2lg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by20y3j70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Wed, 28 Jan 2026 13:39:36 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88887682068so25901726d6.0
        for <linux-mtd@lists.infradead.org>; Wed, 28 Jan 2026 05:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769607576; x=1770212376; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O0osrPFbOmiLuUfjxs6qOPLzwDxoVeeFwe/w5K5EmiY=;
        b=T/98fnFVdgy8Zm7rmMuTwbkxsqlWzMA4GrFBztaAXnNAicilSYmqOmO+TvpeeapcGT
         bUBr+f4idEHpt5YxxUeTBcpPK1IDbzUl9xAESLSYduvzv5KFVkf/WANRmcpp7K9FOMU2
         PL5OBMe+PmAXjB7bAxB+ZFm29J7T0RT1pLqkKWEdJJ0gepRSaH/4y8a1YwAbVrq3mtKM
         DVe+CSDXIg6L+HHks5nTBq8vIv3kmaFRUMU0xWmRvqlCuuAJ5CKymGsCP2QSda0xRTQd
         OtgUchW1/d5Qzhfv+4ldzwfnhcTtdq2F0StLb4b7Q3VVA58KNy9tEjjCpKtd/nqnC01w
         Eo5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769607576; x=1770212376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O0osrPFbOmiLuUfjxs6qOPLzwDxoVeeFwe/w5K5EmiY=;
        b=ICGpkOvupXZgbwjjdvsISzDvueoygVL5Bf3mOIggeBimLaZ+wVY0KgEJs0BMXz0kpd
         oYAH2qKncDF2N/PwyNnvCQmoRqWtSLtYiQoJiPjnfa5HpP61t/GjVMG0cB0IqcuKM6Ks
         YYiYkBpN6AaHwAlW9rJLURBpz7mlU3UiodQO9cgALmV2Q7E1BJgwUcxn2fpX7j0oF0eZ
         dmtVbXRScr9QV/BuFH75c6MRPy4HjAeYf2MCpXs+V4YNn9WL3ES03N5+ZirDSE53bLSW
         Hyrec4ob9lO88Pu7uHKfDXJvVaPte3LZDuQuB7ebEHlh5mRIGCoroeferYOAAlBCpd/J
         ij/w==
X-Forwarded-Encrypted: i=1; AJvYcCXCMfKByBkbmfE1A1r2kDbxhjvm0yKRVH0/fclzX4+qDAVCUnRm8xe81J7D3tyzLyadguoogIuWMeE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwnxHqGMh/sFojowl0a6dMxYMqHibxLCVrAetMvqrfC99I6ctJ7
	bjg5TyWbqc5wrXOxOvOoCVIIM45wd30Kuc+E84j5acJYYTgTTYTqfNs+nU3E5Pf3y5cS4VkrR6R
	K6+F8qQlrGrkQPO2iFKM5eQnVq0/XpAPVr/d5+T6NbX8mDMHOSSYdhZgMc5LPa5U9F4Fc
X-Gm-Gg: AZuq6aKcZvn94uPGMG2ZdEGZP2M6DOC6oSus5X+iGWrmDr5FwYIIWl+1RuZk75uGwua
	HhmnnQCXZV1yl212ZYRDpWdueqwWKs2GfIHlz37Qcvpb6pVYtUdM7RGzah+qxPug5P2i38vaccU
	yiYYeTKpRSPMKUmQxljr8EHV/f7Mtv1RbeLrQPvXlV4+CfFFEdyCWmpRNkz481qnro3646viAhq
	edV9VvjqD91N0eqD1zI7WI7YbExHxf+fnKwrbCXYGllTMqOvDmU5RRAIQV1xw0dMsTuCrHRQfFp
	gM3Cv74ASA1NLT5L3ax4ZrXCAA4KSDVbb28ee8UYso6wcA2lly9pjWWvQuFFNqBg1ArGccAtR2y
	eMMJUluQIsZx78ZKGTnynsujndYQkb/oq+jl/gNSSdaSqi8RZd13Vq4fcPyyV7HW4EBc=
X-Received: by 2002:a05:6214:3304:b0:894:8fc0:13cf with SMTP id 6a1803df08f44-894dcd227e1mr3737446d6.5.1769607575858;
        Wed, 28 Jan 2026 05:39:35 -0800 (PST)
X-Received: by 2002:a05:6214:3304:b0:894:8fc0:13cf with SMTP id 6a1803df08f44-894dcd227e1mr3737086d6.5.1769607575450;
        Wed, 28 Jan 2026 05:39:35 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b469e45fsm1500146a12.24.2026.01.28.05.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 05:39:34 -0800 (PST)
Message-ID: <2d28b5d0-c5f4-4085-b2d0-18128b021416@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 14:39:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] firmware: qcom: scm: Add SCM storage interface
 support
To: Junhao Xie <bigfoot@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org, Xilin Wu <sophon@radxa.com>
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
 <20260126-scm-storage-v2-v2-1-fa045c7e7699@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260126-scm-storage-v2-v2-1-fa045c7e7699@radxa.com>
X-Proofpoint-ORIG-GUID: qFZDq0oQBnJQv4xPOu8zlAzJhzP2G2Sy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDExMSBTYWx0ZWRfXwFUnOSOeEqUE
 JWSMLbqc0Y525QVdw1lqrx1icz2JkhxDbNZIK7qj0BRnkhZIhQ/llF4FJGM8xD1HgKNbVfSP9g4
 qrZFPV3nSglfTtls8Sj/9na5ktjcUGZyi/RZEUKw3QpSHb//pw6UQVFrEpLA7BCHcWo4o6uTPW4
 3Yem1QSbROIwCHEswYAfw82j3KbtRoZF4ZjPno0NRyA1dxeKgRqfSvE9J3eX4EinHqV2qBMXFnf
 9z0ZAwH74wLqPxC5bglgnW50c+FDhNr9m6HYBD43p4NRIVsdz272Bxvgm+SpuXqfphPtIOhXRmB
 IfCCzZIFydekheAKRXN4if9Yc/n95JZT+kUrkc84qyk4JgOLrrhMIt/WXQM8D2hfbv3ik/lRUhm
 t47iCOam1LswXlzeOPh39U3+Ome6ZH+4iky+MSJTAuiTwTFw2fJW75EpzmijqTCKChwhNRfycN6
 JyxYv3yafhG/h6oqFfw==
X-Proofpoint-GUID: qFZDq0oQBnJQv4xPOu8zlAzJhzP2G2Sy
X-Authority-Analysis: v=2.4 cv=IKgPywvG c=1 sm=1 tr=0 ts=697a1198 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ksxQWNrZAAAA:8 a=vnTlnYwSaAcbgi9v49MA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_053938_429524_0B97CA29 
X-CRM114-Status: GOOD (  17.69  )
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

On 1/26/26 12:44 PM, Junhao Xie wrote:
> Add infrastructure to support accessing TrustZone-protected storage
> devices through SCM (Secure Channel Manager) calls. Some Qualcomm
> platforms protect their firmware storage (typically SPI NOR flash)
> via TrustZone, making it inaccessible from the non-secure world.
> 
> Signed-off-by: Junhao Xie <bigfoot@radxa.com>
> Tested-by: Xilin Wu <sophon@radxa.com>
> ---

[...]

> +int qcom_scm_storage_send_cmd(enum qcom_scm_storage_type storage_type,
> +			      enum qcom_scm_storage_cmd_id cmd_id,
> +			      u64 lba, void *data, size_t size)

Please add kerneldoc, as this is an exported function

> +{
> +	struct qcom_scm_storage_payload *payload __free(qcom_tzmem) = NULL;
> +	struct qcom_scm_res scm_res = {};
> +	struct qcom_scm_desc desc = {};
> +	phys_addr_t payload_addr;
> +	size_t buf_size;
> +	int ret;
> +
> +	buf_size = sizeof(*payload);
> +	if (data)
> +		buf_size += size;
> +
> +	payload = qcom_tzmem_alloc(__scm->mempool, buf_size, GFP_KERNEL);
> +	if (!payload)
> +		return -ENOMEM;
> +
> +	memset(payload, 0, buf_size);

You're overwriting the data part a line below, let's just zero out the
cmd+details (sizeof(*payload)) part

> +	if (data)

(please add a \n above - normally

foo = xyz;
if (abc)
	...

implies the condition takes into account the previous line)

[...]

> +	if (!__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_STORAGE,
> +					 QCOM_SCM_STORAGE_CMD))
> +		return;
> +
> +	ret = qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
> +					QCOM_SCM_STORAGE_GET_INFO,
> +					0, &info, sizeof(info));

I'm curious what happens if the call is available but SPINOR is not
populated onboard..

I thiiiink it should return STORAGE_RESULT_INVALID_PARAMETER but I'm not
a 100% sure. Guess we'll see down the road.


> +	if (ret < 0) {
> +		dev_warn(scm->dev, "scm storage get info failed: %d\n", ret);
> +		return;
> +	}
> +
> +	total_blocks = le64_to_cpu(info.total_blocks);
> +	block_size = le32_to_cpu(info.block_size);
> +
> +	dev_dbg(scm->dev, "scm storage size %llu bytes\n",
> +		total_blocks * block_size);
> +
> +	storage_dev = platform_device_alloc("qcom_scm_storage", -1);

-1 is PLATFORM_DEVID_NONE

Let's use PLATFORM_DEVID_AUTO to allow potentially multiple instances of
this driver being spawned down the road

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
