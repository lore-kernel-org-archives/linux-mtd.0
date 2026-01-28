Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71641D46C06
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Jan 2026 21:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TdaOeIvUJkEtFMCN+/4T3BpiY9nIVvbJV9KTaDwtSgQ=; b=Jr6CuILNaNd94L
	ebCYN/bY6cvdI/uc58h/sERzIFyRePykJFMP8YSl6IDm2C8tyErz4ryHnvxURBMj6f43Seg31s/QC
	ErxpFDvyS/hoIaa8IUgpdLWnpY17AgUhji1mgRNbQB102jAyfLqDTyeb0zJZo+zreqxkdQSR9xy1T
	AU+JuJO7gKt3VZ1wDzCxY3ry1BeRMJQtMrpPn4AYybK+mn6MO9eKYvZVHJI96xosXCSqptbE/oZ9k
	IlNjuZMkYMVT5sVSiQ7h1eu937NYacSOTEjt1w960PXfY9M282GFdLAbw5PTp381GHilkDOve6jbI
	6rn9OKFVbnu5HHjivEjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlDJf-0000000GqyR-2xDI;
	Wed, 28 Jan 2026 21:43:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlDJd-0000000Gqxx-2XDk
	for linux-mtd@lists.infradead.org;
	Wed, 28 Jan 2026 21:43:11 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SH2XIP800896
	for <linux-mtd@lists.infradead.org>; Wed, 28 Jan 2026 21:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	694p56qmOVCQOsKwAm7dFp6MAQxFwO6++hWNZYgjm9E=; b=gCJYk2cgjy0uoyQT
	BO1Lro3w9aF0v5JgMJ0dKpha4oR4iOuuASg/JKOYPf0fcPfyioXf6hAJGbsY5V3K
	zTguP+7J+atDGPaAfQzNPh6JT423pZ5njoiwrIWYqC/Uluva99Ncwrgm5mS+8p7G
	U2aQcjQcaiKctzbgbX/op9t/blcH3iknjdccraDN8ay9xeUmzs1XoLR1iBFvQLif
	yCI/jNzXhhafjYRI/m1vnbsz02Slo0RRyAhLXk83A7OztSbTHyjs5WHrQ0QCs1/m
	lxiROXsjuJNSvnesy1ei012chuYNnYIA5B6WDs7FhUNMPlVei2QIUWsXCL/7LL1w
	2RPUDA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bypgrgw8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Wed, 28 Jan 2026 21:43:08 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b6f0b345e3so2532327eec.0
        for <linux-mtd@lists.infradead.org>; Wed, 28 Jan 2026 13:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769636587; x=1770241387; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=694p56qmOVCQOsKwAm7dFp6MAQxFwO6++hWNZYgjm9E=;
        b=GlQgfSbmce/FVT+O+j85tARrcJDZjg+NcDgmHAIyEPWg21+TlIp85Ah/pHSPxXXj/J
         ProEVyXe5uDtFbBugLFcA1+46u2X/XdHzRQzEgoK828qcU5kKSthHPzRxhI1pvPH0EnZ
         ySQacFDTfwbXZUCTwfghLBuP5gaM2hKVfeYOfmI3CFJ2w2wm6MoTRVmaOR/2ea6lWcBC
         vnXsSMRBcfandkdLM3tPN3v+sHjfegwvBikadqCN0WIrgn2ihOPVvRLivd9uK/CvBKLe
         VfpyQFvNmOWJobwyv0VBWlhU/avcblaFPQZ2T649xGuM3r6eoVajNWjijF6PxBJ4ekYL
         iFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769636587; x=1770241387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=694p56qmOVCQOsKwAm7dFp6MAQxFwO6++hWNZYgjm9E=;
        b=EXv7tui2hpAXiFeg0IeqE634ZeDe7UnHrL1Iwm9azZU05d0Ucy2bL6O9FHiJbWQSBa
         FCWikAwJgqiS1bwvd8qeo3MhBb5PYUICJz1U2jz3dqk/2s7QhNeD8YQZqgbjaIE1STGR
         i97hgi7W/nKwOZ6x/agHstk2Uk7XkmNq7j7UkE20kMJGQJFCO242KoY8dh3s14DR3PIa
         drPk4AeJQxAgP/MRNF3fXVEsGQYJQhb249EDYI9gj4YX7eyWOF4BLQMQzKL6BjzUe+0F
         lT/DBwkYwelhzZE0qVsTD3B/MBX0DKzHEUXbbnZkkyPqAFEq8qXKpA+jzJnvAxmihhZj
         QFfA==
X-Forwarded-Encrypted: i=1; AJvYcCXGdKnIYLpikAFwfvhmqhxhRYHgLz620KF4YvRoRmK6chTUs2dJcDstHNHeJWGJQ2tAIVPI4yxCApc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4fdoZPo8Uq/hejxSCBiWA/7gdfloJm2sdeRIaBr0Prq6BisND
	us3vC4pUA1ljRgOC9aut0SmINQKi6IvaNATUdB0mMri33m7VNfaD7xVByigW+Ntj73laTmJzxh9
	HoNTj1LB4alAZMr6loVxCr6KOmWTGR9dsPQYBazD9Yf8Px1FfYUVQf4rJqvZ4kkuehY8n
