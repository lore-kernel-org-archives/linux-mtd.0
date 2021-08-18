Return-Path: <SRS0=f8pO=NJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 871ACC4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 08:31:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4770B61042
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 08:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4770B61042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jN4+5QPfMIHP1ovdtb9t8/fESKRWfcaJNSfExv8jz5w=; b=43c/FPQljsYPqt
	10lKPNnN2FMsUS5uBpu1QQ1iQeqditUChTKFHZfa4oK+GJCFoX3+pbVyYGDCbpqgHI3kTuPLCrD+X
	wUiSOV+yYUKblMxIE+l/IlbR0KB0YgZiWBFHR7TrXOEIB4l4DqGC3r5Z+p0zVsTPzUQj6DHxS8qQW
	RN/NudYcjrt/clm/20W5rtXPAG+UyLRkiCayG9ZXf1bLCgnHRHK409oIK3X7JcWVe5pYVTX8WLaVO
	MYH8MJV54p5ak4Ne88Ah52itbyGv7AAoHF2gRNftGDDCxQuWHvyIKfcNegci2gnBt4k6f48JE1ytr
	+LeXi+q/99azaVNUzWyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGGxv-004esi-Oq; Wed, 18 Aug 2021 08:30:27 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGGxm-004eri-Kv
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 08:30:22 +0000
Received: by mail-vs1-xe35.google.com with SMTP id d16so1254887vsf.12
 for <linux-mtd@lists.infradead.org>; Wed, 18 Aug 2021 01:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IKqcflYMaSUyzwd/eHbHpOkvH7hAYsOOplnEzRxLbhU=;
 b=R/YglmSTFalwgblF0J7z+xo4QD/viWueOMjtEA3qajPeKluQA8KyZlPIazxZCmQcOV
 ypXroUN/dz8G8KIy2PndGeFR9trr2TXk1MLEpZYZHSdEPDIvmCIDK5BOf+7ryOnDMlAz
 KKZOIcOvNnsfQADPruS78lcAX/NT/qxMC6OewVDoFYGt5hY5K9huXDQ6tsxV07Sxs/Du
 uf/zCLpMusk1iMjpoom1MA3j5kIRz40ZYONDbw9Bk+/YXVmdr5o2bmiJpfJC1CERXXmo
 E0BgAf1avWcJ6cYGmW6zCxZHRihbaxeLgDmifTSo359uCk7uScIh0CC8oShYygGDo0u/
 CxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IKqcflYMaSUyzwd/eHbHpOkvH7hAYsOOplnEzRxLbhU=;
 b=m6JS+PIOjKDekdoShqvPyx2amgAqXxUd3K3Ukgk8+HP7pEqMP1VcSTFJ4xIFnblABE
 eILVoXNC9nNrqlr18wR6CNA27RLj3LflicNM7CzWUoI/t0e1Q9dAkRACK0efCxVB7I98
 ZDCW1vZc35nx4MtalM+AUtr49vfDPpvTXltiQ2tL9aQn3mVX7wFCYnt5z6uy3Tg3NPxA
 YtK3nxuIYwDYD86osaXdbkdzQANxgumUQq4ljxyibiCXqvSLo3c4D4FMOrT7pFPS/PDN
 Q9Tl9lk0jNhbycS/b5DtyIgjjsB/61XWG4nKMDVbw5qBs5FW8mo/kxJhQeum8N23JeOz
 K/iQ==
X-Gm-Message-State: AOAM533TC91ipWJ2e/Ei8oJ0SqFjAByTfh+XF/jMTZcE4oGzxpA4lZkn
 P1cd2WSsaDBO5Ab//vHJ8kjoINcRF9FC4TzwBXamRQ==
X-Google-Smtp-Source: ABdhPJwKrtdwLrtqnGeoY6XyZUUGVixFdE7Mg0poY1hljrcpole6+hd3NjZWSpGJ4mjLJUHBolVYDumnC7t4U+ynnmc=
X-Received: by 2002:a67:3212:: with SMTP id y18mr6323760vsy.19.1629275417181; 
 Wed, 18 Aug 2021 01:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210817075515.vyyv7z37e6jcrhsl@vireshk-i7>
 <710261d9-7ae3-5155-c0a2-f8aed2408d0b@gmail.com>
 <20210818035533.ieqkexltfvvf2p4n@vireshk-i7>
 <5b2a80c1-9743-e633-6257-ede94c8a274c@gmail.com>
 <20210818043131.7klajx6drvvkftoc@vireshk-i7>
 <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7>
 <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
 <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
 <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
