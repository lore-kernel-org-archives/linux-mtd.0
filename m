Return-Path: <SRS0=HmSd=G7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F42C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 06:34:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C179664D99
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 06:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C179664D99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rhmaLY8SWw3lcpNMmKCPOMxG1/DnLEFVLfhUwuwSuqA=; b=zVPZIf4i9inUGd191WpjMjwd7
	EQfW2gdt4ZaUdPAVDZFpr7gZ5NnXGSAEXlphooP7C1KODDpsP8nYz7T5lu3AcS0HT0Pc9ayn5EKzq
	ddSkMO9f89ZROmk6+/jIHN0rozdCzzyULJfmqVsvYdz8BzjIEbGttdUlTRFIyJbQ9cWiGQ1VrDSdD
	ORLSRsIK2e3FL3dXFYXvcbYXT92WWmX9HcxA1Z3om9AjWr5ygCBsRdjZ9+mvOo9EGrlnjVWUd+R1V
	3kqeVr7uIAPZzLSF3V26eRa5dV1sQveeiRiFYsCNBDvJdTWMrxcfrTxdbmsSyBpbe2ucoAFpSlq+B
	n/DWMJlSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l50sO-0003lf-Nx; Thu, 28 Jan 2021 06:33:56 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l50sM-0003lG-CP
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2021 06:33:55 +0000
IronPort-SDR: 2TIqCHnm6etmpdNQgZov9QsPO6P+xARP7O0338xXwgTYumP1zMgJXddG4d1zbjjYsEeL7M+Vbx
 UAnxob3KSehw==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="167862007"
X-IronPort-AV: E=Sophos;i="5.79,381,1602572400"; d="scan'208";a="167862007"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 22:33:50 -0800
IronPort-SDR: l+tRUQI/DhisSjVUdEcootSuETTPJUR3+HNQC3fCUbAzmTztf1oDip2R11hPCeoajwpETZ2XFn
 4ouf1ZYNdvZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,381,1602572400"; d="scan'208";a="407414005"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga002.fm.intel.com with ESMTP; 27 Jan 2021 22:33:50 -0800
