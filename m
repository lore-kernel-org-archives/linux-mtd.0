Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C56C52D7C
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2024 08:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fs/A0i9j2GrAFMTVGdRoRNfT+rDM20I9OK3e+tBkbgM=; b=bOi0Tjh6rJjUve
	saSzkrq8ENf1W0BONg0ZY/r44Yf1Exicltb8/GyW1Vm0hPRfZBtjbENX78+gF6Ws/ydouYmHfP1OW
	3v7driB0mghnv9tnptvTCKEeY3H2QhyT9fA7PIcjSZgLwE5P4MkUSRwZBa4u3s0dIDXRMQnwl/jNL
	Q29jnz+jUScZ2x0/OV6FhL2FX/xIUtEWKepGF9OAhODwBSEjgWjX0fAFWfgIcwNkpDY5jUZjSt/0e
	jmW/7+JKz86zu/AOZv5ekzSN1AXa3ZwnIUrN1EkFgwJdIZvyNO5g91lLRNeT/cvsfcGkLfM8WaZ5Q
	R+jjbVVXGmrDKYMS7c/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdQbb-0000000HIqR-37mD;
	Mon, 12 Aug 2024 08:40:43 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdQay-0000000HIiv-3dKy;
	Mon, 12 Aug 2024 08:40:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F827FF80F;
	Mon, 12 Aug 2024 08:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723452001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jHAG+jr6VS671kkd3H78pc9Iro9nLTf+bq+1ySK8OnU=;
	b=Ne2p68+A/GgfP/80JnUELAHEfVOaVX9dUSegNx2U92Hm4Z+Z1tahbt/l3m/yDi/8Rg3yrX
	VPhiQlymu6tf5Dd62mTznTv+B41O9S6hXO3soybZzLuPwJ4avLyz0uieM4UcQ/O+XsXBDW
	29n/W0lXXeEP6UOG4OOrY/EoJ/lavU6/A3xZj/SvNZlHe2kGmzkKt7WvUu9C0vZwWi7mZJ
	SsBl6rAFh+4ke/YlSof6m/uMVG705rrGJidSAzD8lHx3VZJYI/1DsO/1Tel3tjlnVtyEtB
	cPR6vqhZKGqWUlu+ynuxR3hEd5mx9dPoGK7cwHxuIr8iqMJGW/9C1nblAWRxZw==
Date: Mon, 12 Aug 2024 10:39:57 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <michael@walle.cc>
Cc: "Michal Simek" <michal.simek@amd.com>, "Mahapatra, Amit Kumar"
 <amit.kumar-mahapatra@amd.com>, "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "pratyush@kernel.org"
 <pratyush@kernel.org>, "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com"
 <vigneshr@ti.com>, "sbinding@opensource.cirrus.com"
 <sbinding@opensource.cirrus.com>, "lee@kernel.org" <lee@kernel.org>,
 "james.schulman@cirrus.com" <james.schulman@cirrus.com>,
 "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "claudiu.beznea@tuxon.dev" <claudiu.beznea@tuxon.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "patches@opensource.cirrus.com"
 <patches@opensource.cirrus.com>, "linux-sound@vger.kernel.org"
 <linux-sound@vger.kernel.org>, "git (AMD-Xilinx)" <git@amd.com>,
 "amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>, "Conor Dooley"
 <conor.dooley@microchip.com>, "beanhuo@micron.com" <beanhuo@micron.com>
Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Message-ID: <20240812103957.04a1ef55@xps-13>
In-Reply-To: <D3DREP874QG7.2UOSZSBI3BRQY@walle.cc>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
	<BN7PR12MB28027E62D66460A374E3CFEADC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
	<e212f9fa-83c5-4b9e-8636-c8c6183096ab@linaro.org>
	<BN7PR12MB280237CDD7BB148479932874DC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
	<576d56ed-d24b-40f9-9ae4-a02c50eea2ab@linaro.org>
	<BN7PR12MB2802F288C6A6B1580CF07959DC95A@BN7PR12MB2802.namprd12.prod.outlook.com>
	<c6f209c8-47da-4881-921d-683464b9ddd5@linaro.org>
	<9cdb7f8b-e64f-46f6-94cb-194a25a42ccd@linaro.org>
	<BN7PR12MB28028B63E69134094D50F3E4DC2A2@BN7PR12MB2802.namprd12.prod.outlook.com>
	<IA0PR12MB769944254171C39FF4171B52DCB42@IA0PR12MB7699.namprd12.prod.outlook.com>
	<D2ZHJ765LUGP.2KTA46P1BL75X@walle.cc>
	<e1587f61-f765-4a22-b06e-71387cc49c4d@amd.com>
	<D33M26RLVLHF.3Q5YARPBNSBOY@walle.cc>
	<9fb60743-3e89-49fa-a399-3cf2607a7e41@amd.com>
	<D33S9T73M6ND.G7CCJ4PDVYQU@walle.cc>
	<20240812092937.2bd5c85a@xps-13>
	<D3DREP874QG7.2UOSZSBI3BRQY@walle.cc>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_014005_218569_1E3A8D33 
