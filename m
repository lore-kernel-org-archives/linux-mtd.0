Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF82C282EC
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Mar 2025 07:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=szwSc3RRhKhR1lsPge9L1cmXRdZ2MH9gXr0ngI06V7U=; b=JEhubHEDEzkkpN
	3MwIDMDnOYdOlGh8LFTfW7MIeiP5WTBonptc2EC5x6UvvZLK7YJgRtvxPfbbUfTYbGQzfl1TH7fdz
	xVzhYW4vwhSeK7yanX+5ZebLezTHjnAYpOC84qd70OTMHIMy8T12cowHgFUAoh4LZ595o266vZxty
	PjUSSfSNH+1hJ9RQjtoe56Dal3UsXNBAjBRbT6uwMQPBnxUWcHF9ilabr3tKqRoCjLYXRvZv7a7CR
	z3YQ79sdETx0perWnpr6K/5c1mVVNN5TMWt2JzxUnkRN3fFUSvSvdJEkKFktQdATFXy/fBo34/xuS
	qt8XA1AQc3MokeKZvZWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRSG-00000004vbT-27Qq;
	Tue, 18 Mar 2025 07:33:40 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRSD-00000004vb4-1m9R
	for linux-mtd@lists.infradead.org;
	Tue, 18 Mar 2025 07:33:38 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2232aead377so117441405ad.0
        for <linux-mtd@lists.infradead.org>; Tue, 18 Mar 2025 00:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742283217; x=1742888017; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oOISki8dnLdBinmyN5Fhhwr/b+hOKzHW4IWqOj6LscA=;
        b=jeKA94lU65o9cqOq3fu8/30czD0atw4yrjj4wEimdFNuORtnx8H6mwaFrCQPWGUZzy
         IyuWk03gubV0d4lSqwdlTHsyHYWH3+ZtMUH0bO19QFXAj5tTlO18bbVQt1wzkoMIMTYA
         4Un0KrtFxafkmT2fSGtDdreFJE851GCmOwV/kPic5E8pyZlJJKy95cDAHVJBY/nnfrzl
         e7oiVZkX18H3BZyWKuBNDkYiO1RDBUKGKAPMp0KdIG+BwqkvhIZAZV+jae7+/Ewb+YEx
         PFRa89lWtIqMrkXGsdHzZxpYf9TWkJu9Fay4ZKfopN9cHn2y4irbvd7yemT1MPL81GW2
         hUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742283217; x=1742888017;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oOISki8dnLdBinmyN5Fhhwr/b+hOKzHW4IWqOj6LscA=;
        b=mrt0dAGSMoTRSVo4dwwdW50Wa+XlgsS0WljlHnWK0QK8EiJdu4R7Wksgqk25TzkHq5
         1eIsSOEw8UwkFVFmB0KgfdT5YyV/1cHbp69sXJkMdSMhoyzQTtjnLD6MqatRxN6+m82t
         nNg1fbRSpBla9sMOVHoztSW1EzreDJoJ2c3dm7lfsMq0b03OP3hKnD5Pl0mXf2Q5F2Ox
         IJHz/CRHmF0LyFuUOG763e8VIDY0aYyBn2gkBhLScu+CSLuqwyMFfYP2a02nZf8ddbny
         oJ7bujKa27F96qhArEKWOk1kHlipbzQO5lCyoFQB0lVxG+nGw24ZJkKURgOQkEHzqNMD
         okLQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6p/zmro4pIaW4g0p4lYNUDVZiC8YIwnH+TtLFcf3J+v6GK5NPXwy8uFk6iyg5BJNZ3O/fZNcvRmQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxCt3xcYLuTDLeF/Jde0VLz+jWLg6rpz34t5d4yvY+JPurfQLCZ
	yU/4OiM0KFaQKIAAicxMMYA71IZS1vqAOddyfeWkOvKZH3o6pURW0fDZhXLpGQ==
X-Gm-Gg: ASbGncufYDNLVmkOl226W28/i0Z7ed8bZlKsADVRNPJouc1J/GAg6imVlS/2XXr++ME
	GNb1z8nDEuhvWfbH2bzuFb3wpBu6gB0t2xtCiDtB/hBoFLmYIUxXC02Y9CFo6rKQNcHsnuAFatg
	RnoiBFmqRvev5lDhm/JTwP6TZ7/fIZsZgpJd83uk/7JM2Jke6m1PYbrDvUgH4AR1beo89Sl+V9+
	+TPvQutPv66hNH2S6xw4ERfHvf8uRC8X5qIbeg8XT71CVs5AJlcahPgGo2Wp0RbY/TQA9MJgqZt
	jyl0wSqYD+u7BP696pxKIwDavlBKAceq2Pc9d224siXVusdpdvTMICIN44KN6FHL6kA=
