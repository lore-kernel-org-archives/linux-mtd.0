Return-Path: <SRS0=KyYR=PJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D167BC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 10:57:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D579D60F46
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 10:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D579D60F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QOQ57wTWXv7+x685g+JEkkbfT4xAj75R0SeDheumVpg=; b=v2iOrP71CacMQF
	3OkiIJRkYfGuHWEU0+Ox1B/4+gC+J730sRxCKnyktAwXebvqz79L5lwPUzRI++Mbt4/Ktavh0Vv8q
	tAOmNbJJlwJludBwzgSI/RQ1USCjRI69i3JYf75/9yzp0OuYoE1mMxIvwHT/7Mh/xC0UwgYMmyt2s
	1CYw+Tkia1NwI9FV+RaOWL8mahT2KUID0LNK8Fx06IP+utZ7RpbqhXqSODw2CSN1xkZJ8rBi8II9c
	M0I20+oqr46a5i5Pee85WA05ExF22Zwzs8V6ygZqtJuOkmS64IFfdJKwrZxSNqVoGpO5h4ZPzbqyC
	cwdsoxAiK50p45s78YzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdVlB-007Ihv-98; Thu, 21 Oct 2021 10:57:21 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdVl8-007IhJ-D5
 for linux-mtd@lists.infradead.org; Thu, 21 Oct 2021 10:57:19 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 s198-20020a1ca9cf000000b0030d6986ea9fso366118wme.1
 for <linux-mtd@lists.infradead.org>; Thu, 21 Oct 2021 03:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=2q8epunI2YJhS7Y5OvXRSfgnjSjIlOxQhWm8Zime4ZA=;
 b=wzK981VLSe8rOftFqyi7FSQznuKzeJC7z9un27zFAQKuoZaLfKG+i6biCvyisY7FSn
 zP8ZeN28SeeIlOCbB5YLgUvfTp0AdPc3HHatbOdQWH+iPb3dZcdvHe8u5phYwiBwUYvX
 yuVhM3qbhR11RJQzT75URYmoIeBXBfZCApiliAPma5gmh0gfMmZJtwGuQvat131RkNSF
 fKnE1gqepZtoaGLI4oh21Oaf+Rx+oI902OfGpeZD1Yi4xfMAeILgyRjHJ6A8CGSL1d8n
 PSv0ZGM/CctnF5vQP97w039WJ+upPbg3VIzC+kS/RWWA0bPmUdwuNJFLrUEqQI2TInzP
 2urA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2q8epunI2YJhS7Y5OvXRSfgnjSjIlOxQhWm8Zime4ZA=;
 b=Z5lTrVb4aErojU9yDF54r+DNzbjXX6NTtF/k413Ry33BZc4TFGgVWvh20lhqMYJNix
 jUGjkNnuBxfUqVFCetIH9WvJ2YboVMdCp0z20qEHC/M45rSIcGhkgLpqi7bq8FVG/b0u
 uWgzV6vb9iPsaWTBFv7IKof+CZ6s6KkkK3edHi6joqqV6GtOjjhq/OyQHyZOEX2vQW4e
 5ZjoQynZjxX+zcrzrJ3wOqjXxu7St9omatqqUV/lBggAbAMM3AkYTDvWomf5jiMI+anf
 Mdbhw9YrJKR+a/ZfuQgK4638yjnftkdQ09OymzeNqU2mOWikcaYqpleu+5XzletbjRCm
 gu2Q==
X-Gm-Message-State: AOAM533ked/h4A/vyWqWJS0V4EXtwSgRPsrO0kNNJ/dwvSMxkx4OpVO+
 NBv3edASsbgdR1bz1O+PlCGAqw==
X-Google-Smtp-Source: ABdhPJwq6IzyGk5NqRL6jkJfSRsLMIAxvgYpLGUX6cV1w4RGXuY5ZSGXnYWzepTgkl78EuNFZdHfkA==
X-Received: by 2002:a1c:7c0e:: with SMTP id x14mr5795779wmc.128.1634813836516; 
 Thu, 21 Oct 2021 03:57:16 -0700 (PDT)
Received: from google.com ([95.148.6.207])
 by smtp.gmail.com with ESMTPSA id l40sm4871132wms.31.2021.10.21.03.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 03:57:16 -0700 (PDT)
Date: Thu, 21 Oct 2021 11:57:14 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mark Brown <broonie@kernel.org>, Michael Walle <michael@walle.cc>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Mauro Lima <mauro.lima@eclypsium.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 2/3] mtd: spi-nor: intel-spi: Convert to SPI MEM
Message-ID: <YXFHimJ75Bpg5sSP@google.com>
References: <20211007112132.30934-1-mika.westerberg@linux.intel.com>
 <20211007112132.30934-3-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211007112132.30934-3-mika.westerberg@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_035718_471903_77300BF5 
X-CRM114-Status: GOOD (  16.41  )
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

