Return-Path: <SRS0=z9um=NK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29ED0C4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 13:09:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC3886108D
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 13:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC3886108D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=abK9Ud3ghfWhL3k9s1c9WppGJHjj9ezkQoGy10kJIs0=; b=iHUj1F9lDBPwqs
	VnM7Jlly5SNN2Hci0nZck357bZARaie+pUek/Mw0YNc8SGc1gSFsqG4U0gt8m7+NDdiu/GzpgmoWt
	mo5/rzF5tzfQyCdtnW0iPfNS8KMhpEEnKj3gm2j5ctAyJ1QOZMeo1iIDD7ReHq+aaR11CI5IDE/f5
	n6OpDLzpORBb6Ssmq+4I9g33AchdYeU7dH6Wu6Cq9t+jCRoT3NKmA+Wd/2Ek4DHIfTu3SYq5O28CL
	A4aCFHiMGq2w6+/uEE5/gNU7dZux7ac1dQly1Ffnh4AwGIUq6cAzHLRjuJnXJhRUEwTrD82Nm/aAZ
	OCE81XnykxP0f4k1St8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGhm8-008Q5N-0h; Thu, 19 Aug 2021 13:08:04 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGhm2-008Q1x-N9
 for linux-mtd@lists.infradead.org; Thu, 19 Aug 2021 13:08:00 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id k24so3967295vsg.9
 for <linux-mtd@lists.infradead.org>; Thu, 19 Aug 2021 06:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1GCKu9c84zINYtTdflsWXKCWXkOZdKhJUWmHuvrkY+4=;
 b=f+4CRpBzlKKi/DOaSNA/G+hiFrodgB7WwtvP6lDjHBbwMct5xJEnNRIBbwWd50HxVl
 4zhiGfKdAN1zaQTNFhB6Vi8xqc4j40IY1vsyJhWmkAu9OGW99mwK9tXMUYa730kFsYI4
 idKdGIien3FkWDSAe9a9bUwucupyJle2LRixnAHVpFbbr4u728pooiABojadky5czPhQ
 T05rm31+E59u8E8W6WOHoHOIbfDCZtTsEcAVQYXP/NQkrFth/PCbSSe6c7z8JAzoaO1+
 46BAA+NxWAouT+Gc5X4wCTy1dHtG/pP9SH4vbLZ8x03CSox6/vBN4JfPUqmpPE9U44nl
 Iiow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1GCKu9c84zINYtTdflsWXKCWXkOZdKhJUWmHuvrkY+4=;
 b=O35/9mqOa3rKCDMxl8PVeZ0Ex6nGwPpK8qBDlBv8a7Zww+mrMyYxRP9zVIevk+LRbR
 mBgCgrJEuCvB9ge2egqGYu4dUMLPCq7xCD6strbQ8Y1HrLBYGpJNH9dpNmWg1eSDf4AR
 jDeRX5mzPHpl2gKpPdzIt4Rf7rg6y5/XgwVTUcGD1uO67TlW0bkbiW8soS5+5bWv7Fe/
 eseUE8E4lH0Mj15NBWGpr9J7qeO+BtCNCuKt2gUUNKopYGyz1zY7nvHJ0QENjoLOy9cq
 EqZ+cPczRYvHKDySKQzfC23XclfDRVDgyqCuB0LWGf7lUeF9APCdIiTQbD1zQgm3f43V
 EXMQ==
X-Gm-Message-State: AOAM533ma4S0SixkdIi9RqCa29jyAZZE3apwL59rIHeYJav9GsTDia3g
 P3Wt/RB0LDmxCVROibiDdCJpmYOXuZadPDqY9Ktedg==
