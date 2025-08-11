Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA38CA0EC0
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 08:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k7N0MpL+iZ9mADQun/qG3E0wkOwAHM+g8EJzAwDLEF8=; b=obw/qYZjCK8M7O
	iRDgikTkWxfmoM2bydPw8Ti8ZEwDAYCTwcycG/neagUe3P66xmcRpUBUbCWmv2yMe8r5UrO9H6xEw
	vj11BNlh0nD36SsVb22bLLbQ5i+Sm5PmGrgRiqbcAJV+WCtU0IoOq216rSAAuBhZDC3vbelEzhE2N
	gvdslVZzELEHalQMh0YYylulqMoRmO02Pqort2yLJQCXEdSBikzKhvbCw5bhhfsV4AWXz5w7A0Uyk
	mGQK17RXCpJ2fcKmnBpa5Bj6Vb0tSSe3UeufdAZ05sj3gjG99QO2JCsnqRtyMwCt3R2asVPssnZGM
	sxEVc8M2h+r3sjBtgC1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulO7B-00000006sz7-1BwW;
	Mon, 11 Aug 2025 08:42:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNem-00000006onb-1FPE
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 08:13:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 02A51449FB;
	Mon, 11 Aug 2025 08:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A450C4CEF7;
	Mon, 11 Aug 2025 08:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754900002;
	bh=5sjPiBzdpJnO+FR0G57D0bldCe0wsDvVzVNiX8GVo3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qP9CMZeDHEIMUyDRW81lz9yYFrXw+jtqQ4lmG4odliDcLaBN7Zb3z8FBq0SBqjJRD
	 jIwIHc0Z8fx0NlTtIU+Bioq3GyTpDjjeC0f0m/9fVj9hSfdVaHrpdAdmnk9o+qF8wt
	 znSC5pXA7nFfXG+0l/VycbdArzc2403pOdGirxDD2fbSDjmZDJFPmZWJNlK+loqTpK
	 wcgSmyT59uhRn395apbWLSboB8RPzajxb/HS89c84zYjV/Wcsd/A39ROv/6KZoFtuK
	 ROEHMpKX2CvgDqd69BBrSHFev/Thp9kaXaTLEZXIRfHyv07umoEK/Qd7owiXIylbWP
	 KAhNLP0tY76CQ==
Date: Mon, 11 Aug 2025 10:13:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: Re: [PATCH v2 5/8] dt-bindings: mtd: loongson,ls1b-nand-controller:
 Document the Loongson-2K0500 NAND controller
Message-ID: <20250811-impetuous-civet-of-wind-febe58@kuoka>
References: <cover.1754890670.git.zhoubinbin@loongson.cn>
 <a6b216e6726edc00a910ba543ef8f7a9195b94f7.1754890670.git.zhoubinbin@loongson.cn>
 <208c1e34-85b4-47d7-a4d3-8b8b7f2caa84@kernel.org>
 <CAMpQs4+OcC_jMvQVc+u9ue9HeBEPcbzWORC0rWkXhj3y90fvSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMpQs4+OcC_jMvQVc+u9ue9HeBEPcbzWORC0rWkXhj3y90fvSQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_011324_357997_FEE5F7C3 
X-CRM114-Status: GOOD (  12.36  )
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

T24gTW9uLCBBdWcgMTEsIDIwMjUgYXQgMDM6NDI6MDlQTSArMDgwMCwgQmluYmluIFpob3Ugd3Jv
dGU6Cj4gSGkgS3J6eXN6dG9mOgo+IAo+IE9uIE1vbiwgQXVnIDExLCAyMDI1IGF0IDM6MzLigK9Q
TSBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9u
IDExLzA4LzIwMjUgMDg6MDMsIEJpbmJpbiBaaG91IHdyb3RlOgo+ID4gPiBBZGQgbmV3IGNvbXBh
dGlibGUgZm9yIHRoZSBMb29uZ3Nvbi0ySyBOQU5EIGNvbnRyb2xsZXIgdXNlZCBmb3IKPiA+ID4g
TG9vbmdzb24tMkswNTAwIFNvQy4KPiA+ID4KPiA+ID4gQWNrZWQtYnk6ICJSb2IgSGVycmluZyAo
QXJtKSIgPHJvYmhAa2VybmVsLm9yZz4KPiA+Cj4gPgo+ID4gV2h5IGRvIHlvdSBhZGQgcXVvdGVz
Pwo+IAo+IEVtbS4uLgo+IFNvcnJ5LCBJIGRpZG4ndCBub3RpY2UgdGhhdC4KPiBJIHJlYWNxdWly
ZWQgdGhlIFYxIHBhdGNoc2V0IHVzaW5nIOKAnGI0IGFtIHh4eOKAnSB0byBhdm9pZCBtYW51YWxs
eQo+IGFkZGluZyB0YWdzLiBJIGJlbGlldmUgaXQgbWF5IGJlIGNhdXNlZCBieSB0aGUgYGI0YCBj
b21tYW5kLgoKVGhlbiBhcmVuJ3QgeW91IHVzaW5nIHNvbWUgb2xkIGI0PwoKSSBqdXN0IGRpZCBp
dCBhbmQgbG9vazoKCiAgW1BBVENIIHYxIDUvOF0gZHQtYmluZGluZ3M6IG10ZDogbG9vbmdzb24s
bHMxYi1uYW5kLWNvbnRyb2xsZXI6IERvY3VtZW50IHRoZSBMb29uZ3Nvbi0ySzA1MDAgTkFORCBj
b250cm9sbGVyCiAgICArIEFja2VkLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwu
b3JnPiAo4pyTIERLSU0va2VybmVsLm9yZykKICAgICsgTGluazogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvci81ODg2MzlkZTU5MWFkYTQwOGJkYWViMGQyNzljNWQ2MmE0YjUzZDYxLjE3NTMxNjYw
OTYuZ2l0Lnpob3ViaW5iaW5AbG9vbmdzb24uY24KICAgICsgU2lnbmVkLW9mZi1ieTogS3J6eXN6
dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgoKCk5vIHF1b3Rl
cyBpbiBjb21taXQgbXNnIGVpdGhlci4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
