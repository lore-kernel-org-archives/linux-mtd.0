Return-Path: <SRS0=HmSd=G7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB9DC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 08:55:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56B6664DBD
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 08:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56B6664DBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y6CiXHz9gD3GPrjLsBzExLTttpwlMElKgcM67zolXu4=; b=ohVDyAbkQtfujk6s5mv9550f5
	HP23ieceRrh+D8HP3ZSfuPmYVju0V22eTp0onibDypnwmQBpMiPs7xCQxjmTUjYtLUUGZG8M5WdNA
	0yCP0A3MUa15JR3e1WKT7XTSJEtCErkVDs9W4Fj6zMuZPKCmiXo8hDQPKtX6oGsL652Ularr0pTyi
	0QZ4g4qQKDYZ/eznXfovI0KY2hfqSAZbnUVcgciM8+EWSP6MpZN5GYv5kCWL55Tht443DIKg330h4
	8TgyfkJWqT8nIJoA0aqriYKgbplnBrEDfdWaAmCTTF6y9hCchV0B/IOS6bZ5jXASUyybxQzG7CTuU
	gpYt8zf5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l533q-00063C-MS; Thu, 28 Jan 2021 08:53:54 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l533m-00061R-N0
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2021 08:53:51 +0000
IronPort-SDR: Kqbcrd1nygvZxb6UMKIGtoFUjB/EBKLGzocmUwrgk0eu6SobTpoYlkY9wWwNKlzMebDEUGeA1Y
 Wk1us+K+DFnQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="159974058"
X-IronPort-AV: E=Sophos;i="5.79,381,1602572400"; d="scan'208";a="159974058"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2021 00:53:46 -0800
IronPort-SDR: pDiClYaI8TQxzAsxx3AhxaWV7WWLTfGrYaWK+wq7J6qie6/9ikS/ptPDrLLCgdgsdrvepVgB68
 dQSTyJWrZuVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,381,1602572400"; d="scan'208";a="410907392"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Jan 2021 00:53:46 -0800
