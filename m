Return-Path: <SRS0=qXjq=NL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 991FCC4338F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 02:52:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E9E2610CB
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 02:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E9E2610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gnaMenotr9iYGd0MieXU73ug0IBq89zxrzQJUZ9hPRg=; b=Hi3p1RYyRSiAp3/M/S1zLTqjEm
	QMKNqanKQX5fw1u9VDxaywaCn7WozY4nkCrMAWXYr0bE+bvpe/fARm7CxCwrwff5OwMmebay7Y/4f
	7VcKkAmjyV3Y1D1bMDws3dJzNstSuhZ2GYysfK/Z2299ylU+MAOaO8YkspQNP+CJrArynctZj6srh
	yV0GdaqrPeQ2n10oH94vByAKRX295uT1l+DS0g40omm69wQIkFj7SIFK8hg9wrQQD/uscyOsAImHO
	eMAJ/JHO47+VtaCOA2ryuaA5aGu+82AlicF1Lr9+keqUXQMcmO6Jr00CaAFz8ernWCBDoOa7//n8v
	Q51mXOhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGudE-009xDn-4H; Fri, 20 Aug 2021 02:51:44 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGud8-009xBk-Qn
 for linux-mtd@lists.infradead.org; Fri, 20 Aug 2021 02:51:42 +0000
Received: by mail-lf1-x135.google.com with SMTP id i9so17251752lfg.10
 for <linux-mtd@lists.infradead.org>; Thu, 19 Aug 2021 19:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zboB1Q6i9oYgbkK+DWfMo5HokGy8eox3TcOGLTI8/TQ=;
 b=MSPObL9gtIfvXhGm8vmuM1WlsX8S9aqUcJKehk6hQXt2kTc0FpmAMpCNdosprR8DEi
 /yWFr3UlXiFd2ptrMNopWEd4mvb/K8eNekkIVvnlp6AKdEAvU+jGXH5uVDxvGcdGZoGg
 7d0zSU30Fr03L6Jyi08Us+ikNmam6soR3xc9TnEUbHxYKYK/+DxyeuIlb2H/R67utUeG
 f8Hx0eRqtRpuLlOkbbDR3VqVNtgKs+C8IJnFlLq0D7i7HgCycFYmI+7YKNlKYZOsIZqi
 M8cceb7ZJ2VG2spCfJmWhEcSNn6fxBgRnLJwFtl+p9dAcHXGqIRgt1IqsRHAMWfqn/Mz
 6mnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zboB1Q6i9oYgbkK+DWfMo5HokGy8eox3TcOGLTI8/TQ=;
 b=IrGsHeFxOAnwcyiHrPAkcaT3QAXX2j+6eg4QhlA2Dna/XZYdH4+WLvQSvgAh10YIUJ
 Tm13pL6ZiMBxlUi/xoPwMjIw6xdT3W9kDYIwt73O5+uyaiQkgcstDCeeouOU/NBaUC0c
 v4nI2GWjZpb672FdAygDPnQYWOQOQfANdKlMcLzsTTMOUwfvzOdquGWmzB/IXVBNhTpJ
 sO0adRJ2ibY1dxYxYUhSkYeHZUq3bgYiSQUNRVancyCDy6ZhXIk2BBv/KmshiwBrH3m6
 B569io9vDLrJIHQcF2FNfvZYE8ajVBYcgfzxtj8KHegJSSosA8GM2x5Hkwcee/MNL5ad
 Wo2w==
X-Gm-Message-State: AOAM532pZIzd4pN1E2hlxvweI95+010imnpU6ZY+vvdNHHAoBbgdA3lv
 hGARmwEzkeaqoOIShdAOuMQ=
X-Google-Smtp-Source: ABdhPJxyaLUy3vFiucIY3S77FtdQqbUhTA2/WSHmXMHR7V1HqPjJvW4kwuD0WLGfg5N30COber68xA==
X-Received: by 2002:ac2:4c94:: with SMTP id d20mr12622519lfl.640.1629427896895; 
 Thu, 19 Aug 2021 19:51:36 -0700 (PDT)
