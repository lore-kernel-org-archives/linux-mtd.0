Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89504C79F82
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 15:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AjHV9x4tJJCGFk4JM01dxOvVkz24CMi3WtXGScfANMA=; b=PrdUYw22CB/oIj
	ePJ8A6cZm6LhkByUodtgGTaywM+hKNAuyeo4gpzrqtbGXtgd0QiYa1qXLWruAYHQHyv2tCl3/SOt9
	uoXNXWNiSC82u2iobAX1v06A9cgRrYa7LwO+GQFxzt/d+UavYLsIS5Y6j6SCY6Fr+FsER0cyFAdLT
	Sst2cnOPfT+3G+0NOibA+DFB9PXw/1tjT2Q1ypDLiU1OfeX3+j+qEoWYMV2WW1r/JSfsRV+HIqpop
	ZGVAh3cRKNhM6Or924JHS3a3nYtZdGOgt0UpPcnj6+7D+UHo2DIVDpIodpHCH6xIHOZcbbwB4Yog8
	ElrSPAz+XaVhIce5TNgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Vp4-00000002WXr-0ylz;
	Fri, 04 Sep 2026 15:27:22 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Vp1-00000002WWt-2zbY;
	Fri, 04 Sep 2026 15:27:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C0FB44E41511;
	Fri,  4 Sep 2026 15:27:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 93BBE6057F;
	Fri,  4 Sep 2026 15:27:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C349711C79A0A;
	Fri,  4 Sep 2026 17:27:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788535636; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=N1nfkxoqHqtsDIrlAOueBGPUz7eK3DRzUma2WlWEGlY=;
	b=RzxnD/IpiHfYHW8Y4IF9QDaStVQ5scVKGIR6fIbFHUu8oMt2/2KyH5RdGRIhq0wR0uhahF
	Mc15SmDirQDEVKxEk9XdxLyCuxjZW76fH7KryOI04ovbiDdLlW7u1kKU5iVHVbt7Sf9Okp
	9uEgl4dKhuuEBbvBTvg0ijybhm9odnMK+R74rbdsGjGYVbh6ghWvRTu/JUO4mMdY5Zsplx
	1pclSnSH5DOhyKqyQXxODoIsu/HqFAJgWzrSMv0INoDFw4Ptcjy6E2L+IgrKvuJ/RKNzi3
	TKWZhwXr9HChSTW+O97kVgt91eyfh5RfmxFkytingVInkm9XdhhuhI2eHzW07g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Maxime Ripard <mripard@kernel.org>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] mtd: rawnand: sunxi: support randomized OOB formats
