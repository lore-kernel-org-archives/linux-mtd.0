Return-Path: <SRS0=Ynzp=NM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5103BC4338F
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Aug 2021 17:46:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1050A60F42
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Aug 2021 17:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1050A60F42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=voftYE5f+o7aU+huVQy6Ayb18Q2C2EvRqyMFdU9WYWI=; b=An+9Jb44uwiXNB46L9w/ubKZWQ
	LuuFxbnefgk2C/9vhVFHQPIhRv705fOr+f7brTF/ZcU6hpxF4r6RGUtGqNFioOP4z7vkHP7EN7y8X
	d8CzZ6oUCkM/rGnBEjlPfunCMojx6IaWT9eHlaJT0801BPFPti0+LJ85G8bvwaPnPZ1uMEuv4jIr/
	Qrfo/422bgivBgAM8m6/LOW6ycUFlUfJI0nsIu9yq2BQ51QWapW3SwY5zCyBxcWKX9DUX8iXarEZi
	YsBCeSQyf4eGguDqL79EBXzrE44qAHReleodduIHIFmUm/qgKVsYdgT4GHeHyMKrzOkFM35VmcokV
	08D9w6Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHV4D-00D2xv-Iw; Sat, 21 Aug 2021 17:46:01 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHV4B-00D2xG-3z
 for linux-mtd@lists.infradead.org; Sat, 21 Aug 2021 17:46:00 +0000
Received: by mail-lf1-x12e.google.com with SMTP id u22so27650971lfq.13
 for <linux-mtd@lists.infradead.org>; Sat, 21 Aug 2021 10:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IUNZGcwEvLiT98uruvqOHnHGgaNyFWtPLETI2dPthCw=;
 b=p08OD/GPPXR4tm7RkNA9toKvQsVUl8L8J4oVZmC67OE0wZNQVqTaUco2HrwrnDiQ5w
 YuB7XIX+XHBkQHFFdAzLyF2BxZCm+jSnFq4FsCUAM2T1sDn/9oxf4t2nPY94dg8ZOy02
 4ifXdf59PODf4caGN1F1ErdH+dIo7YXjnB5cY+HfdftEYqOCt2+nTokc6UD388Ko2qxo
 MvhYOSvGDT1/FsQM/l16oRX1i1OGSNP7dXhT5bdzGaUHSnydnyQWWVAxmDtcpnGU6hl9
 akWPj9WfjbxtYLM0nKZbQdHyelXHGLCzov3c1u9xeUbYJI6bez6nJO7fiBHU51tlE3bJ
 Ui+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IUNZGcwEvLiT98uruvqOHnHGgaNyFWtPLETI2dPthCw=;
 b=DRDu1F6W8cYJGulyCYgCpPG7njM/YNGD3J8GTiI1Al7LW9Ld9++AyapJVrzj5Lnag2
 iEIic91C3kBno8nRSrtHLKyPfW469CThSN/d8aIfHyKH16LhJyu+NxqbeNpf0oZCwrR0
 nN7rP6IVhAqkN0FwHTDeIXArjyEolIe8ypd9DhLYYrIaydd975VVjwJlLyqTQRgsCqq2
 7Rg9xfyLMxES1T/RQJhvp/YLSRPZJ6Z6UyhIGy/bKQY53kGpKb7vaoadcirSFW3BLJgh
 NOpVSa7dxIXvBiLQIFFGUjWhojs/mwmJTZXz9VTgUWCsqSLFXiqfHynTUaJSFnLypcls
 onfQ==
X-Gm-Message-State: AOAM5313CJVfoWMK5+Sei9suxdhSBHWWfzSpC4YYvp72JjSAZKPVwbFN
 jTxeBPLfG+0RhzkKlc1oXdg=
X-Google-Smtp-Source: ABdhPJwQTUwfeBc8x+Qc/XgoFvNgZwRj7DA1ImLYu2aN3NoNJ/vJapVfLwS/Dwin1R3kajnXi5wLGA==
X-Received: by 2002:ac2:4839:: with SMTP id 25mr19053893lft.455.1629567957530; 
 Sat, 21 Aug 2021 10:45:57 -0700 (PDT)
Received: from [192.168.2.145] (46-138-120-72.dynamic.spd-mgts.ru.
 [46.138.120.72])
 by smtp.googlemail.com with ESMTPSA id e19sm868158ljj.28.2021.08.21.10.45.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Aug 2021 10:45:56 -0700 (PDT)
Subject: Re: [PATCH v8 07/34] clk: tegra: Support runtime PM and power domain
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Viresh Kumar
 <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Peter Chen <peter.chen@kernel.org>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 Linux USB List <linux-usb@vger.kernel.org>, linux-staging@lists.linux.dev,
 linux-spi@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-8-digetx@gmail.com> <YR0UBi/ejy+oF4Hm@orome.fritz.box>
 <da7356cb-05ee-ba84-8a7c-6e69d853a805@gmail.com>
 <YR04YHGEluqLIZeo@orome.fritz.box>
 <ad99db08-4696-1636-5829-5260f93dc681@gmail.com>
 <YR6Mvips3HAntDy0@orome.fritz.box>
 <e17bbe8d-7c0f-fc3d-03c7-d75c54c24a43@gmail.com>
 <YR+VDZzTihmpENp6@orome.fritz.box>
 <CAPDyKFpJ+TK0w1GZEA7G=rtAjq5ipmVR4P0wy7uHiEGVWRk5yA@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <89ea1694-be9e-7654-abeb-22de0ca5255a@gmail.com>
