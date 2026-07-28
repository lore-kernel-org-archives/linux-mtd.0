Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B58C53219
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jul 2026 05:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7GlUIVB7awqWIZl+wibsmMc6i6PoCvOlylg84gH+Yo=; b=YIXnjuRHKsdTYoaSjkzF3dGUsY
	TeV2WLXnJ2K/fSh8XdvJjhZAb0/LzOk2XE5BtjVhUpJS45XX8s8kGmKGl+M3smP2yS95WVPq2/0BU
	j9952yYP5CLN5WCppDtUBcShhwB8JOEORHuIE2qo+Bb/GlorlRCuBm9xzr/4dgCWSrTAWLTycXJlE
	PZzvjzd61MrXctlrNr3HAKK05nuEe9MoTmNQ3A7re7WvtKNPSTFTdhy8i3AOoWX9NCd1ZCFhVi6x0
	RTiHU5qCWus7zGr1WoBDRMQsfkqpABnkm5ET4MlAn/mgJwLflLrjSaou0cYEcnBkXoblYUTrzF2eh
	D1BjR4GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woaRq-00000004Tbt-0Ftu;
	Tue, 28 Jul 2026 05:33:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woaRm-00000004Tb3-2wLX
	for linux-mtd@lists.infradead.org;
	Tue, 28 Jul 2026 05:33:48 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3b7Ga1701852
	for <linux-mtd@lists.infradead.org>; Tue, 28 Jul 2026 05:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PA85A/2Y8/wacRDzGIjmCxM+w+D8cmd7uPV5mtDmVzg=; b=iJENhN98jHb/RoIj
	KRVBsCurohNZ1/ruAlnZApR+P0IPeFf+xG6nNwvS4PuSIw6yyA72xbrkQe8rxF+f
	nWG3skYfVnExEmJyw3Z1SiUdT9AA5ZLxMN2mJPqReeAHsoXPMOre9A0cJbFc6EuF
	WOJ1hF82btIlnb1SVSFGbzMzDacERb/+DIJPsKgZzccS/8eMduyIWzIO1qUqC1WB
	CV9iTuWDLOCgstTvkVtSHUAnmRba8oJa8imV0fE1aXq8Z8hqphK/gTfINMeyY6BR
	/c1DcxU/epCNj9cUYuhlKKVp/YLWk20FkRZ69jRhqrn5PdelB4mi9HuVK8h/o3TQ
	tEYEig==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fphh7h2n1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Tue, 28 Jul 2026 05:33:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so65701065ad.3
        for <linux-mtd@lists.infradead.org>; Mon, 27 Jul 2026 22:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785216824; x=1785821624; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PA85A/2Y8/wacRDzGIjmCxM+w+D8cmd7uPV5mtDmVzg=;
        b=NIHscQHePWdCFaWvms1kNhMMCAYBHfcHnzSXe4rc/ErjtK1FnNZJiqoTGNBOAhbsE5
         D9pDQuRER23zu0la8HP6/9A4yGpcD/uyThI3ymhvViSRw2S62EHeQXOM09XWQ2N+YGyk
         7o6awFyq3BlKJNw4r7UxcR0cqIaRhNQqYUVeVTYvz8+O/5ZZUs2RByA5F0YzqEYi/jYy
         U9b4iVvWmmRuI9mIf6KOwXpeL75tqzLvaFzpG10IMoKgRFpGZaPNxA3Z7YwArAWRzKnX
         J0lwVL3QEg4OYNs/fMG3B94wreXpJoJlaRLztDonoDzRH67qfAlmt5etHTXQOuxuQBvw
         tdLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785216824; x=1785821624;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PA85A/2Y8/wacRDzGIjmCxM+w+D8cmd7uPV5mtDmVzg=;
        b=LUK2SvyGv5Q7AihIVkhDhD6vnWyFOQ7ZQv3TeecRMMGfKWeehRYcjcljV32dA4zsnN
         2zILg+XVdq4vx6uoYNNXauyvkYD9LK5w3Uj7k7+iqMrSN5hejrxiUGkpbX60cOyz9065
         VBbPEnT5aSSTqVxIAhfetegSe0o3FuvRyI5Tb6hKdF0DfXU9Ylc0liMnTt1GSsx+Btf3
         /QjiloJiEGEWWp04QAlgNyF/44KOZaLNerVp5KdE2wOou+kUCwkEi1YSg6/0gZlgYxRb
         FvZ/EQMOTuVM7x46XiyGacOsucC/E1YIEYXi66E8+5IO6QPb/b+GfZMNe1igxCGRGqrp
         sv3g==
X-Gm-Message-State: AOJu0YxxatiRLVlpabStvz/7WrU6G3aZTkD0rGpceLO9yjJoYIz3BS7E
	/zE8AOsFXEEolMx3p5gyajO7ruf8Z4S2+yk8owfaSSkGYm/Dn5C2zzM9OMBSB/aPUaFPDjCj472
	Wu2fml5DBHRY/07iFryly+wW09GIaamQfsvjzFrL9jGKyZVqZzsxYhT1+pSLXaY3glzTAQQ62RN
	/J
X-Gm-Gg: AR+sD11lukgKUsHHJdev++CgjrshnUCw2DQUUS4Z7iGFHWpVI52L6B2zD/En7eGFPGL
	Ca35oC4cRkK7wxFiLVb1/IjfOZ4n0Fh0suc2buu0IWYqcJr3QbR+fAs2PfjxDt3WErkpsQ6Nrx6
	YjntQyXGoIHTmXF/xUMF1xQhOvUOwcv6eTrJylwpW1VIxCjVPC+CwX+wNF9pw/BTGv99uHsb7v0
	qfOD45nwtxM4Wmw93FB64MEz3ezMTLwrsJn4deZ8OPQjNTSZS4lW/pok35RiaavNSuIHe8F6pWK
	Nhp3DCSEw5TdfLVPWSrbb0xJp7QEry3ZtXmdV8fjR5RgziFw/eEjekUlEoq57TvUv2IN6hYiBa4
	5IxP2Cl4BmLBsr/VOmmOYe1s=
