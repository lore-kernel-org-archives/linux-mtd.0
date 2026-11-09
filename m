Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2698606A31C
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2026 13:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4oqYTJHW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AuIEAf33;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HU3LMUbS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FM88EDgy0c+NQhokmH+jyo/Gnj5AGOfpTS+a4Bu3cOk=; b=4oqYTJHWZQaXH1fe+bANGCcm6L
	eyBNguGNWDisARcjllTWFyKCz/3O8GxqLfDfXGjiokELo5Hm2X62N8C0RT3SQ5/eQWPWTJmglXOfy
	5UrJuXwrhTGgF530izaP06S0p5PEhiV/m+RlhTfKf2FC33SQmTU1yt7Os1VNjJ1tYe7WpzOMHyZJC
	yHSJi5YzgG1OwGD+a3+zsII10AE7PqxQqq7rAkW1/zzM2Q8llX4K9SMP2SpEHJYUsudRIdlgG1kjd
	zxL940K9KJ19LqUKr4XE1yw5cmEDm79Hh4DHkZg6PAi3uShdYDYzGAXVyohjP+xLsVSb+5zoZ7ROb
	sNjAFPiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPUQ-00000000onR-02YY;
	Mon, 09 Nov 2026 13:32:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPUM-00000000omr-0FrR
	for linux-mtd@lists.infradead.org;
	Mon, 09 Nov 2026 13:32:47 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFMNG3589048
	for <linux-mtd@lists.infradead.org>; Mon, 9 Nov 2026 13:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tSYZSMfbWpn6IZacmi5pJPA8yJbsB5V+fFXDT86LYhY=; b=AuIEAf33+rrs+pto
	WYdMtA6ypYrroU5H+DcPWPiCxEkisy9TOauID34IJjIyEr1IcFCDznV+xp97ZBg0
	cenaQyHSTchsakwuhzyQFi+RsWZQAX2qIoLOn5mHQEHZLd2D+td42zrAjlWYMM8B
	Zm1TkyYfQZ05g32+LqpoBSCx4Rr/Dal6yDMp4UnWzTtvXpAEM/cFxS3TR7AiIwle
	k1tZ8oePfEtXHnffTZ+3q+63WJCUSHva8/dJWcmo4pZGMHWdDf9Z3ugTvmVYbpFb
	ZBCDbLVPn+Y6Lo8Bxhz0dPFb3OmasektxfwVEdWjvj0u513EONjM8yrqwo9GIRAB
	afBi8A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcj8cn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 13:32:45 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eae4d7ebd2so27847e0c.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 05:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794231164; x=1794835964; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSYZSMfbWpn6IZacmi5pJPA8yJbsB5V+fFXDT86LYhY=;
        b=HU3LMUbScSVbP48F8O8inixSX/ybBQd1+qk/svhCnDy+X8ObBUCWJAFcKUE5Uh965g
         toj6Qp76lpBuqWa+0v6DVqIjTUt5yD8Pj8Oz7iUWwtNVQJM5//8FDPXhI2DDsEj3n8Fi
         PLh9Wx87e1N5o3v0WzZ0b0e6GwIP/puoXigDFEP1Ly+4DsS2Ew/1mvugw4WL2Jeyw53t
         gZ0jrwNBDBsItz5AvilnJaR1S5RpXEdsVBs1GuuZ82tHsscIMql6jYpqFSzaSrv4SHpz
         CBFUqj7KsC1J6aqWWDTaWDIuzyL/2x/1SBk2vs0sdLoN9E4Dae0Nd5ccZB/abR0p7XRu
         ShCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231164; x=1794835964;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSYZSMfbWpn6IZacmi5pJPA8yJbsB5V+fFXDT86LYhY=;
        b=dCnq7+RKHyv/LkJF0vwaJrfMPRoVg4ff+74zDoZ/xiluiohvcpnYl9OLEc5IJbjpAO
         A/tyMWIk6rYtLnXkGHHPIHvYCBj/zWtVqxabeeMSAIplYwA2ik7263O8hZkaX3TkY1XQ
         Xa3X3XOLrs/4jKga/+z7IzT7kLOcrZ3dRgTihhcoLjOGsvEzvw3/dV/kmjNXHWX2dNP+
         ztYkGbrf5wtz+9P9TdNvuHuv/NR30Fklryt7PfVjNa3gAq05YXkHkczO58qpGld6LFyZ
         opeL6CxjXTwXreyPiWTUcbmdxtV3MHY+Lp2HKakwWr9hJcOCEiZPqQhaUUhGUQySuFjb
         BbGQ==
X-Gm-Message-State: APuU4Z+xLR8AVgEKhihEjJteg3LXhXD4IIH/LsqLSfoNWOD5dO2GQmzI
	vff5w9ai9cxHU66O1lWSo5ozi2htFaQsI9gsG3780Mw0LLo7lwSiMf9sXYUvfRASmxefRDdlaNh
	pIKIahZEYFpHoK5aI0SJoUcBKmDXnoa4LzbFGs30ubFObrmQ48XwZ2N4rlitBfEOf3MpK
