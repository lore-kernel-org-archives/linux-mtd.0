Return-Path: <SRS0=76BL=HP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3783C433E0
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Feb 2021 17:09:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68BF264DDE
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Feb 2021 17:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68BF264DDE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OTlHuynTnAiQXKHdZx6lgajQPCM3DfkKH2R5nyp1vIA=; b=FA4+B/3CePtpXeOdC6TwPT3zG
	NuJnVeGMONnqRJ1mhWhEZSqc6UtrsLPznaotXlOTzKFQWM47cTXKLXzWHfXiAYu3caccONe1JvzMG
	1DqfCx+uaH/bZHq8jfjqgKUdBVXzwvdt0F+AMmYvXJaKRWD5lJznBT0gqW/zjf1i63TQTV0O4rZON
	Ls3nUhvnJkCQAoZ3QY1M5Jyfh6Rt1e2A7KtEfZeL2PjMTDKmoOSoYub0axPyTaUhpJF9I9473FGw2
	WzHHdvDI/wMpp+IikPnkOSPXeNSF+fnkYdNYacwuylEGxb8Kl89kJpHolrs56ZWx3SUNYctCfv55d
	9GueTAfeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAyQ9-0007zC-3W; Sat, 13 Feb 2021 17:09:25 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAyQ6-0007yK-LS
 for linux-mtd@lists.infradead.org; Sat, 13 Feb 2021 17:09:23 +0000
IronPort-SDR: SNhw3uyWxO1X7TzMdrZXk4+RoTe/JCt8CH47qdmL4NNErxD2gB4PSRu/LRulPjHEey9YMpebJO
 ZtBxBCX68jUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9894"; a="201694174"
X-IronPort-AV: E=Sophos;i="5.81,176,1610438400"; d="scan'208";a="201694174"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2021 09:09:20 -0800
IronPort-SDR: zxeaR09jXell1e+x2UGPbnP4I9gr3xdCYoPW6FrRXaGwyPYSfVZkCxoCy/x+Rmc+/M5nGiwoxx
 0Lv+4396MH/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,176,1610438400"; d="scan'208";a="437984772"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga001.jf.intel.com with ESMTP; 13 Feb 2021 09:09:20 -0800
