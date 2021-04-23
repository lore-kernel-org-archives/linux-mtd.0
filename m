Return-Path: <SRS0=ovMs=JU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06547C433ED
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Apr 2021 02:41:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 545C461425
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Apr 2021 02:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 545C461425
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X/LcSSj/KchZi9Yo+mTSBbjglL/E1v3HwDFt23EU2tI=; b=AFRKCakyzoyY0WtkMF+5KnwOk
	upL86lng+swXXovSoBcN/Ui+BdrPTsgiJ4WR69pP75qsuw7yTBemNCutSD9OsI1lzmFwjxHSAn5y5
	tOxBjDhddGRwSBc1LM3WspH6XZfquOaAiASDmK4SKHGtT5Phm1SLW5ahgP3R5L/Ie0dpHkPDJ2Pf+
	hilTdF6Vr3TSOR9yJ0+HU4ctYfbv1t0BJGOuYgLqy0vEFkp7t/5QD9WFruueF5PnVl8eMXId7u6OB
	bgR3IeXqsrvrTJM0zN/hMfKKlU8l4/NY+YEmS5FphhjOpDOV9k2b/0Fu96be4u+jV+kAWCD/4ZNNp
	vTcWYwExQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZlh2-000OCR-Ic; Fri, 23 Apr 2021 02:37:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZlex-000O06-LS
 for linux-mtd@desiato.infradead.org; Fri, 23 Apr 2021 02:35:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=b71nI+sXe01LhMN7x+MBgBsL+VShdc2Sy2WppyA0dDg=; b=f1PEbS/TNPXx34zV1sQQAptXxp
 J2CNerV/fZLBdKwHTenxN3kTCzIJAgHFxtdjxQCaSUpigxUvSm6hpXQpdqll7z6y/8piOSSdlFxVu
 fFJduu8rRvyaBWanRMDVF3WJ+Du6rmbCescWNYYYaoLf1rFwZIo4fCyoWOIjjoVc6jK4PABKC+E6r
 4gYuBuXR0MPgXUFWcBqsx8raoJ4HFePQ5GTn6B4lThu1g1NIrmr8a2gM2+6B4+ENU1VsOzNXRx5RV
 lodeSbPybNNciHgm1el5H3Qyw1mvbZPf3CzsEiJTNBEiyG5jk3hNxfUvP5uiAT4WvAlJQ05E/sGpp
 AYnweFiw==;
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZler-00E6NS-OS
 for linux-mtd@lists.infradead.org; Fri, 23 Apr 2021 02:35:10 +0000
Received: by mail-yb1-xb33.google.com with SMTP id c195so53909233ybf.9
 for <linux-mtd@lists.infradead.org>; Thu, 22 Apr 2021 19:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=b71nI+sXe01LhMN7x+MBgBsL+VShdc2Sy2WppyA0dDg=;
 b=fjj1fAB5Lcl0PdzNTH6o+dkAWCNIQXBT8fT0iOW2tEwEprlKeyAVGLGlFdhDj1osxF
 aStXf9IjTGeMshd1k/YsGKgkc0AFGNe/QS+Jf85BJ7TmZbse4cx8pkfe+CupblduQiaF
 YskLa6d3FE2X4gI15LXOZIQ+pTEwZJP0PW8VF7IUaCYxAbcK8HAZBgMPa+mLil24IXYr
 yBrGPDlUVejuHlmxTsWqxXZeCFGA9vBYvKxwZqwIdIX/X7r1DUliBlPeXzDGQ0RGR5Bo
 XD6OJf//Q60Uv5nWsMzwF6+u3g8gWckHZBqoJNZLkPc64bKDlb/bEEORVWJK/I21//Vh
 KXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b71nI+sXe01LhMN7x+MBgBsL+VShdc2Sy2WppyA0dDg=;
 b=durNigXqcob7gd8pixHmKjrkWbQUZxow1W0hYcg6Ak+cqC4rsky6teJOjjuGv7G5mx
 vCX6pvfY4IbuayuvEblbbigUMxOyaRAhCXScWH/SqE5ESw8EzqIozLFkoVrD3l4Fm0uy
 +dRyFnexh04x07ANuCoh7Dls6/ZlPBiwz6BYrSYphbppL1fOTxa1y3w/bBZL3m52/Kxe
 S3sjLQJZfW/VUzL16dZaQssRZBEztB1cieEXw0UYpLWm4eFjEw54nTlsM8u8nUB+6fPP
 0PJsvkSqytUBdUKYoEuV7CIE742+SiuAxBBwOUHMmRUwy6ofZKjveuvdWvMWuIWBcYXV
 Ll7g==
