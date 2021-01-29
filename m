Return-Path: <SRS0=IJeB=HA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 259F5C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Jan 2021 16:13:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBF2164DFA
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Jan 2021 16:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBF2164DFA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bUQinzhywJeTykm9fWWqWfSn6lIeCBJasx78SAMyIlQ=; b=rrXxqLeE2fe2aeYF0eBgaMzXO
	6OZGp3GGb3rSayiZwqboTqFK0JQ1Pu+DI5RM1UbGBFiN3n97j7D8DS9RwuUhoqs/74XjaTlMBejxg
	hTdZYgE96wCZrLt5IEEDMhy4Gw4K8u2Mgo23pxaFXtosU8F1Ox82aLNgC0gTSckvwFKy4b4R9Jr1f
	SR2B/2Zc3yghdFUms1+cOoadNv5pur0JS9lfJDA4UyNIylEmnyyry6wXVSm/orpryFSpjWsa8BC+Y
	Hpq2l8gzOeUKBa2OmOUFp4PG+Nt3gQ3LmFelehh4UYjbmYTgxDxOND/S/OPOubmfeZ4J64vEAmoXJ
	lOghCRlEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5WNb-0002y7-Af; Fri, 29 Jan 2021 16:12:15 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5WNZ-0002xI-3Q
 for linux-mtd@lists.infradead.org; Fri, 29 Jan 2021 16:12:14 +0000
IronPort-SDR: O38GkirGFpYRwDTRu0JyD4x47EgcNUppcTrIYS/qEjBQ9kNFe0KfvwTdGZQ2JHGqthZIAj8R1M
 ha2HHR3jIZlw==
X-IronPort-AV: E=McAfee;i="6000,8403,9878"; a="180519004"
X-IronPort-AV: E=Sophos;i="5.79,385,1602572400"; d="scan'208";a="180519004"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2021 08:12:08 -0800
IronPort-SDR: 82l5O6IjMmvb+PkwYGRblaWqqMcKwhPQdPvd2vF1kBV4FZ/KNALq/pCUIt4lhZu+xJ929kvr1y
 Qzir+xMEFJOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,385,1602572400"; d="scan'208";a="431074549"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga001.jf.intel.com with ESMTP; 29 Jan 2021 08:12:07 -0800
Received: from lcsmsx601.ger.corp.intel.com (10.109.210.10) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 29 Jan 2021 08:12:06 -0800
Received: from hasmsx602.ger.corp.intel.com (10.184.107.142) by
 LCSMSX601.ger.corp.intel.com (10.109.210.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 29 Jan 2021 18:12:05 +0200
Received: from hasmsx602.ger.corp.intel.com ([10.184.107.142]) by
 HASMSX602.ger.corp.intel.com ([10.184.107.142]) with mapi id 15.01.1713.004;
 Fri, 29 Jan 2021 18:12:04 +0200
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: Richard Weinberger <richard@nod.at>
Subject: RE: [PATCH] mtd: use refcount to prevent corruption
Thread-Topic: [PATCH] mtd: use refcount to prevent corruption
Thread-Index: AQHW9OeD00Da249Jw0qJn6+VIZAeUao7z7AAgAAh5BBxoBSOfPxzntFAEGBJdu//fSiMQP//4NkAAA+XK+AnHY02HSbvTBPA
Date: Fri, 29 Jan 2021 16:12:04 +0000
Message-ID: <1a420da9edf449dcbc38dc17505b0ad5@intel.com>
References: <20210127200319.662842-1-tomas.winkler@intel.com>
 <c8d0f22c5fdf443cb8dda1f996b148d9@intel.com>
 <1776363776.325713.1611782270873.JavaMail.zimbra@nod.at>
 <a6cb6eb10bbb48989d3a9e087951e50e@intel.com>
 <1665542284.336646.1611820031174.JavaMail.zimbra@nod.at>
 <f91d7eff1d764ba7b47f023bc0fafacb@intel.com> <20210128100032.5eb542c6@xps13>
 <10c2e98c393a486cab3bc953e9926e38@intel.com>
 <1363048722.339069.1611865409332.JavaMail.zimbra@nod.at>
In-Reply-To: <1363048722.339069.1611865409332.JavaMail.zimbra@nod.at>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.22.254.132]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_111213_332277_12149193 
X-CRM114-Status: GOOD (  23.29  )
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