Received: from lcsmsx602.ger.corp.intel.com (10.109.210.11) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sat, 13 Feb 2021 09:09:19 -0800
Received: from hasmsx602.ger.corp.intel.com (10.184.107.142) by
 LCSMSX602.ger.corp.intel.com (10.109.210.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sat, 13 Feb 2021 19:09:17 +0200
Received: from hasmsx602.ger.corp.intel.com ([10.184.107.142]) by
 HASMSX602.ger.corp.intel.com ([10.184.107.142]) with mapi id 15.01.2106.002;
 Sat, 13 Feb 2021 19:09:17 +0200
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: Richard Weinberger <richard@nod.at>
Subject: RE: [PATCH] mtd: use refcount to prevent corruption
Thread-Topic: [PATCH] mtd: use refcount to prevent corruption
Thread-Index: AQHW9OeD00Da249Jw0qJn6+VIZAeUao7z7AAgAAh5BBxoBSOfPxzntFAEGBJdu//fSiMQP//4NkAAA+XK+AnHY02HSTJqnMg
Date: Sat, 13 Feb 2021 17:09:17 +0000
Message-ID: <783a45b0bc04483e9a0a6bb0a083bccb@intel.com>
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
x-originating-ip: [10.184.70.1]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210213_120922_885007_6CF08BCD 
X-CRM114-Status: GOOD (  23.83  )
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

DQo+IA0KPiBUb21hcywNCj4gDQo+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0NCj4g
Pj4gQXMgUmljaGFyZCB3YXMgc2F5aW5nLCB3ZSBhcmUgcmVhbGx5IG9wZW4gdG8gZW5oYW5jZSBN
VEQgcmVmY291bnRpbmcuDQo+ID4+DQo+ID4+IEhvd2V2ZXIsIHRoZSBpc3N1ZSB5b3UgYXJlIGZh
Y2luZyBpcywgSU1ITywgbm90IHJlbGF0ZWQgdG8gTVREIGJ1dCB0bw0KPiBNRkQuDQo+ID4+IFRo
ZXJlIHNob3VsZCBiZSBhIHdheSB0byBhdm9pZCBNRkQgdG8gdmFuaXNoIGJ5IHRha2luZyBhIHJl
ZmVyZW5jZSBvZg0KPiA+PiBpdCB0aHJvdWdoIG10ZC0+X2dldF9kZXZpY2UoKS4gSSBkb24ndCB0
aGluayBhZGRyZXNzaW5nIHRoZSBjYXNlDQo+ID4+IHdoZXJlIE1GRCB2YW5pc2hlcyB3aGlsZSBN
VEQgKGFzIGEgdXNlcikgaXMgc3RpbGwgYWN0aXZlIGlzIHRoZSByaWdodA0KPiBhcHByb2FjaC4N
Cj4gPg0KPiA+IEkgdGhpbmsgaXQgd29uJ3Qgd29yayBiZWNhdXNlIE1GRCBzdWItZHJpdmVyIHJl
bW92ZSgpIGlzIGNhbGxlZCAgIGFuZCBpdA0KPiBtdXN0DQo+ID4gc3VjY2VlZCBiZWNhdXNlIHRo
ZSBtYWluIGRldmljZSAgaXMgbm90IGFjY2Vzc2libGUgdW5saWtlIGdsdWV1YmkNCj4gPiB3aGlj
aCBqdXN0IHJldHVybnMgLUVCVVNZLg0KPiANCj4gV2VsbCwgdGhlIHRyaWNrIGluIGdsdWJpIChh
bmQgb3RoZXIgTVREcyB3aXRoICJob3RwbHVnIiBzdXBwb3J0KSBpcyBub3QgdG8NCj4gcmVqZWN0
IHJlbW92YWwgb2YgdGhlIHN1Yi1kZXZpY2UuIC0+X3B1dF9kZXZpY2UoKSBpcyBvZiByZXR1cm4g
dHlwZSB2b2lkLg0KPiBUaGUga2V5IGlzIGdyYWJiaW5nIGEgcmVmZXJlbmNlIG9uIHRoZSBzdWIt
ZGV2aWNlIGluIC0+X2dldF9kZXZpY2UoKSBzdWNoDQo+IHRoYXQgdGhlIGxheWVyIGJlbG93IGRv
ZXNuJ3QgZXZlbiB0cnkgdG8gcmVtb3ZlIHdoaWxlIHRoZSBNVEQgaXMgaW4gdXNlLg0KDQpJIHVu
ZGVyc3RhbmQgdGhhdC4gQnV0IGluIHRoYXQgY2FzZSB0aGUga2VybmVsIGlzIGluIHRoZSBtZXJj
eSBvZiB1c2VyIHNwYWNlIHRvIGNsb3NlIHRoZSBoYW5kbGUsICANCnRoZSB3aG9sZSBwZXJjZXB0
aW9uIGhlcmUgaXMgdGhhdCBvZiBob3RwbHVnIHRoYXQgdGhlIGRldmljZSBpcyAgcGh5c2ljYWxs
eSByZW1vdmVkIGl0IGNhbm5vdCB3YWl0IA0KZm9yIHRoZSB1c2VyIHNwYWNlIHRvIGNvbXBsZXRl
LiBXaGF0J3MgdGhlIGZpeCBpcyB0cnlpbmcgdG8gZG8gaXMgdG8gYmFpbCBvdXQgZ3JhY2VmdWxs
eS4NCg0KPiA+IHNvIHdlIHBvc3Rwb25lIHRoZSBtdGQgdW5yZWdpc3RlciB0byAgbXRkX2luZm8t
Pl9wdXRfZGV2aWNlKCkgIGJ1dCBpdA0KPiA+IHRoYXQgc3RhdGUgd2UgaGF2ZSBub3RoaW5nIHRv
IGhvbGQgb24gYXMgdGhlIGRldmljZSBpcyBnb25lIGluDQo+ID4gcmVtb3ZlKCkgVXNlciB3aWxs
IGZhaWwgYW55d2F5LCBhcyB0aGUgdW5kZXJseWluZyBkZXZpY2UgaXMgbm90DQo+ID4gZnVuY3Rp
b25hbCBpbiB0aGF0IHN0YXRlLg0KPiA+IEFueXdheSBJJ3ZlIHRyaWVkIHlvdXIgc3VnZ2VzdGlv
biwgdGhlIGtlcm5lbCBpcyBjcmFzaGluZywgaG9wZSBJDQo+ID4gaGF2ZW4ndCBkb25lIHNvbWUg
c2lsbHkgYnVnLg0KPiANCj4gQ2FuIHlvdSBwb2ludCB1cyB0byB0aGUgYWZmZWN0ZWQgY29kZT8N
Cj4gVGhpcyB3b3VsZCBoZWxwIGEgbG90IHRvIHVuZGVyc3RhbmQgdGhlIGlzc3VlIGJldHRlci4N
Cj4gSSdtIHN1cmUgd2UgY2FuIGZpbmQgYSBzb2x1dGlvbi4NCg0KR290IGdyZWVuIGxpZ2h0IG9u
IHJlbGVhc2luZyB0aGUgcGF0Y2hlcyB3aWxsIHNlbmQgc29vbi4NCg0KDQpUaGFua3MNClRvbWFz
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
