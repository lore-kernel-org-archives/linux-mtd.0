Return-Path: <SRS0=HmSd=G7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A771C433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 17:59:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB56964E27
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 17:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB56964E27
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9seUaWgAkaHS84v6InMn8c8/yJAvBfUMszPTDOjxaqg=; b=H1sG6EjTxIhI1itgOkvP8t9MP
	Iry6ZooKFvGcdzvQmxWKBHXKAINVZglML4hbjN3X4xhY2fStUDeWKm58yfu49+63G3EWId68Kz81P
	xDJxSGR3BT/sm+XLZOm/3uc0ldFRZIVh0CDkZ9BE+Ourltac7A4q6ChA+SM4ZC/ONHKQ/F1KfVS1i
	J2v/kfiSMrVvm4XaPJs8Aeaie+1tzWeCQJSprcEZSyGl63blZnk7lhmACcDypKMhbFmpjlQrFNTA5
	iVDKAx0viNacqQZ5pZZ1iYOY7QUZ/jzqugN7cxPIyDCimujSXr0TzcyYWpFvjAaDau79eh2vUyFcB
	IqhvcBGag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5BYO-0006cu-Ve; Thu, 28 Jan 2021 17:58:01 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5BYL-0006cL-Tx
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2021 17:57:59 +0000
IronPort-SDR: ykl6iOuidl0ij0tmkdOJzB+PiXQC8/P+Lxr8TvKjphext0/Lf15VKbyPbVID/a9L9FnajDmvEa
 +G4ErVQEcZPA==
X-IronPort-AV: E=McAfee;i="6000,8403,9878"; a="265113901"
X-IronPort-AV: E=Sophos;i="5.79,383,1602572400"; d="scan'208";a="265113901"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2021 09:57:53 -0800
IronPort-SDR: DjuDc+ED+B7u05IN5Yc8E9sNgLGhr+YLu6AmqfYCJY4KplT658lVrOiGkjfWh6YIqqweS5jg2v
 MVKnFxPKdaMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,383,1602572400"; d="scan'208";a="363892443"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 28 Jan 2021 09:57:53 -0800
