Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D68CDB474
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Oct 2023 14:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OyuqOwr2PdQkabkIFyReBZRI6mK3hspTZYlJjB8Fkbg=; b=mbtaPBtNxgSJCK
	pifc73R7OKtg1nEsnWyk6gZkEXwZZ7WpERFl7phlBxawyKnXfx1Ahtj/pi5q7Rq0RW5+gKdXJJaun
	62k1vQqLMcbfNJ9hiEZkjOy+5GlabtlR4rKjNgo/ZWvpZ68zKmgveUIX4erRnw2OFg9LnW6dcqvQD
	MqEA9X42vZnEKHdhEMfMxv00WvmTsO1UM0ioyngo58bD850eTR5eBY/shL/Aq0ZoEev/nzBgn1/07
	De9T6T4AIkQdTcaPqyECEzOwWlfaP36nQBKBDRSJsnEPX3FlagT6hfVekW2u9oKWVnW1v9twf5Glh
	Eg57lC1H0ect6U8uxOEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qslL1-00CYc2-1M;
	Tue, 17 Oct 2023 14:46:27 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslKy-00CYam-1o
	for linux-mtd@lists.infradead.org;
	Tue, 17 Oct 2023 14:46:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF87740005;
	Tue, 17 Oct 2023 14:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697553981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z+HVpjFBYgEh2l2BPPwW70dNMY8NySzXp+03g4Vtt4g=;
	b=i3Q8JGEVZ8AB1Xf6d3lGj4uWum1vScljC3EssKIwWv1VDYy+BVhLDQV7ngvm5edpVwvci4
	mAwzq35EGlvF3k5pwvp9zHBRV2MXFPFRItjFO9HqbHLaTUvIMedwgRkRjSeGwQzPCsqFs1
	x29BnDvWgQPlssTonWtV4KEeojCX9jwRtkWwHm7vDv65Xb2Sy9rBqh4f/c0tJO9ZexLaon
	cKBuqiHzctUyxrsYZAVDJhy/jtjL60rXnHLFLz19N+6+fRmYKCLob6ywCZ5Mkk6jKzBAGu
	6O5PIZILVXcp3yqC1OYvDm2xD5uUqsVK4GgmLtFPPVsb1lBnebkWTMFZXU0pwg==
Date: Tue, 17 Oct 2023 16:46:15 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Lubart, Vitaly" <vitaly.lubart@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Winkler, Tomas" <tomas.winkler@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 06/10] drm/i915/spi: spi register with mtd
Message-ID: <20231017164615.5b58fcc6@xps-13>
In-Reply-To: <CY5PR11MB63663DB0C17321A1A0C46FF3EDD6A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20230910123949.1251964-1-alexander.usyskin@intel.com>
	<20230910123949.1251964-7-alexander.usyskin@intel.com>
	<20231016103939.67445bee@xps-13>
	<CY5PR11MB6366850CCE851BCA05A9DC2BEDD6A@CY5PR11MB6366.namprd11.prod.outlook.com>
	<20231017155544.6cceb6a6@xps-13>
	<CY5PR11MB63663DB0C17321A1A0C46FF3EDD6A@CY5PR11MB6366.namprd11.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_074624_886581_7BFE1959 
X-CRM114-Status: GOOD (  15.81  )
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

SGkgQWxleGFuZGVyLAoKYWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29tIHdyb3RlIG9uIFR1ZSwg
MTcgT2N0IDIwMjMgMTQ6MjA6MzIgKzAwMDA6Cgo+ID4gPiA+ID4gKwlzcGktPm10ZC53cml0ZXNp
emUgPSBTWl8xOyAvKiAxIGJ5dGUgZ3JhbnVsYXJpdHkgKi8gIAo+ID4gPiA+Cj4gPiA+ID4gWW91
IHNheSB3cml0ZXNpemUgc2hvdWxkIGJlIGFsaWduZWQgd2l0aCA0IGluIHlvdXIgbmV4dCBwYXRj
aD8gIAo+ID4gPgo+ID4gPiBXZSBzdXBwb3J0IHVuYWxpZ25lZCB3cml0ZSBieSByZWFkaW5nIGFs
aWduZWQgNGJ5dGVzLAo+ID4gPiByZXBsYWNpbmcgY2hhbmdlZCBieXRlcyB0aGVyZSBhbmQgd3Jp
dGluZyB3aG9sZSA0Ynl0ZXMgYmFjay4KPiA+ID4gSXMgdGhlcmUgYW55IHByb2JsZW0gd2l0aCB0
aGlzIGFwcHJvYWNoPyAgCj4gPiAKPiA+IElzIHRoZXJlIGEgcmVhc29uIHRvIGRvIHRoYXQgbWFu
dWFsbHkgcmF0aGVyIHRoYW4gbGV0dGluZyB0aGUgY29yZQo+ID4gaGFuZGxlIHRoZSBjb21wbGV4
aXR5Pwo+ID4gICAKPiBJIHdhcyBub3QgYXdhcmUgdGhhdCBjb3JlIGNhbiBkbyB0aGlzLiBUaGUg
Y29yZSBpbXBsZW1lbnRzIGFib3ZlIGxvZ2ljCj4gaWYgSSBwdXQgU1pfNCBoZXJlIGFuZCBjYWxs
ZXIgdHJ5IHRvIHdyaXRlLCBzYXksIG9uZSBieXRlPwo+IEFuZCBzeW5jIG11bHRpcGxlIHdyaXRl
cnM/Cj4gSWYgc28sIEkgY2FuIHJlbW92ZSBtYW51YWwgd29yaywgSSB0aGluaywgYW5kIG1ha2Ug
dGhlIHBhdGNoZXMgc21hbGxlci4KCkkgaGF2ZW4ndCBjaGVja2VkIGluIGRldGFpbCBidXQgSSB3
b3VsZCBleHBlY3QgdGhpcyB5ZXMuIFBsZWFzZSBoYXZlIGEKcm91bmQgb2YgdGVzdHMgYW5kIGlm
IGl0IHdvcmtzLCBwbGVhc2Ugc2ltcGxpZnkgdGhpcyBwYXJ0LgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