In-Reply-To: <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Aug 2021 10:29:40 +0200
Message-ID: <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
To: Viresh Kumar <viresh.kumar@linaro.org>, Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>, 
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>, 
 Linux PM <linux-pm@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-mmc <linux-mmc@vger.kernel.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_013018_740779_10F5CDA6 
X-CRM114-Status: GOOD (  30.49  )
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

T24gV2VkLCAxOCBBdWcgMjAyMSBhdCAwODoyNywgVmlyZXNoIEt1bWFyIDx2aXJlc2gua3VtYXJA
bGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiAxOC0wOC0yMSwgMDk6MjIsIERtaXRyeSBPc2lwZW5r
byB3cm90ZToKPiA+IDE4LjA4LjIwMjEgMDg6NTgsIFZpcmVzaCBLdW1hciDQv9C40YjQtdGCOgo+
ID4gPiBXaGF0IGFib3V0IGNhbGxpbmcgZGV2X3BtX29wcF9zZXRfcmF0ZShkZXYsIGNsa19nZXRf
cmF0ZShkZXYpKSBoZXJlCj4gPiA+IGluc3RlYWQgPyBUaGF0IHdpbGwgd29yaywgcmlnaHQgPyBU
aGUgYWR2YW50YWdlIGlzIGl0IHdvcmtzIHdpdGhvdXQKPiA+ID4gYW55IHNwZWNpYWwgcm91dGlu
ZSB0byBkbyBzby4KPiA+Cj4gPiBJdCB3aWxsIHdvcmssIGJ1dCBhIGRlZGljYXRlZCBoZWxwZXIg
aXMgbmljZXIuCj4gPgo+ID4gPiBJIGFsc28gd29uZGVyIGxvb2tpbmcgYXQgeW91ciBncjNkLmMg
Y2hhbmdlcywgeW91IHNldCBhIHNldC1vcHAKPiA+ID4gaGVscGVyLCBidXQgdGhlIGRyaXZlciBk
b2Vzbid0IGNhbGwgc2V0X29wcF9yYXRlIGF0IGFsbC4gV2hvIGNhbGxzIGl0Cj4gPiA+ID8KPiA+
Cj4gPiBkZXZfcG1fb3BwX3N5bmMoKSBjYWxscyBpdCBmcm9tIF9zZXRfb3BwKCkuCj4KPiBPa2F5
LCBwbGVhc2UgdXNlIGRldl9wbV9vcHBfc2V0X3JhdGUoKSBpbnN0ZWFkIHRoZW4uIE5ldyBoZWxw
ZXIganVzdAo+IGFkZHMgdG8gdGhlIGNvbmZ1c2lvbiBhbmQgaXNuJ3QgZG9pbmcgYW55dGhpbmcg
c3BlY2lhbCBhcGFydCBmcm9tCj4gZG9pbmcgY2xrX2dldF9yYXRlKCkgZm9yIHlvdS4KPgo+ID4g
PiBBbmQgaWYgaXQgaXMgYWxsIGFib3V0IGp1c3Qgc3luY2luZyB0aGUgZ2VucGQgY29yZSwgdGhl
biBjYW4gdGhlIGdlbnBkCj4gPiA+IGNvcmUgZG8gc29tZXRoaW5nIGxpa2Ugd2hhdCBjbGsgZnJh
bWV3b3JrIGRvZXM/IGkuZS4gYWxsb3cgYSBuZXcKPiA+ID4gb3B0aW9uYWwgZ2VucGQgY2FsbGJh
Y2ssIGdldF9wZXJmb3JtYW5jZV9zdGF0ZSgpIChqdXN0IGxpa2UKPiA+ID4gc2V0X3BlcmZvcm1h
bmNlX3N0YXRlKCkpLCB3aGljaCBjYW4gYmUgY2FsbGVkIGluaXRpYWxseSBieSB0aGUgY29yZSB0
bwo+ID4gPiBnZXQgdGhlIHBlcmZvcm1hbmNlIHRvIHNvbWV0aGluZyBvdGhlciB0aGFuIHplcm8u
IG9wcC1zZXQtcmF0ZSBpcwo+ID4gPiB0aGVyZSB0byBzZXQgdGhlIHBlcmZvcm1hbmNlIHN0YXRl
IGFuZCBlbmFibGUgdGhlIHN0dWZmIGFzIHdlbGwuCj4gPiA+IFRoYXQncyB3aHkgaXQgbG9va3Mg
aW5jb3JyZWN0IGluIHlvdXIgY2FzZSwgd2hlcmUgdGhlIGZ1bmN0aW9uIHdhcwo+ID4gPiBvbmx5
IHJlcXVpcmVkIHRvIGJlIGNhbGxlZCBvbmNlLCBhbmQgeW91IGFyZSBlbmRpbmcgdXAgY2FsbGlu
ZyBpdCBvbgo+ID4gPiBlYWNoIHJlc3VtZS4gTGltaXRpbmcgdGhhdCB3aXRoIGFub3RoZXIgbG9j
YWwgdmFyaWFibGUgaXMgYmFkIGFzIHdlbGwuCj4gPgo+ID4gV2UgZGlzY3Vzc2VkIHZhcmlhbnQg
d2l0aCBnZXRfcGVyZm9ybWFuY2Vfc3RhdGUoKSBwcmV2aW91c2x5IGFuZCBVbGYKPiA+IGRpZG4n
dCBsaWtlIGl0IGVpdGhlciBzaW5jZSBpdCBzdGlsbCByZXF1aXJlcyB0byB0b3VjaCAnaW50ZXJu
YWxzJyBvZiBHRU5QRC4KPgo+IEhtbSwgSSB3b25kZXIgaWYgdGhhdCB3b3VsZCBiZSBhIHByb2Js
ZW0gc2luY2Ugb25seSBnZW5wZCBjb3JlIGlzCj4gZ29pbmcgdG8gY2FsbCB0aGF0IHJvdXRpbmUg
YW55d2F5LgoKTWUgYW5kIERtaXRyeSBkaXNjdXNzZWQgYWRkaW5nIGEgbmV3IGdlbnBkIGNhbGxi
YWNrIGZvciB0aGlzLiBJIGFncmVlZAp0aGF0IGl0IHNlZW1zIGxpa2UgYSByZWFzb25hYmxlIHRo
aW5nIHRvIGFkZCwgaWYgaGUgaW5zaXN0cy4KClRoZSBpbnRlbnQgd2FzIHRvIGludm9rZSB0aGUg
bmV3IGNhbGxiYWNrIGZyb20gX19nZW5wZF9kZXZfcG1fYXR0YWNoKCkKd2hlbiB0aGUgZGV2aWNl
IGhhcyBiZWVuIGF0dGFjaGVkIHRvIGl0cyBnZW5wZC4gVGhpcyBhbGxvd3MgdGhlCmNhbGxiYWNr
LCB0byBpbnZva2UgY2xrX2dldF9yYXRlKCkgYW5kIHRoZW4gZGV2X3BtX29wcF9zZXRfcmF0ZSgp
LCB0bwp1cGRhdGUgdGhlIHZvdGUgYWNjb3JkaW5nIHRvIHRoZSBjdXJyZW50IHN0YXRlIG9mIHRo
ZSBIVy4KCkkgYW0gbm90IHN1cmUgaWYvd2h5IHRoYXQgYXBwcm9hY2ggc2VlbWVkIGluc3VmZmlj
aWVudD8KCkFub3RoZXIgb3B0aW9uIHRvIHNvbHZlIHRoZSBwcm9ibGVtLCBJIHRoaW5rLCBpcyBz
aW1wbHkgdG8gcGF0Y2gKZHJpdmVycyB0byBsZXQgdGhlbSBjYWxsIGRldl9wbV9vcHBfc2V0X3Jh
dGUoKSBkdXJpbmcgLT5wcm9iZSgpLCB0aGlzCnNob3VsZCBzeW5jaHJvbml6ZSB0aGUgSFcgc3Rh
dGUgdG9vLgoKRG1pdHJ5LCBjYW4geW91IHBsZWFzZSBlbGFib3JhdGUgb24gdGhpcz8KCktpbmQg
cmVnYXJkcwpVZmZlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
