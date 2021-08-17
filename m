Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24CD3C432BE
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 15:50:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5F5160ED5
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 15:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C5F5160ED5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=W4JOdprGkDgs3vK/ViuHZ65EiyFmyLM1n4Tbw/iml1c=; b=my6kp+l68gCq1bu/5MeSfaa6yt
	/OxUa4KI9d12xiRq2TMW1ZgJs56CXS1gQon79Q9haVpYxYYFbf6QdLWWB2aT/QDQrOebN4gh2r0+H
	M1sAFaquKMgEb17axQlcZI+oY+jA2ZEqaVw2hUHAnm32hJASxxYuZcUHCVbBUUzZRMF/z8RnaBth4
	+uvZ2x8T+GowoyXDuvAsLs+p7EJGu9IUgb14JOKzCj3eDAwwBpxrK2Tn5OW9LrDzW4jvqBbrWqQT3
	6JEsCJxwxaToUj8tfoBR/gtukDvT348WUZ9JyVOYlaFQ6KNcn+L6P/uPsZHk0/VtvdFAclVqZTO63
	hdQ/G1xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG1L1-002s0w-A3; Tue, 17 Aug 2021 15:49:15 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG1Kv-002rxP-33
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 15:49:13 +0000
Received: by mail-lf1-x12a.google.com with SMTP id d4so42162321lfk.9
 for <linux-mtd@lists.infradead.org>; Tue, 17 Aug 2021 08:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fG8UNioj9Gykdv3jKLDDqlFZPR9Bq4ObXeUmu51BqTw=;
 b=qCj8PB2xsh0Gwhg/Mz8T/C3RsrPHTbLP+N4lR2Yg2TB3ET2WkMAO1wgbBYR2q7lO68
 Pc49VlqXQ3dpjJrNlM2C3tPYEqqyhTGSf8sYJWR5lp0WvXn++4GF++0cA3bUAvac9XRG
 g9ViFPs99qgAUHDXdueeQwSgYGDFI/IeqfENUgVVD/rI4Q1ZQoN06DvNSee5A4aKmCOu
 S+uE5zA5q9Snqs4dlpyOLydNmfB2J5W4GujW2PkG6xWyoiPHtLSNJ/LrYoAzYXP3c7VD
 AfB16sdCF6PcILWyGV5dGRZGFQ3HUP80m2Rig47x3ImvxaecyvAZWvXPV2nsoVl7dQ3l
 YRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fG8UNioj9Gykdv3jKLDDqlFZPR9Bq4ObXeUmu51BqTw=;
 b=NALIcfVhLWgqu6pw3nvFZ0pqzlLeFbrEDTwGxJTpLfuwua8HeUGYk7MUDr8KNe4QtA
 bQtTiNzJvEbOASzN8Mbg2rVp7468D932TiA2qF0eqXhP23Z4CqeNCMiW50dgHTMNYazS
 EjyqMOCVvjlzva8+nKUDVUpS89m8GOfAJ5FKKBwmXpktyrayNErM5KhRozVUtoi6Skag
 716VjI5ZQH2+r2mMCOBwQH0BTvMzpksp7vUXy5eZcmL0mPwWaH2kgvEjbQwAG4ocb1cp
 yTK439K4RUnJRa1wvLOhIPlhXiqbdR7wD8E0skIOxfjUknZhJ4S7CfMYPfyaLjco4Pgu
 pTUQ==
X-Gm-Message-State: AOAM533H7+S1+wfWTPmnQCxCbicexCuFB5HSPslccu/Z5ziyJh7VHeq3
 IoQ5QgJHoBn+7ti2EqjVqnM=
X-Google-Smtp-Source: ABdhPJxH1hLTa5AxArOQ97RRWFvJ/qFdnD++u1srz4ssoaY8ztFeO7SrfDBXxb0r5VIrFxPoMPyxwA==
X-Received: by 2002:a19:7603:: with SMTP id c3mr2817435lff.543.1629215345270; 
 Tue, 17 Aug 2021 08:49:05 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id k1sm221767lfg.187.2021.08.17.08.49.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 08:49:04 -0700 (PDT)
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
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
 <20210817012754.8710-2-digetx@gmail.com>
 <20210817075515.vyyv7z37e6jcrhsl@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <710261d9-7ae3-5155-c0a2-f8aed2408d0b@gmail.com>
Date: Tue, 17 Aug 2021 18:49:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817075515.vyyv7z37e6jcrhsl@vireshk-i7>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_084909_165301_4E5501A5 
X-CRM114-Status: GOOD (  19.82  )
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