X-Gm-Message-State: AOAM5322ZHu/RUtDnJaq9Qi4mcyAKS282tiyPKvBk0cFFsvmHlixgtq8
 HnA7vpcHKF6sb/VnT014n2aGVFZ7PFN6kQCVBIg=
X-Google-Smtp-Source: ABdhPJymcFp9iH6SywNWzD2klDMVpKrlqkVupJ2x7SCU0omuqB54XpAoOccLjlc+WfJI/uVJihMnTER1Im5u/zxRtM0=
X-Received: by 2002:a25:ddc2:: with SMTP id u185mr950650ybg.41.1619145304088; 
 Thu, 22 Apr 2021 19:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210416195432.24595-1-zajec5@gmail.com>
 <20210420212008.13174-1-zajec5@gmail.com>
In-Reply-To: <20210420212008.13174-1-zajec5@gmail.com>
From: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 22 Apr 2021 19:34:53 -0700
Message-ID: <CAN8TOE-hMscEyqpZ+mpeZW85izuprxR-HosDgrD0P9o52ATQdQ@mail.gmail.com>
Subject: Re: [PATCH V3] dt-bindings: mtd: brcm,
 brcmnand: convert to the json-schema
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-mtd@lists.infradead.org, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_193505_813351_293B4B7B 
X-CRM114-Status: GOOD (  11.22  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBBcHIgMjAsIDIwMjEgYXQgMjoyMCBQTSBSYWZhxYIgTWnFgmVja2kgPHphamVjNUBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+Cj4gVGhpcyBoZWxwcyB2YWxpZGF0aW5nIERUUyBmaWxlcy4KCkkgZ290dGEgbGVhcm4g
aG93IHRvIHJlYWQgdGhpcyBzdHVmZiBiZXR0ZXIgc29tZWRheS4uLiBidXQgSSdsbCBnaXZlIGl0
IGEgc2hvdDoKCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC55YW1sCj4gQEAgLTAsMCArMSwyNDIgQEAKLi4u
Cj4gKyAgLSBpZjoKPiArICAgICAgcHJvcGVydGllczoKPiArICAgICAgICBjb21wYXRpYmxlOgo+
ICsgICAgICAgICAgY29udGFpbnM6Cj4gKyAgICAgICAgICAgIGNvbnN0OiBicmNtLG5hbmQtaXBy
b2MKPiArICAgIHRoZW46Cj4gKyAgICAgIHByb3BlcnRpZXM6Cj4gKyAgICAgICAgcmVnLW5hbWVz
Ogo+ICsgICAgICAgICAgbWluSXRlbXM6IDIKPiArICAgICAgICAgIG1heEl0ZW1zOiAzCj4gKyAg
ICAgICAgICBpdGVtczoKPiArICAgICAgICAgICAgLSBjb25zdDogbmFuZAo+ICsgICAgICAgICAg
ICAtIGNvbnN0OiBpcHJvYy1pZG0KPiArICAgICAgICAgICAgLSBjb25zdDogaXByb2MtZXh0CgpS
ZWFkaW5nIHRoZSBvcmlnaW5hbCBiaW5kaW5nIGFzIHdlbGwgYXMgdGhlIGNvZGUsIEkgYmVsaWV2
ZSBhbGwgdGhyZWUKYXJlIHJlcXVpcmVkLiBXb3VsZG4ndCB0aGF0IGJlIG1pbkl0ZW1zID0gbWF4
SXRlbXMgPSAzPwoKT3RoZXIgdGhhbiB0aGF0LCB0aGlzIGxvb2tzIGdvb2QgdG8gbWU6CgpSZXZp
ZXdlZC1ieTogQnJpYW4gTm9ycmlzIDxjb21wdXRlcnNmb3JwZWFjZUBnbWFpbC5jb20+CgpUaGFu
a3MhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
