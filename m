Return-Path: <SRS0=z1Oh=HZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE48C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 06:34:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 343AF64E58
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 06:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 343AF64E58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r6Mcfzf2AbMlrDdfdnCIE4Lw6ZX/8iiWltvPGzGgxBE=; b=vQi0FSMexhRLwJYEJcfyPbc9t
	VIkCN+yIfyOZJAPjVtVc0msGyU7aesVauHEbE2VemktrqcToC65lXoDClCeM6GVfflP1/LAHJdIGX
	lcUwGiCyPlC/54uvksJTD0C1FsJJ43Q/QYxPRy1f/sUw+taABOKq0xLNaOgsD5V9pPR2WMulK1loF
	qVTn8pGe+fMwUVnMjGBhcM6mD6MI87PjdvOpAMHvN8Zoh3CBgo7Ko3V2KkJTFwyaeIcXiyCsTU6gI
	Ar1DOuAsOLIs8QlKTLndwNgtTzJwiHp3lsF7eIxdHJQIjwZYv57tW7PDnjJsp61qrokhlCBz1o51f
	QbRtLhutw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lERGW-0000z8-Ms; Tue, 23 Feb 2021 06:33:48 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lERGT-0000yZ-Iv
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2021 06:33:46 +0000
IronPort-SDR: yS1AsNHucx3/h+cgZoFKMDpXTJVacKzXrDFeuqeXXQxk7nHx3LOEqmw2xvI3rVVWl/EOz6+8as
 5U6WO8RSkv3Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="184760293"
X-IronPort-AV: E=Sophos;i="5.81,199,1610438400"; d="scan'208";a="184760293"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 22:33:40 -0800
IronPort-SDR: d9tQ1Rtb4OU8McH6/Puc00hzZpIo+f3SvO+OVaQejrxjQ4//36H9uqKWxA54O1axzJMrMf0Lom
 4goeSuqExdLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,199,1610438400"; d="scan'208";a="441639887"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 22 Feb 2021 22:33:12 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Feb 2021 22:31:23 -0800
Received: from hasmsx602.ger.corp.intel.com (10.184.107.142) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Feb 2021 22:31:22 -0800
Received: from hasmsx602.ger.corp.intel.com ([10.184.107.142]) by
 HASMSX602.ger.corp.intel.com ([10.184.107.142]) with mapi id 15.01.2106.002;
 Tue, 23 Feb 2021 08:31:20 +0200
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: Richard Weinberger <richard@nod.at>
Subject: RE: [RFC PATCH 0/9] drm/i915/spi: discrete graphics internal spi
Thread-Topic: [RFC PATCH 0/9] drm/i915/spi: discrete graphics internal spi
Thread-Index: AQHXBJBTlGMG4b5GwU+w3NO1EU5QQapbRLqAgAC+HMCABjNiUB7bF+50/ww+PVA=
Date: Tue, 23 Feb 2021 06:31:20 +0000
Message-ID: <d2636c94015d40c199616947907b7148@intel.com>
References: <20210216181925.650082-1-tomas.winkler@intel.com>
 <CAFLxGvwP5-O5DHQ07Fs_GnG12dsK24mer8LJfhz2z2UqW9e5cQ@mail.gmail.com>
 <cb20e706d494458a8957252eeacfb1da@intel.com>
 <7601e7f0024c41fb9b454a3c50b02173@intel.com>
 <1279191970.19051.1614033504390.JavaMail.zimbra@nod.at>
In-Reply-To: <1279191970.19051.1614033504390.JavaMail.zimbra@nod.at>
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
X-CRM114-CacheID: sfid-20210223_013345_794485_6F13BFE7 
X-CRM114-Status: GOOD (  11.99  )
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

DQo+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0NCj4gPj4gPiBJJ20gbm90IHN1cmUg
d2hldGhlciB3ZSB3YW50IHRvIHRha2UgdGhhdCBwYXRoLg0KPiA+DQo+ID4gSGkgUmljaGFyZCBp
cyB0aGVyZSBhbnkgd2F5IHdlIGNhbiB0cnkgdG8gdW5jbHV0dGVyIHRoaXMgPw0KPiANCj4gT2Yg
Y291cnNlIHRoZXJlIGlzIGEgd2F5LiA6LSkNCj4gWW91ciB1c2UtY2FzZSByZWFsbHkgc2VlbXMg
dG8gYmUgc3BlY2lhbCBhbmQgTVREIG5lZWRzIGFuIGltcHJvdmVtZW50Lg0KPiBNaXF1ZWwsIFZp
Z25lc2ggYW5kIEkganVzdCBuZWVkIHRvIGNoZWNrIG1vcmUgaW50ZXJuYWxzIGFuZCBjb3JuZXIg
Y2FzZXMgaW4NCj4gTVRELg0KPiBXaXRoIHNvbWUgbHVjayB5b3VyIHBhdGNoIGNhbiBiZSB1c2Vk
IGFzLWlzIHdpdGggc29tZSBtaW5vciBhZGp1c3RtZW50cw0KPiBvbiB0b3AuDQpHcmVhdCwgd2Fp
dGluZyBmb3IgeW91ciBjb21tZW50cy4gDQpUaGFua3MNClRvbWFzDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
