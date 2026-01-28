Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96EE2D25B64
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Jan 2026 13:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S85yvBEu4EzHssHtkjQA20inxXtcssCK+RBSpzvK1OY=; b=poWdzjyLvUDghq
	7lOuFzRR8X1Ytcz2le8CWm2j4m4Fhqw2z99kRi0LQOjoITE9/YiTh0tpIiTZr2A4L6t5qRdL+YZFr
	j7rKRT5GqsuFSQQqFQSaT4HmWR2Jx4vam/yAzLKfgeCEqcVl9IDsDou7rQ+ceQ4RPowAhEEyXA/hV
	bV+VLKjj7b2UaGGGCsve8c0M9qk6KBTHiJ70P6PcHp/mnSq8gfr+KRZR8R3zuxRhjXs4LSzv+wHVq
	+y4vNZsD2yGrvqdU7yOlZdIGza/r3eYKcDnfsI7Rm6dGmdI0uKBDWkHXsVck0QXb7qRIZhlIeKUVI
	N/xS8ZoBLTkYqL0fmGmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5Z2-0000000G3gn-0Pnn;
	Wed, 28 Jan 2026 13:26:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5Yz-0000000G3fo-1hLU
	for linux-mtd@lists.infradead.org;
	Wed, 28 Jan 2026 13:26:30 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S91qSM3879126
	for <linux-mtd@lists.infradead.org>; Wed, 28 Jan 2026 13:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hel6cjtVNcRk3KfsQ1p0whcU2fVKIAOioRDHS0NA4sk=; b=Qv2nX7eGha7JSjeY
	tluBpB7vqNtjrQYw7KDHEhxNjop4afXAIu3dAK4iLjuO6HPw2kYMb9D0o6yVxrdm
	RqB/Pym5eSfqYcWOdzfEyOCSOBSfOxhoprSXwPVpELCeCkEQiAhgcnckqiZi69xG
	qO6YxAsUnsQrUYJoXtWYCo/2K+IlT6cNkE3RN+sVotCjPRetFC9L8o1Uaf7+lfk4
	taAZzY1DHePCFR1I/Aj7ugOMlSYx8zrxUjkqzFZH5wv39XgSs52jXcEaAhn4NKeS
	Uy2jK1HVStAfRd+9B1EIalL0o6NnXRYPpsl5DCoSFVGwCIzwptrJTWx0W1h9UO17
	UmbL8w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bybyv1m96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Wed, 28 Jan 2026 13:26:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-501423e1faaso17178101cf.0
        for <linux-mtd@lists.infradead.org>; Wed, 28 Jan 2026 05:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769606787; x=1770211587; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hel6cjtVNcRk3KfsQ1p0whcU2fVKIAOioRDHS0NA4sk=;
        b=Jw+yENyUrSUTdb149WHZ+rba2pTTl7gePgOOIuHxnInCdp2iBOhpoVljZu8lvW9TIo
         Db7YLmN+Vfg8SpFvqNwNLXax5PtvSizgUMUwqlQtT5WQbzQQLF50y7Krr6cvbmM95k93
         ZelsioHcj0U/9cZU2t0nSduN9CIps44+t1J070YU1tUh/vNUZ3DAf38q4Lkj2caT8jJM
         nVjVqescS1vMicFsr6Tph2oRVzMYJFjrnRmUpL/1+tiyS6gO8Dn2JUks2JPdAiOkCuXe
         5IZYI3smL2eWiQmLPcYdTNvoOGwDmiUynq563HkL3MB8rzwa5ByiJMcTEXDeqiZ2oZ+o
         E1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769606787; x=1770211587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hel6cjtVNcRk3KfsQ1p0whcU2fVKIAOioRDHS0NA4sk=;
        b=jbgaWMUfd16XPvLQG9ARjhwoY6poX3a301QWfIjA/uNdBatPEIzOEhQwgHBPjeP1mT
         ULGDwfMIRd5wCbjr1Cyn/OSpJpngjNAMBQziCw61/1ERWyFG3jizKEL4lujTea86f227
         FepWWic3li9StX/fceNkOPTs6Gm+pRnIY/bCSuIZhtgijoCsydAYAgCVifQiVv+EoM1d
         lRgcqufDYFjIvvrPagBBXjj1c6GxtB1/eb8h8A2N3mTpDcsUTo8nDlPeOY0fiXsr+sCv
         KLvKcPF9XNKkKGAnqXUJpjxgO6ZLc5Uh7XMuOeTHSa/IYAGxuTL5ZmU1TeA/fyDQLWcy
         x3vw==
X-Forwarded-Encrypted: i=1; AJvYcCWicrt2DxkyWFqJdWi+jOcn+O4lvMFou7CaFMwamWTMBAzIf9uiqYyd31XeiCP7IaEZuAGf3mPHaDs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj3QS60TrSqZTr/qidBq4gleyQULtTr3r7ulxwbeUJR71rDa78
	HCtse83ZmMQp5v7H9v4GFple+v5009LK/BPAKYiJEzcj/qLGd1E+C+lzFxEyx0FuxFHpP/sLzaN
	NLdGkFeWB+VVZoVyHKe8Jv0TFMqntmRGCfQXMSM1ChN033wBouUVApEmZskqPJh3vrmK7