PiANCj4gVG9tYXMsDQo+IA0KPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tDQo+ID4+
IEFzIFJpY2hhcmQgd2FzIHNheWluZywgd2UgYXJlIHJlYWxseSBvcGVuIHRvIGVuaGFuY2UgTVRE
IHJlZmNvdW50aW5nLg0KPiA+Pg0KPiA+PiBIb3dldmVyLCB0aGUgaXNzdWUgeW91IGFyZSBmYWNp
bmcgaXMsIElNSE8sIG5vdCByZWxhdGVkIHRvIE1URCBidXQgdG8gTUZELg0KPiA+PiBUaGVyZSBz
aG91bGQgYmUgYSB3YXkgdG8gYXZvaWQgTUZEIHRvIHZhbmlzaCBieSB0YWtpbmcgYSByZWZlcmVu
Y2Ugb2YNCj4gPj4gaXQgdGhyb3VnaCBtdGQtPl9nZXRfZGV2aWNlKCkuIEkgZG9uJ3QgdGhpbmsg
YWRkcmVzc2luZyB0aGUgY2FzZQ0KPiA+PiB3aGVyZSBNRkQgdmFuaXNoZXMgd2hpbGUgTVREIChh
cyBhIHVzZXIpIGlzIHN0aWxsIGFjdGl2ZSBpcyB0aGUgcmlnaHQNCj4gYXBwcm9hY2guDQo+ID4N
Cj4gPiBJIHRoaW5rIGl0IHdvbid0IHdvcmsgYmVjYXVzZSBNRkQgc3ViLWRyaXZlciByZW1vdmUo
KSBpcyBjYWxsZWQgICBhbmQgaXQgbXVzdA0KPiA+IHN1Y2NlZWQgYmVjYXVzZSB0aGUgbWFpbiBk
ZXZpY2UgIGlzIG5vdCBhY2Nlc3NpYmxlIHVubGlrZSBnbHVldWJpDQo+ID4gd2hpY2gganVzdCBy
ZXR1cm5zIC1FQlVTWS4NCj4gDQo+IFdlbGwsIHRoZSB0cmljayBpbiBnbHViaSAoYW5kIG90aGVy
IE1URHMgd2l0aCAiaG90cGx1ZyIgc3VwcG9ydCkgaXMgbm90IHRvIHJlamVjdA0KPiByZW1vdmFs
IG9mIHRoZSBzdWItZGV2aWNlLiAtPl9wdXRfZGV2aWNlKCkgaXMgb2YgcmV0dXJuIHR5cGUgdm9p
ZC4NCj4gVGhlIGtleSBpcyBncmFiYmluZyBhIHJlZmVyZW5jZSBvbiB0aGUgc3ViLWRldmljZSBp
biAtPl9nZXRfZGV2aWNlKCkgc3VjaCB0aGF0DQo+IHRoZSBsYXllciBiZWxvdyBkb2Vzbid0IGV2
ZW4gdHJ5IHRvIHJlbW92ZSB3aGlsZSB0aGUgTVREIGlzIGluIHVzZS4NCj4gDQo+ID4gc28gd2Ug
cG9zdHBvbmUgdGhlIG10ZCB1bnJlZ2lzdGVyIHRvICBtdGRfaW5mby0+X3B1dF9kZXZpY2UoKSAg
YnV0IGl0DQo+ID4gdGhhdCBzdGF0ZSB3ZSBoYXZlIG5vdGhpbmcgdG8gaG9sZCBvbiBhcyB0aGUg
ZGV2aWNlIGlzIGdvbmUgaW4NCj4gPiByZW1vdmUoKSBVc2VyIHdpbGwgZmFpbCBhbnl3YXksIGFz
IHRoZSB1bmRlcmx5aW5nIGRldmljZSBpcyBub3QNCj4gPiBmdW5jdGlvbmFsIGluIHRoYXQgc3Rh
dGUuDQo+ID4gQW55d2F5IEkndmUgdHJpZWQgeW91ciBzdWdnZXN0aW9uLCB0aGUga2VybmVsIGlz
IGNyYXNoaW5nLCBob3BlIEkNCj4gPiBoYXZlbid0IGRvbmUgc29tZSBzaWxseSBidWcuDQo+IA0K
PiBDYW4geW91IHBvaW50IHVzIHRvIHRoZSBhZmZlY3RlZCBjb2RlPw0KPiBUaGlzIHdvdWxkIGhl
bHAgYSBsb3QgdG8gdW5kZXJzdGFuZCB0aGUgaXNzdWUgYmV0dGVyLg0KQmVsb3cgaXMgYXBwcm94
aW1hdGVseSB0aGUgc25pcHBldCANCg0KPiBJJ20gc3VyZSB3ZSBjYW4gZmluZCBhIHNvbHV0aW9u
Lg0KT2theSB0aG91Z2ggIEkndmUgYWxyZWFkeSBmb3VuZCBhIHdvcmtpbmcgc29sdXRpb24uIA0K
DQpzdHJ1Y3QgbXlfc3BpIHsNCiAgICAgICAgc3RydWN0IG10ZF9pbmZvIG10ZDsNCiAgICAgICAg
c3RydWN0IGtyZWYgcmVmY250Ow0KICAgICAgICBib29sIGluaXQ7DQp9Ow0KDQpzdGF0aWMgaW50
IG15X3NwaV9nZXRfbXRkKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQ0Kew0KICAgICAgICBzdHJ1Y3Qg
bXlfc3BpICpzcGkgPSBjb250YWluZXJfb2YobXRkLCBzdHJ1Y3QgbXlfc3BpLCBtdGQpOw0KDQog
ICAgICAgIGlmICghc3BpLT5pbml0KQ0KICAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOw0K
DQogICAgICAgIGtyZWZfZ2V0KCZzcGktPnJlZmNudCk7DQoNCiAgICAgICAgc3BpLT5pbml0ID0g
dHJ1ZTsNCg0KICAgICAgICByZXR1cm4gMDsNCn0NCg0Kc3RhdGljIHZvaWQgbXlfc3BpX3VucmVn
aXN0ZXJfbXRkKHN0cnVjdCBrcmVmICprcmVmKQ0Kew0KICAgICAgICBzdHJ1Y3QgbXlfc3BpICpz
cGkgPSBjb250YWluZXJfb2Yoa3JlZiwgc3RydWN0IG15X3NwaSwgcmVmY250KTsNCg0KICAgICAg
ICBtdGRfZGV2aWNlX3VucmVnaXN0ZXIoJnNwaS0+bXRkKTsNCiAgICAgICAga2ZyZWUoc3BpKTsN
Cn0NCg0Kc3RhdGljIGludCBteV9zcGlfcHV0X210ZChzdHJ1Y3QgbXRkX2luZm8gKm10ZCkNCnsN
CiAgICAgICAgc3RydWN0IG15X3NwaSAqc3BpID0gY29udGFpbmVyX29mKG10ZCwgc3RydWN0IG15
X3NwaSwgbXRkKTsNCg0KICAgICAgICBrcmVmX3B1dCgmc3BpLT5yZWZjbnQsIG15X3NwaV91bnJl
Z2lzdGVyX210ZCk7DQoNCiAgICAgICAgcmV0dXJuIDA7DQp9DQoNCnN0YXRpYyBpbnQgbXlfc3Bp
X2luaXRfbXRkKHN0YXRpYyBteV9zcGkgKnNwaSkNCnsNCiAgICAgICAgLi4uDQogICAgICAgIHNw
aS0+bXRkLl9nZXRfZGV2aWNlID0gbXlfc3BpX2dldF9tdGQ7DQogICAgICAgIHNwaS0+bXRkLl9n
ZXRfZGV2aWNlID0gbXlfc3BpX3B1dF9tdGQ7DQogICAgICAgIGtyZWZfaW5pdCgmc3BpLT5yZWZj
bnQpOw0KICAgICAgICAuLi4NCn0NCg0Kc3RhdGljIGludCBteV9zcGlfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGxhdGRldikNCnsNCiAgICAgICAgLi4uDQogICAgICAgIHNwaSA9IGt6
YWxsb2Moc2l6ZSwgR0ZQX0tFUk5FTCk7DQogICAgICAgIHNwaS0+aW5pdCA9IHRydWU7DQogICAg
ICAgIG15X3NwaV9pbml0X210ZChzcGkpOw0KICAgICAgICBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShw
bGF0ZGV2LCBzcGkpOw0KICAgICAgICAuLi4NCiAgICAgICAgcmV0dXJuIDA7DQp9DQoNCg0Kc3Rh
dGljIGludCBteV9zcGlfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBsYXRkZXYpDQp7
DQogICAgICAgIHN0cnVjdCBteV9zcGkgKnNwaSA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBsYXRk
ZXYpOw0KICAgICAgICBzcGktPmluaXQgPSBmYWxzZTsNCiAgICAgICAgbXlfc3BpX3B1dF9tdGQo
JnNwaS0+bXRkKTsNCiAgICAgICAgcGxhdGZvcm1fc2V0X2RydmRhdGEocGxhdGRldiwgTlVMTCk7
DQp9DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
