Return-Path: <SRS0=n0JE=H6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F54C433E0
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Feb 2021 06:54:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 109D064E21
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Feb 2021 06:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 109D064E21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7Vo+r642xRqrDDFA0D0/0IEjn8RBQUhJemMzMkF2YKI=; b=yYlVq1E7rDCR9geFijiVmJ7Du
	bFx4r1IZFiLimfOlUJwt4oI07Vf9qoQtm2GLiYJDbRMN0UgAc2Qdva1f3GAEXnFEQTm/yzS1Zv7Ki
	PuHAlWXau2C0SvG9PW66RB2QqTbyQv4nvioGDIo3yqSyt9+F+MOn8jdIvzuZk8/pD1G5XIjLsgfOZ
	7V+2WZkGT2DSd7GSI1kxSLGDgJWHZZXMIlNmFxQC0wEmZb762dadD3O0kcH6Per3HabMtY/vov9nE
	sXb21g225NdGSI0e84SEnruqp4g2IKTjVC9LIt6zfBvHJgeBdZF1XUaohAM1pKXhsZ8/JE0jCS+sQ
	qzHZj/ZQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGFwm-00076h-Km; Sun, 28 Feb 2021 06:52:56 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGFwj-00076D-QT
 for linux-mtd@lists.infradead.org; Sun, 28 Feb 2021 06:52:55 +0000
IronPort-SDR: P3uWTcR+v617bBCran1OFgF/UhuYsnoIZoHZZp7e9HcfJACiaFWOZ/ZrdDudX3UGtmWjk6umqH
 Jhn3vZfan+bQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9908"; a="182802942"
X-IronPort-AV: E=Sophos;i="5.81,211,1610438400"; d="scan'208";a="182802942"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2021 22:52:41 -0800
IronPort-SDR: dSFnjs26IhQyDFwh1nyrxPhP0A7u5k/R5AavrnvzJOcCUNRTD25OMSO1vA+H8+Zi9qgJPZm0RK
 q8b2OdLj2ihg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,211,1610438400"; d="scan'208";a="405672303"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 27 Feb 2021 22:52:41 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sat, 27 Feb 2021 22:52:40 -0800
Received: from hasmsx602.ger.corp.intel.com (10.184.107.142) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sat, 27 Feb 2021 22:52:39 -0800
Received: from hasmsx602.ger.corp.intel.com ([10.184.107.142]) by
 HASMSX602.ger.corp.intel.com ([10.184.107.142]) with mapi id 15.01.2106.002;
 Sun, 28 Feb 2021 08:52:37 +0200
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: Richard Weinberger <richard@nod.at>
Subject: RE: [RFC PATCH 0/9] drm/i915/spi: discrete graphics internal spi
Thread-Topic: [RFC PATCH 0/9] drm/i915/spi: discrete graphics internal spi
Thread-Index: AQHXBJBTlGMG4b5GwU+w3NO1EU5QQapbRLqAgAC+HMCABjNiUB7bF+50/ww+PVCAB+VEwA==
Date: Sun, 28 Feb 2021 06:52:37 +0000
Message-ID: <98093c00e7df45298c0ae0a7f27628db@intel.com>
References: <20210216181925.650082-1-tomas.winkler@intel.com>
 <CAFLxGvwP5-O5DHQ07Fs_GnG12dsK24mer8LJfhz2z2UqW9e5cQ@mail.gmail.com>
 <cb20e706d494458a8957252eeacfb1da@intel.com>
 <7601e7f0024c41fb9b454a3c50b02173@intel.com>
 <1279191970.19051.1614033504390.JavaMail.zimbra@nod.at>
 <d2636c94015d40c199616947907b7148@intel.com>
In-Reply-To: <d2636c94015d40c199616947907b7148@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.184.70.1]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210228_015254_312284_251B2E27 
X-CRM114-Status: GOOD (  15.76  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Lubart, Vitaly" <vitaly.lubart@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

PiANCj4gDQo+ID4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQ0KPiA+ID4+ID4gSSdt
IG5vdCBzdXJlIHdoZXRoZXIgd2Ugd2FudCB0byB0YWtlIHRoYXQgcGF0aC4NCj4gPiA+DQo+ID4g
PiBIaSBSaWNoYXJkIGlzIHRoZXJlIGFueSB3YXkgd2UgY2FuIHRyeSB0byB1bmNsdXR0ZXIgdGhp
cyA/DQo+ID4NCj4gPiBPZiBjb3Vyc2UgdGhlcmUgaXMgYSB3YXkuIDotKQ0KPiA+IFlvdXIgdXNl
LWNhc2UgcmVhbGx5IHNlZW1zIHRvIGJlIHNwZWNpYWwgYW5kIE1URCBuZWVkcyBhbiBpbXByb3Zl
bWVudC4NCj4gPiBNaXF1ZWwsIFZpZ25lc2ggYW5kIEkganVzdCBuZWVkIHRvIGNoZWNrIG1vcmUg
aW50ZXJuYWxzIGFuZCBjb3JuZXINCj4gPiBjYXNlcyBpbiBNVEQuDQo+ID4gV2l0aCBzb21lIGx1
Y2sgeW91ciBwYXRjaCBjYW4gYmUgdXNlZCBhcy1pcyB3aXRoIHNvbWUgbWlub3INCj4gPiBhZGp1
c3RtZW50cyBvbiB0b3AuDQo+IEdyZWF0LCB3YWl0aW5nIGZvciB5b3VyIGNvbW1lbnRzLg0KDQpI
aSwgIEkgd291bGQgbGlrZSB0byBzZW5kIG91dCB0aGUgc2Vjb25kIHZlcnNpb24gb2YgdGhlIHNl
cmllcy4gDQpQbGVhc2UgaWYgeW91IGhhdmUgYW55IGNvbW1lbnRzIGxldCBtZSBrbm93Lg0KDQpU
aGFua3MNClRvbWFzDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
