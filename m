Return-Path: <SRS0=z9um=NK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA96EC4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 14:56:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 948C4600CC
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 14:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 948C4600CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oJ4etWkrviSynRSevRAC8uwkUYZ+Z+6ZjRO/FAp1fTU=; b=5Es4pu8Eq+i5Pd
	Ts4/kU8w84ILrBclN6IC95Eupz0Xm3XyI/EaS43CDMwj1h8k6KfFBrW7wH4eYeWTvzGLmy4Jj3mNG
	X9GZfkIdR+GY95hXdKTz0+daXK119cNHbipyBfYitt1YuAYL2JvmQCWmNjKIXT80zRrvLmgHhGOsI
	ROACRTFsNpx+ZTAnWKyvM/ysjFf80InsCenT2m406W+Sb108rn5afiaNMoBtROMZ6mxfI2L6FFg+H
	F6fPwQxnztEXlVe1urv3Lr5nck9pBxso+eW8MDKDnHKZSanjxEP/VjhbS0Gc4DexOfk2WpzxpWREb
	btSnWkST5rd4JoFw92ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGjSa-008hga-5o; Thu, 19 Aug 2021 14:56:00 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGjSV-008heN-3L
 for linux-mtd@lists.infradead.org; Thu, 19 Aug 2021 14:55:58 +0000
Received: by mail-vs1-xe32.google.com with SMTP id j186so4171814vsc.10
 for <linux-mtd@lists.infradead.org>; Thu, 19 Aug 2021 07:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mm8paTdT0zaztfhC5Y4WPaOBPl8kLHQHgl7pXYxX3h4=;
 b=qeDfX1TvtXFpaue7XSJcQGoXvoEPk6keQ3SefhHQYD/RQYSwXL/h7/nJ1tE1n2ZgGf
 hgNQdBuev8q9YdqAn31QqEn+hl0Fw8o/I7j+pKewMg7BSKDExUMcgAG5ffW6TnVBaweA
 awPBlmbVNdD0YyJLl/fecYVhU7UH2GjQaH+G3BKTeEFH67xcFXuuVoODzKyHu4OljnuW
 y3YyyagNQ7/VVdr8UoQMvH7lyjCnnH9zaDfJmZrMJYrsb5yu8bZTEWP6ZCkq4ndYtqKT
 KiXhZrvSOf9kLkVqOyobXMYfdScN3zuV6Y2fafpateAUvd8nG8k5/FLAhRgrUffP4ZSX
 UqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mm8paTdT0zaztfhC5Y4WPaOBPl8kLHQHgl7pXYxX3h4=;
 b=pqd6pxj1gy/pl1qHfKC6OfSptXOBKDQUZiIb+Gd2VXCgxg9dGpk5oRf2PKe8PS4YPN
 wSEjZtceN+30SIIw+Z+j+m/S0ej4E1Ql4Vaonhsx/tkPG9ZtHZlPNk3r6rFiWLcDhGFd
 FHpemznLKzXtHDzwuByCxY4kvArMBV+GzFsJOng6CfoXGe8bPVLyEaPXql8f6zUfi+o5
 qQFG6lz0VYGne2u8q3I6I4D5hl4cYyrCmTETBCUum0Ko8wVNxwIcTZtnzccwbuCAWY97
 uBRVgpuwq+zOGfNYPJHvwTo6Fzrk9KSF1OoXCOi0HsRu04Lnv4V8FOBhnv6oAF95KhA+
 0WgQ==
X-Gm-Message-State: AOAM5308EXNThVYN/ujqnJ9r/s19aWvBrHeLRpPgoU9BHrPD/wzpPKoz
 lgKLYqNpSma44DAT6o0SrnmAuHLaPOvaETSBvunaiA==
