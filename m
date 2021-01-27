Return-Path: <SRS0=ZJz0=G6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB016C433E6
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 20:56:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A14364DC4
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 20:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A14364DC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BU6am9viW4yNWMvDFcnMFgyrGsj16d9py8LTQ2afhek=; b=1U99tPiTWqyMpYF4bQiyhpnm4
	PWol1He4pDoTEjBIas+WaFjTDO/F8vEAapJon+5Os/7w3xJE2EexHF8w0Ag2AGfrDzH/yJlzAqNwR
	6trG1DycetpurQ2fysiHC0Le2oRtU4B5qHCAklMjHDdo3KLJ/5HvZS+GqXZHX4mXx9ZPG62m2soRo
	44M5KRxLhKLdSgeWtCz+nB2BeBXnqr2yPT2ziO0835bPexFrevQpawIRjdf9vL/8/yU6HoIXOv2dz
	w77I1DZ5fim53t57VWDgGkaTddvm82hjPGuyqd79WavpXBFVl88uC73QAErwaBLRG1S8MvzTgz78H
	9lKsDOK0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4rr3-0006vd-By; Wed, 27 Jan 2021 20:55:57 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4rr0-0006uK-72
 for linux-mtd@lists.infradead.org; Wed, 27 Jan 2021 20:55:55 +0000
IronPort-SDR: hwLDUkWOH9cEAQ6YtVNa0ZT9LIiLB9u2+GBJg/kXjbAMroGUJGEQedLKzx1mhE5BG4UpsCjZGm
 tgnpTSj+ZXkQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="264959204"
X-IronPort-AV: E=Sophos;i="5.79,380,1602572400"; d="scan'208";a="264959204"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 12:55:49 -0800
IronPort-SDR: eW5aSob8dr7nNZZVReNYejFMh4C48yxCIyvU2fUPjjMh4fvPhuQmxcG8zIpgOM5Kpq70iNSxRW
 p6Mp/TABIr/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,380,1602572400"; d="scan'208";a="351128700"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 27 Jan 2021 12:55:49 -0800