MTcuMDguMjAyMSAxMDo1NSwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Ci4uLgo+PiAraW50IGRl
dl9wbV9vcHBfc3luYyhzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+ICt7Cj4+ICsJc3RydWN0IG9wcF90
YWJsZSAqb3BwX3RhYmxlOwo+PiArCXN0cnVjdCBkZXZfcG1fb3BwICpvcHA7Cj4+ICsJaW50IHJl
dCA9IDA7Cj4+ICsKPj4gKwkvKiBEZXZpY2UgbWF5IG5vdCBoYXZlIE9QUCB0YWJsZSAqLwo+PiAr
CW9wcF90YWJsZSA9IF9maW5kX29wcF90YWJsZShkZXYpOwo+PiArCWlmIChJU19FUlIob3BwX3Rh
YmxlKSkKPj4gKwkJcmV0dXJuIDA7Cj4+ICsKPj4gKwlpZiAoIV9nZXRfb3BwX2NvdW50KG9wcF90
YWJsZSkpCj4+ICsJCWdvdG8gcHV0X3RhYmxlOwo+PiArCj4+ICsJb3BwID0gX2ZpbmRfY3VycmVu
dF9vcHAoZGV2LCBvcHBfdGFibGUpOwo+PiArCXJldCA9IF9zZXRfb3BwKGRldiwgb3BwX3RhYmxl
LCBvcHAsIG9wcC0+cmF0ZSk7Cj4gCj4gQW5kIEkgYW0gbm90IHN1cmUgaG93IHRoaXMgd2lsbCBl
bmQgdXAgd29ya2luZywgc2luY2UgbmV3IE9QUCB3aWxsIGJlCj4gZXF1YWwgdG8gb2xkIG9uZS4g
U2luY2UgSSBzZWUgeW91IGNhbGwgdGhpcyBmcm9tIHJlc3VtZSgpIGF0IG1hbnkKPiBwbGFjZXMu
CgpJbml0aWFsbHkgT1BQIHRhYmxlIGlzICJ1bmluaXRpYWxpemVkIiBhbmQgb3BwX3RhYmxlLT5l
bmFibGVkPWZhbHNlLApoZW5jZSB0aGUgZmlyc3Qgc3luYyBhbHdheXMgd29ya3MgZXZlbiBpZiBP
UFAgaXMgZXF1YWwgdG8gb2xkIG9uZS4gT25jZQpPUFAgaGFzIGJlZW4gc3luY2VkLCBhbGwgZnVy
dGhlciBzeW5jcyBhcmUgTk8tT1BzLCBoZW5jZSBpdCBkb2Vzbid0Cm1hdHRlciBob3cgbWFueSB0
aW1lcyBzeW5jaW5nIGlzIGNhbGxlZC4KCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4
L3Y1LjE0LXJjNi9zb3VyY2UvZHJpdmVycy9vcHAvY29yZS5jI0wxMDEyCgo+IHdoYXQgZXhhY3Rs
eSBhcmUgeW91IHRyeWluZyB0byBkbyBoZXJlID8gVGhvc2UgZGV0YWlscyB3b3VsZCBiZSBnb29k
Cj4gdG8gaGF2ZSBpbiBjb21taXQgbG9nIGFzIHdlbGwsIEkgaGF2ZW4ndCByZWFsbHkgZm9sbG93
ZWQgVjcgb2YgeW91cgo+IHNlcmllcy4KCkknbSBpbml0aWFsaXppbmcgdm9sdGFnZS9wb3dlciBz
dGF0ZSBvZiBPUFAgdGFibGUgaW4gYWNjb3JkYW5jZSB0byB0aGUKY2xvY2sgcmF0ZSwgYnVtcGlu
ZyB2b2x0YWdlIGJlZm9yZSBjbG9jayBpcyBlbmFibGVkIGJ5IGRldmljZSBkcml2ZXIuCkknbGwg
aW1wcm92ZSB0aGUgY29tbWl0IG1lc3NhZ2UuCgpBbiBhbHRlcm5hdGl2ZSB0byB0aGUgZXhwbGlj
aXQgc3luY2luZyBjb3VsZCBiZSBzb21ldGhpbmcgbGlrZSBhIG5ldwpkZXZfcG1fb3BwX3Jlc3Vt
ZS9zdXNwZW5kIGhlbHBlcnMgdGhhdCB3aWxsIHRha2UgY2FyZSBvZgplbmFibGluZy9kaXNhYmxp
bmcgdGhlIE9QUCB0YWJsZSBjbG9jay9ldGMgYW5kIHN5bmNpbmcgdGhlIE9QUCBzdGF0ZQp3aXRo
IGgvdy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