X-Google-Smtp-Source: ABdhPJyJROokpzMBNet191tDOwD7eE8PakuStZsC4TgI99eWakoC4SNznlH+uH6MVn3jKPVb3Va23L7NrWpzQmbz4ck=
X-Received: by 2002:a67:3212:: with SMTP id y18mr12074668vsy.19.1629378466059; 
 Thu, 19 Aug 2021 06:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210818043131.7klajx6drvvkftoc@vireshk-i7>
 <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7>
 <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
 <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
 <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
 <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
 <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
 <20210818095044.e2ntsm45h5cddk7s@vireshk-i7>
 <CAPDyKFrFF00xGDWPCQnPwF0_QkG4TB2UqggpuBpp8LY_CMKP-A@mail.gmail.com>
 <0354acbe-d856-4040-f453-8e8164102045@gmail.com>
In-Reply-To: <0354acbe-d856-4040-f453-8e8164102045@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Aug 2021 15:07:09 +0200
Message-ID: <CAPDyKFoQdn1rm91iFNJwZwpSYcKJBjDLqtJB4KZAkhgY1Grm-Q@mail.gmail.com>
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
To: Dmitry Osipenko <digetx@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>
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
X-CRM114-CacheID: sfid-20210819_060758_788300_26EA71B5 
X-CRM114-Status: GOOD (  45.74  )
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

