Return-Path: <SRS0=bXaR=LX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F66C11F66
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jun 2021 09:34:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8FEB61D86
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jun 2021 09:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8FEB61D86
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:Cc:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zVpU63KihyYKxBiwO76gM/9327B2loNZCoF2G7uARnM=; b=oRvlY35bwf01aD
	eYk163HJwrrQCdbtTN5hzGuoKaQJu8kbed9LY30oEDBXtoOHrrqzt/WBlmwjqMViG6M2Kj7A6xc8a
	m/gWRXu+2zjtTKXo36w8UThj99X9iuxeWTseSQaWbx8jUl9eBfsaNOjflpFP+dM7XU7iaoIZPApxK
	lycWY+qjf5biJAg+ZVwAM3wrlYL056S5HLVYkAk3PGJcvWLI9q+Lfk9n025DvGM4HJkrd3XEM6Xis
	7ElKRgcUsPKNfNZzmMI6Jts/z287h9jgrbGZSdX80SA6/PtB480ppNCB9Jo8eW9r1nNWk5QWh7aRO
	IvCcD8dtGLaCCR5uvLMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyA7d-00ANYX-9F; Tue, 29 Jun 2021 09:33:37 +0000
Received: from twhmllg4.macronix.com ([122.147.135.202])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyA7a-00ANXR-6M
 for linux-mtd@lists.infradead.org; Tue, 29 Jun 2021 09:33:35 +0000