Received: from lcsmsx602.ger.corp.intel.com (10.109.210.11) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 27 Jan 2021 12:55:48 -0800
Received: from hasmsx602.ger.corp.intel.com (10.184.107.142) by
 LCSMSX602.ger.corp.intel.com (10.109.210.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 27 Jan 2021 22:55:47 +0200
Received: from hasmsx602.ger.corp.intel.com ([10.184.107.142]) by
 HASMSX602.ger.corp.intel.com ([10.184.107.142]) with mapi id 15.01.1713.004;
 Wed, 27 Jan 2021 22:55:46 +0200
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: Richard Weinberger <richard@nod.at>
Subject: RE: [PATCH] mtd: use refcount to prevent corruption
Thread-Topic: [PATCH] mtd: use refcount to prevent corruption
Thread-Index: AQHW9OeD00Da249Jw0qJn6+VIZAeUao7z7AAgAAh5BA=
Date: Wed, 27 Jan 2021 20:55:46 +0000
Message-ID: <c8d0f22c5fdf443cb8dda1f996b148d9@intel.com>
References: <20210127200319.662842-1-tomas.winkler@intel.com>
 <9732911.325628.1611780400338.JavaMail.zimbra@nod.at>
In-Reply-To: <9732911.325628.1611780400338.JavaMail.zimbra@nod.at>
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
X-CRM114-CacheID: sfid-20210127_155554_407082_0EAB8BF6 
X-CRM114-Status: GOOD (  13.68  )
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

DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIG10ZDogdXNlIHJlZmNvdW50IHRvIHByZXZlbnQgY29y
cnVwdGlvbg0KPiANCj4gVG9tYXMsDQo+IA0KPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0t
LS0tDQo+ID4gVm9uOiAiVG9tYXMgV2lua2xlciIgPHRvbWFzLndpbmtsZXJAaW50ZWwuY29tPg0K
PiA+IEFuOiAiTWlxdWVsIFJheW5hbCIgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+LCAicmlj
aGFyZCINCj4gPiA8cmljaGFyZEBub2QuYXQ+LCAiVmlnbmVzaCBSYWdoYXZlbmRyYSIgPHZpZ25l
c2hyQHRpLmNvbT4sICJsaW51eC1tdGQiDQo+ID4gPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQu
b3JnPiwgImxpbnV4LWtlcm5lbCINCj4gPiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4N
Cj4gPiBDQzogIlRvbWFzIFdpbmtsZXIiIDx0b21hcy53aW5rbGVyQGludGVsLmNvbT4NCj4gPiBH
ZXNlbmRldDogTWl0dHdvY2gsIDI3LiBKYW51YXIgMjAyMSAyMTowMzoxOQ0KPiA+IEJldHJlZmY6
IFtQQVRDSF0gbXRkOiB1c2UgcmVmY291bnQgdG8gcHJldmVudCBjb3JydXB0aW9uDQo+IA0KPiA+
IFdoZW4gdW5kZXJseWluZyBkZXZpY2UgaXMgcmVtb3ZlZCBtdGQgY29yZSB3aWxsIGNyYXNoIGlu
IGNhc2UgdXNlcg0KPiA+IHNwYWNlIGlzIHN0aWxsIGhvbGRpbmcgYW4gb3BlbiBoYW5kbGUgdG8g
YSBtdGQgZGV2aWNlIG5vZGUuDQo+ID4gQSBwcm9wZXIgcmVmY291bnRpbmcgaXMgbmVlZGVkIHNv
IGRldmljZSBpcyByZWxlYXNlIG9ubHkgd2hlbiBhDQo+ID4gcGFydGl0aW9uIGhhcyBubyBhY3Rp
dmUgdXNlcnMuIFRoZSBjdXJyZW50IHNpbXBsZSBjb3VudGVyIGlzIG5vdA0KPiA+IHN1ZmZpY2ll
bnQuDQo+IA0KPiBDYW4geW91IHBsZWFzZSBleHBsYWluIGEgbGl0dGxlIG1vcmUgd2hhdCBkZXZp
Y2VzIGFyZSBpbnZvbHZlZD8NCj4gRG9lcyBpdCBpbXBsZW1lbnQgX2dldF9kZXZpY2UoKSBhbmQg
X3B1dF9kZXZpY2UoKT8NCk5vIHRoaXMgaXMgbm90IGNvbm5lY3RlZCB0byB0aG9zZSBoYW5kbGVy
cyBvZiB0aGUgdW5kZXJseWluZyBkZXZpY2UgYW5kIHRob3NlIHdvbid0IGhlbHAuIA0KSSBoYXZl
IGEgc3BpIGRldmljZSBwcm92aWRlZCBieSBNRkQgZnJhbWV3b3JrIHNvIGl0IGNhbiBnbyBhd2F5
IGFueXRpbWUuIA0KTXkgc29sdXRpb24gdHJpZXMgdG8gIHJlcGxhY2UgdGhlIGN1cnJlbnQgc2lt
cGxlIHBhcnRpdGlvbiByZWZlcmVuY2UgY291bnRpbmcuICBJbiBwcmV2aW91cyBzb2x1dGlvbiBp
dCB3aWxsIHJldHVybiAtRUJVU1kgb24gcGFydGl0aW9uIHRoYXQgaXMgaGVsZCBidXQgd2lsbCBy
ZW1vdmUgdGhlIGFjdHVhbCBwYXJlbnQgZGV2aWNlLCBsZWFkaW5nIHRvIGNyYXNoLg0KQWxzbyB3
L28gcmVmZXJlbmNlIGNvdW50aW5nIHRoZXJlIGlzIG5vIHByb2Nlc3MgdG8gYWN0dWFsbHkgcmVt
b3ZlIHRoZSBwYXJ0aXRpb24gdGhhdCB3YXMgcHJldmlvdXNseSBidXN5Lg0KDQpUaGFua3MNClRv
bWFzDQoNCg0KDQo+IA0KPiBUaGFua3MsDQo+IC8vcmljaGFyZA0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