X-Google-Smtp-Source: AGHT+IHFVJZtu55P6A5DXRQBgEp/mTXhH/XT9ESOfze6ksB+o7qEeCG3zUQ7NMUJih+FIIspGKyTcQ==
X-Received: by 2002:a05:6a00:3cc8:b0:736:5b85:a911 with SMTP id d2e1a72fcca58-7372239a441mr22267474b3a.8.1742283216714;
        Tue, 18 Mar 2025 00:33:36 -0700 (PDT)
Received: from thinkpad ([120.56.195.170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73760713875sm260507b3a.33.2025.03.18.00.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 00:33:36 -0700 (PDT)
Date: Tue, 18 Mar 2025 13:03:32 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	broonie@kernel.org, bbrezillon@kernel.org,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v3 1/4] mtd: rawnand: qcom: Pass 18 bit offset from QPIC
 base address to BAM
Message-ID: <20250318073332.guylcyqjmfq5nyyr@thinkpad>
References: <20250310120906.1577292-1-quic_mdalam@quicinc.com>
 <20250310120906.1577292-2-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250310120906.1577292-2-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_003337_468849_CAEF869A 
X-CRM114-Status: GOOD (  19.38  )
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

T24gTW9uLCBNYXIgMTAsIDIwMjUgYXQgMDU6Mzk6MDNQTSArMDUzMCwgTWQgU2FkcmUgQWxhbSB3
cm90ZToKPiBDdXJyZW50bHkgd2UgYXJlIGNvbmZpZ3VyaW5nIGxvd2VyIDI0IGJpdHMgb2YgYWRk
cmVzcyBpbiBkZXNjcmlwdG9yCj4gd2hlcmVhcyBRUElDIGRlc2lnbiBleHBlY3RzIDE4IGJpdCBy
ZWdpc3RlciBvZmZzZXQgZnJvbSBRUElDIGJhc2UKPiBhZGRyZXNzIHRvIGJlIGNvbmZpZ3VyZWQg
aW4gY21kIGRlc2NyaXB0b3JzLiBUaGlzIGlzIGxlYWRpbmcgdG8gYQo+IGRpZmZlcmVudCBhZGRy
ZXNzIGFjdHVhbGx5IGJlaW5nIHVzZWQgaW4gSFcsIGxlYWRpbmcgdG8gd3JvbmcgdmFsdWUKPiBy
ZWFkLgo+IAo+IHRoZSBhY3R1YWwgaXNzdWUgaXMgdGhhdCB0aGUgTkFORGMgYmFzZSBhZGRyZXNz
IGlzIGRpZmZlcmVudCBmcm9tIHRoZQo+IFFQSUMgYmFzZSBhZGRyZXNzLiBCdXQgdGhlIGRyaXZl
ciBkb2Vzbid0IHRha2UgaXQgaW50byBhY2NvdW50IGFuZCBqdXN0Cj4gdXNlZCB0aGUgUVBJQyBi
YXNlIGFzIHRoZSBOQU5EYyBiYXNlLiBUaGlzIHVzZWQgdG8gd29yayBhcyB0aGUgTkFORGMgSVAK
PiBvbmx5IGNvbnNpZGVycyB0aGUgbG93ZXIgMTggYml0cyBvZiB0aGUgYWRkcmVzcyBwYXNzZWQg
YnkgdGhlIGRyaXZlciB0bwo+IGRlcml2ZSB0aGUgcmVnaXN0ZXIgb2Zmc2V0LiBTaW5jZSB0aGUg
YmFzZSBhZGRyZXNzIG9mIFFQSUMgdXNlZCB0byBjb250YWluCj4gYWxsIDAgZm9yIGxvd2VyIDE4
IGJpdHMgKGxpa2UgMHgwNzk4MDAwMCksIHRoZSBkcml2ZXIgZW5kZWQgdXAgcGFzc2luZyB0aGUK
CldoYXQgaXMgdGhpcyBhZGRyZXNzPyBJcyBpdCBjb21pbmcgZnJvbSBEVD8KCj4gYWN0dWFsIHJl
Z2lzdGVyIG9mZnNldCBpbiBpdCBhbmQgTkFORGMgd29ya2VkIHByb3Blcmx5LiBCdXQgb24gbmV3
ZXIgU29Dcwo+IGxpa2UgU0RYNzUsIHRoZSBRUElDIGJhc2UgYWRkcmVzcyBkb2Vzbid0IGNvbnRh
aW4gYWxsIDAgZm9yIGxvd2VyIDE4IGJpdHMKPiAobGlrZSAweDAxQzk4MDAwKS4gU28gTkFORGMg
c2VlcyB3cm9uZyBvZmZzZXQgYXMgcGVyIHRoZSBjdXJyZW50IGxvZ2ljCj4gCj4gVGhlIGFkZHJl
c3Mgc2hvdWxkIGJlIHBhc3NlZCB0byBCQU0gMHgzMDAwMCArIG9mZnNldC4gSW4gb2xkZXIgdGFy
Z2V0cwoKWW91IGdhdmUgbm8gZXhwbGFuYXRpb24gb24gaG93IHRoaXMgMHgzMDAwMCBvZmZzZXQg
Y2FtZSBpbnRvIHBpY3R1cmUuIEkgZ2F2ZSB0aGUKcmVhc29uaW5nIGluIHYyOgoKIlNEWDU1J3Mg
TkFORGMgYmFzZSBpcyAweDAxYjMwMDAwIGFuZCBpdCBoYXMgYml0cyAxNyBhbmQgMTggc2V0IGNv
cnJlc3BvbmRpbmcgdG8KMHgzMDAwMC4gU28gaXQgaXMgY29ycmVjdCB0aGF0IHRoZSBJUCBvbmx5
IGNvbnNpZGVycyBsb3dlciAxOCBiaXRzIGFuZCBpdCB1c2VkCnRvIHdvcmsgYXMgdGhlIGRyaXZl
ciBlbmRlZCB1cCBwYXNzaW5nIDB4MzAwMCArIHJlZ2lzdGVyIG9mZnNldC4iCgpUaGVuIHlvdSBy
ZXBsaWVkOgoKIlRoaXMgYWRkcmVzcyAweDMwMDAwIGlzIHRoZSBhZGRyZXNzIGZyb20gUVBJQ19C
QVNFIHRvIFFQSUNfRUJJMk5BTkQKZS5nIGZvciBTRFg1NSBhbmQgU0RYNjUgdGhlIFFQSUNfQkFT
RSBpcyAweDAxQjAwMDAwLiBTbyBoZXJlIGxvd2VyIDE4LWJpdHMKYXJlIHplcm8gb25seS4iCgpO
byBvbmUgb3V0c2lkZSBRY29tIGtub3dzIHdoYXQgUVBJQ19CQVNFIGFuZCBRUElDX0VCSTJOQU5E
IGFyZS4gV2UganVzdCBrbm93IHRoZQpOQU5EYyBhZGRyZXNzIG1lbnRpb25lZCBpbiBEVCwgd2hp
Y2ggY29ycmVzcG9uZHMgdG8gMHgwMWIzMDAwMCBmb3IgU0RYNTUuCgpQbGVhc2UgcmV3b3JkIHRo
ZSBjb21taXQgbWVzc2FnZSB0byBwcmVzZW50IHRoZSBmdWxsIHBpY3R1cmUgYW5kIG5vdCBoYWxm
IGJha2VkCmluZm8uIFRoaXMgaXMgdjMsIEkgc2VlIG5vIGltcHJvdmVtZW50IGluIHRoZSBjb21t
aXQgbWVzc2FnZSwgc29ycnkuCgo+IHRoZSBsb3dlciAxOC1iaXRzIGFyZSB6ZXJvIHNvIHRoYXQg
Y29ycmVjdCBhZGRyZXNzIGJlaW5nIHBhYXNlZC4gQnV0Cj4gaW4gbmV3ZXIgdGFyZ2V0cyB0aGUg
bG93ZXIgMTgtYml0cyBhcmUgbm9uLXplcm8gaW4gUVBJQyBiYXNlIHNvIHRoYXQKPiAweDMwMDAw
MCArIG9mZnNldCBnaXZpbmcgdGhlIHdyb25nIHZhbHVlLgo+IAo+IFNEWDc1IDogUVBJQ19RUElD
IHwgMHgwMUM5ODAwMCAoTG93ZXIgMTggYml0cyBhcmUgbm9uIHplcm8pCj4gU0RYNTUgOiBRUElD
X1FQSUMgfCAweDFCMDAwMDAgKExvd2VyIDE4IGJpdHMgYXJlIHplcm8pIFNhbWUgZm9yCgpUaGVy
ZSBpcyBubyBhZGRyZXNzIGFzICcweDFCMDAwMDAnIGluIERULgoKLSBNYW5pCgotLSAK4K6u4K6j
4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
