Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C106C83003
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 05:54:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3B3D206F0
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 05:54:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="upSSty8a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3B3D206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7tnU2Db24DPoyyWis/mFmWacJYSxgcEIkBUk3uc6xvo=; b=upSSty8a/nZ/H5
	SImIjuiMxdgNY9eV9flPk74F1VTuPcHpz83yo1zjWLQbCZIn0X5X5djdSj13Tlmoepi53/VfuY/bG
	UGGfB39dBTv+CBZwVIpQrCCyuqm1mrd+LG1JyDSilj1GjjXmkH6z/C0gC6Yla/outDb6H2ruB3hYx
	0zuKY34Mn0/g5jGlTbaZqkABx9vSUGk3Om2A/tQnyYTpdPpr9WTYTTxxvG2yzqOHYuB21l3CMcJOW
	JyeCw/4OxeuJRcHMnNbFI6LPETOCXwkcqtGkaxtgGCwHpDUtei0BO9WWjndSl0/rOZI1VAJmSTiKu
	IoYRv8Znhte321oi1qmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTffC-0003e1-Np; Wed, 29 Apr 2020 05:53:42 +0000
Received: from twhmllg4.macronix.com ([122.147.135.202])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTffA-0003cy-9s
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 05:53:41 +0000
Received: from twhfm1p2.macronix.com (twhfmlp2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id 03T5rCRq046799;
 Wed, 29 Apr 2020 13:53:12 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id DF38F35635D9C5E3A125;
 Wed, 29 Apr 2020 13:53:12 +0800 (CST)
In-Reply-To: <2988068.fH3nZIc59V@192.168.0.120>
References: <1587631123-25474-1-git-send-email-masonccyang@mxic.com.tw>
 <2988068.fH3nZIc59V@192.168.0.120>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v2 0/2] mtd: spi-nor: macronix: Add support for
 mx25l512/mx25u512
MIME-Version: 1.0
X-KeepSent: 12BC809E:2E327E2D-48258559:002025E6;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF12BC809E.2E327E2D-ON48258559.002025E6-48258559.0020562E@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Wed, 29 Apr 2020 13:53:12 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2020/04/29 PM 01:53:12,
 Serialize complete at 2020/04/29 PM 01:53:12
