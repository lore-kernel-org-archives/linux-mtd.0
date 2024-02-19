Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C971CC48BC3
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Feb 2024 09:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aiOdo4JicWhH/u4mtO+zIfv9lRMRZKUdyWITXNbvKag=; b=Y/MgcdRmja44dA
	250nklDBWj/w+OmySfWPgZQBPtrRnhijg+F1AeP6lP4cqkSuO1iAh+uglZChYyTHeH75ysT3RHF1c
	Weylv4/otfruMrSETI877btm/BIYNZbIQK4T3d3QM9H+J+4qUMav5U9lrPOhMh50L7nIBBnhJofkW
	2X9ar1wVe3a9RnQlHoltijJXXeTqMZ61NXh2qNGPdJWVzVCggt0O38ASLtwbaD3i06H2nFFjpq2ZF
	0nx25DsKqMOFDc4lQrK6yGHklX+lOQgGiNVSqB8FTaboYZTitT0ZYVEWjVHKcch8cZuGbw//nJ65M
	9K0746LjI4sA+BoijSyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzeY-00000009kJu-2x2b;
	Mon, 19 Feb 2024 09:09:34 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzeV-00000009kFR-1rkJ
	for linux-mtd@lists.infradead.org;
	Mon, 19 Feb 2024 09:09:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39FDD240012;
	Mon, 19 Feb 2024 09:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708333760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H8vWhExmV17xgBupKhlUpM5JsVzLtHrfZFnRIwxZZMw=;
	b=ZKwoH0udRomK3OIA/PKL3qQfxaieAKjDxWRt3K7eg7fBWc+ApQu62ioIdky+i8DejUz0cz
	C9yNTyPskz8oJ4diNJGQ4gSn63C+kmXFAdg49pXmTmf1GTlIH7jpzRuEojPcY6xIcQZz1X
	1dp1uLQCLLXPqZH3XMAMo6TYDl6oW/kgsa1z7pgDHgiZzexiGUQ4B6qNGqWsDrqmhx+7B4
	DOGMFBeoRlmQbxKvxlrKuuRu0utt+SBNjbP3iPyUb6a5ivWycobTaXepaj02bhbklP3O/0
	we5hDXUX8pjx5eBDAuhOTAfi+MeeXBETTAz6/dqEB6U8URRqMQanGW60TKE0DQ==
Date: Mon, 19 Feb 2024 10:09:15 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Lubart, Vitaly" <vitaly.lubart@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Winkler, Tomas" <tomas.winkler@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, Michael Walle <michael@walle.cc>, Tudor Ambarus
 <tudor.ambarus@linaro.org>
Subject: Re: [PATCH 06/10] drm/i915/spi: spi register with mtd
Message-ID: <20240219100915.5a778fb9@xps-13>
In-Reply-To: <CY5PR11MB63660FF7942CA400439B76D8ED4E2@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20230910123949.1251964-1-alexander.usyskin@intel.com>
	<20230910123949.1251964-7-alexander.usyskin@intel.com>
	<20231016103939.67445bee@xps-13>
	<CY5PR11MB6366850CCE851BCA05A9DC2BEDD6A@CY5PR11MB6366.namprd11.prod.outlook.com>
	<20231017155544.6cceb6a6@xps-13>
	<CY5PR11MB63663DB0C17321A1A0C46FF3EDD6A@CY5PR11MB6366.namprd11.prod.outlook.com>
	<20231017164615.5b58fcc6@xps-13>
	<CY5PR11MB6366383C8C0DCA9B3D41BF63EDB2A@CY5PR11MB6366.namprd11.prod.outlook.com>
	<20231114101324.39569e96@xps-13>
	<CY5PR11MB63660FF7942CA400439B76D8ED4E2@CY5PR11MB6366.namprd11.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_010931_630575_B2E9BEA6 
X-CRM114-Status: GOOD (  10.88  )
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

SGkgQWxleGFuZGVyLAoKYWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29tIHdyb3RlIG9uIFdlZCwg
MTQgRmViIDIwMjQgMTI6MTY6MDAgKzAwMDA6Cgo+IEhpIE1pcXVlbAo+IAo+IEludGVsIEdmeCBp
biBpbmZpbml0ZSB3aXNkb20gZGVjaWRlZCB0byBjcmVhdGUgYW5vdGhlciBkcml2ZXIgLSBYZSBh
bmQKPiB0aGUgc3BpIGRyaXZlciBwYXJ0IG9mIHRoaXMgc2VyaWVzIHNob3VsZCBiZSBtb3ZlZCB0
byBzb21lIGNvbW1vbiBsb2NhdGlvbi4KPiBTaG91bGQgaXQgYmUgZHJpdmVycy9tdGQgb3IgZHJp
dmVycy9zcGksIG9yIHNvbWUgb3RoZXIgcGxhY2U/CgpJdCBwcm9iYWJseSBkZXBlbmRzIG9uIHRo
ZSBmcmFtZXdvcmsgdGhleSBkZWNpZGVkIHRvIHJlZ2lzdGVyIGludG8uIEknbQpzb3JyeSBidXQg
SSBpbnRlcmFjdGVkIGluIHRoaXMgdGhyZWFkIG1vcmUgdGhhbiAzIG1vbnRocyBhZ28sIEkgbm8K
bG9uZ2VyIHJlbWVtYmVyIG1vc3Qgb2YgdGhlIGRldGFpbHMuCgpJZiB0aGlzIGlzIGEgZHJpdmVy
IGZvciBhIHNwaSBjb250cm9sbGVyIChldmVuIGEgbGltaXRlZCBvbmUpIHRoZW4gaXQKc2hvdWxk
IGJlIGRyaXZlcnMvc3BpLyBJIGd1ZXNzLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