Date: Sat, 21 Aug 2021 20:45:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFpJ+TK0w1GZEA7G=rtAjq5ipmVR4P0wy7uHiEGVWRk5yA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210821_104559_393371_791EE2FC 
X-CRM114-Status: GOOD (  21.40  )
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

MjAuMDguMjAyMSAxNjowOCwgVWxmIEhhbnNzb24g0L/QuNGI0LXRgjoKLi4uCj4+IEkgc3VwcG9z
ZSBpZiB0aGVyZSdzIHJlYWxseSBubyBnb29kIHdheSBvZiBkb2luZyB0aGlzIG90aGVyIHRoYW4K
Pj4gcHJvdmlkaW5nIGEgc3RydWN0IGRldmljZSwgdGhlbiBzbyBiZSBpdC4gSSB0aGluayB0aGUg
Y2xlYW5lZCB1cCBzeXNmcwo+PiBzaG93biBpbiB0aGUgc3VtbWFyeSBhYm92ZSBsb29rcyBtdWNo
IGJldHRlciB0aGFuIHdoYXQgdGhlIG9yaWdpbmFsCj4+IHdvdWxkJ3ZlIGxvb2tlZCBsaWtlLgo+
Pgo+PiBQZXJoYXBzIGFuIGFkZGl0aW9uYWwgdHdlYWsgdG8gdGhhdCB3b3VsZCBiZSB0byBub3Qg
Y3JlYXRlIHBsYXRmb3JtCj4+IGRldmljZXMuIEluc3RlYWQsIGp1c3QgY3JlYXRlIHN0cnVjdCBk
ZXZpY2UuIFRob3NlIHJlYWxseSBoYXZlCj4+IGV2ZXJ5dGhpbmcgeW91IG5lZWQgKC5vZl9ub2Rl
LCBhbmQgY2FuIGJlIHVzZWQgd2l0aCBSUE0gYW5kIEdFTlBEKS4gQXMgSQo+PiBtZW50aW9uZWQg
ZWFybGllciwgcGxhdGZvcm0gZGV2aWNlIGltcGxpZXMgYSBDUFUtbWVtb3J5LW1hcHBlZCBidXMs
Cj4+IHdoaWNoIHRoaXMgY2xlYXJseSBpc24ndC4gSXQncyBraW5kIG9mIGEgc2VwYXJhdGUgImJ1
cyIgaWYgeW91IHdhbnQsIHNvCj4+IGp1c3QgdXNpbmcgc3RydWN0IGRldmljZSBkaXJlY3RseSBz
ZWVtcyBtb3JlIGFwcHJvcHJpYXRlLgo+IAo+IEp1c3QgYSBoZWFkcyB1cC4gSWYgeW91IGRvbid0
IHVzZSBhIHBsYXRmb3JtIGRldmljZSBvciBoYXZlIGEgZHJpdmVyCj4gYXNzb2NpYXRlZCB3aXRo
IGl0IGZvciBwcm9iaW5nLCB5b3UgbmVlZCB0byBtYW5hZ2UgdGhlIGF0dGFjaG1lbnQgdG8KPiBn
ZW5wZCB5b3Vyc2VsZi4gVGhhdCBtZWFucyBjYWxsaW5nIG9uZSBvZiB0aGUgZGV2X3BtX2RvbWFp
bl9hdHRhY2gqKCkKPiBBUElzLCBidXQgdGhhdCdzIHBlcmZlY3RseSBmaW5lLCBvZmNvdXJzZS4K
PiAKPj4KPj4gV2UgZGlkIHNvbWV0aGluZyBzaW1pbGFyIGZvciBYVVNCIHBhZHMsIHNlZSBkcml2
ZXJzL3BoeS90ZWdyYS94dXNiLltjaF0KPj4gZm9yIGFuIGV4YW1wbGUgb2YgaG93IHRoYXQgd2Fz
IGRvbmUuIEkgdGhpbmsgeW91IGNhbiBkbyBzb21ldGhpbmcKPj4gc2ltaWxhciBoZXJlLgoKV2Ug
bmVlZCBhIHBsYXRmb3JtIGRldmljZSBiZWNhdXNlIHdlIGhhdmUgYSBwbGF0Zm9ybSBkZXZpY2Ug
ZHJpdmVyIHRoYXQKbXVzdCBiZSBib3VuZCB0byB0aGUgZGV2aWNlLCBvdGhlcndpc2UgUE1DIGRy
aXZlciBzdGF0ZSB3b24ndCBiZSBzeW5jZWQKc2luY2UgaXQgaXQncyBzeW5jZWQgYWZ0ZXIgYWxs
IGRyaXZlcnMgb2YgZGV2aWNlcyB0aGF0IHJlZmVyZW5jZSBQTUMKbm9kZSBpbiBEVCBhcmUgcHJv
YmVkLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