Received: from lcsmsx603.ger.corp.intel.com (10.109.210.12) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 28 Jan 2021 09:57:52 -0800
Received: from hasmsx602.ger.corp.intel.com (10.184.107.142) by
 LCSMSX603.ger.corp.intel.com (10.109.210.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 28 Jan 2021 19:57:50 +0200
Received: from hasmsx602.ger.corp.intel.com ([10.184.107.142]) by
 HASMSX602.ger.corp.intel.com ([10.184.107.142]) with mapi id 15.01.1713.004;
 Thu, 28 Jan 2021 19:57:50 +0200
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: RE: [PATCH] mtd: use refcount to prevent corruption
Thread-Topic: [PATCH] mtd: use refcount to prevent corruption
Thread-Index: AQHW9OeD00Da249Jw0qJn6+VIZAeUao7z7AAgAAh5BBxoBSOfPxzntFAEGBJdu//fSiMQP//4NkAAA+XK+A=
Date: Thu, 28 Jan 2021 17:57:50 +0000
Message-ID: <10c2e98c393a486cab3bc953e9926e38@intel.com>
References: <20210127200319.662842-1-tomas.winkler@intel.com>
 <9732911.325628.1611780400338.JavaMail.zimbra@nod.at>
 <c8d0f22c5fdf443cb8dda1f996b148d9@intel.com>
 <1776363776.325713.1611782270873.JavaMail.zimbra@nod.at>
 <a6cb6eb10bbb48989d3a9e087951e50e@intel.com>
 <1665542284.336646.1611820031174.JavaMail.zimbra@nod.at>
 <f91d7eff1d764ba7b47f023bc0fafacb@intel.com> <20210128100032.5eb542c6@xps13>
In-Reply-To: <20210128100032.5eb542c6@xps13>
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
X-CRM114-CacheID: sfid-20210128_125758_132782_2DB58C6C 
X-CRM114-Status: GOOD (  30.96  )
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
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

PiBIaSBUb21hcywNCj4gDQo+ICJXaW5rbGVyLCBUb21hcyIgPHRvbWFzLndpbmtsZXJAaW50ZWwu
Y29tPiB3cm90ZSBvbiBUaHUsIDI4IEphbiAyMDIxDQo+IDA4OjUzOjQzICswMDAwOg0KPiANCj4g
PiA+IFRvbWFzLA0KPiA+ID4NCj4gPiA+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0N
Cj4gPiA+ID4+ID4+IENhbiB5b3UgcGxlYXNlIGV4cGxhaW4gYSBsaXR0bGUgbW9yZSB3aGF0IGRl
dmljZXMgYXJlIGludm9sdmVkPw0KPiA+ID4gPj4gPj4gRG9lcyBpdCBpbXBsZW1lbnQgX2dldF9k
ZXZpY2UoKSBhbmQgX3B1dF9kZXZpY2UoKT8NCj4gPiA+ID4+ID4gTm8gdGhpcyBpcyBub3QgY29u
bmVjdGVkIHRvIHRob3NlIGhhbmRsZXJzIG9mIHRoZSB1bmRlcmx5aW5nDQo+ID4gPiA+PiA+IGRl
dmljZSBhbmQgdGhvc2Ugd29uJ3QgaGVscC4NCj4gPiA+ID4+ID4gSSBoYXZlIGEgc3BpIGRldmlj
ZSBwcm92aWRlZCBieSBNRkQgZnJhbWV3b3JrIHNvIGl0IGNhbiBnbyBhd2F5DQo+IGFueXRpbWUu
DQo+ID4gPiA+Pg0KPiA+ID4gPj4gQ2FuIGl0IGdvIGF3YXkgcGh5c2ljYWxseSBvciBqdXN0IGlu
IHNvZnR3YXJlPw0KPiA+ID4gPiBTb2Z0d2FyZSwgYnV0IHNpbmNlIHRoaXMgaXMgbWZkIGl0J3Mg
YmFzaWNhbGx5IGhvdHBsdWcuIFRoZSBrZXJuZWwNCj4gPiA+ID4gaXMgY3Jhc2hpbmcgd2hlbiBJ
IHNpbXVsYXRlIGhhcmR3YXJlIGZhaWx1cmUuDQo+ID4gPiA+Pg0KPiA+ID4gPj4gVXN1YWxseSB0
aGUgcGF0dGVybiBpcyB0aGF0IHlvdSBtYWtlIHN1cmUgaW4gdGhlIGRldmljZSBkcml2ZXINCj4g
PiA+ID4+IHRoYXQgbm9ib2R5IGNhbiBvcnBoYW4gdGhlIE1URCB3aGlsZSBpdCBpcyBpbiB1c2Uu
DQo+ID4gPiA+PiBlLmcuIGRyaXZlcnMvbXRkL3ViaS9nbHVlYmkuYyBkb2VzIHNvLiBJbiBfZ2V0
X2RldmljZSgpIGl0IGdyYWJzDQo+ID4gPiA+PiBhIHJlZmVyZW5jZSBvbiB0aGUgdW5kZXJseWlu
ZyBVQkkgdm9sdW1lIHRvIG1ha2Ugc3VyZSBpdCBjYW5ub3QNCj4gPiA+ID4+IGdvIGF3YXkgd2hp
bGUgdGhlIE1URCAob24gdG9wIG9mIFVCSSkgaXMgaW4gdXNlLg0KPiA+ID4gPg0KPiA+ID4gPiBJ
IGNhbiB0cnkgdGhhdCBpZiBpdCBoZWxwcywgYmVjYXVzZSB3ZSBhcmUgc2ltdWxhdGluZyBwb3Nz
aWJsZQ0KPiA+ID4gPiBsb3dlciBsZXZlbCBjcmFzaC4NCj4gPiA+ID4gSW4gYW4gY2FzZSBJIGJl
bGlldmUgdGhhdCB0aGUgcHJvcGVyIHJlZmNvdXRpbmcgaXMgbXVjaCBtb3JlDQo+ID4gPiA+IHJv
YnVzdCBzb2x1dGlvbiwgdGhhbiB0aGUgY3VycmVudCBvbmUuDQo+ID4gPiA+IEknZCBhcHByZWNp
YXRlIGlmIHNvbWVvbmUgY2FuIHJldmlldyB0aGUgYWN0dWFsIGltcGxlbWVudGF0aW9uLg0KPiA+
ID4NCj4gPiA+IFRoaXMgaGFwcGVucyByaWdodCBub3csIEkgdHJ5IHRvIHVuZGVyc3RhbmQgd2h5
IGV4YWN0bHkgdGhlIGN1cnJlbnQNCj4gPiA+IHdheSBpcyBub3QgZ29vZCBpbiBlbm91Z2guIDot
KQ0KPiA+ID4NCj4gPiA+IFlvdXIgYXBwcm9hY2ggbWFrZXMgc3VyZSB0aGF0IHRoZSBNVEQgaXRz
ZWxmIGRvZXMgbm90IGdvIGF3YXkgd2hpbGUNCj4gPiA+IGl0IGhhcyB1c2VycyBidXQgaG93IGRv
ZXMgdGhpcyBoZWxwIGluIHRoZSBjYXNlIHdoZXJlIHRoZSB1bmRlcmx5aW5nDQo+ID4gPiBNRkQg
anVzdCB2YW5pc2hlcz8NCj4gPiA+IFRoZSBNVEQgY2FuIGJlIGluIHVzZSBhbmQgdGhlIE1GRCBj
YW4gZ28gYXdheSB3aGlsZSBlLmcuIG10ZF9yZWFkKCkNCj4gPiA+IG9yIHN1Y2ggdGFrZXMgcGxh
Y2UuDQo+ID4NCj4gPiBSZWFkIHdpbGwgZmFpbCwgYnV0IGtlcm5lbCB3b24ndCBjcmFzaCBvbiBh
Y2Nlc3MgdG8gbWVtb3J5IHRoYXQgd2FzIGZyZWVkLg0KPiANCj4gQXMgUmljaGFyZCB3YXMgc2F5
aW5nLCB3ZSBhcmUgcmVhbGx5IG9wZW4gdG8gZW5oYW5jZSBNVEQgcmVmY291bnRpbmcuDQo+IA0K
PiBIb3dldmVyLCB0aGUgaXNzdWUgeW91IGFyZSBmYWNpbmcgaXMsIElNSE8sIG5vdCByZWxhdGVk
IHRvIE1URCBidXQgdG8gTUZELg0KPiBUaGVyZSBzaG91bGQgYmUgYSB3YXkgdG8gYXZvaWQgTUZE
IHRvIHZhbmlzaCBieSB0YWtpbmcgYSByZWZlcmVuY2Ugb2YgaXQNCj4gdGhyb3VnaCBtdGQtPl9n
ZXRfZGV2aWNlKCkuIEkgZG9uJ3QgdGhpbmsgYWRkcmVzc2luZyB0aGUgY2FzZSB3aGVyZSBNRkQN
Cj4gdmFuaXNoZXMgd2hpbGUgTVREIChhcyBhIHVzZXIpIGlzIHN0aWxsIGFjdGl2ZSBpcyB0aGUg
cmlnaHQgYXBwcm9hY2guDQoNCkkgdGhpbmsgaXQgd29uJ3Qgd29yayBiZWNhdXNlIE1GRCBzdWIt
ZHJpdmVyIHJlbW92ZSgpIGlzIGNhbGxlZCAgIGFuZCBpdCBtdXN0IHN1Y2NlZWQgYmVjYXVzZSB0
aGUgbWFpbiBkZXZpY2UgIGlzIG5vdCBhY2Nlc3NpYmxlIHVubGlrZSBnbHVldWJpIHdoaWNoIGp1
c3QgcmV0dXJucyAtRUJVU1kuDQpzbyB3ZSBwb3N0cG9uZSB0aGUgbXRkIHVucmVnaXN0ZXIgdG8g
IG10ZF9pbmZvLT5fcHV0X2RldmljZSgpICBidXQgaXQgdGhhdCBzdGF0ZSB3ZSBoYXZlIG5vdGhp
bmcgdG8gaG9sZA0Kb24gYXMgdGhlIGRldmljZSBpcyBnb25lIGluIHJlbW92ZSgpDQpVc2VyIHdp
bGwgZmFpbCBhbnl3YXksIGFzIHRoZSB1bmRlcmx5aW5nIGRldmljZSBpcyBub3QgZnVuY3Rpb25h
bCBpbiB0aGF0IHN0YXRlLg0KQW55d2F5IEkndmUgdHJpZWQgeW91ciBzdWdnZXN0aW9uLCB0aGUg
a2VybmVsIGlzIGNyYXNoaW5nLCBob3BlIEkgaGF2ZW4ndCBkb25lIHNvbWUgc2lsbHkgYnVnLg0K
DQpUaGFua3MNClRvbWFzDQoNCg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