X-MAIL: TWHMLLG4.macronix.com 03T5rCRq046799
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_225340_618690_992E7531 
X-CRM114-Status: GOOD (  10.25  )
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
Cc: vigneshr@ti.com, juliensu@mxic.com.tw, richard@nod.at,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVHVkb3IsDQoNCj4gPFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbT4gDQo+IDIwMjAvMDQv
MjggpFWkyCAwNDozOQ0KPiANCj4gVG8NCj4gDQo+IDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFk
Lm9yZz4sIA0KPiANCj4gY2MNCj4gDQo+IDxtYXNvbmNjeWFuZ0BteGljLmNvbS50dz4sIDxtaXF1
ZWwucmF5bmFsQGJvb3RsaW4uY29tPiwgDQo8cmljaGFyZEBub2QuYXQ+LCANCj4gPHZpZ25lc2hy
QHRpLmNvbT4sIDxqdWxpZW5zdUBteGljLmNvbS50dz4sIA0KPGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc+DQo+IA0KPiBTdWJqZWN0DQo+IA0KPiBSZTogW1BBVENIIHYyIDAvMl0gbXRkOiBz
cGktbm9yOiBtYWNyb25peDogQWRkIHN1cHBvcnQgZm9yIA0KbXgyNWw1MTIvbXgyNXU1MTINCj4g
DQo+IE9uIFRodXJzZGF5LCBBcHJpbCAyMywgMjAyMCAxMTozODo0MSBBTSBFRVNUIE1hc29uIFlh
bmcgd3JvdGU6DQo+ID4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVu
IGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyANCnRoZQ0KPiA+IGNvbnRlbnQgaXMgc2FmZQ0K
PiA+IA0KPiA+IEhpLA0KPiA+IA0KPiA+IG14MjVsNTEyNDVnL214MjV1NTEyNDVnIGlzIGEgbWFz
cyBwcm9kdWN0aW9uIGZvciBuZXcgZGVzaWduIGFuZA0KPiA+IHJlcGxhY2UgbXg2Nmw1MTIzNWwv
bXg2NnU1MTIzNWYocGhhc2Ugb3V0KS4NCj4gPiANCj4gPiBWYWxpZGF0ZWQgYnkgcmVhZCwgZXJh
c2UsIHJlYWQgYmFjaywgd3JpdGUgYW5kIHJlYWQgYmFjaw0KPiA+IG9uIFhpbGlueCBaeW5xIFBp
Y29aZWQgRlBHQSBib2FyZCB3aGljaCBpbmNsdWRlZA0KPiA+IE1hY3Jvbml4IFNQSSBIb3N0IChk
cml2ZXIvc3BpL3NwaS1teGljLmMpLg0KPiA+IA0KPiA+IGNoYW5nZSBsb2c6DQo+ID4gdjI6DQo+
ID4gQWRkIHdoaWNoIGNvbnRyb2xsZXIgd2UgdGVzdGVkIHRoZSBteDI1bC91NTEyNDVnLg0KPiA+
IA0KPiA+IE1hc29uIFlhbmcgKDIpOg0KPiA+ICAgbXRkOiBzcGktbm9yOiBtYWNyb25peDogQWRk
IHN1cHBvcnQgZm9yIG14MjVsNTEyNDVnDQo+ID4gICBtdGQ6IHNwaS1ub3I6IG1hY3Jvbml4OiBB
ZGQgc3VwcG9ydCBmb3IgbXgyNXU1MTI0NWcNCj4gPiANCj4gPiAgZHJpdmVycy9tdGQvc3BpLW5v
ci9tYWNyb25peC5jIHwgNiArKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKQ0KPiANCj4gQm90aCBhcHBsaWVkLiBJbiAyLzIgSSBvcmRlcmVkIHRoZSBlbnRyeSBhbHBo
YWJldGljYWxseS4gV291bGQgeW91IHNlbmQgDQphIA0KPiBwYXRjaCB0byBvcmRlciBhbGwgZW50
cmllcyBpbiBtYWNyb25peC5jIGluIGFscGhhYmV0aWNhbCBvcmRlcj8gSXQncyBhIA0KbWVzcyAN
Cj4gcmlnaHQgbm93Lg0KDQp0aGFua3MgeW91IGFuZCBJIHdpbGwgc2VuZCBhIHBhdGNoIHRvIGRv
IHRoYXQuDQoNCj4gDQo+IENoZWVycywNCj4gdGENCj4gDQo+IA0KDQpiZXN0IHJlZ2FyZHMsDQpN
YXNvbg0KDQoNCkNPTkZJREVOVElBTElUWSBOT1RFOg0KDQpUaGlzIGUtbWFpbCBhbmQgYW55IGF0
dGFjaG1lbnRzIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiANCmFuZC9vciBw
ZXJzb25hbCBkYXRhLCB3aGljaCBpcyBwcm90ZWN0ZWQgYnkgYXBwbGljYWJsZSBsYXdzLiBQbGVh
c2UgYmUgDQpyZW1pbmRlZCB0aGF0IGR1cGxpY2F0aW9uLCBkaXNjbG9zdXJlLCBkaXN0cmlidXRp
b24sIG9yIHVzZSBvZiB0aGlzIGUtbWFpbCANCihhbmQvb3IgaXRzIGF0dGFjaG1lbnRzKSBvciBh
bnkgcGFydCB0aGVyZW9mIGlzIHByb2hpYml0ZWQuIElmIHlvdSByZWNlaXZlIA0KdGhpcyBlLW1h
aWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdXMgaW1tZWRpYXRlbHkgYW5kIGRlbGV0ZSB0aGlz
IG1haWwgYXMgDQp3ZWxsIGFzIGl0cyBhdHRhY2htZW50KHMpIGZyb20geW91ciBzeXN0ZW0uIElu
IGFkZGl0aW9uLCBwbGVhc2UgYmUgDQppbmZvcm1lZCB0aGF0IGNvbGxlY3Rpb24sIHByb2Nlc3Np
bmcsIGFuZC9vciB1c2Ugb2YgcGVyc29uYWwgZGF0YSBpcyANCnByb2hpYml0ZWQgdW5sZXNzIGV4
cHJlc3NseSBwZXJtaXR0ZWQgYnkgcGVyc29uYWwgZGF0YSBwcm90ZWN0aW9uIGxhd3MuIA0KVGhh
bmsgeW91IGZvciB5b3VyIGF0dGVudGlvbiBhbmQgY29vcGVyYXRpb24uDQoNCk1hY3Jvbml4IElu
dGVybmF0aW9uYWwgQ28uLCBMdGQuDQoNCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KDQoNCg0KPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQ0KDQpDT05GSURFTlRJQUxJVFkgTk9URToNCg0KVGhpcyBlLW1haWwgYW5kIGFueSBh
dHRhY2htZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24gYW5kL29yIHBl
cnNvbmFsIGRhdGEsIHdoaWNoIGlzIHByb3RlY3RlZCBieSBhcHBsaWNhYmxlIGxhd3MuIFBsZWFz
ZSBiZSByZW1pbmRlZCB0aGF0IGR1cGxpY2F0aW9uLCBkaXNjbG9zdXJlLCBkaXN0cmlidXRpb24s
IG9yIHVzZSBvZiB0aGlzIGUtbWFpbCAoYW5kL29yIGl0cyBhdHRhY2htZW50cykgb3IgYW55IHBh
cnQgdGhlcmVvZiBpcyBwcm9oaWJpdGVkLiBJZiB5b3UgcmVjZWl2ZSB0aGlzIGUtbWFpbCBpbiBl
cnJvciwgcGxlYXNlIG5vdGlmeSB1cyBpbW1lZGlhdGVseSBhbmQgZGVsZXRlIHRoaXMgbWFpbCBh
cyB3ZWxsIGFzIGl0cyBhdHRhY2htZW50KHMpIGZyb20geW91ciBzeXN0ZW0uIEluIGFkZGl0aW9u
LCBwbGVhc2UgYmUgaW5mb3JtZWQgdGhhdCBjb2xsZWN0aW9uLCBwcm9jZXNzaW5nLCBhbmQvb3Ig
dXNlIG9mIHBlcnNvbmFsIGRhdGEgaXMgcHJvaGliaXRlZCB1bmxlc3MgZXhwcmVzc2x5IHBlcm1p
dHRlZCBieSBwZXJzb25hbCBkYXRhIHByb3RlY3Rpb24gbGF3cy4gVGhhbmsgeW91IGZvciB5b3Vy
IGF0dGVudGlvbiBhbmQgY29vcGVyYXRpb24uDQoNCk1hY3Jvbml4IEludGVybmF0aW9uYWwgQ28u
LCBMdGQuDQoNCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