Received: from [192.168.2.145] (46-138-120-72.dynamic.spd-mgts.ru.
 [46.138.120.72])
 by smtp.googlemail.com with ESMTPSA id w9sm2965ljo.36.2021.08.19.19.51.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 19:51:36 -0700 (PDT)
Subject: Re: [PATCH v8 06/34] dt-bindings: clock: tegra-car: Document new
 tegra-clocks sub-node
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
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
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-spi@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-7-digetx@gmail.com> <YR0SSz7KMh7TwaFW@orome.fritz.box>
 <eff5ef47-e6e0-3e03-cf1a-d931b0f2dc2a@gmail.com>
 <YR033zuYWWLCeYpM@orome.fritz.box>
 <a5b942cb-1611-9ae1-6e89-4b68fdaf03e3@gmail.com>
 <YR6HWMuYcF6NIepi@orome.fritz.box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <cad7c578-f533-12f8-3dc0-d2854344148c@gmail.com>
Date: Fri, 20 Aug 2021 05:51:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YR6HWMuYcF6NIepi@orome.fritz.box>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_195138_945705_2DB512DD 
X-CRM114-Status: GOOD (  31.21  )
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

MTkuMDguMjAyMSAxOTozMSwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPj4gVGhlICJkZXZp
Y2UiIHJlcHJlc2VudGF0aW9uIGlzIGludGVybmFsIHRvIHRoZSBrZXJuZWwuIEl0J3Mgb2theSB0
byBtZQo+PiB0byBoYXZlIFBMTHMgcmVwcmVzZW50ZWQgYnkgYSBkZXZpY2UsIGl0J3MgYSBkaXN0
aW5jdCBoL3cgYnkgaXRzZWxmLgo+Pgo+PiBDQ0Ygc3VwcG9ydHMgbWFuYWdpbmcgb2YgY2xvY2sn
cyBSUE0gYW5kIGl0IHJlcXVpcmVzIHRvIGhhdmUgY2xvY2sgdG8gYmUKPj4gYmFja2VkIGJ5IGEg
ZGV2aWNlLiBUaGF0J3Mgd2hhdCB3ZSBhcmUgdXNpbmcgaGVyZS4KPj4KPj4gUGxlYXNlIHNlZQo+
PiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4xNC1yYzYvc291cmNlL2RyaXZl
cnMvY2xrL2Nsay5jI0wxMDkKPiBMb29raW5nIGF0IHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBfX2Ns
a19yZWdpc3RlcigpIGFuZCB3aGVyZSB0aGF0IGRldmljZQo+IHBvaW50ZXIgdHlwaWNhbGx5IGNv
bWVzIGZyb20sIEkgZG9uJ3QgdGhpbmsgdGhlIHdheSB0aGlzIGlzIHVzZWQgaGVyZSBpcwo+IHdo
YXQgd2FzIGludGVuZGVkLiBUaGUgd2F5IEkgaW50ZXJwcmV0IHRoZSBjb2RlIGlzIHRoYXQgYSBj
bG9jayBpcwo+IHJlZ2lzdGVyZWQgd2l0aCBhIHBhcmVudCBkZXZpY2UgKGkuZS4gaXRzIHByb3Zp
ZGVyKSBhbmQKPiBjbGtfcG1fcnVudGltZV9nZXQoKSBpcyB0aGVuIHVzZWQgaW50ZXJuYWxseSBh
cyBhIHdheSB0byBtYWtlIHN1cmUgdGhhdAo+IHdoZW4gYSBjbG9jayBpcyBwcmVwYXJlZCwgaXQn
cyBwYXJlbnQgZGV2aWNlIGlzIHJ1bnRpbWUgcmVzdW1lZC4gVGhpcyBpcwo+IHByZXN1bWFibHkg
dG8gZW5zdXJlIHRoYXQgYW55IHJlZ2lzdGVycyB0aGF0IHRoZSBkcml2ZXIgbWlnaHQgbmVlZCB0
bwo+IGFjY2VzcyBpbiBvcmRlciB0byBwcmVwYXJlIGFuZCBlbmFibGUgdGhlIGNsb2NrIGFyZSBh
Y2Nlc3NpYmxlIChpLmUuIHRoZQo+IENBUiBpcyBub3QgcG93ZXJlZCBvZmYgb3IgaW4gcmVzZXQp
Lgo+IAo+IFNvIHRoZSBzdHJ1Y3QgZGV2aWNlIHRoYXQgaXMgcGFzc2VkIHRvIF9fY2xrX3JlZ2lz
dGVyKCkgKG9yIGl0cyBjYWxsZXJzKQo+IHNob3VsZCBiZSB0aGF0IG9mIHRoZSBDQVIgcmF0aGVy
IHRoYW4gdmlydHVhbCBzdHJ1Y3QgZGV2aWNlcyBjcmVhdGVkIGJ5Cj4gdGhlIENBUi4KPiAKPiBB
bmQgaXQncyBhIGJpdCBkZWJhdGFibGUgd2hldGhlciBvciBub3QgUExMcyByZXByZXNlbnQgZGlz
dGluY3QKPiBoYXJkd2FyZS4gVWx0aW1hdGVseSBldmVyeSB0cmFuc2lzdG9yIG9uIGEgY2hpcCBj
b3VsZCBiZSBjb25zaWRlcmVkCj4gZGlzdGluY3QgaGFyZHdhcmUuIEJ1dCBhIHBsYXRmb3JtIGRl
dmljZSBpcyBhIGRldmljZSBvbiBhIHBsYXRmb3JtIGJ1cywKPiB3aGljaCBpcyByZWFsbHkganVz
dCBhbm90aGVyIHdheSBvZiBzYXlpbmcgaXQncyBhIGhhcmR3YXJlIGJsb2NrIHRoYXQncwo+IGFj
Y2Vzc2libGUgZnJvbSB0aGUgQ1BVIHZpYSBhIG1lbW9yeS1tYXBwZWQgYWRkcmVzcy4gQSBQTEwg
KGp1c3QgbGlrZQo+IG90aGVyIGNsb2NrcykgaXMgbWVyZWx5IGEgcmVzb3VyY2UgZXhwb3NlZCBi
eSBtZWFucyBvZiBhY2Nlc3MgdG8gdGhlc2UKPiByZWdpc3RlcnMuIFNvIEkgZG9uJ3QgdGhpbmsg
dGhleSBzaG91bGQgYmUgcGxhdGZvcm0gZGV2aWNlcy4gRXZlbiBtYWtpbmcKPiB0aGVtIHN0cnVj
dCBkZXZpY2U6cyBzZWVtcyBhIGJpdCBvZiBhIHN0cmV0Y2guCj4gCj4gSXMgdGhlcmUgYW55IHJl
YXNvbiB3aHkgc3RydWN0IGNsayBjYW4ndCBiZSB1c2VkIGZvciB0aGlzPyBJIG1lYW4sIHRoZQo+
IHdob2xlIHB1cnBvc2Ugb2YgdGhhdCBzdHJ1Y3R1cmUgaXMgdG8gcmVwcmVzZW50IGNsb2Nrcy4g
V2h5IGRvIHdlIG5lZWQKPiB0byBtYWtlIHRoZW0gc3BlY2lhbD8KCkJlY2F1c2Ugd2UgbmVlZCB0
byBwZXJmb3JtIERWRlMgZm9yIFBMTHMuIFRoZSBvbmx5IHdheSB0byBkbyBpdCB3aXRob3V0Cmhh
dmluZyB0byByZWludmVudCBleGlzdGluZyBmcmFtZXdvcmtzIGlzIHRvIHVzZSB0aGVzZSBmcmFt
ZXdvcmtzIGFuZAp0aGV5IHJlcXVpcmUgYSBkZXZpY2UuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