In-Reply-To: <CADvTj4oW8Hxv_b5vWM5pbeB3wEO-WoqhLwyinCTFPNR6wTHYmQ@mail.gmail.com>
	(James Hilliard's message of "Fri, 4 Sep 2026 11:17:46 -0400")
References: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
	<20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-2-463853a14ad9@gmail.com>
	<87se3p13jy.fsf@bootlin.com>
	<CADvTj4oW8Hxv_b5vWM5pbeB3wEO-WoqhLwyinCTFPNR6wTHYmQ@mail.gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 04 Sep 2026 17:27:13 +0200
Message-ID: <878q5h11gu.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_082719_888113_0702118F 
X-CRM114-Status: GOOD (  16.11  )
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

T24gMDQvMDkvMjAyNiBhdCAxMToxNzo0NiAtMDQsIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxs
aWFyZDFAZ21haWwuY29tPiB3cm90ZToKCj4gT24gRnJpLCBTZXAgNCwgMjAyNiBhdCA4OjQy4oCv
QU0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4+Cj4+
IE9uIDEwLzA4LzIwMjYgYXQgMTc6MDQ6NTAgLTA2LCBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGls
bGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+ID4gVGhlIGNvbnRyb2xsZXIgcmFuZG9taXpl
ciBjb3ZlcnMgdGhlIGJhZCBibG9jayBtYXJrZXIgYWxvbmcgd2l0aCB0aGUKPj4gPiByZXN0IG9m
IHRoZSBPT0IgZGF0YS4gVGhlIGRyaXZlciBjdXJyZW50bHkgY29tcGVuc2F0ZXMgdGhlIG1hcmtl
ciBieXRlcwo+PiA+IGJlZm9yZSB3cml0ZXMgYW5kIGFmdGVyIHJlYWRzIHNvIHRoYXQgdGhleSBy
ZW1haW4gcGxhaW4gb24gZmxhc2guCj4+ID4KPj4gPiBBbGx3aW5uZXIgTkFORCBmaXJtd2FyZSBp
bnN0ZWFkIHN0b3JlcyB0aGUgbWFya2VyIHRocm91Z2ggdGhlCj4+ID4gcmFuZG9taXplci4gTWVk
aWEgdXNpbmcgdGhhdCBmb3JtYXQgYXBwZWFycyB0byBjb250YWluIGJhZCBibG9ja3MgdW5sZXNz
Cj4+ID4gdGhlIHJhbmRvbWl6ZXIgaXMgZW5hYmxlZCB3aGlsZSByZWFkaW5nIHRoZSBtYXJrZXIu
Cj4+ID4KPj4gPiBIb25vciB0aGUgYWxsd2lubmVyLHJhbmRvbWl6ZWQtb29iIHByb3BlcnR5IGJ5
IHVuY29uZGl0aW9uYWxseSBlbmFibGluZwo+PiA+IHBhZ2Ugc2NyYW1ibGluZyBhbmQgbGVhdmlu
ZyB0aGUgbWFya2VyIGluIHRoZSByYW5kb21pemVyIGRhdGEgc3RyZWFtLgo+PiA+IEtlZXAgdGhl
IGV4aXN0aW5nIHBsYWluIG1hcmtlciBiZWhhdmlvciB3aGVuIHRoZSBwcm9wZXJ0eSBpcyBhYnNl
bnQuCj4+ID4gVGhpcyBjaGFuZ2VzIG1hcmtlciBoYW5kbGluZyBvbiBhbGwgc3VwcG9ydGVkIGNv
bnRyb2xsZXJzOyB0aGUgSDYvSDYxNgo+PiA+IHByb3RlY3RlZCB1c2VyLWRhdGEgcGxhY2VtZW50
IGlzIGhhbmRsZWQgc2VwYXJhdGVseS4KPj4KPj4gQnV0IEkgdGhpbmsgdGhlIHJlYXNvbiB3aHkg
dGhpcyBoYXMgbmV2ZXIgYmVlbiBkb25lIGlzIGJlY2F1c2UgaXQganVzdAo+PiBicmVha3MgcmF3
IGFjY2Vzc2VzLCBpbmNsdWRpbmcgdGhlIEJCVCByZWFkcy4gSSBkb24ndCB0aGluayB0aGlzIGlz
Cj4+IGhhbmRsZWQsIGlzIGl0Pwo+Cj4gRnJvbSBteSB1bmRlcnN0YW5kaW5nIHJhdyBhY2Nlc3Mg
YnlwYXNzZXMgcmFuZG9taXphdGlvbiBlbnRpcmVseS4KCnllcywgc28gdGhlIGltcGxlbWVudGF0
aW9uIHlvdSBwcm9wb3NlIGlzIGludmFsaWQsIHJhdyByZWFkcyBzaGFsbApzaG93IHRoZSBCQk0u
IEFuZCBhbHNvLCB3aGVuIGFjY2Vzc2luZyBhIEJCVCwgaXQgaXMgbWFkZSBpbiByYXcgbW9kZSwK
d2l0aG91dCByYW5kb21pemF0aW9uLCBhbmQgaGVuY2UgdG90YWxseSBmYWlsLiBUaGlzIGNhbm5v
dCBmbHkhCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