Received: from twhfm1p2.macronix.com (twhfmlp2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id 15T9XGuc013926;
 Tue, 29 Jun 2021 17:33:16 +0800 (GMT-8)
 (envelope-from zhengxunli@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id 55299B94918F0AE99BFE;
 Tue, 29 Jun 2021 17:33:17 +0800 (CST)
In-Reply-To: <59855ba0-31d8-25b4-3000-ca493a83fe00@microchip.com>
References: <1621232088-12567-1-git-send-email-zhengxunli@mxic.com.tw>
 <1621232088-12567-2-git-send-email-zhengxunli@mxic.com.tw>
 <59855ba0-31d8-25b4-3000-ca493a83fe00@microchip.com>
To: <Tudor.Ambarus@microchip.com>
Cc: broonie@kernel.org, jaimeliao@mxic.com.tw, linux-mtd@lists.infradead.org, 
 linux-spi@vger.kernel.org, miquel.raynal@bootlin.com, p.yadav@ti.com
Subject: Re: [PATCH v5 1/2] mtd: spi-nor: macronix: add support for Macronix
 octaflash
MIME-Version: 1.0
X-KeepSent: 0F03D74E:5813696B-48258703:003378F0;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP6 SHF907 April 26, 2018
Message-ID: <OF0F03D74E.5813696B-ON48258703.003378F0-48258703.00347C73@mxic.com.tw>
From: zhengxunli@mxic.com.tw
Date: Tue, 29 Jun 2021 17:33:17 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2021/06/29 PM 05:33:17,
 Serialize complete at 2021/06/29 PM 05:33:17
X-MAIL: TWHMLLG4.macronix.com 15T9XGuc013926
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_023334_558452_B632ED0C 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVHVkb3IsDQoNCjxUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb20+IHdyb3RlIG9uIDIwMjEv
MDYvMjkgpFWkyCAwMjozNzowMToNCg0KPiA8VHVkb3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29tPiAN
Cj4gMjAyMS8wNi8yOSCkVaTIIDAyOjM3DQo+IA0KPiBUbw0KPiANCj4gPHpoZW5neHVubGlAbXhp
Yy5jb20udHc+LCA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCA8bGludXgtDQo+IHNw
aUB2Z2VyLmtlcm5lbC5vcmc+LCANCj4gDQo+IGNjDQo+IA0KPiA8cC55YWRhdkB0aS5jb20+LCA8
bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4sIDxicm9vbmllQGtlcm5lbC5vcmc+LA0KPiA8amFp
bWVsaWFvQG14aWMuY29tLnR3Pg0KPiANCj4gU3ViamVjdA0KPiANCj4gUmU6IFtQQVRDSCB2NSAx
LzJdIG10ZDogc3BpLW5vcjogbWFjcm9uaXg6IGFkZCBzdXBwb3J0IGZvciBNYWNyb25peCANCm9j
dGFmbGFzaA0KPiANCj4gT24gNS8xNy8yMSA5OjE0IEFNLCBaaGVuZ3h1biBMaSB3cm90ZToNCj4g
PiArICAgICAgIHsgIm14NjZsbTFnNDVnIiwgSU5GTygweGMyODUzYiwgMCwgMzIgKiAxMDI0LCA0
MDk2LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNFQ1RfNEsgfCBTUElfTk9S
X09DVEFMX0RUUl9SRUFEIHwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTUElf
Tk9SX09DVEFMX0RUUl9QUCB8IA0KU1BJX05PUl80Ql9PUENPREVTKQ0KPiA+ICsgICAgICAgICAg
ICAgICAuZml4dXBzID0gJm9jdGFmbGFzaF9maXh1cHMgfSwNCj4gDQo+IEkgaGF2ZSBhIG14NjZs
bTFnNDVnIHdoaWNoIGRvZXMgbm90IGRlZmluZSBTRkRQIHRhYmxlcywgaG93IHlvdSdsbCANCj4g
ZGlmZmVyZW50aWF0ZQ0KPiBiZXR3ZWVuIHRoZSB0d28/IA0KPiBNaW5lIHdpbGwgZmFpbCBhZnRl
ciByZXNldC4gSSdtIHdvcmtpbmcgdG8gYWRkcmVzcyANCj4gdGhlIGZsYXNoIElEDQo+IGNvbGxp
c2lvbnMsIHdpbGwgc2VuZCBwYXRjaGVzIHNvb24uIEkgd29uJ3QgcXVldWUgYW55IG5ldyBmbGFz
aCANCj4gYWRkaXRpb25zIHVudGlsDQo+IHdlJ2xsIHNvbHZlIHRoZSBJRCBjb2xsaXNpb25zIHBy
b2JsZW0uDQoNClNvcnJ5IGZvciB0aGUgaW5jb252ZW5pZW5jZS4gSSB3aWxsIGRpc2N1c3Mgd2l0
aCBvdXIgZmxhc2ggdGVhbSBhcyBzb29uIGFzIA0KcG9zc2libGUuDQoNClRoYW5rcywNClpoZW5n
eHVuDQoNCg0KDQoNCkNPTkZJREVOVElBTElUWSBOT1RFOg0KDQpUaGlzIGUtbWFpbCBhbmQgYW55
IGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiANCmFuZC9v
ciBwZXJzb25hbCBkYXRhLCB3aGljaCBpcyBwcm90ZWN0ZWQgYnkgYXBwbGljYWJsZSBsYXdzLiBQ
bGVhc2UgYmUgDQpyZW1pbmRlZCB0aGF0IGR1cGxpY2F0aW9uLCBkaXNjbG9zdXJlLCBkaXN0cmli
dXRpb24sIG9yIHVzZSBvZiB0aGlzIGUtbWFpbCANCihhbmQvb3IgaXRzIGF0dGFjaG1lbnRzKSBv
ciBhbnkgcGFydCB0aGVyZW9mIGlzIHByb2hpYml0ZWQuIElmIHlvdSByZWNlaXZlIA0KdGhpcyBl
LW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdXMgaW1tZWRpYXRlbHkgYW5kIGRlbGV0ZSB0
aGlzIG1haWwgYXMgDQp3ZWxsIGFzIGl0cyBhdHRhY2htZW50KHMpIGZyb20geW91ciBzeXN0ZW0u
IEluIGFkZGl0aW9uLCBwbGVhc2UgYmUgDQppbmZvcm1lZCB0aGF0IGNvbGxlY3Rpb24sIHByb2Nl
c3NpbmcsIGFuZC9vciB1c2Ugb2YgcGVyc29uYWwgZGF0YSBpcyANCnByb2hpYml0ZWQgdW5sZXNz
IGV4cHJlc3NseSBwZXJtaXR0ZWQgYnkgcGVyc29uYWwgZGF0YSBwcm90ZWN0aW9uIGxhd3MuIA0K
VGhhbmsgeW91IGZvciB5b3VyIGF0dGVudGlvbiBhbmQgY29vcGVyYXRpb24uDQoNCk1hY3Jvbml4
IEludGVybmF0aW9uYWwgQ28uLCBMdGQuDQoNCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KDQoNCg0KPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PQ0KDQpDT05GSURFTlRJQUxJVFkgTk9URToNCg0KVGhpcyBlLW1haWwgYW5kIGFu
eSBhdHRhY2htZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24gYW5kL29y
IHBlcnNvbmFsIGRhdGEsIHdoaWNoIGlzIHByb3RlY3RlZCBieSBhcHBsaWNhYmxlIGxhd3MuIFBs
ZWFzZSBiZSByZW1pbmRlZCB0aGF0IGR1cGxpY2F0aW9uLCBkaXNjbG9zdXJlLCBkaXN0cmlidXRp
b24sIG9yIHVzZSBvZiB0aGlzIGUtbWFpbCAoYW5kL29yIGl0cyBhdHRhY2htZW50cykgb3IgYW55
IHBhcnQgdGhlcmVvZiBpcyBwcm9oaWJpdGVkLiBJZiB5b3UgcmVjZWl2ZSB0aGlzIGUtbWFpbCBp
biBlcnJvciwgcGxlYXNlIG5vdGlmeSB1cyBpbW1lZGlhdGVseSBhbmQgZGVsZXRlIHRoaXMgbWFp
bCBhcyB3ZWxsIGFzIGl0cyBhdHRhY2htZW50KHMpIGZyb20geW91ciBzeXN0ZW0uIEluIGFkZGl0
aW9uLCBwbGVhc2UgYmUgaW5mb3JtZWQgdGhhdCBjb2xsZWN0aW9uLCBwcm9jZXNzaW5nLCBhbmQv
b3IgdXNlIG9mIHBlcnNvbmFsIGRhdGEgaXMgcHJvaGliaXRlZCB1bmxlc3MgZXhwcmVzc2x5IHBl
cm1pdHRlZCBieSBwZXJzb25hbCBkYXRhIHByb3RlY3Rpb24gbGF3cy4gVGhhbmsgeW91IGZvciB5
b3VyIGF0dGVudGlvbiBhbmQgY29vcGVyYXRpb24uDQoNCk1hY3Jvbml4IEludGVybmF0aW9uYWwg
Q28uLCBMdGQuDQoNCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
