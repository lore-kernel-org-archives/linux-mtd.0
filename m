Return-Path: <SRS0=EgaJ=JY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E6D9C433ED
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Apr 2021 01:50:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE21E613AF
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Apr 2021 01:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE21E613AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:Subject:Cc:To:
	References:In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3v26FUz5aXLiFE8jbGetU94RKMvyXnd2GEuTKaeBeqA=; b=YkZ2rQi5ILpmB3j+6sABt14Ex
	eB3TD7x1WwV+BjecqnGbc0Z5wLa8UFsPAHrT3D64soch8BB/twb5g9vxkkBxf64OZL2vDam8WE3GD
	yOPJ6JBkwG2YCPuBM63HOVAo6kYWLkProHgLwlJSDJJBnqef5dot0yrR69hkYS995veBIhrLFLFx/
	iP6DjSdCvwcca9OKdD/0YFJ/cO051J/41S/B3lb6OqwVdha0ExSEqSx0jwiuvBp1pBKHuXwW6aDvf
	yNT6y6yNCU7Wvu2i2u7GfXOHg9BU9GgFSgkX6XIaRH4HVu/j5pf5fHZWCWhBVKBXHF7OZpNwn3wIS
	5lkHe85VQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbCqf-000Q10-DJ; Tue, 27 Apr 2021 01:49:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbCqW-000Q0Q-1W
 for linux-mtd@desiato.infradead.org; Tue, 27 Apr 2021 01:49:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Date:From:Message-ID:MIME-Version:Subject:Cc:To:References:
 In-Reply-To:Sender:Reply-To:Content-ID:Content-Description;
 bh=82SCcSoF2bouREbOPzJ5lrBKmvAB7GisUvTyp3euCJU=; b=ocxn4X2a4INfn/mRFtlotolkYx
 VKuRIk+aEBxMo6/sqXLResRXFHtZXmM1ZRmWtMNi46DIOEbYpzTnfXpHNAitlwGU2b52JdpNE1+0v
 lqQNlbPd6woDPkHL3Qh8M+Cx9C/AdqORxMsXKl/B7E6J32x9d9WCVEk+uCSqg4Y6XtDqdIcOD9x34
 KGUAAnpnDP1FyH/ULcM19aL1SSnZDkZQeUf9BteqHJ5IwBlx1ggNB3PVL9zvrfph3frn4Dn0sSif5
 P5LN0QbY8k7GHL2IDHbVs9w3nKrgWjqfkDsIh4lxNElt8CJA5ZPbYwIVZlfm6qnLOEFR729/ndypr
 eUoMzN+A==;
Received: from twhmllg4.macronix.com ([211.75.127.132])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbCqR-00GNHH-Ri
 for linux-mtd@lists.infradead.org; Tue, 27 Apr 2021 01:49:01 +0000