X-CRM114-Status: GOOD (  19.35  )
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

SGkgTWljaGFlbCwKCm1pY2hhZWxAd2FsbGUuY2Mgd3JvdGUgb24gTW9uLCAxMiBBdWcgMjAyNCAw
OTozNzowNiArMDIwMDoKCj4gSGksCj4gCj4gPiA+ID4gPiBUaGUgZmlyc3Qgcm91bmQgb2YgcGF0
Y2hlcyB3ZXJlIHJlYWxseSBpbnZhc2l2ZSByZWdhcmRpbmcgdGhlIGNvcmUKPiA+ID4gPiA+IGNv
ZGUuIFNvIGlmIHRoZXJlIGlzIGEgY2xlYW4gbGF5ZXJpbmcgYXBwcm9hY2ggd2hpY2ggY2FuIGJl
IGVuYWJsZWQKPiA+ID4gPiA+IGFzIGEgbW9kdWxlIGFuZCB5b3UgYXJlIG1haW50YWluaW5nIGl0
IEknbSBmaW5lIHdpdGggdGhhdCAoZXZlbiBpZgo+ID4gPiA+ID4gdGhlIGNvcmUgY29kZSBuZWVk
cyBzb21lIGNoYW5nZXMgdGhlbiBsaWtlIGhvb2tzIG9yIHNvLCBub3Qgc3VyZSkuICAgIAo+ID4g
PiA+Cj4gPiA+ID4gVGhhdCBkaXNjdXNzaW9uIHN0YXJ0ZWQgd2l0aCBNaXF1ZWwgc29tZSB5ZWFy
cyBhZ28gd2hlbiBoZSB3YXMgdHJ5aW5nIHRvIHRvIAo+ID4gPiA+IHNvbHZlIGRlc2NyaXB0aW9u
IGluIERUIHdoaWNoIGlzIG1lcmdlZCBmb3IgYSB3aGlsZSBpbiB0aGUga2VybmVsLiAgICAKPiA+
ID4gCj4gPiA+IFdoYXQncyB5b3VyIHBvaW50IGhlcmU/IEZyb20gd2hhdCBJIGNhbiB0ZWxsIHRo
ZSBEVCBiaW5kaW5nIGlzIHdyb25nCj4gPiA+IGFuZCBuZWVkcyB0byBiZSByZXdvcmtlZCBhbnl3
YXkuICAKPiA+Cj4gPiBJJ20gc29ycnkgSSdtIG5vdyBjYXRjaGluZyB1cCwgY2FuIHlvdSBwb2lu
dCBhdCB0aGUgdGhyZWFkIGV4cGxhaW5pbmcKPiA+IHdoYXQgaXMgd3JvbmcgaW4gdGhlIGJpbmRp
bmdzPyBJIGRpZG4ndCBmaW5kIHdoZXJlIHRoaXMgd2FzIGRldGFpbGVkLiBPcgo+ID4gb3RoZXJ3
aXNlIHN1bW1hcml6ZSBxdWlja2x5IHdoYXQgbmVlZHMgdG8gY2hhbmdlPyAgCj4gCj4gU29tZXdo
ZXJlIGluIHRoaXMgbWVnYSB0aHJlYWQgVHVkb3IgaGFkIHNvbWUgcmVtYXJrcyBhYm91dCB0aGUK
PiBiaW5kaW5ncy4gQW1pdCBhbHNvIG1lbnRpb25lZCBpdCBoZXJlOgo+IAo+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3IvSUEwUFIxMk1CNzY5OTQ0MjU0MTcxQzM5RkY0MTcxQjUyRENCNDJASUEw
UFIxMk1CNzY5OS5uYW1wcmQxMi5wcm9kLm91dGxvb2suY29tLwoKR3JlYXQuIEkganVtcGVkLWlu
IHRoZXJlLiBUaGFua3MhCgpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