X-Google-Smtp-Source: ABdhPJy9lhlHe3ZkjkK69gRHTqfsYZUpyU/u1QO9GNutRCvh27kC0oDOl0UN2vIh0G0BbPGuh3RFsxVqGIQ9yFmBme8=
X-Received: by 2002:a67:f6d8:: with SMTP id v24mr12929204vso.48.1629384953702; 
 Thu, 19 Aug 2021 07:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7>
 <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
 <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
 <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
 <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
 <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
 <f1314a47-9e8b-58e1-7c3f-0afb1ec8e70a@gmail.com>
 <20210819061617.r4kuqxafjstrv3kt@vireshk-i7>
In-Reply-To: <20210819061617.r4kuqxafjstrv3kt@vireshk-i7>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Aug 2021 16:55:16 +0200
Message-ID: <CAPDyKFpg8ixT4AEjzVLTwQR7Nn9CctjnLCDS5GwkOrAERquyxw@mail.gmail.com>
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Viresh Kumar <vireshk@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Peter Chen <peter.chen@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, 
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
X-CRM114-CacheID: sfid-20210819_075555_171245_256A110A 
X-CRM114-Status: GOOD (  39.37  )
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

T24gVGh1LCAxOSBBdWcgMjAyMSBhdCAwODoxNywgVmlyZXNoIEt1bWFyIDx2aXJlc2gua3VtYXJA
bGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiAxOC0wOC0yMSwgMTg6NTUsIERtaXRyeSBPc2lwZW5r
byB3cm90ZToKPiA+IDE4LjA4LjIwMjEgMTI6NDEsIFVsZiBIYW5zc29uINC/0LjRiNC10YI6Cj4g
Pgo+ID4gRWl0aGVyIHdheSBnaXZlcyB0aGUgZXF1YWwgcmVzdWx0LiBUaGUgbmV3IGNhbGxiYWNr
IGFsbG93cyB0byByZW1vdmUgdGhlCj4gPiBib2lsZXJwbGF0ZSBkZXZfcG1fb3BwX3NldF9yYXRl
KGNsa19nZXRfcmF0ZSgpIGNvZGUgZnJvbSB0aGUgcnBtLXJlc3VtZQo+ID4gb2YgY29uc3VtZXIg
ZGV2aWNlcywgdGhhdCdzIGl0Lgo+Cj4gSXQgbWF5IG5vdCBiZSBlcXVhbCwgYXMgZGV2X3BtX29w
cF9zZXRfcmF0ZSgpIG1heSBkbyBhZGRpdGlvbmFsIHN0dWZmLAo+IG5vdyBvciBpbiBhIGxhdGVy
IGltcGxlbWVudGF0aW9uLiBDdXJyZW50bHkgaXQgb25seSBkb2VzCj4gcmVndWxhdG9yX2VuYWJs
ZSgpIGFzIGEgc3BlY2lhbCBjYXNlLCBidXQgaXQgY2FuIGJlIGNsa19lbmFibGUoKSBhcwo+IHdl
bGwuIEFsc28sIHRoaXMgdHJpZXMgdG8gc29sdmUgdGhlIHByb2JsZW0gaW4gYSB0cmlja3kvaGFj
a3kgd2F5LAo+IHdoaWxlIGFsbCB5b3Ugd2FudGVkIHdhcyB0byBtYWtlIHRoZSBnZW5wZCBhd2Fy
ZSBvZiB3aGF0IHRoZQo+IHBlcmZvcm1hbmNlIHN0YXRlIHNob3VsZCBiZS4KPgo+IFlvdXIgZHJp
dmVyIGNhbiBicmVhayB0b21vcnJvdyBpZiB3ZSBzdGFydGVkIHRvIGRvIG1vcmUgc3R1ZmYgZnJv
bQo+IHRoaXMgQVBJIGF0IGFub3RoZXIgdGltZS4KPgo+ID4gPiBkZXZfcG1fb3BwX3NldF9yYXRl
KCkgaXMgYmVzdCBjYWxsZWQgZnJvbSBjb25zdW1lciBkcml2ZXJzLCBhcyB0aGV5Cj4gPiA+IG5l
ZWQgdG8gYmUgaW4gY29udHJvbC4KPiA+ID4+IFdoYXQgd2UgbmVlZCBoZXJlIGlzIGp1c3QgY29u
ZmlndXJlLiBTbyBzb21ldGhpbmcgbGlrZSB0aGlzIHRoZW46Cj4gPiBUaGUgaW50ZW50IHdhc24n
dCB0byB1c2UgZGV2X3BtX29wcF9zZXRfcmF0ZSgpIGZyb20KPiA+IF9fZ2VucGRfZGV2X3BtX2F0
dGFjaCgpLCBidXQgdG8gc2V0IGdlbnBkLT5ycG1fcHN0YXRlIGluIGFjY29yZGFuY2UgdG8KPiA+
IHRoZSBoL3cgY29uZmlndXJhdGlvbi4KPgo+IFJpZ2h0Lgo+Cj4gPiBPbiBUZWdyYSB3ZSBoYXZl
IGEgY2hhaW4gb2YgUERzIGFuZCBpdCdzIG5vdCB0cml2aWFsIHRvIGNvbnZlcnQgdGhlCj4gPiBk
ZXZpY2UncyBPUFAgaW50byBwc3RhdGUgYmVjYXVzZSBvbmx5IHRoZSBwYXJlbnQgZG9tYWluIGNh
biB0cmFuc2xhdGUKPiA+IHRoZSByZXF1aXJlZCBPUFAuCj4KPiBUaGUgZHJpdmVyIHNob3VsZCBq
dXN0IGJlIHJlcXVpcmVkIHRvIG1ha2UgYSBjYWxsLCBhbmQgT1BQL2dlbnBkIGNvcmUKPiBzaG91
bGQgcmV0dXJuIGl0IGEgdmFsdWUuIFRoaXMgaXMgYWxyZWFkeSBkb25lIHRvZGF5IHdoaWxlIHNl
dHRpbmcgdGhlCj4gcHN0YXRlIGZvciBhIGRldmljZS4gVGhlIHNhbWUgZnJhbWV3b3JrcyBtdXN0
IGJlIGFibGUgdG8gc3VwcGx5IGEKPiB2YWx1ZSB0byBiZSB1c2VkIGZvciB0aGUgZGV2aWNlLgoK
UmlnaHQsIHRoYXQgc291bmRzIHJlYXNvbmFibGUuCgpXZSBhbHJlYWR5IGhhdmUgcG1fZ2VucGRf
b3BwX3RvX3BlcmZvcm1hbmNlX3N0YXRlKCkgd2hpY2ggdHJhbnNsYXRlcwphbiBPUFAgdG8gYSBw
ZXJmb3JtYW5jZSBzdGF0ZS4gVGhpcyBmdW5jdGlvbiBpbnZva2VzIHRoZQotPm9wcF90b19wZXJm
b3JtYW5jZV9zdGF0ZSgpIGZvciBhIGdlbnBkLiBNYXliZSB3ZSBuZWVkIHRvIGFsbG93IGEKZ2Vu
cGQgdG8gbm90IGhhdmUgLT5vcHBfdG9fcGVyZm9ybWFuY2Vfc3RhdGUoKSBjYWxsYmFjayBhc3Np
Z25lZAp0aG91Z2gsIGJ1dCBjb250aW51ZSB1cCBpbiB0aGUgaGllcmFyY2h5IHRvIHNlZSBpZiB0
aGUgcGFyZW50IGhhcyB0aGUKY2FsbGJhY2sgYXNzaWduZWQsIHRvIG1ha2UgdGhpcyB3b3JrIGZv
ciBUZWdyYT8KClBlcmhhcHMgd2Ugc2hvdWxkIGFkZCBhbiBBUEkgZGV2X3BtX2dlbnBkX29wcF90
b19wZXJmb3JtYW5jZV9zdGF0ZSgpLAphbGxvd2luZyB1cyB0byBwYXNzIHRoZSBkZXZpY2UgaW5z
dGVhZCBvZiB0aGUgZ2VucGQuIEJ1dCB0aGF0J3MgYQptaW5vciB0aGluZy4KCkZpbmFsbHksIHRo
ZSBwcmVjb25kaXRpb24gdG8gdXNlIHRoZSBhYm92ZSwgaXMgdG8gZmlyc3QgZ2V0IGEgaGFuZGxl
CnRvIGFuIE9QUCB0YWJsZS4gVGhpcyBpcyB3aGVyZSBJIGFtIHN0cnVnZ2xpbmcgdG8gZmluZCBh
IGdlbmVyaWMKc29sdXRpb24sIGJlY2F1c2UgSSBndWVzcyB0aGF0IHdvdWxkIGJlIHBsYXRmb3Jt
IG9yIGV2ZW4gY29uc3VtZXIKZHJpdmVyIHNwZWNpZmljIGZvciBob3cgdG8gZG8gdGhpcy4gQW5k
IGF0IHdoYXQgcG9pbnQgc2hvdWxkIHdlIGRvCnRoaXM/Cgo+Cj4gPiBWaXJlc2gsIHBsZWFzZSB0
YWtlIGEgbG9vayBhdCB3aGF0IEkgZGlkIGluIFsxXS4gTWF5YmUgaXQgY291bGQgYmUgZG9uZQo+
ID4gaW4gYW5vdGhlciB3YXkuCj4KPiBJIGxvb2tlZCBpbnRvIHRoaXMgYW5kIGxvb2tlZCBsaWtl
IHRvbyBtdWNoIHRyb3VibGUuIFRoZQo+IGltcGxlbWVudGF0aW9uIG5lZWRzIHRvIGJlIHNpbXBs
ZS4gSSBhbSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQgYWxsIHRoZQo+IHByb2JsZW1zIHlvdSBmYWNl
ZCB3aGlsZSBkb2luZyB0aGF0LCB3b3VsZCBiZSBiZXR0ZXIgdG8gc3RhcnQgd2l0aCBhCj4gc2lt
cGxlciBpbXBsZW1lbnRhdGlvbiBvZiBnZXRfcGVyZm9ybWFuY2Vfc3RhdGUoKSBraW5kIG9mIEFQ
SSBmb3IKPiBnZW5wZCwgYWZ0ZXIgdGhlIGRvbWFpbiBpcyBhdHRhY2hlZCBhbmQgaXRzIE9QUCB0
YWJsZSBpcyBpbml0aWFsaXplZC4KPgo+IE5vdGUsIHRoYXQgdGhlIE9QUCB0YWJsZSBpc24ndCBy
ZXF1aXJlZCB0byBiZSBmdWxseSBpbml0aWFsaXplZCBmb3IKPiB0aGUgZGV2aWNlIGF0IHRoaXMg
cG9pbnQsIHdlIGNhbiBwYXJzZSB0aGUgRFQgYXMgd2VsbCBpZiBuZWVkZWQgYmUuCgpTdXJlLCBi
dXQgYXMgSSBpbmRpY2F0ZWQgYWJvdmUsIHlvdSBuZWVkIHNvbWUga2luZCBvZiBpbnB1dCBkYXRh
IHRvCmZpZ3VyZSBvdXQgd2hhdCBPUFAgdGFibGUgdG8gcGljaywgYmVmb3JlIHlvdSBjYW4gdHJh
bnNsYXRlIHRoYXQgaW50bwphIHBlcmZvcm1hbmNlIHN0YXRlLiBJcyB0aGF0IGFsd2F5cyB0aGUg
Y2xvY2sgcmF0ZSwgZm9yIGV4YW1wbGU/CgpQZXJoYXBzLCB3ZSBzaG91bGQgc3RhcnQgd2l0aCBh
ZGRpbmcgYSBkZXZfcG1fb3BwX2dldF9mcm9tX3JhdGUoKSBvcgp3aGF0IGRvIHlvdSB0aGluaz8g
RG8geW91IGhhdmUgb3RoZXIgc3VnZ2VzdGlvbnM/Cgo+Cj4gLS0KPiB2aXJlc2gKCktpbmQgcmVn
YXJkcwpVZmZlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