Received: from lcsmsx602.ger.corp.intel.com (10.109.210.11) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 27 Jan 2021 22:33:49 -0800
Received: from hasmsx602.ger.corp.intel.com (10.184.107.142) by
 LCSMSX602.ger.corp.intel.com (10.109.210.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 28 Jan 2021 08:33:47 +0200
Received: from hasmsx602.ger.corp.intel.com ([10.184.107.142]) by
 HASMSX602.ger.corp.intel.com ([10.184.107.142]) with mapi id 15.01.1713.004;
 Thu, 28 Jan 2021 08:33:47 +0200
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: Richard Weinberger <richard@nod.at>
Subject: RE: [PATCH] mtd: use refcount to prevent corruption
Thread-Topic: [PATCH] mtd: use refcount to prevent corruption
Thread-Index: AQHW9OeD00Da249Jw0qJn6+VIZAeUao7z7AAgAAh5BBxoBSOfPxzntFA
Date: Thu, 28 Jan 2021 06:33:47 +0000
Message-ID: <a6cb6eb10bbb48989d3a9e087951e50e@intel.com>
References: <20210127200319.662842-1-tomas.winkler@intel.com>
 <9732911.325628.1611780400338.JavaMail.zimbra@nod.at>
 <c8d0f22c5fdf443cb8dda1f996b148d9@intel.com>
 <1776363776.325713.1611782270873.JavaMail.zimbra@nod.at>
In-Reply-To: <1776363776.325713.1611782270873.JavaMail.zimbra@nod.at>
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
X-CRM114-CacheID: sfid-20210128_013354_581278_43E211A3 
X-CRM114-Status: GOOD (  19.16  )
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

DQo+IA0KPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tDQo+ID4+ID4gV2hlbiB1bmRl
cmx5aW5nIGRldmljZSBpcyByZW1vdmVkIG10ZCBjb3JlIHdpbGwgY3Jhc2ggaW4gY2FzZSB1c2Vy
DQo+ID4+ID4gc3BhY2UgaXMgc3RpbGwgaG9sZGluZyBhbiBvcGVuIGhhbmRsZSB0byBhIG10ZCBk
ZXZpY2Ugbm9kZS4NCj4gPj4gPiBBIHByb3BlciByZWZjb3VudGluZyBpcyBuZWVkZWQgc28gZGV2
aWNlIGlzIHJlbGVhc2Ugb25seSB3aGVuIGENCj4gPj4gPiBwYXJ0aXRpb24gaGFzIG5vIGFjdGl2
ZSB1c2Vycy4gVGhlIGN1cnJlbnQgc2ltcGxlIGNvdW50ZXIgaXMgbm90DQo+ID4+ID4gc3VmZmlj
aWVudC4NCj4gPj4NCj4gPj4gQ2FuIHlvdSBwbGVhc2UgZXhwbGFpbiBhIGxpdHRsZSBtb3JlIHdo
YXQgZGV2aWNlcyBhcmUgaW52b2x2ZWQ/DQo+ID4+IERvZXMgaXQgaW1wbGVtZW50IF9nZXRfZGV2
aWNlKCkgYW5kIF9wdXRfZGV2aWNlKCk/DQo+ID4gTm8gdGhpcyBpcyBub3QgY29ubmVjdGVkIHRv
IHRob3NlIGhhbmRsZXJzIG9mIHRoZSB1bmRlcmx5aW5nIGRldmljZQ0KPiA+IGFuZCB0aG9zZSB3
b24ndCBoZWxwLg0KPiA+IEkgaGF2ZSBhIHNwaSBkZXZpY2UgcHJvdmlkZWQgYnkgTUZEIGZyYW1l
d29yayBzbyBpdCBjYW4gZ28gYXdheSBhbnl0aW1lLg0KPiANCj4gQ2FuIGl0IGdvIGF3YXkgcGh5
c2ljYWxseSBvciBqdXN0IGluIHNvZnR3YXJlPw0KU29mdHdhcmUsIGJ1dCBzaW5jZSB0aGlzIGlz
IG1mZCBpdCdzIGJhc2ljYWxseSBob3RwbHVnLiBUaGUga2VybmVsIGlzIGNyYXNoaW5nIHdoZW4g
SSBzaW11bGF0ZSBoYXJkd2FyZSBmYWlsdXJlLg0KPiANCj4gVXN1YWxseSB0aGUgcGF0dGVybiBp
cyB0aGF0IHlvdSBtYWtlIHN1cmUgaW4gdGhlIGRldmljZSBkcml2ZXIgdGhhdCBub2JvZHkgY2Fu
DQo+IG9ycGhhbiB0aGUgTVREIHdoaWxlIGl0IGlzIGluIHVzZS4NCj4gZS5nLiBkcml2ZXJzL210
ZC91YmkvZ2x1ZWJpLmMgZG9lcyBzby4gSW4gX2dldF9kZXZpY2UoKSBpdCBncmFicyBhIHJlZmVy
ZW5jZSBvbg0KPiB0aGUgdW5kZXJseWluZyBVQkkgdm9sdW1lIHRvIG1ha2Ugc3VyZSBpdCBjYW5u
b3QgZ28gYXdheSB3aGlsZSB0aGUgTVREIChvbg0KPiB0b3Agb2YgVUJJKSBpcyBpbiB1c2UuDQoN
CkkgY2FuIHRyeSB0aGF0IGlmIGl0IGhlbHBzLCBiZWNhdXNlIHdlIGFyZSBzaW11bGF0aW5nIHBv
c3NpYmxlIGxvd2VyIGxldmVsIGNyYXNoLiANCkluIGFuIGNhc2UgSSBiZWxpZXZlIHRoYXQgdGhl
IHByb3BlciByZWZjb3V0aW5nIGlzIG11Y2ggbW9yZSByb2J1c3Qgc29sdXRpb24sIHRoYW4gdGhl
IGN1cnJlbnQgb25lLg0KSSdkIGFwcHJlY2lhdGUgaWYgc29tZW9uZSBjYW4gcmV2aWV3IHRoZSBh
Y3R1YWwgaW1wbGVtZW50YXRpb24uIA0KDQpUaGFua3MNClRvbWFzDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
