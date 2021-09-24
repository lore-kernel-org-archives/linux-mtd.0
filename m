Return-Path: <SRS0=s2V4=OO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B899C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Sep 2021 07:07:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D43F860F41
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Sep 2021 07:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D43F860F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CLsdGHaaPVVI8CPjt1UV4WrVf7V8x+Yghs+NDp/1UY8=; b=xOwi4BL2aVPlpp
	6ITuiqJPG+jF03ozJdAfRZOg3d+j1s+OrP1nGSUPIv8eFVTHcROQBEgxtOcGuX4bHW9e+i40OfKaD
	xtJLSX3FdiR1UH0yaGD/2fMvIrkO8yYf9CMamGLOtFF2meRvS+80Qy53DaZB5vkyUwfnKiyuR78kU
	aw++J4UNtO0fLCpJh7Ndrb6uX/UhNBcroQDXwH2UiNG5G1rTtIYn6DCEB1Yw9BOztsOhbyk0emCHy
	lX0XonIe44VRfEjcMRjdbbAuttz8hyhhwUCPF3jzUFHlttSFmr6HPora+yxWj9wrB+BYvUYzg7UTC
	+VijQz/yn+4r4XHNwg9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTfHM-00DF0z-DW; Fri, 24 Sep 2021 07:05:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTfHH-00DF0W-AH; Fri, 24 Sep 2021 07:05:50 +0000
X-UUID: 02589f43cb624a37b024b29e9027f1ad-20210924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=+T9fSPnDxhMPA7wZqz8M6KQfJaH1DE/LVFGszfshQGU=; 
 b=StnamuE9i/HpUb8ipYG58Xobh4uVIooBg2ycSaHbjUky1JD8266K81SlwlEazOfY5xLLXJFUfyCE3NYPs4mBi7ZbhBTm2q7jbLlSyVNSjWFyoQobwB3wT1DY5WAiH360ow0vRlf+bQvhqUieI1sXgVLAoSaKRL8YZLYief5AAUA=;
X-UUID: 02589f43cb624a37b024b29e9027f1ad-20210924
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <xiangsheng.hou@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 778956115; Fri, 24 Sep 2021 00:05:41 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Sep 2021 00:05:39 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 24 Sep 2021 15:05:38 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Sep 2021 15:05:37 +0800
Message-ID: <f8f837ad3e4f4e6a3aead2d56b26812635231407.camel@mediatek.com>
Subject: Re: Mediatek SPI Nand controller driver design for upstream
From: xiangsheng.hou <xiangsheng.hou@mediatek.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Benliang Zhao =?UTF-8?Q?=28=E8=B5=B5=E6=9C=AC=E4=BA=AE=29?=
 <Benliang.Zhao@mediatek.com>, Dandan He
 =?UTF-8?Q?=28=E4=BD=95=E4=B8=B9=E4=B8=B9=29?= <dandan.he@mediatek.com>,
 Guochun Mao =?UTF-8?Q?=28=E6=AF=9B=E5=9B=BD=E6=98=A5=29?=
 <Guochun.Mao@mediatek.com>, Bin Zhang =?UTF-8?Q?=28=E7=AB=A0=E6=96=8C=29?=
 <bin.zhang@mediatek.com>, "info@bootlin.com" <info@bootlin.com>, "Lee, Rob"
 <rdlee@amazon.com>, Sanny Chen =?UTF-8?Q?=28=E9=99=B3=E6=96=AF=E5=AF=97=29?=
 <Sanny.Chen@mediatek.com>, "Dong, Hunter" <donghunt@amazon.com>, Mao Zhong
 =?UTF-8?Q?=28=E9=92=9F=E8=8C=82=29?= <Mao.Zhong@mediatek.com>, Yingjoe Chen
 =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?= <Yingjoe.Chen@mediatek.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Xiangsheng Hou =?UTF-8?Q?=28=E4=BE=AF=E7=A5=A5=E8=83=9C=29?=
 <Xiangsheng.Hou@mediatek.com>