X-Gm-Gg: AZuq6aIImJBRa5BBS4ShIsH8MfKlC80gU69qFDqPCT4kLCrWvYa6Kmab/OjYWjc6/B1
	ZVqmr8YbbER2ZTrJubOHiGyCQ+Pu2NDPfKmJaIGgJaFjhViI0e4zCwNjtCLkeltoRbWIb3TIoTZ
	gJ9hJuF6QxSLN99o7ghZwvFHrKK+YH7rZ+WWuVLsCshwMCaR7nl/LVX0jUCHYP9m1x6eNLerwkH
	oKCVkAXrTXbUwxw/qrcbkWVDOrm83mEyFf46MikE3H08+n5nsxxw6pKGNv4gklwVBqer5cjt4qU
	QBlUN9Um66yiM8ebcGdPa+P8rLIGxkoH3MgDW2+saI2XHGmYyu9/lvT16C7pJ02lFZKQuaGAIZr
	oEn04M/aSPjEIiRzUNwMWHA93QbMWuWdlXGR5RbuxQRcqQOE44VwWSP3lk/2OuLSkG+M=
X-Received: by 2002:a05:620a:4721:b0:8b2:e19c:67cd with SMTP id af79cd13be357-8c71ad7d3a4mr13123585a.9.1769606787314;
        Wed, 28 Jan 2026 05:26:27 -0800 (PST)
X-Received: by 2002:a05:620a:4721:b0:8b2:e19c:67cd with SMTP id af79cd13be357-8c71ad7d3a4mr13120585a.9.1769606786904;
        Wed, 28 Jan 2026 05:26:26 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbef86df9sm128268266b.10.2026.01.28.05.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 05:26:26 -0800 (PST)
Message-ID: <d0652707-c983-4deb-981c-b1584168e330@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 14:26:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
To: Junhao Xie <bigfoot@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org, Xilin Wu <sophon@radxa.com>
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
X-Proofpoint-GUID: c9rFHLAm6xWWSY9U_k-KlGDmdn7Ifvx7
X-Authority-Analysis: v=2.4 cv=ZZ4Q98VA c=1 sm=1 tr=0 ts=697a0e84 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=x7yhTW8McE9ZTQqoy28A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDExMCBTYWx0ZWRfX3Z02WafuKnSC
 cBV4wMaMdxex0xPmunrM+UWVa01VCEWc3jgxXhwGWtdPeCM0ZdrCCayFZdlmrxiEijVKDx5SP4l
 wTfS0O1cZNIMoC1E/hizaHKkrlDin+7jSvi+B+w/XHOyMW5pvngx7OeIId3xNGdOvjZphOhMvdk
 4QNeVZrlIpsls6wsP3LiY5QVbmg6fdLRoxW6+DrBMTvn0mBkM46CpDTb7TJ4LIHbdrvRUR7bqLL
 IuJdAkpwRihX87+9nXSE9Qat7OT0xbv4qy20nYFUDGJbK6hJ00OrRcfhHdIHcrGwYX1H4WjFBfE
 wmGBXPaJ5ky/QnLCOjXGOT2kaF7iOHkvYtIK8GHZA4jLuTY0sBHO03m8uhylmGKlaL7Si9iB6Zh
 77koyMHk7cCBE+m7ub6rP8MUNoaks+tnkyd6edQ6sxRZw6zEeoMMad58SQe4Gjtmt0zP7g97VkP
 4Z6IWtqEcK21/DOfRug==
X-Proofpoint-ORIG-GUID: c9rFHLAm6xWWSY9U_k-KlGDmdn7Ifvx7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_052629_587670_F0DBFCE2 
X-CRM114-Status: GOOD (  19.81  )
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
> This patch series adds support for accessing storage devices managed by
> Qualcomm TrustZone firmware via SCM (Secure Channel Manager) by
> introducing a new MTD driver.
> 
> On some Qualcomm platforms, firmware or BIOS-related storage (typically
> SPI NOR flash) is not directly accessible from the non-secure world.
> All read, write, and erase operations must be performed through SCM
> interfaces provided by the secure firmware. As a result, existing MTD
> SPI NOR drivers cannot be used directly on these systems.
> 
> This series introduces a new MTD device driver that exposes such
> firmware-managed storage as a standard MTD device in the Linux kernel.
> The driver is built on top of the existing Qualcomm SCM infrastructure
> and integrates with the MTD subsystem to provide a uniform interface to
> userspace.

[...]

> Junhao Xie (2):
>       firmware: qcom: scm: Add SCM storage interface support
>       mtd: devices: Add Qualcomm SCM storage driver
> 
>  drivers/firmware/qcom/qcom_scm.c       | 161 ++++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.h       |   3 +
>  drivers/mtd/devices/Kconfig            |  17 +++
>  drivers/mtd/devices/Makefile           |   1 +
>  drivers/mtd/devices/qcom_scm_storage.c | 265 +++++++++++++++++++++++++++++++++
>  include/linux/firmware/qcom/qcom_scm.h |  34 +++++
>  6 files changed, 481 insertions(+)
> ---
> base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377

This is 6.19-rc7, please rebase on linux-next/master (the series
doesn't currently apply because this base is essentially a full release
behind)

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
