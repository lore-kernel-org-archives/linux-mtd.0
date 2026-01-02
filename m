Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23915FA3741
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jan 2026 14:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EjZCBGeKQESD6U4QV9rkobM6PA7Gqx4FeuDKp9XevPg=; b=LCKokE2/tSPQVt
	4f399uPAKIxOP1PJSRHimEAgsFcV6kWPg1sysnIlhUrSocxPKbUGjanGsvsS7IZVpzIzzm3H09Bb2
	n0qmPACX2DK7Ogk2ypDslr+OYzpl/SPylJV3SdkTxe3L/8dRLv5Cney8oIxKLPAmYsNiWcyo1xd4d
	XjqfS4Z/eFEBo08YFmTQAsG/5jpoYPncYjjrcAZDcSRs9g9bVNMQycOTrBqcKvx+fnBn7JfT0Nksc
	YR19K9yoXsXb9RE5gTcVZ7WIAQN2zccSK33+ZFoFkUhtrMaG/d3FuqdTWvuRGcenfuEJQibw7lFAN
	mjvs/q5D+XAyCYNdXVaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbfhH-00000008KJ1-1mzD;
	Fri, 02 Jan 2026 14:00:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbfhE-00000008KIX-3pJa
	for linux-mtd@lists.infradead.org;
	Fri, 02 Jan 2026 14:00:06 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WBQ1637864
	for <linux-mtd@lists.infradead.org>; Fri, 2 Jan 2026 14:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x03N+1nkxwtdppRPIJ+rN+xH+oPAXikV45X3MjLLm/U=; b=pQZjxdWu146rz+Ln
	wuEZ+TCxIwl//TICA4OB9Agfc5KjyaBO4Drs1tF7fJmgmnyyDzye7dgTtPIC9rdq
	1QFZfBeidguqVdKffIcb4wcbfUl/ztF5N/+2FqpRLQEsl7wuEe+WbOdEl4M9CXpH
	UDffpQNRqkEPUmPofSE2jY8U9uBNNCshP1x1f+NYdNA3BaiMyGxfXkFN5/AYqxCH
	OUOCEtymcAH8Tgz/KFq3oKiTJL3zw40Fx1v558dDqRFOMKhyvwuX5DqbPPaPJxOp
	h7mAodYiwpP25mTBVszDgmZ2Dgx/8lcmz1qP7lsHhiGlA/jYHwyjsWfjy1DVsW72
	XnJAaw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd3v8uxce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Fri, 02 Jan 2026 14:00:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f357ab5757so56731481cf.0
        for <linux-mtd@lists.infradead.org>; Fri, 02 Jan 2026 06:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767362402; x=1767967202; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x03N+1nkxwtdppRPIJ+rN+xH+oPAXikV45X3MjLLm/U=;
        b=XlqAZx5UT9BfRckSqag7pmzlmwjkgI1A6J3GAEap2IE2CLT2T5q/GIRCwbq93z+C1d
         1e7Pi+JKFSb1N2EQJ4vVV9CT7m69uiElewSG49ixxbQodI0C/8z2FgY7Sav1syX3XUIO
         XE2p9ihBw0wXGn+DQakuvghUgzJSKCX3MsETRz7z1Epbp6eLFkcypChcAmZpOP2m2UaQ
         UubrsffPoYdZT2bLLXgle+g8/f2qaud2BC5XcjNdPMdiaePQwP7p4RTT6evqX2AQa0UN
         AfgK10fpiRJvYeIq4Nnkgms7/swKg8HT6l/RCcos8I0aWpKgF4T+HfVc/AS3WJzG/SUu
         RltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767362402; x=1767967202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x03N+1nkxwtdppRPIJ+rN+xH+oPAXikV45X3MjLLm/U=;
        b=hGTMM7mS5JbkO0282Df4xhw0a390yAL7jsa91UX+/0xeqZWrQLewgqo7zHYXDiQ/t/
         aq7opwEBGLcQBFLqd9et23Zt3EFLGH7PucyKaHSFkBZNawdxoKRaim4aUTqolAGiPabZ
         zHsH+mfdHfFlJQhEXpiadEhSNQx4S8aZxthshnV21Z6o9h4mjeRPpBByrTCnaoomT9j5
         2lXl/SwBtGVOCwHMlH9tMsu0UVZDUFTB7oxdpnM1O7tRHcOYlqW9EgoH0pPp7+jA2cZk
         2MkWmPs+GlLJoBMHJENnD3ckgG7cITk5a5vtYfKnN/lRvY3R8RleJwL7mclmznKh3uq2
         g53Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8vctBQ2niEuP61WI95C/TziI7dFbFsxIIP0NHyJNY/VwjolPOj5ff/XHnrCe3YnrmMXunxuiTi4k=@lists.infradead.org