T24gVGh1LCAwNyBPY3QgMjAyMSwgTWlrYSBXZXN0ZXJiZXJnIHdyb3RlOgoKPiBUaGUgcHJlZmVy
cmVkIHdheSB0byBpbXBsZW1lbnQgU1BJLU5PUiBjb250cm9sbGVyIGRyaXZlcnMgaXMgdGhyb3Vn
aCBTUEkKPiBzdWJzdWJzeXN0ZW0gdXRpbGl6aW5nIHRoZSBTUEkgTUVNIGNvcmUgZnVuY3Rpb25z
LiBUaGlzIGNvbnZlcnRzIHRoZQo+IEludGVsIFNQSSBmbGFzaCBjb250cm9sbGVyIGRyaXZlciBv
dmVyIHRoZSBTUEkgTUVNIGJ5IG1vdmluZyB0aGUgZHJpdmVyCj4gZnJvbSBTUEktTk9SIHN1YnN5
c3RlbSB0byBTUEkgc3Vic3lzdGVtIGFuZCBpbiBvbmUgZ28gbWFrZSBpdCB1c2UgdGhlCj4gU1BJ
IE1FTSBmdW5jdGlvbnMuIFRoZSBkcml2ZXIgbmFtZSB3aWxsIGJlIGNoYW5nZWQgZnJvbSBpbnRl
bC1zcGkgdG8KPiBzcGktaW50ZWwgdG8gbWF0Y2ggdGhlIGNvbnZlbnRpb24gdXNlZCBpbiB0aGUg
U1BJIHN1YnN5c3RlbS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaWthIFdlc3RlcmJlcmcgPG1pa2Eu
d2VzdGVyYmVyZ0BsaW51eC5pbnRlbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL3NwaS1ub3Iv
Y29udHJvbGxlcnMvS2NvbmZpZyAgICAgICB8ICAzNiAtLS0KPiAgZHJpdmVycy9tdGQvc3BpLW5v
ci9jb250cm9sbGVycy9NYWtlZmlsZSAgICAgIHwgICAzIC0KPiAgZHJpdmVycy9tdGQvc3BpLW5v
ci9jb250cm9sbGVycy9pbnRlbC1zcGkuaCAgIHwgIDIxIC0tCj4gIGRyaXZlcnMvc3BpL0tjb25m
aWcgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAzOSArKysKPiAgZHJpdmVycy9zcGkvTWFr
ZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAzICsKPiAgLi4uL2ludGVsLXNwaS1w
Y2kuYyA9PiBzcGkvc3BpLWludGVsLXBjaS5jfSAgIHwgIDIwICstCj4gIC4uLi9zcGktaW50ZWwt
cGxhdGZvcm0uY30gICAgICAgICAgICAgICAgICAgICB8ICAyMSArLQo+ICAuLi4vaW50ZWwtc3Bp
LmMgPT4gc3BpL3NwaS1pbnRlbC5jfSAgICAgICAgICAgfCAzMDQgKysrKysrKysrKystLS0tLS0t
Cj4gIGRyaXZlcnMvc3BpL3NwaS1pbnRlbC5oICAgICAgICAgICAgICAgICAgICAgICB8ICAxOSAr
Kwo+ICBpbmNsdWRlL2xpbnV4L21mZC9scGNfaWNoLmggICAgICAgICAgICAgICAgICAgfCAgIDIg
Ky0KPiAgLi4uL3g4Ni97aW50ZWwtc3BpLmggPT4gc3BpLWludGVsLmh9ICAgICAgICAgIHwgICA2
ICstCj4gIDExIGZpbGVzIGNoYW5nZWQsIDI1NCBpbnNlcnRpb25zKCspLCAyMjAgZGVsZXRpb25z
KC0pCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xsZXJz
L2ludGVsLXNwaS5oCj4gIHJlbmFtZSBkcml2ZXJzL3ttdGQvc3BpLW5vci9jb250cm9sbGVycy9p
bnRlbC1zcGktcGNpLmMgPT4gc3BpL3NwaS1pbnRlbC1wY2kuY30gKDg2JSkKPiAgcmVuYW1lIGRy
aXZlcnMve210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL2ludGVsLXNwaS1wbGF0Zm9ybS5jID0+IHNw
aS9zcGktaW50ZWwtcGxhdGZvcm0uY30gKDY1JSkKPiAgcmVuYW1lIGRyaXZlcnMve210ZC9zcGkt
bm9yL2NvbnRyb2xsZXJzL2ludGVsLXNwaS5jID0+IHNwaS9zcGktaW50ZWwuY30gKDgwJSkKPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc3BpL3NwaS1pbnRlbC5oCj4gIHJlbmFtZSBpbmNs
dWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEveDg2L3tpbnRlbC1zcGkuaCA9PiBzcGktaW50ZWwuaH0g
KDg5JSkKCkZvciB0aGUgTUZEIHBhcnRzOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAKIEFja2VkLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25l
c0BsaW5hcm8ub3JnPiAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApXaG9ldmVyIGVu
ZHMgdXAgdGFraW5nIHRoaXMgbmVlZHMgdG8gc2VuZCBvdXQgYSBwdWxsLXJlcXVlc3QgdG8gYW4K
aW1tdXRhYmxlIGJyYW5jaCBwbGVhc2UuICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVh
ZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2Fy
ZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