Date: Fri, 24 Sep 2021 15:05:39 +0800
In-Reply-To: <SG2PR03MB4565B0B2724EA7A0F3F3A9ECF9CD9@SG2PR03MB4565.apcprd03.prod.outlook.com>
References: <7657953e8f5948b1959124e8f13ed1d1@MTKMBS31N1.mediatek.inc>
 <20210622230925.2c4f535a@xps13>
 <65cadbd0c9a34cc6bcf0f3216f983ef2@MTKMBS31N1.mediatek.inc>
 <20210630134353.5b5d65f3@xps13>
 <e6a457fdef0f40789c1d375ba8129199@MTKMBS31N1.mediatek.inc>
 <20210823173235.214228d1@xps13>
 <SG2PR03MB4565B0B2724EA7A0F3F3A9ECF9CD9@SG2PR03MB4565.apcprd03.prod.outlook.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_000547_394967_488133EA 
X-CRM114-Status: GOOD (  25.35  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

UmV0aXRsZQ0KDQpIaSBNaXF1ZWwsDQoNCkFzIHRhbGtlZCBiZWZvcmUsIEkgZGV2ZWxvcGVkIHRo
ZSAxc3QgZHJpdmVyIGZvciBNZWRpYXRlayBTUEkgTmFuZA0KY29udHJvbGxlci4gSG93ZXZlciwg
dGhlcmUgaGF2ZSBwZXJmb3JtYW5jZSBpc3N1ZSBpbiAxc3QgdmVyc2lvbihyZWFkDQpzcGVlZCBy
ZWR1Y2UgNDIlIGFuZCB3cml0ZSBzcGVlZCByZWR1Y2UgMTUlKS4NCg0KVGhlIGNvbnRyb2xsZXIg
Y29uc2lzdHMgb2YgdHdvIHBhcnRzIHNuZmkoc3RhbmQgZm9yIHNlcmlhbCBuYW5kIGZsYXNoDQpp
bnRlcmZhY2UpIGZvciBzcGltIGFuZCBodyBlY2MgZm9yIGdlbmVyaWMgZWNjIGVuZ2luZS4gVGhl
eSBjYW4gY293cm9rDQpvciB3b3JrIGluZGVwZW5kZW50Lg0KDQpUaGUgMXN0IGRyaXZlciByZWFs
aXplZCBpbiB0aGUgd2F5IG9mIHdvcmtpbmcgaW5kZXBlbmRlbnRseSwgZHVlIHRvIHRoZQ0KY293
b3JrIG5lZWQgZ2V0IG5hbmQgcGFyYW1ldGVyKHBhZ2Ugc2l6ZSBhbmQgc3BhcmUgc2l6ZSkgZm9y
IHNuZmkgYW5kDQpodyBlY2MuIEhvd2V2ZXIsIHRoZSBzbmZpIGluIHNwaSBzdWJzeXN0ZW0gc2Vl
bXMgZGlmZmljdWx0IHRvIGdldCBuYW5kDQpwYXJhbWV0ZXIuDQoNClRoZXJlZm9yZSwgSSB0aG91
Z2h0IG9mIHR3byB3YXlzIGxldCBzbmZpIGluIHNwaSBzdWJzeXN0ZW0gZ2V0IG5hbmQNCnBhcmFt
ZXRlciB0byBpbXByb3ZlIHBlcmZvcm1hbmNlLg0KDQoxKSBFeHBvcnQgc29tZSBmdW5jdGlvbiBp
biBtZWRpYXRlayBodyBlY2MgZHJpdmVyLiBBbmQgY2FsbGVkIGJ5IHNuZmkNCmRyaXZlciBpbiBz
cGkgc3Vic3lzdGVtIHRvIGxldCBzbmZpIGdldCBuYW5kIHBhcmFtZXRlciBhbmQgZWNjIGRpc2Fi
bGUNCm9yIG5vdC4NCg0KMikgQWRkIHNuZmkgcmVnIGluIGVjYyBkdHMgbm9kZSwgY29uZmlnIHNu
ZmkgcmVncyhnZXQgYnkgb2ZfaW9tYXApIHdpdGgNCm5hbmQgcGFyYW1ldGVyIGluIGh3IGVjYyBk
cml2ZXIuIEFuZCBzbmZpIGRyaXZlciBwYXJzZSBuYW5kIHBhcmFtZXRlcg0KaW4gc25maSByZWdz
IHRvIHVzZS4NCg0KTWF5IEkgaGF2ZSB5b3VyIG9waW5pb24gYWJvdXQgd2hldGhlciB0aGV5IGFy
ZSBzdWl0YWJsZSBhbmQgd2hpY2ggbWF5YmUNCmJldHRlci4NCg0KVGhhbmtzDQoNCk9uIFdlZCwg
MjAyMS0wOS0wMSBhdCAxODoyMCArMDgwMCwgWGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCkgd3Jv
dGU6DQo+IEhpIE1pcXVlbCwNCj4gDQo+ID4gQWN0dWFsbHkgSSBkb24ndCBoYXZlIHRoZSB0aW1l
IHRvIGRpZyBpbnRvIHRoaXMgcHJvYmxlbSwgd291bGQgeW91DQo+ID4gbWluZCBwcm9wb3Npbmcg
YSBwYXRjaCBvbiB0aGUgbWFpbGluZyBsaXN0PyBPciBtYXliZSBpZiB5b3UgZG9uJ3QNCj4gPiBo
YXZlIHRoZSByZXNvdXJjZXMgaW50ZXJuYWxseSB3ZSBjb3VsZCBvcGVuIGEgY29udHJhY3RpbmcN
Cj4gPiBkaXNjdXNzaW9uPw0KPiANCj4gSWBtIGNvZGluZyBhbmQgdGVzdGluZyBiYXNlZCBvbiBN
ZWRpYXRlayBTUEkgTmFuZCBjb250cm9sbGVyIGJ5IHNvbWUNCj4gd29ya2Fyb3VuZCB3aXRoIHRo
ZSBhdXRvIG9vYiBpc3N1ZSBmb3Igbm93LiAgDQo+IEkgd2lsbCBjaGVjayB0aGUgaXNzdWUgdGhv
cm91Z2hseSwgYnV0IHVzZSBIVyBFQ0Mgb24gbXkgYm9hcmQuDQo+IA0KPiBJbiBhZGRpdGlvbiwg
IEkgZm91bmQgcGVyZm9ybWFuY2UgaXNzdWUgd2hlbiBmb3JjZSBNZWRpYXRlayBTUEkgTmFuZA0K
PiBjb250cm9sbGVyIGZpdCB0byBjdXJyZW50IEVDQyAmIFNQSSBOYW5kICAmIFNQSSBNZW0gZnJh
bWV3b3JrLg0KPiANCj4gMS4gSW50cm9kdWN0aW9uIGFib3V0IE1lZGlhdGVrIFNQSSBOYW5kIGNv
bnRyb2xsZXINCj4gVGhlIE1lZGlhdGVrIFNQSSBOYW5kIGNvbnRyb2xsZXIgY29uc2lzdHMgb2Yg
dHdvIHBhcnRzIEhXIEVDQyBhbmQgbmZpDQo+IChzdGFuZCBmb3IgbmFuZCBmbGFzaCBpbnRlcmZh
Y2UpDQo+IFRoZSBIVyBFQ0MgaGF2ZSAzIHNvdXJjZSBkYXRhIG1vZGU6DQo+IDEpIHBpbyBtb2Rl
OiBtZWFucyBzb3VyY2UgZGF0YSBpcyB3cml0dGVuIGJ5IE1DVQ0KPiAyKSBkbWEgbW9kZTogbWVh
bnMgc291cmNlIGRhdGEgZnJvbSBBSEIgQnVzDQo+IDMpIG5maSBtb2RlOiBtZWFucyBzb3VyY2Ug
ZGF0YSBmcm9tIE5GSSBtb2R1bGUsIGNhbiBhdXRvbWF0aWNhbGx5DQo+IGdlbmVyYXRlIEVDQyBz
eW5kcm9tZSBiaXRzIHdoZW4gcHJvZ3JhbW1pbmcgb3IgcmVhZGluZyB0aGUgZGV2aWNlLg0KPiAN
Cj4gMi4gRUNDIG5maSBtb2RlICYgZG1hIG1vZGUgZGF0YSBmbG93DQo+IDEpIGRtYSBtb2RlIChy
ZWFkIGZsb3cgZm9yIGV4YW1wbGUpDQo+IA0KPiBUaGUgSFcgRUNDIGVuZ2luZSBnZXQgc291cmNl
IGRhdGEgYWZ0ZXIgdGhlIG5maSBlbmdpbmUgZ2V0IGRhdGEgZnJvbQ0KPiBuYW5kIGRldmljZS4g
QW5kLCB0aGUgSFcgRUNDIGVuZ2luZSBkZWNvZGUvZW5jb2RlIGRhdGEgYnkgc2VjdG9yIGZvcg0K
PiBlYWNoLg0KPiANCj4gMiluZmkgbW9kZShyZWFkIGZsb3cgZm9yIGV4YW1wbGUpDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgDQo+IFRoZSBuZmkgYW5kIEhXIEVDQyBjYW4gY29vcGVy
YXRpb24gd2l0aCBIVyBzaGFyZSBidWYgaW4gbmZpIG1vZGUNCj4gd2l0aG91dCBhbm90aGVyIGRt
YSB0cmFuc2Zlci4gDQo+IEhXIEVDQyBjYW4gZ2V0IHNvdXJjZSBkYXRhIGFuZCBkZWNvZGUvZW5j
b2RlIGR1cmluZyBuZmkgZGF0YQ0KPiB0cmFuc21pc3Npb24gZnJvbSBuYW5kIGRldmljZS4NCj4g
QW5kLCB0aGUgSFcgRUNDIGVuZ2luZSBkZWNvZGUvZW5jb2RlIGJ5IHNlY3RvciBpbiBwaXBlbGlu
ZS4NCj4gDQo+IDMuIEN1cnJlbnQgZHJpdmVyIGltcGxlbWVudGF0aW9uDQo+IE1vZGUgMSkgJiAy
KSBtZWFucyB0aGUgSFcgRUNDIGVuZ2luZSBjYW4gd29yayBpbmRlcGVuZGVudCB0byBuZmkNCj4g
ZW5naW5lLiBIVyBFQ0MgcmVzcG9uc2libGUgZm9yIGRhdGEgZW5jb2RlL2RlY29kZS4gbmZpIHJl
c3BvbnNpYmxlDQo+IGZvciBkYXRhIHRyYW5zZmVyLg0KPiBUaGVzZSBsb29rIGxpa2UgY2FuIGZp
dCB0byBjdXJyZW50IFNQSSBOYW5kIGZyYW1ld29yay4gVGhlIEhXIEVDQw0KPiBkcml2ZXIgcmVh
bGl6ZSB0aGUgZWNjIGVuZ2luZSBhdCBtdGQgbGF5ZXIsIHRoZSBuZmkgcmVhbGl6ZSBzcGkNCj4g
ZHJpdmVyIGF0IHNwaSBsYXllci4NCj4gT2YgY291cnNlLCB0aGUgZWNjIGRyaXZlciBjaG9vc2Ug
dGhlIG1vZGUgMikgZG1hIG1vZGUgZm9yIGhpZ2gNCj4gcGVyZm9ybWFuY2UuDQo+IA0KPiA0LlBl
cmZvcm1hbmNlIGNvbXBhcmlzb24NCj4gSG93ZXZlciwgdGhlIGVjYyBhbmQgbmZpIGRyaXZlciB3
aGljaCBmaXQgdG8gdXBzdHJlYW0gZnJhbWV3b3JrIGhhdmUNCj4gcG9vciBwZXJmb3JtYW5jZSBj
b21wYXJlIHdpdGggdGhlIGRyaXZlcihwcml2YXRlIGRyaXZlciBkaXJlY3QNCj4gcmVhbGl6ZSBt
dGQgZnVuY3Rpb24gKSB1c2UgRUNDIG5maSBtb2RlIHdoaWNoIG5vdCBmaXQgZnJhbWV3b3JrLg0K
PiBUYWtlIHNvbWUgcGVyZm9ybWFuY2UgaW5mb3JtYXRpb24gdGVzdGVkIGJ5IG10ZF9zcGVlZHRl
c3QsIHJlYWQgc3BlZWQNCj4gcmVkdWNlIDQyJSBhbmQgd3JpdGUgc3BlZWQgcmVkdWNlIDE1JS4N
Cj4gDQo+IE1heSBJIGhhdmUgeW91ciBzb21lIHN1Z2dlc3Rpb24gZm9yIHRoZSBwZXJmb3JtYW5j
ZSBpc3N1ZSB3aXRoIHRoZQ0KPiByZWFsaXphdGlvbiBvZiBNZWRpYXRlayBTUEkgTmFuZCBjb250
cm9sbGVyIGRyaXZlci4NCj4gDQo+IFRoYW5rcw0KPiBYaWFuZ3NoZW5nIEhvdQ0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
