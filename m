Return-Path: <SRS0=z9um=NK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5327C4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 22:38:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81A4C60462
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 22:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81A4C60462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=aN5Wi/ZUQKYisBFG+5y2oTrKnlIeZ+QbiliGVakBEPQ=; b=bBrqIwLpteCULxQnMxkBjXzrw/
	HfgkxvYWGXEvijV0rCEMETkEWH/Zm4+blout47h7suFbEMcgdIyvxutUL32fdZOEtrRVjhpYTSrmn
	eQuQWj5S8L/b5+nDC6u4uW5Ru8rrOSE4mmCH10tfYu2FRu+gJoOw4FGETnbdoqe2cAzsKvzeWDq6l
	VnHgpgpB2jqg3IUQ5B3sjKa0AQ/ke4rlZJB2iQIV3v7PvwPM8fCQVyjaExIlYz3kHFjYl4tqlrmA7
	DQHno+MBFqAO/V9GHIXqTM3/Ke5zJae4rFZFfBuWazFg3myC0iCoRW26RfRp6o8I1a8KQoyVBooAQ
	7Ae2jCQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGqf2-009fB0-W0; Thu, 19 Aug 2021 22:37:21 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGqey-009f9o-Nv
 for linux-mtd@lists.infradead.org; Thu, 19 Aug 2021 22:37:19 +0000
Received: by mail-lf1-x12b.google.com with SMTP id w20so16168839lfu.7
 for <linux-mtd@lists.infradead.org>; Thu, 19 Aug 2021 15:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nAS9qcnivKqgeAIIut8h1WFAVA13oxF52QRobcHq7Xc=;
 b=a4XV4VjRWxo1kHnGEwcEOxFKRCM6deOw4lOM9Uon818SGJgn0YPFw4DdKti64wBV9H
 ZocBdzpcFtuEYqk3Wa8+HUMj2ko6agOMxjv09whIIThddMbYROGGAAS4Plcpv1Z18cgY
 5sKTsW0BmphWVrS/Tiinzv52JEwYHnlvjz/kC/ONQmk2H2QZrW0O70369IiptcK6UmEd
 XneH4My93CRKDRkqsBmuCdSoAuWcBI3J8xEuCJKQTSLx7Jnn2Qku3bl3B0b4iwQ7W5+X
 bMdlKDDR1RyjIOyTN2oZCz5u+iQg+iw/06K9i+IzAB7AjGsFZejlDhk+M4jSdmwerMgk
 ecRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nAS9qcnivKqgeAIIut8h1WFAVA13oxF52QRobcHq7Xc=;
 b=BsjkBgiQ/UsYSi5DXTma9Rh+xETKlbcjNNVcDaorOhWjDi5VQzki6KPLJBmsSRiYUz
 FfbYK4eM18tjpRskc7gBUjOn1e08wDaxPcFbpnRkXwk6e4oDbsRLuRsH/25RNydaubVa
 WgB6xKEmYLR3f4ozAkRpT7krRkbWYZMOfliEaUO3Mt5Wa3PP8phl9Uzi51fXHWi0mjkH
 mrIur7XonPqTCPvYm0JnDLIW23g2UvpJUSdRlfa39VdvBd2PAIrfHCBcrFrUQhDKNnUu
 mEu0gix37+UlWQB/pb19rWISTpjzFCWGNQGOsBrA/8G990QApk4qZC9NZT8d+o0PW9OU
 uqKw==
X-Gm-Message-State: AOAM533o2/2+YkzecamS9r05mEWzKxgfnCxeIPSp/Wcrr71/Qa5ZWK6c
 z2C0yJ8wuIflpKZecgVdWVY=
X-Google-Smtp-Source: ABdhPJwuMIWgok5xoSqa52pUigQi/FuENEcCid7QFl2xNGsNEC360zffkjPyNHa+eJldf8U6/MOiRQ==
X-Received: by 2002:a05:6512:b8e:: with SMTP id
 b14mr12930460lfv.449.1629412634809; 
 Thu, 19 Aug 2021 15:37:14 -0700 (PDT)
Received: from [192.168.2.145] (46-138-120-72.dynamic.spd-mgts.ru.
 [46.138.120.72])
 by smtp.googlemail.com with ESMTPSA id b19sm437171lff.121.2021.08.19.15.37.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 15:37:14 -0700 (PDT)
Subject: Re: [PATCH v8 20/34] mmc: sdhci-tegra: Add runtime PM and OPP support
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-21-digetx@gmail.com> <YR6O9Om+HzMMG8AR@orome.fritz.box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <05b7ff28-4c01-fb56-deeb-595a5797394b@gmail.com>
Date: Fri, 20 Aug 2021 01:37:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YR6O9Om+HzMMG8AR@orome.fritz.box>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_153716_842163_E6DBD5E1 
X-CRM114-Status: GOOD (  24.28  )
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

MTkuMDguMjAyMSAyMDowMywgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBUdWUsIEF1
ZyAxNywgMjAyMSBhdCAwNDoyNzo0MEFNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
IFRoZSBTREhDSSBvbiBUZWdyYSBiZWxvbmdzIHRvIHRoZSBjb3JlIHBvd2VyIGRvbWFpbiBhbmQg
d2UncmUgZ29pbmcgdG8KPj4gZW5hYmxlIEdFTlBEIHN1cHBvcnQgZm9yIHRoZSBjb3JlIGRvbWFp
bi4gTm93IFNESENJIG11c3QgYmUgcmVzdW1lZCB1c2luZwo+PiBydW50aW1lIFBNIEFQSSBpbiBv
cmRlciB0byBpbml0aWFsaXplIHRoZSBTREhDSSBwb3dlciBzdGF0ZS4gVGhlIFNESENJCj4+IGNs
b2NrIHJhdGUgbXVzdCBiZSBjaGFuZ2VkIHVzaW5nIE9QUCBBUEkgdGhhdCB3aWxsIHJlY29uZmln
dXJlIHRoZSBwb3dlcgo+PiBkb21haW4gcGVyZm9ybWFuY2Ugc3RhdGUgaW4gYWNjb3JkYW5jZSB0
byB0aGUgcmF0ZS4gQWRkIHJ1bnRpbWUgUE0gYW5kIE9QUAo+PiBzdXBwb3J0IHRvIHRoZSBTREhD
SSBkcml2ZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdt
YWlsLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL21tYy9ob3N0L3NkaGNpLXRlZ3JhLmMgfCAxNDYg
KysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMTA1
IGluc2VydGlvbnMoKyksIDQxIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tbWMvaG9zdC9zZGhjaS10ZWdyYS5jIGIvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS10ZWdyYS5j
Cj4+IGluZGV4IDM4N2NlOWNkYmQ3Yy4uYTM1ODMzNTljOTcyIDEwMDY0NAo+PiAtLS0gYS9kcml2
ZXJzL21tYy9ob3N0L3NkaGNpLXRlZ3JhLmMKPj4gKysrIGIvZHJpdmVycy9tbWMvaG9zdC9zZGhj
aS10ZWdyYS5jCj4+IEBAIC0xNSw2ICsxNSw4IEBACj4+ICAjaW5jbHVkZSA8bGludXgvb2YuaD4K
Pj4gICNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4KPj4gICNpbmNsdWRlIDxsaW51eC9waW5j
dHJsL2NvbnN1bWVyLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvcG1fb3BwLmg+Cj4+ICsjaW5jbHVk
ZSA8bGludXgvcG1fcnVudGltZS5oPgo+PiAgI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25z
dW1lci5oPgo+PiAgI2luY2x1ZGUgPGxpbnV4L3Jlc2V0Lmg+Cj4+ICAjaW5jbHVkZSA8bGludXgv
bW1jL2NhcmQuaD4KPj4gQEAgLTI0LDYgKzI2LDggQEAKPj4gICNpbmNsdWRlIDxsaW51eC9ncGlv
L2NvbnN1bWVyLmg+Cj4+ICAjaW5jbHVkZSA8bGludXgva3RpbWUuaD4KPj4gIAo+PiArI2luY2x1
ZGUgPHNvYy90ZWdyYS9jb21tb24uaD4KPj4gKwo+PiAgI2luY2x1ZGUgInNkaGNpLXBsdGZtLmgi
Cj4+ICAjaW5jbHVkZSAiY3FoY2kuaCIKPj4gIAo+PiBAQCAtMTIzLDYgKzEyNywxMiBAQAo+PiAg
CQkJCQkgU0RIQ0lfVFJOU19CTEtfQ05UX0VOIHwgXAo+PiAgCQkJCQkgU0RIQ0lfVFJOU19ETUEp
Cj4+ICAKPj4gK2VudW0gewo+PiArCVRFR1JBX0NMS19CVUxLX1NESENJLAo+PiArCVRFR1JBX0NM
S19CVUxLX1RNQ0xLLAo+PiArCVRFR1JBX0NMS19CVUxLX05VTSwKPj4gK307Cj4+ICsKPj4gIHN0
cnVjdCBzZGhjaV90ZWdyYV9zb2NfZGF0YSB7Cj4+ICAJY29uc3Qgc3RydWN0IHNkaGNpX3BsdGZt
X2RhdGEgKnBkYXRhOwo+PiAgCXU2NCBkbWFfbWFzazsKPj4gQEAgLTE3MSw2ICsxODEsOCBAQCBz
dHJ1Y3Qgc2RoY2lfdGVncmEgewo+PiAgCWJvb2wgZW5hYmxlX2h3Y3E7Cj4+ICAJdW5zaWduZWQg
bG9uZyBjdXJyX2Nsa19yYXRlOwo+PiAgCXU4IHR1bmVkX3RhcF9kZWxheTsKPj4gKwo+PiArCXN0
cnVjdCBjbGtfYnVsa19kYXRhIGNsb2Nrc1tURUdSQV9DTEtfQlVMS19OVU1dOwo+IAo+IFRoaXMg
ZG9lc24ndCBzZWVtIHdvcnRoIGl0IHRvIG1lLiBUaGVyZSdzIGEgbG90IG9mIGNodXJuIGluIHRo
aXMgZHJpdmVyCj4gdGhhdCdzIG9ubHkgbmVlZGVkIHRvIGNvbnZlcnQgdGhpcyB0byB0aGUgY2xr
X2J1bGsgQVBJIGFuZCBpdCBtYWtlcyB0aGUKPiBjb2RlIGEgbG90IG1vcmUgZGlmZmljdWx0IHRv
IHJlYWQsIGluIG15IG9waW5pb24uCj4gCj4gSXQgbG9va3MgbGlrZSB0aGUgb25seSBiZW5lZml0
IHRoYXQgdGhpcyBnaXZlcyB1cyBpcyB0aGF0IHJ1bnRpbWUKPiBzdXNwZW5kIGFuZCByZXN1bWUg
YmVjb21lIGEgZmV3IGxpbmVzIHNob3J0ZXIuCgpUaGUgZHJpdmVyIHByb2JlIGNvZGUgbG9va3Mg
Y2xlYW5lciB3aXRoIHRoYXQuIFlvdSBzaG91bGQgYmUgbG9va2luZyBhdAp0aGUgZmluYWwgcmVz
dWx0IGFuZCBub3QgYXQgdGhlIHBhdGNoIHRvIHNlZSBpdC4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
