Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D4DE82CA2
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Sep 2023 14:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OyzPp7hwVf7SXXHN4ohLmxK5NhmjSUP1A8p6N9EmCJk=; b=qlRHL0a4GaIBaC
	v4/mTHiz3e1+OT12+ht0OK9hsD3vsVSdNfkaVwTzVAll3A/lNZVwAjNS6eUD8pN6krxviAzyUQwmh
	28BmB4cWAX9wNmlzyL7yprpmHdvB9VcDyLfDTHVez+U/IGiHw9j8YFB2MQgzYj80qFt4kHnVtqgPV
	Nv+F6ROC0IHc7f6uRjNL2NVhwuYz40QIwZYnN2MYiyTeUnmQ2WFul7zVMu77VWh4FS+b0nSeWfCBJ
	IQ6dmxj9zSzlUcr0pZRGpfjtoPRFlf7JB7lwGefz2KF1bvT9YDQgz0H0EbBKNFZxZYBAUVhev1Zok
	ZpmxgajwuC/ro86jcMUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlVwI-001AtN-0C;
	Wed, 27 Sep 2023 14:54:58 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlVwF-001AsW-1z
	for linux-mtd@lists.infradead.org;
	Wed, 27 Sep 2023 14:54:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F837240013;
	Wed, 27 Sep 2023 14:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695826488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bU7T7dDQ/dHFd7LrSzq4NNGKbKWAKTZ4mfNpbgF6ZUs=;
	b=bh26dm8STTmIX6aEY3yids5BNROji9NHQGCOkljcLJGC7bWQN0oVyOYBbPx8EDjBWSUOhI
	kZlgWMO10lk3atwHM1kAVX27i0xASK7A1e+nfUzrjb2Xg6uNXXXTu++hyN2wXoU7cwNdy0
	hFIpSIr3igF9xMGLltEJ8R9cP7nRW3LXTxsocJd9Ha+COgsVI+DmGUQFre4pi0hPCf6uuO
	81rLsrDdebLX/bqTcmFAiWGh2863Q5KfTaG3AUzOKMKt4N1HCzB9QKh2kRgmINHh6GLOkE
	yK+sCCVNwpUWbTpGLujlpRxy+fiuTIx5/uIV9fENKj3PD9H0dzqZ5YAOtT8TYw==
Date: Wed, 27 Sep 2023 16:54:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: "Usyskin, Alexander" <alexander.usyskin@intel.com>, "Winkler, Tomas"
 <tomas.winkler@intel.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Lubart, Vitaly" <vitaly.lubart@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>
Subject: Re: [PATCH 00/10] drm/i915/spi: spi access for discrete graphics
Message-ID: <20230927165350.470bea0f@xps-13>
In-Reply-To: <ZRQ+LzIoD+J0BzVp@finisterre.sirena.org.uk>
References: <CY5PR11MB63667FBB6AF5B4331419BDAAEDF1A@CY5PR11MB6366.namprd11.prod.outlook.com>
	<0d60a78b-0305-4cb3-babe-4eefe5001b29@sirena.org.uk>
	<CY5PR11MB63667AB9958A23970B4B0D3EEDF1A@CY5PR11MB6366.namprd11.prod.outlook.com>
	<20230912152102.0dfe7558@xps-13>
	<ee4a85be-aa87-4c40-916c-0a796688ad6f@sirena.org.uk>
	<CY5PR11MB6366427A8DD52D9B8B54F25DEDF9A@CY5PR11MB6366.namprd11.prod.outlook.com>
	<1b93fffe-5aac-42f3-9bbe-a307758673cf@sirena.org.uk>
	<MN2PR11MB40938110726F81D8CE305FB8E5F9A@MN2PR11MB4093.namprd11.prod.outlook.com>
	<0682443d-5219-4aa2-a932-ee3e04c0760e@sirena.org.uk>
	<CY5PR11MB63661B36FFAE9455504DACD6EDC2A@CY5PR11MB6366.namprd11.prod.outlook.com>
	<ZRQ+LzIoD+J0BzVp@finisterre.sirena.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_075455_807606_CA9E427E 
X-CRM114-Status: GOOD (  15.77  )
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

SGkgTWFyaywKCmJyb29uaWVAa2VybmVsLm9yZyB3cm90ZSBvbiBXZWQsIDI3IFNlcCAyMDIzIDE2
OjM3OjM1ICswMjAwOgoKPiBPbiBXZWQsIFNlcCAyNywgMjAyMyBhdCAwMjoxMTo0N1BNICswMDAw
LCBVc3lza2luLCBBbGV4YW5kZXIgd3JvdGU6Cj4gCj4gPiBUaGVyZSBpcyBhIERpc2NyZWV0IEdy
YXBoaWMgZGV2aWNlIHdpdGggZW1iZWRkZWQgU1BJIChjb250cm9sbGVyICYgZmxhc2gpLgo+ID4g
VGhlIGVtYmVkZGVkIFNQSSBpcyBub3QgdmlzaWJsZSB0byBPUy4KPiA+IFRoZXJlIGlzIGFub3Ro
ZXIgSFcgaW4gdGhlIGNoaXAgdGhhdCBnYXRlcyBhY2Nlc3MgdG8gdGhlIGNvbnRyb2xsZXIgYW5k
Cj4gPiBleHBvc2VzIHJlZ2lzdGVycyBmb3I6Cj4gPiByZWdpb24gc2VsZWN0OyByZWFkIGFuZCB3
cml0ZSAoNCBhbmQgOCBieXRlcyk7IGVyYXNlICg0Syk7IGVycm9yIHJlZ2lzdGVyOyAgIAo+IAo+
IFNvIGFzc3VtaW5nIHRoYXQncyBmbGFzaCByZWdpb24gc2VsZWN0IGl0IHNvdW5kcyBsaWtlIHRo
aXMgaXMgYSBNVEQKPiBjb250cm9sbGVyIGFuZCB0aGUgZmFjdCB0aGF0IHRoZXJlJ3MgU1BJIGlz
bid0IHJlYWxseSByZWxldmFudCBhdCBhbGwKPiBmcm9tIGEgcHJvZ3JhbW1pbmcgbW9kZWwgcG9p
bnQgb2YgdmlldyBhbmQgaXQgc2hvdWxkIHByb2JhYmx5IGJlCj4gZGVzY3JpYmVkIGFzIGEgTVRE
IGNvbnRyb2xsZXIgb2Ygc29tZSBraW5kLiAgRG9lcyB0aGF0IHNvdW5kIGFib3V0Cj4gcmlnaHQ/
CgpZZWFoIGluIHRoaXMgY2FzZSBpdCBzZWVtcyB0aGUgYmVzdCBvcHRpb24gaWYgdGhlIE9TIG9u
bHkgaGFzIGFjY2VzcyB0bwphIHZlcnkgc21hbGwgc3Vic2V0IG9mIHdoYXQgdGhlIHNwaSBjb250
cm9sbGVyIGNhbiBkby4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