Received: from lcsmsx603.ger.corp.intel.com (10.109.210.12) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 28 Jan 2021 00:53:45 -0800
Received: from hasmsx602.ger.corp.intel.com (10.184.107.142) by
 LCSMSX603.ger.corp.intel.com (10.109.210.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 28 Jan 2021 10:53:43 +0200
Received: from hasmsx602.ger.corp.intel.com ([10.184.107.142]) by
 HASMSX602.ger.corp.intel.com ([10.184.107.142]) with mapi id 15.01.1713.004;
 Thu, 28 Jan 2021 10:53:43 +0200
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: Richard Weinberger <richard@nod.at>
Subject: RE: [PATCH] mtd: use refcount to prevent corruption
Thread-Topic: [PATCH] mtd: use refcount to prevent corruption
Thread-Index: AQHW9OeD00Da249Jw0qJn6+VIZAeUao7z7AAgAAh5BBxoBSOfPxzntFAEGBJdu//fSiMQA==
Date: Thu, 28 Jan 2021 08:53:43 +0000
Message-ID: <f91d7eff1d764ba7b47f023bc0fafacb@intel.com>
References: <20210127200319.662842-1-tomas.winkler@intel.com>
 <9732911.325628.1611780400338.JavaMail.zimbra@nod.at>
 <c8d0f22c5fdf443cb8dda1f996b148d9@intel.com>
 <1776363776.325713.1611782270873.JavaMail.zimbra@nod.at>
 <a6cb6eb10bbb48989d3a9e087951e50e@intel.com>
 <1665542284.336646.1611820031174.JavaMail.zimbra@nod.at>
In-Reply-To: <1665542284.336646.1611820031174.JavaMail.zimbra@nod.at>
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
X-CRM114-CacheID: sfid-20210128_035350_896379_BFDE19B2 
X-CRM114-Status: GOOD (  23.31  )
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

DQoNCj4gVG9tYXMsDQo+IA0KPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tDQo+ID4+
ID4+IENhbiB5b3UgcGxlYXNlIGV4cGxhaW4gYSBsaXR0bGUgbW9yZSB3aGF0IGRldmljZXMgYXJl
IGludm9sdmVkPw0KPiA+PiA+PiBEb2VzIGl0IGltcGxlbWVudCBfZ2V0X2RldmljZSgpIGFuZCBf
cHV0X2RldmljZSgpPw0KPiA+PiA+IE5vIHRoaXMgaXMgbm90IGNvbm5lY3RlZCB0byB0aG9zZSBo
YW5kbGVycyBvZiB0aGUgdW5kZXJseWluZyBkZXZpY2UNCj4gPj4gPiBhbmQgdGhvc2Ugd29uJ3Qg
aGVscC4NCj4gPj4gPiBJIGhhdmUgYSBzcGkgZGV2aWNlIHByb3ZpZGVkIGJ5IE1GRCBmcmFtZXdv
cmsgc28gaXQgY2FuIGdvIGF3YXkgYW55dGltZS4NCj4gPj4NCj4gPj4gQ2FuIGl0IGdvIGF3YXkg
cGh5c2ljYWxseSBvciBqdXN0IGluIHNvZnR3YXJlPw0KPiA+IFNvZnR3YXJlLCBidXQgc2luY2Ug
dGhpcyBpcyBtZmQgaXQncyBiYXNpY2FsbHkgaG90cGx1Zy4gVGhlIGtlcm5lbCBpcw0KPiA+IGNy
YXNoaW5nIHdoZW4gSSBzaW11bGF0ZSBoYXJkd2FyZSBmYWlsdXJlLg0KPiA+Pg0KPiA+PiBVc3Vh
bGx5IHRoZSBwYXR0ZXJuIGlzIHRoYXQgeW91IG1ha2Ugc3VyZSBpbiB0aGUgZGV2aWNlIGRyaXZl
ciB0aGF0DQo+ID4+IG5vYm9keSBjYW4gb3JwaGFuIHRoZSBNVEQgd2hpbGUgaXQgaXMgaW4gdXNl
Lg0KPiA+PiBlLmcuIGRyaXZlcnMvbXRkL3ViaS9nbHVlYmkuYyBkb2VzIHNvLiBJbiBfZ2V0X2Rl
dmljZSgpIGl0IGdyYWJzIGENCj4gPj4gcmVmZXJlbmNlIG9uIHRoZSB1bmRlcmx5aW5nIFVCSSB2
b2x1bWUgdG8gbWFrZSBzdXJlIGl0IGNhbm5vdCBnbyBhd2F5DQo+ID4+IHdoaWxlIHRoZSBNVEQg
KG9uIHRvcCBvZiBVQkkpIGlzIGluIHVzZS4NCj4gPg0KPiA+IEkgY2FuIHRyeSB0aGF0IGlmIGl0
IGhlbHBzLCBiZWNhdXNlIHdlIGFyZSBzaW11bGF0aW5nIHBvc3NpYmxlIGxvd2VyDQo+ID4gbGV2
ZWwgY3Jhc2guDQo+ID4gSW4gYW4gY2FzZSBJIGJlbGlldmUgdGhhdCB0aGUgcHJvcGVyIHJlZmNv
dXRpbmcgaXMgbXVjaCBtb3JlIHJvYnVzdA0KPiA+IHNvbHV0aW9uLCB0aGFuIHRoZSBjdXJyZW50
IG9uZS4NCj4gPiBJJ2QgYXBwcmVjaWF0ZSBpZiBzb21lb25lIGNhbiByZXZpZXcgdGhlIGFjdHVh
bCBpbXBsZW1lbnRhdGlvbi4NCj4gDQo+IFRoaXMgaGFwcGVucyByaWdodCBub3csIEkgdHJ5IHRv
IHVuZGVyc3RhbmQgd2h5IGV4YWN0bHkgdGhlIGN1cnJlbnQgd2F5IGlzIG5vdA0KPiBnb29kIGlu
IGVub3VnaC4gOi0pDQo+IA0KPiBZb3VyIGFwcHJvYWNoIG1ha2VzIHN1cmUgdGhhdCB0aGUgTVRE
IGl0c2VsZiBkb2VzIG5vdCBnbyBhd2F5IHdoaWxlIGl0IGhhcw0KPiB1c2VycyBidXQgaG93IGRv
ZXMgdGhpcyBoZWxwIGluIHRoZSBjYXNlIHdoZXJlIHRoZSB1bmRlcmx5aW5nIE1GRCBqdXN0DQo+
IHZhbmlzaGVzPw0KPiBUaGUgTVREIGNhbiBiZSBpbiB1c2UgYW5kIHRoZSBNRkQgY2FuIGdvIGF3
YXkgd2hpbGUgZS5nLiBtdGRfcmVhZCgpIG9yIHN1Y2gNCj4gdGFrZXMgcGxhY2UuDQoNClJlYWQg
d2lsbCBmYWlsLCBidXQga2VybmVsIHdvbid0IGNyYXNoIG9uIGFjY2VzcyB0byBtZW1vcnkgdGhh
dCB3YXMgZnJlZWQuDQoNClRoYW5rcw0KVG9tYXMNCg0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