T24gV2VkLCAxOCBBdWcgMjAyMSBhdCAxNzo0MywgRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21h
aWwuY29tPiB3cm90ZToKPgo+IDE4LjA4LjIwMjEgMTM6MDgsIFVsZiBIYW5zc29uINC/0LjRiNC1
0YI6Cj4gPiBPbiBXZWQsIDE4IEF1ZyAyMDIxIGF0IDExOjUwLCBWaXJlc2ggS3VtYXIgPHZpcmVz
aC5rdW1hckBsaW5hcm8ub3JnPiB3cm90ZToKPiA+Pgo+ID4+IE9uIDE4LTA4LTIxLCAxMTo0MSwg
VWxmIEhhbnNzb24gd3JvdGU6Cj4gPj4+IE9uIFdlZCwgMTggQXVnIDIwMjEgYXQgMTE6MTQsIFZp
cmVzaCBLdW1hciA8dmlyZXNoLmt1bWFyQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4+Pj4gV2hhdCB3
ZSBuZWVkIGhlcmUgaXMganVzdCBjb25maWd1cmUuIFNvIHNvbWV0aGluZyBsaWtlIHRoaXMgdGhl
bjoKPiA+Pj4+Cj4gPj4+PiAtIGdlbnBkLT5nZXRfcGVyZm9ybWFuY2Vfc3RhdGUoKQo+ID4+Pj4g
ICAtPiBkZXZfcG1fb3BwX2dldF9jdXJyZW50X29wcCgpIC8vTmV3IEFQSQo+ID4+Pj4gICAtPiBk
ZXZfcG1fZ2VucGRfc2V0X3BlcmZvcm1hbmNlX3N0YXRlKGRldiwgY3VycmVudF9vcHAtPnBzdGF0
ZSk7Cj4gPj4+Pgo+ID4+Pj4gVGhpcyBjYW4gYmUgZG9uZSBqdXN0IG9uY2UgZnJvbSBwcm9iZSgp
IHRoZW4uCj4gPj4+Cj4gPj4+IEhvdyB3b3VsZCBkZXZfcG1fb3BwX2dldF9jdXJyZW50X29wcCgp
IHdvcms/IERvIHlvdSBoYXZlIGEgc3VnZ2VzdGlvbj8KPiA+Pgo+ID4+IFRoZSBvcHAgY29yZSBh
bHJlYWR5IGhhcyBhIHdheSBvZiBmaW5kaW5nIGN1cnJlbnQgT1BQLCB0aGF0J3Mgd2hhdAo+ID4+
IERtaXRyeSBpcyB0cnlpbmcgdG8gdXNlIGhlcmUuIEl0IGZpbmRzIGl0IHVzaW5nIGNsa19nZXRf
cmF0ZSgpLCBpZgo+ID4+IHRoYXQgaXMgemVybywgaXQgcGlja3MgdGhlIGxvd2VzdCBmcmVxIHBv
c3NpYmxlLgo+ID4+Cj4gPj4+IEkgYW0gc3VyZSBJIHVuZGVyc3RhbmQgdGhlIHByb2JsZW0uIFdo
ZW4gYSBkZXZpY2UgaXMgZ2V0dGluZyBwcm9iZWQsCj4gPj4+IGl0IG5lZWRzIHRvIGNvbnN1bWUg
cG93ZXIsIGhvdyBlbHNlIGNhbiB0aGUgY29ycmVzcG9uZGluZyBkcml2ZXIKPiA+Pj4gc3VjY2Vz
c2Z1bGx5IHByb2JlIGl0Pwo+ID4+Cj4gPj4gRG1pdHJ5IGNhbiBhbnN3ZXIgdGhhdCBiZXR0ZXIs
IGJ1dCBhIGRldmljZSBkb2Vzbid0IG5lY2Vzc2FyaWx5IG5lZWQKPiA+PiB0byBjb25zdW1lIGVu
ZXJneSBpbiBwcm9iZS4gSXQgY2FuIGNvbnN1bWUgYnVzIGNsb2NrLCBsaWtlIEFQQiB3ZQo+ID4+
IGhhdmUsIGJ1dCB0aGUgbW9yZSBlbmVyZ3kgY29uc3VtaW5nIHN0dWZmIGNhbiBiZSBsZWZ0IGRp
c2FibGVkIHVudGlsCj4gPj4gdGhlIHRpbWUgYSB1c2VyIGNvbWVzIHVwLiBQcm9iZSB3aWxsIGp1
c3QgZW5kIHVwIHJlZ2lzdGVyaW5nIHRoZQo+ID4+IGRyaXZlciBhbmQgaW5pdGlhbGl6aW5nIGl0
Lgo+ID4KPiA+IFRoYXQncyBwZXJmZWN0bHkgZmluZSwgYXMgdGhlbiBpdCdzIGxpa2VseSB0aGF0
IGl0IHdvbid0IHZvdGUgZm9yIGFuCj4gPiBPUFAsIGJ1dCBjYW4gcG9zdHBvbmUgdGhhdCBhcyB3
ZWxsLgo+ID4KPiA+IFBlcmhhcHMgdGhlIHByb2JsZW0gaXMgcmF0aGVyIHRoYXQgdGhlIEhXIG1h
eSBhbHJlYWR5IGNhcnJ5IGEgbm9uLXplcm8KPiA+IHZvdGUgbWFkZSBmcm9tIGEgYm9vdGxvYWRl
ci4gSWYgdGhlIGNvbnN1bWVyIGRyaXZlciB0cmllcyB0byBjbGVhcgo+ID4gdGhhdCB2b3RlIChj
YWxsaW5nIGRldl9wbV9vcHBfc2V0X3JhdGUoZGV2LCAwKSwgZm9yIGV4YW1wbGUpLCBpdCB3b3Vs
ZAo+ID4gc3RpbGwgbm90IGxlYWQgdG8gYW55IHVwZGF0ZXMgb2YgdGhlIHBlcmZvcm1hbmNlIHN0
YXRlIGluIGdlbnBkLAo+ID4gYmVjYXVzZSBnZW5wZCBpbnRlcm5hbGx5IGhhcyBpbml0aWFsaXpl
ZCB0aGUgcGVyZm9ybWFuY2Utc3RhdGUgdG8KPiA+IHplcm8uCj4KPiBXZSBkb24ndCBuZWVkIHRv
IGRpc2NvdmVyIGludGVybmFsIFNvQyBkZXZpY2VzIGJlY2F1c2Ugd2UgdXNlCj4gZGV2aWNlLXRy
ZWUgb24gQVJNLiBGb3IgbW9zdCBkZXZpY2VzIHBvd2VyIGlzbid0IHJlcXVpcmVkIGF0IGEgcHJv
YmUKPiB0aW1lIGJlY2F1c2UgcHJvYmUgZnVuY3Rpb24gZG9lc24ndCB0b3VjaCBoL3cgYXQgYWxs
LCB0aHVzIGRldmljZXMgYXJlCj4gbGVmdCBpbiBzdXNwZW5kZWQgc3RhdGUgYWZ0ZXIgcHJvYmUu
Cj4KPiBXZSBoYXZlIHRocmVlIGNvbXBvbmVudHMgY29tcHJpc2luZyBQTSBvbiBUZWdyYToKPgo+
IDEuIFBvd2VyIGdhdGUKPiAyLiBDbG9jayBzdGF0ZQo+IDMuIFZvbHRhZ2Ugc3RhdGUKPgo+IEdF
TlBEIG9uL29mZiByZXByZXNlbnRzIHRoZSAncG93ZXIgZ2F0ZScuCj4KPiBDbG9jayBhbmQgcmVz
ZXQgYXJlIGNvbnRyb2xsZWQgYnkgZGV2aWNlIGRyaXZlcnMgdXNpbmcgY2xrIGFuZCByc3QgQVBJ
cy4KPgo+IFZvbHRhZ2Ugc3RhdGUgaXMgcmVwcmVzZW50ZWQgYnkgR0VOUEQncyBwZXJmb3JtYW5j
ZSBsZXZlbC4KPgo+IEdFTlBEIGNvcmUgYXNzdW1lcyB0aGF0IGF0IGEgZmlyc3QgcnBtLXJlc3Vt
ZSBvZiBhIGNvbnN1bWVyIGRldmljZSwgaXRzCj4gZ2VucGRfcGVyZm9ybWFuY2U9MC4gTm90IHRy
dWUgZm9yIFRlZ3JhIGJlY2F1c2UgaC93IG9mIHRoZSBkZXZpY2UgaXMKPiBwcmVjb25maWd1cmVk
IHRvIGEgbm9uLXplcm8gcGVyZiBsZXZlbCBpbml0aWFsbHksIGgvdyBtYXkgbm90IHN1cHBvcnQK
PiB6ZXJvIGxldmVsIGF0IGFsbC4KCkkgdGhpbmsgeW91IG1heSBiZSBtaXN1bmRlcnN0YW5kaW5n
IGdlbnBkJ3MgYmVoYXZpb3VyIGFyb3VuZCB0aGlzLCBidXQKbGV0IG1lIGVsYWJvcmF0ZS4KCklu
IGdlbnBkX3J1bnRpbWVfcmVzdW1lKCksIHdlIHRyeSB0byByZXN0b3JlIHRoZSBwZXJmb3JtYW5j
ZSBzdGF0ZSBmb3IKdGhlIGRldmljZSB0aGF0IGdlbnBkX3J1bnRpbWVfc3VzcGVuZCgpICptYXkq
IGhhdmUgZHJvcHBlZCBlYXJsaWVyLgpUaGF0IG1lYW5zLCBpZiBnZW5wZF9ydW50aW1lX3Jlc3Vt
ZSgpIGlzIGNhbGxlZCBwcmlvcgpnZW5wZF9ydW50aW1lX3N1c3BlbmQoKSBmb3IgdGhlIGZpcnN0
IHRpbWUsIGl0IG1lYW5zIHRoYXQKZ2VucGRfcnVudGltZV9yZXN1bWUoKSB3aWxsICpub3QqIHJl
c3RvcmUgYSBwZXJmb3JtYW5jZSBzdGF0ZSwgYnV0Cmluc3RlYWQganVzdCBsZWF2ZSB0aGUgcGVy
Zm9ybWFuY2Ugc3RhdGUgYXMgaXMgZm9yIHRoZSBkZXZpY2UgKHNlZQpnZW5wZF9yZXN0b3JlX3Bl
cmZvcm1hbmNlX3N0YXRlKCkpLgoKSW4gb3RoZXIgd29yZHMsIGEgY29uc3VtZXIgZHJpdmVyIG1h
eSB1c2UgdGhlIGZvbGxvd2luZyBzZXF1ZW5jZSB0bwpzZXQgYW4gaW5pdGlhbCBwZXJmb3JtYW5j
ZSBzdGF0ZSBmb3IgdGhlIGRldmljZSBkdXJpbmcgLT5wcm9iZSgpOgoKLi4uCnJhdGUgPSBjbGtf
Z2V0X3JhdGUoKQpkZXZfcG1fb3BwX3NldF9yYXRlKHJhdGUpCgpwbV9ydW50aW1lX2VuYWJsZSgp
CnBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoKQouLi4KCk5vdGUgdGhhdCwgaXQncyB0aGUgY29u
c3VtZXIgZHJpdmVyJ3MgcmVzcG9uc2liaWxpdHkgdG8gbWFuYWdlIGRldmljZQpzcGVjaWZpYyBy
ZXNvdXJjZXMsIGluIGl0cyAtPnJ1bnRpbWVfc3VzcGVuZHxyZXN1bWUoKSBjYWxsYmFja3MuClR5
cGljYWxseSB0aGF0IG1lYW5zIGRlYWxpbmcgd2l0aCBjbG9jayBnYXRpbmcvdW5nYXRpbmcsIGZv
ciBleGFtcGxlLgoKSW4gdGhlIG90aGVyIHNjZW5hcmlvIHdoZXJlIGEgY29uc3VtZXIgZHJpdmVy
IHByZWZlcnMgdG8gKm5vdCogY2FsbApwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KCkgaW4gaXRz
IC0+cHJvYmUoKSwgYmVjYXVzZSBpdCBkb2Vzbid0IG5lZWQKdG8gcG93ZXIgb24gdGhlIGRldmlj
ZSB0byBjb21wbGV0ZSBwcm9iaW5nLCB0aGVuIHdlIGRvbid0IHdhbnQgdG8gdm90ZQpmb3IgYW4g
T1BQIGF0IGFsbCAtIGFuZCB3ZSBhbHNvIHdhbnQgdGhlIHBlcmZvcm1hbmNlIHN0YXRlIGZvciB0
aGUKZGV2aWNlIGluIGdlbnBkIHRvIGJlIHNldCB0byB6ZXJvLiBDb3JyZWN0PwoKSXMgdGhpcyB0
aGUgbWFpbiBwcm9ibGVtIHlvdSBhcmUgdHJ5aW5nIHRvIHNvbHZlLCBiZWNhdXNlIEkgdGhpbmsg
dGhpcwpkb2Vzbid0IHdvcmsgb3V0IG9mIHRoZSBib3ggYXMgb2YgdG9kYXk/CgpUaGVyZSBpcyBh
bm90aGVyIGNvbmNlcm4gdGhvdWdoLCBidXQgcGVyaGFwcyBpdCdzIG5vdCBhIHByb2JsZW0gYWZ0
ZXIKYWxsLiBWaXJlc2ggdG9sZCB1cyB0aGF0IGRldl9wbV9vcHBfc2V0X3JhdGUoKSBtYXkgdHVy
biBvbiByZXNvdXJjZXMKbGlrZSBjbG9jay9yZWd1bGF0b3JzLiBUaGF0IGNvdWxkIGNlcnRhaW5s
eSBiZSBwcm9ibGVtYXRpYywgaW4KcGFydGljdWxhciBpZiB0aGUgZGV2aWNlIGFuZCBpdHMgZ2Vu
cGQgaGF2ZSBPUFAgdGFibGVzIGFzc29jaWF0ZWQgd2l0aAppdCBhbmQgdGhlIGNvbnN1bWVyIGRy
aXZlciB3YW50cyB0byBmb2xsb3cgdGhlIGFib3ZlIHNlcXVlbmNlIGluCnByb2JlLgoKVmlyZXNo
LCBjYW4geW91IHBsZWFzZSBjaGltZSBpbiBoZXJlIGFuZCBlbGFib3JhdGUgb24gc29tZSBvZiB0
aGUKbWFnaWMgaGFwcGVuaW5nIGJlaGluZCBkZXZfcG1fb3BwX3NldF9yYXRlKCkgQVBJIC0gaXMg
dGhlcmUgYSBwcm9ibGVtCmhlcmUgb3Igbm90PwoKPgo+IEdFTlBEIGNvcmUgYXNzdW1lcyB0aGF0
IGNvbnN1bWVyIGRldmljZXMgY2FuIHdvcmsgYXQgYW55IHBlcmZvcm1hbmNlCj4gbGV2ZWwuIE5v
dCB0cnVlIGZvciBUZWdyYSBiZWNhdXNlIHZvbHRhZ2UgbmVlZHMgdG8gYmUgc2V0IGluIGFjY29y
ZGFuY2UKPiB0byB0aGUgY2xvY2sgcmF0ZSBiZWZvcmUgY2xvY2sgaXMgZW5hYmxlZCwgb3RoZXJ3
aXNlIGgvdyB3b24ndCB3b3JrCj4gcHJvcGVybHksIHBlcmhhcHMgY2xvY2sgbWF5IGJlIHVuc3Rh
YmxlIG9yIGgvdyB3b24ndCBiZSBsYXRjaGluZy4KCkNvcnJlY3QuIEdlbnBkIHJlbGllcyBvbiB0
aGUgY2FsbGVycyB0byB1c2UgdGhlIE9QUCBmcmFtZXdvcmsgaWYgdGhlcmUKYXJlIGNvbnN0cmFp
bnRzIGxpa2UgeW91IGRlc2NyaWJlIGFib3ZlLgoKVGhhdCBzYWlkLCBpdCdzIG5vdCBmb3JiaWRk
ZW4gZm9yIGEgY29uc3VtZXIgZHJpdmVyIHRvIGNhbGwKZGV2X3BtX2dlbnBkX3NldF9wZXJmb3Jt
YW5jZV9zdGF0ZSgpIGRpcmVjdGx5LCBidXQgdGhlbiBpdCBiZXR0ZXIKa25vd3MgZXhhY3RseSB3
aGF0IGl0J3MgZG9pbmcuCgo+Cj4gUGVyZm9ybWFuY2UgbGV2ZWwgc2hvdWxkIGJlIHNldCB0byAw
IHdoaWxlIGRldmljZSBpcyBzdXNwZW5kZWQuCgpEbyB5b3UgbWVhbiBzeXN0ZW0gc3VzcGVuZCBv
ciBydW50aW1lIHN1c3BlbmQ/IE9yIGJvdGg/Cgo+IFBlcmZvcm1hbmNlIGxldmVsIG5lZWRzIHRv
IGJlIGJ1bXBlZCBvbiBycG0tcmVzdW1lIG9mIGEgZGV2aWNlIGluCj4gYWNjb3JkYW5jZSB0byBo
L3cgc3RhdGUgYmVmb3JlIGhhcmR3YXJlIGlzIGVuYWJsZWQuCgpBc3N1bWluZyB0aGVyZSB3YXMg
YSBwZXJmb3JtYW5jZSBzdGF0ZSBzZXQgZm9yIHRoZSBkZXZpY2Ugd2hlbgpnZW5wZF9ydW50aW1l
X3N1c3BlbmQoKSB3YXMgY2FsbGVkLCBnZW5wZF9ydW50aW1lX3Jlc3VtZSgpIHdpbGwKcmVzdG9y
ZSB0aGF0IHN0YXRlIGFjY29yZGluZyB0byB0aGUgc2VxdWVuY2UgeW91IGRlc2NyaWJlZC4KCktp
bmQgcmVnYXJkcwpVZmZlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