X-Gm-Gg: AYBFou2/uWeuKqTCaLIJ+L89ndL1eQRdoA8sIJg9zAWwrMflXT/QyY9sVYMAApbQmR6
	y7axDqhTKg8fGrALe+NvUhtj7d1X/iGgPlyo6YdKwV0q6OTLGjMb4Hfzv4pnIRsAta+xaM/zRlz
	RKJIAh2XWhh0bTX67/pZ0kzdSQRoA9PUXVwQsk0FfdRuaVPNF8XT2C5JSJpAwiX28mg1OlUK+Zv
	QbsxX7YhwYLAi5udqJOrEbIRZI4aQ6kn30myVhJ3lYXv4d9r1I+C++D44itZxc7jsa9WvQta2vJ
	JOAWXPmFuFH0i9qMg61kcxWWQ1SZGQwt9ko9r6C9PIoXKDBRXh8SLe+X1n/jaVwIF0iMsLb+iaG
	NRnxI5UGqNt0/ZKRuuev5CioV3ab2XwzJEXg7dmSfPUuKD8nRhLbn84FG0rhambLdP9kzXQ==
X-Received: by 2002:a05:6122:1c9:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ece7165ea6mr965375e0c.2.1794231164204;
        Mon, 09 Nov 2026 05:32:44 -0800 (PST)
X-Received: by 2002:a05:6122:1c9:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ece7165ea6mr965320e0c.2.1794231162971;
        Mon, 09 Nov 2026 05:32:42 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a9bc2e2sm169621466b.83.2026.11.09.05.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:32:41 -0800 (PST)
Message-ID: <480582fe-27ff-4d14-b0c3-deab365a1225@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:32:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] mtd: rawnand: qcom: parse boot partitions before
 registering MTD
To: James Hilliard <james.hilliard1@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Sricharan R <quic_srichara@quicinc.com>,
        Md Sadre Alam <quic_mdalam@quicinc.com>,
        Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-0-4a8704cbf7b4@gmail.com>
 <20261108-submit-qcom-nand-child-probe-errors-v1-v2-1-4a8704cbf7b4@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-1-4a8704cbf7b4@gmail.com>
X-Proofpoint-GUID: Mv7a7gME5nR0tBedpCrEBI2GbsNHUafY
X-Proofpoint-ORIG-GUID: Mv7a7gME5nR0tBedpCrEBI2GbsNHUafY
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af1cb7d cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=X9yRgxbac6UzRlJmAAEA:9
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MyBTYWx0ZWRfXyvdMbDYXaeqN
 V81NllmrLU0zqIDldtFOjxTiDdAS4sA5a16CS6DR7+F/+Kr+PVauGDiZMNnIvzbhoNEgmMZMUvU
 XahfkEYawQHOq4HaNmCnbV4IN2yhE/4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MyBTYWx0ZWRfX9Ih1487pGYM3
 KNXCSYqOh23Ndi1ZqagBk8HvjBO0ExOEuEMI3YLLc1MwdHCxUgBCkmixdQl5ICFbjFHAp90bUAM
 EkQVphQLH9/tiFQH2jU90VH8kkIJOz4Rdg6kTB8bh8be6Qy08eGpWamjufvj/in7bxxRparuO62
 LY5RqNgIfnS5bPzjzEl7wr/paCgNs0u8j21rh9SD0RwdOshookkUpNyxJoqI0t3idsTyfYlNZ4r
 0Sl5NLRXfPBLMZtuLpXcAOdjCwVANt3wfq1tujpZR3J1BtPxbI+LI1lvlj4jXA3cRQwdEtl8TN0
 AK3NmOBGdX9UZi9le5xfiz7SIdze/DNN+Yqnck3bocfvrksNfpbvU5jgnNYRKdY0tqAVY0fjbTK
 E8oNg4uZOZKIwT8XFT1HhvXz36+2T41jXRlwRrFXCySbCX4N6jOqJHr9+SKnYIUGgqShOIQ9MBG
 yvGpyvskEJ3Ll0M9yrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1011 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_053246_852886_883867E3 
X-CRM114-Status: GOOD (  11.83  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/8/26 11:42 PM, James Hilliard wrote:
> A boot-partition parsing error currently calls nand_cleanup() after the
> MTD device has already been registered, leaving a published device backed
> by freed chip resources. Registration can also invoke consumers before
> the boot-partition layout is available.
> 
> Parse that layout after nand_scan() supplies the geometry but before
> publishing the device. All failures then reach cleanup without leaving a
> registered MTD behind.
> 
> Fixes: 862bdedd7f4b ("mtd: nand: raw: qcom_nandc: add support for unprotected spare data pages")
> Cc: stable@vger.kernel.org
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