Received: from twhfm1p2.macronix.com (twhfmlp2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id 13R1majp016941;
 Tue, 27 Apr 2021 09:48:36 +0800 (GMT-8)
 (envelope-from zhengxunli@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id C65D0F8794AF8785BB8B;
 Tue, 27 Apr 2021 09:48:36 +0800 (CST)
In-Reply-To: <20210426165358.GI4590@sirena.org.uk>
References: <1618900179-14546-1-git-send-email-zhengxunli@mxic.com.tw>
 <1618900179-14546-4-git-send-email-zhengxunli@mxic.com.tw>
 <20210426165358.GI4590@sirena.org.uk>
To: "Mark Brown" <broonie@kernel.org>
Cc: jaimeliao@mxic.com.tw, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, miquel.raynal@bootlin.com,
 tudor.ambarus@microchip.com
Subject: Re: [PATCH v3 3/3] spi: mxic: patch for octal DTR mode support
MIME-Version: 1.0
X-KeepSent: 9A94F8F9:DF8D5789-482586C4:0008EE9F;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP6 SHF907 April 26, 2018
Message-ID: <OF9A94F8F9.DF8D5789-ON482586C4.0008EE9F-482586C4.0009F19F@mxic.com.tw>
From: zhengxunli@mxic.com.tw
Date: Tue, 27 Apr 2021 09:48:37 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2021/04/27 AM 09:48:36,
 Serialize complete at 2021/04/27 AM 09:48:36
X-MAIL: TWHMLLG4.macronix.com 13R1majp016941
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_184900_172419_36E3DDC8 
X-CRM114-Status: UNSURE (   8.08  )
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

SGkgTWFyaywNCg0KVGhhbmtzIGZvciB5b3VyIHJlcGx5Lg0KDQoiTWFyayBCcm93biIgPGJyb29u
aWVAa2VybmVsLm9yZz4gd3JvdGUgb24gMjAyMS8wNC8yNyCkV6TIIDEyOjUzOjU4Og0KDQo+ICJN
YXJrIEJyb3duIiA8YnJvb25pZUBrZXJuZWwub3JnPiANCj4gMjAyMS8wNC8yNyCkV6TIIDEyOjU0
DQo+IA0KPiBUbw0KPiANCj4gIlpoZW5neHVuIExpIiA8emhlbmd4dW5saUBteGljLmNvbS50dz4s
IA0KPiANCj4gY2MNCj4gDQo+IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnLCBsaW51eC1z
cGlAdmdlci5rZXJuZWwub3JnLCANCj4gdHVkb3IuYW1iYXJ1c0BtaWNyb2NoaXAuY29tLCBtaXF1
ZWwucmF5bmFsQGJvb3RsaW4uY29tLCANCmphaW1lbGlhb0BteGljLmNvbS50dw0KPiANCj4gU3Vi
amVjdA0KPiANCj4gUmU6IFtQQVRDSCB2MyAzLzNdIHNwaTogbXhpYzogcGF0Y2ggZm9yIG9jdGFs
IERUUiBtb2RlIHN1cHBvcnQNCj4gDQo+IE9uIFR1ZSwgQXByIDIwLCAyMDIxIGF0IDAyOjI5OjM5
UE0gKzA4MDAsIFpoZW5neHVuIExpIHdyb3RlOg0KPiANCj4gPiAtICAgcmV0dXJuIHNwaV9tZW1f
ZGVmYXVsdF9zdXBwb3J0c19vcChtZW0sIG9wKTsNCj4gPiArICAgYWxsX2ZhbHNlID0gIW9wLT5j
bWQuZHRyICYmICFvcC0+YWRkci5kdHIgJiYgIW9wLT5kdW1teS5kdHIgJiYNCj4gPiArICAgICAg
ICAgICFvcC0+ZGF0YS5kdHI7DQo+ID4gKw0KPiA+ICsgICBpZiAoYWxsX2ZhbHNlKQ0KPiANCj4g
VGhpcyBmZWVscyBsaWtlIHdlIG1pZ2h0IHdhbnQgYSBzcGlfbWVtX29wX2lzX2R0cigpIGhlbHBl
cj8gIEkgY2FuIHNlZQ0KPiBvdGhlciBjb250cm9sbGVycyB3YW50aW5nIGEgc2ltaWxhciBjaGVj
ay4NCg0KWWVzLCBzaW5jZSBzcGlfbWVtX2RlZmF1bHRfc3VwcG9ydHNfb3AgZG9lcyBub3Qgc3Vw
cG9ydCBhbnkgZHRyIA0Kb3BlcmF0aW9ucywNCndlIG5lZWQgc3BpX21lbV9vcF9pcyBkdHIoKSB0
byBoZWxwIHVzIGNoZWNrIGR0ciBvcGVyYXRpb25zLg0KDQpUaGFua3MsDQpaaGVuZ3h1biBMaQ0K
DQoNCkNPTkZJREVOVElBTElUWSBOT1RFOg0KDQpUaGlzIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1l
bnRzIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiANCmFuZC9vciBwZXJzb25h
bCBkYXRhLCB3aGljaCBpcyBwcm90ZWN0ZWQgYnkgYXBwbGljYWJsZSBsYXdzLiBQbGVhc2UgYmUg
DQpyZW1pbmRlZCB0aGF0IGR1cGxpY2F0aW9uLCBkaXNjbG9zdXJlLCBkaXN0cmlidXRpb24sIG9y
IHVzZSBvZiB0aGlzIGUtbWFpbCANCihhbmQvb3IgaXRzIGF0dGFjaG1lbnRzKSBvciBhbnkgcGFy
dCB0aGVyZW9mIGlzIHByb2hpYml0ZWQuIElmIHlvdSByZWNlaXZlIA0KdGhpcyBlLW1haWwgaW4g
ZXJyb3IsIHBsZWFzZSBub3RpZnkgdXMgaW1tZWRpYXRlbHkgYW5kIGRlbGV0ZSB0aGlzIG1haWwg
YXMgDQp3ZWxsIGFzIGl0cyBhdHRhY2htZW50KHMpIGZyb20geW91ciBzeXN0ZW0uIEluIGFkZGl0
aW9uLCBwbGVhc2UgYmUgDQppbmZvcm1lZCB0aGF0IGNvbGxlY3Rpb24sIHByb2Nlc3NpbmcsIGFu
ZC9vciB1c2Ugb2YgcGVyc29uYWwgZGF0YSBpcyANCnByb2hpYml0ZWQgdW5sZXNzIGV4cHJlc3Ns
eSBwZXJtaXR0ZWQgYnkgcGVyc29uYWwgZGF0YSBwcm90ZWN0aW9uIGxhd3MuIA0KVGhhbmsgeW91
IGZvciB5b3VyIGF0dGVudGlvbiBhbmQgY29vcGVyYXRpb24uDQoNCk1hY3Jvbml4IEludGVybmF0
aW9uYWwgQ28uLCBMdGQuDQoNCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KDQoNCg0KPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQ0KDQpDT05GSURFTlRJQUxJVFkgTk9URToNCg0KVGhpcyBlLW1haWwgYW5kIGFueSBhdHRhY2ht
ZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24gYW5kL29yIHBlcnNvbmFs
IGRhdGEsIHdoaWNoIGlzIHByb3RlY3RlZCBieSBhcHBsaWNhYmxlIGxhd3MuIFBsZWFzZSBiZSBy
ZW1pbmRlZCB0aGF0IGR1cGxpY2F0aW9uLCBkaXNjbG9zdXJlLCBkaXN0cmlidXRpb24sIG9yIHVz
ZSBvZiB0aGlzIGUtbWFpbCAoYW5kL29yIGl0cyBhdHRhY2htZW50cykgb3IgYW55IHBhcnQgdGhl
cmVvZiBpcyBwcm9oaWJpdGVkLiBJZiB5b3UgcmVjZWl2ZSB0aGlzIGUtbWFpbCBpbiBlcnJvciwg
cGxlYXNlIG5vdGlmeSB1cyBpbW1lZGlhdGVseSBhbmQgZGVsZXRlIHRoaXMgbWFpbCBhcyB3ZWxs
IGFzIGl0cyBhdHRhY2htZW50KHMpIGZyb20geW91ciBzeXN0ZW0uIEluIGFkZGl0aW9uLCBwbGVh
c2UgYmUgaW5mb3JtZWQgdGhhdCBjb2xsZWN0aW9uLCBwcm9jZXNzaW5nLCBhbmQvb3IgdXNlIG9m
IHBlcnNvbmFsIGRhdGEgaXMgcHJvaGliaXRlZCB1bmxlc3MgZXhwcmVzc2x5IHBlcm1pdHRlZCBi
eSBwZXJzb25hbCBkYXRhIHByb3RlY3Rpb24gbGF3cy4gVGhhbmsgeW91IGZvciB5b3VyIGF0dGVu
dGlvbiBhbmQgY29vcGVyYXRpb24uDQoNCk1hY3Jvbml4IEludGVybmF0aW9uYWwgQ28uLCBMdGQu
DQoNCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