X-Gm-Message-State: AOJu0YwehkHkRA/LAMfg9CeMu2BGRQWPHc0t6GnEzM0dMolqGNRc9sTH
	Or3zUTigvh5j6dsG7lI8tHkrj/bpNl0qldDldJLP3K/NUMswERuH94c14FJ8/a39Uq07PZKjwUB
	FkS1l3QXsDJKi0qDmnyJyePWH5nu1yfYWOYMLdNQ9AhkvvucKruvTz2IicEHhUoS3uedH
X-Gm-Gg: AY/fxX4RRwc23jugKjhbYK5F0tBQ/B334FfmRM/C5DjrBuiYBOV+1Eu+spnHw2RTXAg
	wVJEOIaVSHLKao6HAPCU3Auu0T8QDiD1WFWw0Udl0APq7jf+NJTwMi5GtzfiDBMhVdNRZqEUObh
	di9k7cXPIlrZ7JNbWaiHVubzSESA/yRHDR0WgMQZK4jVTh8m5zaH2Jg2HR7ORO8Lio6i44sBEf6
	tmroJmDzW3xVBVEbr015Tx6i9AUzSFUtd+iv/4+nWuL0hZUJZt6SfiOoakt5ZZaTNPh8eMWnrYm
	OO2RY6tOX8mLnsy2WrhOteVEl2sJ9ZtlEXMajSqPTYofeVVrSwNuBEL4SKnm0PUMAoFx/BcTvRv
	Mb6uMutCj4u4ZPoQDlT82bxrbUPxf6iJ66i1yHF0JPz9DuPhgf3GdLq1Mrn3niOJZnA==
X-Received: by 2002:ac8:598f:0:b0:4f1:dffa:7834 with SMTP id d75a77b69052e-4f4abd7613dmr434910601cf.7.1767362402420;
        Fri, 02 Jan 2026 06:00:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBkOKZSWRFsB6BJFVbH93340vfDP9YfJ3KoJRojpfsiJwEKriedd/ViwC+9G4nwS5XjYG7SQ==
X-Received: by 2002:ac8:598f:0:b0:4f1:dffa:7834 with SMTP id d75a77b69052e-4f4abd7613dmr434910091cf.7.1767362401838;
        Fri, 02 Jan 2026 06:00:01 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91056731sm43735803a12.8.2026.01.02.05.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 06:00:01 -0800 (PST)
Message-ID: <22121c9e-1cb6-4948-93d3-6e9f9d7922b8@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 14:59:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] mtd: rawnand: qcom: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Brian Norris <computersforpeace@gmail.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Paul Cercueil
 <paul@crapouillou.net>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Pratyush Yadav <pratyush@kernel.org>,
        Michael Walle <mwalle@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
 <20260102124927.64703-11-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260102124927.64703-11-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDEyMiBTYWx0ZWRfX/yh7QK8L80tw
 K8MwrgneuhNLr2SLP9ce/T45sbaiNS2hGf4Xhn28ANY7vX+xsVuzI1m/edQ1ktFn81Iz29QiYwj
 CAocjI2r9yq6XmccS66cTJWCbFjKVT+wrRrjz/JXTPAeCLovyoBgYiaf3IOCgEbUhiRBDpNsrdC
 mU9fH9Bx1Av+bjboW7lrvIKmv2fI7Fo1P/zXJCntW9kGKL/vIRSXxKkQzjeunC4EZATJ3EcJi+L
 GYA6sa68loDbgPZ7du+ta/xWF9fggjTJkuPBggRc4qtS7NEz04ohyX8cQmXfqOhbFkWHDJsGk2c
 OOTywajmpWmDuobtFkImuXMfymNTQ/3LXwqfM12sY/4GuUFm4npNef1XOcMqp1ZOakymhSNXfR8
 Td0+w0npGDkTaqrQeSpjn59zLVRYPn7THFQ/BCBbDB8IvbKr5kiMp9v+uUdPY7hOA4gX+V/QiTK
 pES3G37FJiLkoLXOqpQ==
X-Authority-Analysis: v=2.4 cv=JdOxbEKV c=1 sm=1 tr=0 ts=6957cf63 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9ra_KJl88v3tURVkoeQA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: FjnRs2riWccFgmfchkWXoSZY-9l_BZIj
X-Proofpoint-ORIG-GUID: FjnRs2riWccFgmfchkWXoSZY-9l_BZIj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 clxscore=1011
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_060005_105145_633FC866 
X-CRM114-Status: GOOD (  10.04  )
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

On 1/2/26 1:49 PM, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