X-Gm-Gg: AZuq6aIF6ii5fgcizAPvPXhGcHlmgnp03CaosSDrpX2arG/SaktAh0GCukOHymTAwzW
	WDDTD/vHbqIQUuaOMSUWMcgQU4HI28arOtxFjJr9zgJU6ISGYfze5a+v1qCew1mEIxfT0U4+kbx
	vFZePoToZ4Nh8JOxGuT2t4RVgY8rzs0zkeX5okLho0x3dAYtkN8cf93rSfLWNJb+su1EJMKoXUo
	JbAZJlc6yDU7BhYpiMYUIpAVRbbvN+C8oYzc/eUqR06lfGQureYZoFbLWDW6w51rHAv7SamsuFk
	+RWp8bEsfHugSEbAJQoq7kZiYSkD137pkbx4cm/NtD8pDxPx3/h9442fiUbwG7D5ansB/oY1Mln
	DE0reh92OM5y9n+Jo1N34GcrbZdTasfVa97UE80pwL5UHMZ5TRHSrda/hClBhFw6Etcit
X-Received: by 2002:a05:7300:6428:b0:2ae:824e:31ba with SMTP id 5a478bee46e88-2b78d8cb64emr3980097eec.7.1769636587373;
        Wed, 28 Jan 2026 13:43:07 -0800 (PST)
X-Received: by 2002:a05:7300:6428:b0:2ae:824e:31ba with SMTP id 5a478bee46e88-2b78d8cb64emr3980081eec.7.1769636586750;
        Wed, 28 Jan 2026 13:43:06 -0800 (PST)
Received: from [10.134.65.116] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1adc5ecsm4795082eec.24.2026.01.28.13.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 13:43:06 -0800 (PST)
Message-ID: <dd89949a-11da-4c57-9b1a-2fba181988cc@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 13:43:05 -0800
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
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
X-Authority-Analysis: v=2.4 cv=d7T4CBjE c=1 sm=1 tr=0 ts=697a82ec cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=ksxQWNrZAAAA:8
 a=y_qrqjq6FbBQszKUsJIA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: Qn5M9ATINm5vln0wTuhByKSGPbsY-VHE
X-Proofpoint-ORIG-GUID: Qn5M9ATINm5vln0wTuhByKSGPbsY-VHE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDE3OSBTYWx0ZWRfX6fJDPuLdX1+i
 6eTx7mwk/vQ9bIdY+5MV2v5xUYysApQXyeb4jN3gbZlRadjbk14wEv/xNeeJg85UoJeAnrjq6pt
 5w8NyopDhifzvyVZe0kwJ5UV1VbsKaRA7SHySP68jKFipEDQq1V4mrpLxAdyciCa6j4Rgs5ZDwO
 w6NNwqXQTFXUWeSIGgMz7OmQnVTYDLgkr+HfD6WRw2OxesV804l8/7CiKHncI576CkSNqE5GN7q
 SpVL5gLQapaLojjP5+HIN201/pJ52aijZGz9/8/bo/MsMlyK3EFyGfy1UShkZr+HogHxYEE8BW8
 PRof9Q5iKxtZ2RbjZ9OjM38sEyj4ycvI8UWb7I5XY64mHWX6BpyEH4cmrLApyjCkFrwHKmAVr97
 9MRQPNzuUS7zKaqfTdu4df6Yub/wbIllBIbKy3MZkrsDFqV9AMyYphUSMWtU9nGHFBZ28G8r8YI
 Tk2kj4e9x0/Q8r9hcOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1011
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_134309_659908_FFB2AA4A 
X-CRM114-Status: GOOD (  28.44  )
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

On 1/26/2026 3:44 AM, Junhao Xie wrote:
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
> 
> This driver has been tested on Radxa Dragon Q6A, based on the Qualcomm
> QCS6490 SoC, with a Winbond W25Q256JWPIQ SPI NOR flash device.
> 
> Note that this platform previously used the standard Qualcomm Linux
> firmware, which allowed direct access to the QSPI controller without
> needing this driver. However, we plan to migrate to a Windows-compatible
> firmware which is more feature-complete but restricts direct access.
> Device tree changes for this transition will be sent separately.
> 
> If kernel boots with EL2, access to the SCM storage will be denied. This
> needs more investigation.

So you plan to enable this driver only w/ the Gunyah based configuration
and disable for the KVM one through the devicetree overlay ? I just
don't want to break the KVM boot flow on other platforms supporting
qcs6490. 

> 
> Changes in v2:
> - Convert enum qcom_scm_storage_result to macro definitions
> - Use __qcom_scm_is_call_available() instead of a machine allowlist
> - Add missing __packed annotations and endianness handling
> - Introduce struct qcom_scm_storage_payload to improve readability
> - Always compiled-in qcom_scm_storage_send_cmd() and qcom_scm_storage_init()
> https://lore.kernel.org/lkml/F138514E18CB55B6+20251218180205.930961-1-bigfoot@radxa.com/
> 
> Tested-by: Xilin Wu <sophon@radxa.com>
> Signed-off-by: Junhao Xie <bigfoot@radxa.com>
> ---
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
> change-id: 20260126-scm-storage-v2-0a4f3e900b88
> 
> Best regards,


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