X-Received: by 2002:a17:903:380e:b0:2ca:e19c:97b with SMTP id d9443c01a7336-2d015c91fc8mr10199795ad.5.1785216824426;
        Mon, 27 Jul 2026 22:33:44 -0700 (PDT)
X-Received: by 2002:a17:903:380e:b0:2ca:e19c:97b with SMTP id d9443c01a7336-2d015c91fc8mr10199465ad.5.1785216823857;
        Mon, 27 Jul 2026 22:33:43 -0700 (PDT)
Received: from [10.152.201.53] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59bb35sm45043575ad.12.2026.07.27.22.33.42
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 22:33:43 -0700 (PDT)
Message-ID: <ea11922a-5d7c-443a-978b-4ebaf8d21523@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 11:03:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: spi-qpic-snand: write the feature value before
 executing SET_FEATURE
To: linux-mtd@lists.infradead.org
References: <20260727163216.109938-1-kuncy7@gmail.com>
Content-Language: en-US
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
In-Reply-To: <20260727163216.109938-1-kuncy7@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA0OCBTYWx0ZWRfX1AyVSpj3ygU+
 gKuJHkgJHgxPyStLgAMf8frjMRfqJlCpdV/ShA90uEccmIrUZ64nImiG6FNpyQQOEvD7ewbOZ4S
 3CJmL3P0xwqJolKWTAZohtYX6ki/37bgUJjz7UDhVlabZvXVIyWHV+wZ60ffreW/SCLRwn5awvD
 cdgpqSZJbhlH3ssRt/eDTdW/SyDnlFOq3hM9R+bSqTOLLcJUs0i0UNhSznCkxVU1egKBHJQjIo6
 /mh4uiThksisWiCyky6/3e+WtxSlwB25yoYtXCHoO0de4WbcVIkL6nV92KyY0vyMOrSXUA9865F
 ue5uktIft1i6cP5EOe2UIb+kXdArU7Oo9oXiI4u0c8ivDFSHS2NhKGYb9qpdvB0eRhi3CHq58fB
 rEWMUaCh8k4RIFQR7Q2SQbohnUZ2sw8lD+ciAbHvik8wJ1k224ahpQmruffoQz9bc6iYENNLB3T
 aCmReBJP8Rm1TZumxzg==
X-Proofpoint-ORIG-GUID: HSMfCPfkw8nzjSve3oLQx74_aISRLNRk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA0OCBTYWx0ZWRfX0UWhBUSyLFQA
 icDEotoi/mR/+xWWRmYg1S/PlWmQJEbKFCluNzDt/Fct33kh4WxybbDEk3AIiTKyn4PfEXQnjc3
 6eZMDuGvE2SJFuqKJ1hq+eBalOLZQnU=
X-Proofpoint-GUID: HSMfCPfkw8nzjSve3oLQx74_aISRLNRk
X-Authority-Analysis: v=2.4 cv=b+6CJNGx c=1 sm=1 tr=0 ts=6a683f39 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=5MJLllL7VwR0ULivmUYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_223346_856375_7F3F3254 
X-CRM114-Status: GOOD (  23.41  )
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



On 7/27/2026 10:02 PM, Stanislaw Pal wrote:
> qcom_spi_send_cmdaddr() programs NAND_FLASH_CMD/NAND_EXEC_CMD and submits
> the descriptors, which makes the controller execute the command
> immediately. For SPINAND_SET_FEATURE the value to be written is only
> placed into NAND_FLASH_FEATURES afterwards, by qcom_spi_io_op(), in a
> second submission - so the chip is programmed with whatever that register
> happened to hold from a previous operation, and the intended value is only
> applied by the *next* SET_FEATURE.
> 
> Measured on a TP-Link Archer AX55 v1 (IPQ5018, ESMT F50L1G41LB): writing
> 0x40 to the configuration register (0xb0) leaves the chip at 0x00, and the
> subsequent write of 0x00 leaves it at 0x40 - every write lands one
> operation late.
> 
> This stayed unnoticed until v6.18 added SPI-NAND OTP support together
> with OTP entries for ESMT chips. spinand_otp_rw() enables OTP mode,
> reads, and disables it again, and mtd_otp_nvmem_add() does this during
> MTD registration. With the off-by-one, the "disable" write actually
> applies the previously requested value, so CFG_OTP_ENABLE ends up set:
> the chip stays in OTP mode, every subsequent array read returns the OTP
> area instead of the array (UBI reports an empty device) and all writes
> fail with -EIO because the OTP area is write protected. On this board
> that makes the whole flash unusable and the device unbootable.
> 
> Write the feature value into NAND_FLASH_FEATURES as part of the same
> transaction, before NAND_EXEC_CMD. While at it, copy only the bytes the
> operation actually carries - the previous code dereferenced a 4-byte
> pointer on a one-byte buffer (spinand->scratchbuf).
> 
> With this patch the flash contents read back bit-identical to a
> known-good dump of the same board taken under the vendor firmware
> (md5-verified across partitions), and writes work.
> 
> Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
> Cc: stable@vger.kernel.org
> Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
> ---

Reviewed-by: Md Sadre Alam <md.alam@oss.qualcomm.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
