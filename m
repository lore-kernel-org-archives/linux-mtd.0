Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5589D59F6C
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2024 19:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=21pHVseYRHzPrdQhSTIuAFvQXjyna64yMHy3Vp5kyN8=; b=ZhkQd2pJlYtg2a
	mo4DFSNMR+dUoVVtfitvbgxwV3OFPrT+k0Gbk37oDTb/ab8QGY8pyI3wGugVxGlb/g8xkTcZNkFyA
	audFCABDn8Y5+8nMNKe0jwcZAzgX/X1dZrx/f717jVykvOQXmiM6HEdgk5N1c5rCgu7QTprCF1OEI
	QzQsXvnuM7SrWaUPJjufHQgPMyHzfJLDTzG5KahUaorWLG194VZsfPE05B9hE4mSoBYPaA7YXH44W
	o0RaGsIdiXJNG0RoW602D0Y+kiMGxgnD9ltF0s5SSq6u2KQmynNmMmoX4kJnTMk+ygPANytOtT0bt
	XivEED0HFDt+RGhIKENA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lx6-00000004ZlK-1tYu;
	Wed, 06 Nov 2024 19:44:28 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lrs-00000004Xxw-2a5I
	for linux-mtd@lists.infradead.org;
	Wed, 06 Nov 2024 19:39:07 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id B0AB62C01F6;
	Thu,  7 Nov 2024 08:38:58 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1730921938;
	bh=0yMXJ3amPkiTYtjDbP6sDDDoFte7LfJTl96OJZnq0QY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=yNSkz/VVZNIzd38tOD9TA3rHugD/gTWnpjGlBCybjTTqn5tY615oySThaKEYRXqDM
	 ljUAMoNlWhhbrtFEl7RoI49Uh3SvHzWLBg41cA3u3C01GAZpEPWE5lKKEnPCztXcvZ
	 f9mLwGneA6ZFK8nLU+X+AZL9R8h/Kjtmlk27XzBBnrQObkKqbm6SawPyV59L9FMRJN
	 e/f6IVEUNZR71B/cXaxgnLi1XCW5ozU/SUkF1CycDlHIE7Xntp/imVHLyf4CkafTCI
	 8Yn04mYeO49EFnZKROahJOmo2/LSbGA9vShFo2pGUwkWpI3DzjnwShdm6Pr8olx9Yv
	 SI1CiD2dRJgHQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B672bc5d20000>; Thu, 07 Nov 2024 08:38:58 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Thu, 7 Nov 2024 08:38:58 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.48; Thu, 7 Nov 2024 08:38:46 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Thu, 7 Nov 2024 08:38:46 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: ubifs_recover_master_node: failed to recover master node
Thread-Topic: ubifs_recover_master_node: failed to recover master node
Thread-Index: AQHbKZq96Tx6yEKYG0Wljc12ck8PQ7Kqb/M4//9p5YA=
Date: Wed, 6 Nov 2024 19:38:45 +0000
Message-ID: <2aadcbb0-298c-4b60-9d6f-a1b55f23de2b@alliedtelesis.co.nz>
References: <7eaf332e-9439-4d4c-a2ea-d963e41f44f2@alliedtelesis.co.nz>
 <87jzdgjrxw.fsf@bootlin.com>
In-Reply-To: <87jzdgjrxw.fsf@bootlin.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-ID: <38D079CB9521194784CA57B05BDE1B83@atlnz.lc>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=672bc5d2 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=VwQbUJbxAAAA:8 a=aDF-memnnrlVHBypX7IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_113905_341573_E12E4824 
X-CRM114-Status: GOOD (  21.49  )
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

SGkgTWlxdWVsLA0KDQpPbiA3LzExLzI0IDA0OjM1LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOg0KPiBI
aSBDaHJpcywNCj4NCj4gT24gMjkvMTAvMjAyNCBhdCAxMzozNzozMSArMTMsIENocmlzIFBhY2to
YW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4gd3JvdGU6DQo+DQo+PiBIaSwN
Cj4+DQo+PiBJIHJlY2VudGx5IGFkZGVkIHN1cHBvcnQgZm9yIHRoZSBTUEktTkFORCBjb250cm9s
bGVyIG9uIHRoZSBSVEw5MzAyQyBTb0NbMV0uIEkgZGlkIG1vc3Qgb2YgdGhlIHdvcmsgYWdhaW5z
dCBMaW51eCA2LjExDQo+PiBhbmQgaXQncyB3b3JraW5nIGZpbmUgdGhlcmUuIEkgcmVjZW50bHkg
cmViYXNlZCBhZ2FpbnN0IHRoZSB0aXAgb2YgTGludXMncyB0cmVlICg2LjEyLXJjNSkgYW5kIGZv
dW5kIEkgd2FzIGdldHRpbmcgdWJpZnMNCj4+IGVycm9ycyB3aGVuIG1vdW50aW5nOg0KPj4NCj4+
IFsgICAgMS4yNTUxOTFdIHNwaS1uYW5kIHNwaTEuMDogTWFjcm9uaXggU1BJIE5BTkQgd2FzIGZv
dW5kLg0KPj4gWyAgICAxLjI2MTI4M10gc3BpLW5hbmQgc3BpMS4wOiAyNTYgTWlCLCBibG9jayBz
aXplOiAxMjggS2lCLCBwYWdlIHNpemU6IDIwNDgsIE9PQiBzaXplOiA2NA0KPj4gWyAgICAxLjI3
MTEzNF0gMiBmaXhlZC1wYXJ0aXRpb25zIHBhcnRpdGlvbnMgZm91bmQgb24gTVREIGRldmljZSBz
cGkxLjANCj4+IFsgICAgMS4yNzgyNDddIENyZWF0aW5nIDIgTVREIHBhcnRpdGlvbnMgb24gInNw
aTEuMCI6DQo+PiBbICAgIDEuMjgzNjMxXSAweDAwMDAwMDAwMDAwMC0weDAwMDAwZjAwMDAwMCA6
ICJ1c2VyIg0KPj4gWyAgIDIwLjQ4MTEwOF0gMHgwMDAwMGYwMDAwMDAtMHgwMDAwMTAwMDAwMDAg
OiAiUmVzZXJ2ZWQiDQo+PiBbICAgNzIuMjQwMzQ3XSB1YmkwOiBzY2FubmluZyBpcyBmaW5pc2hl
ZA0KPj4gWyAgIDcyLjI3MDU3N10gdWJpMDogYXR0YWNoZWQgbXRkMyAobmFtZSAidXNlciIsIHNp
emUgMjQwIE1pQikNCj4+IFsgICA3Mi4yNzY4MTVdIHViaTA6IFBFQiBzaXplOiAxMzEwNzIgYnl0
ZXMgKDEyOCBLaUIpLCBMRUIgc2l6ZTogMTI2OTc2IGJ5dGVzDQo+PiBbICAgNzIuMjg0NTM3XSB1
YmkwOiBtaW4uL21heC4gSS9PIHVuaXQgc2l6ZXM6IDIwNDgvMjA0OCwgc3ViLXBhZ2Ugc2l6ZSAy
MDQ4DQo+PiBbICAgNzIuMjkyMTMyXSB1YmkwOiBWSUQgaGVhZGVyIG9mZnNldDogMjA0OCAoYWxp
Z25lZCAyMDQ4KSwgZGF0YSBvZmZzZXQ6IDQwOTYNCj4+IFsgICA3Mi4yOTk4ODVdIHViaTA6IGdv
b2QgUEVCczogMTkyMCwgYmFkIFBFQnM6IDAsIGNvcnJ1cHRlZCBQRUJzOiAwDQo+PiBbICAgNzIu
MzA2Njg5XSB1YmkwOiB1c2VyIHZvbHVtZTogMSwgaW50ZXJuYWwgdm9sdW1lczogMSwgbWF4LiB2
b2x1bWVzIGNvdW50OiAxMjgNCj4+IFsgICA3Mi4zMTQ3NDddIHViaTA6IG1heC9tZWFuIGVyYXNl
IGNvdW50ZXI6IDEvMCwgV0wgdGhyZXNob2xkOiA0MDk2LCBpbWFnZSBzZXF1ZW5jZSBudW1iZXI6
IDI1MjY0MjIzMA0KPj4gWyAgIDcyLjMyNDg1MF0gdWJpMDogYXZhaWxhYmxlIFBFQnM6IDAsIHRv
dGFsIHJlc2VydmVkIFBFQnM6IDE5MjAsIFBFQnMgcmVzZXJ2ZWQgZm9yIGJhZCBQRUIgaGFuZGxp
bmc6IDQwDQo+PiBbICAgNzIuMzcwMTIzXSB1YmkwOiBiYWNrZ3JvdW5kIHRocmVhZCAidWJpX2Jn
dDBkIiBzdGFydGVkLCBQSUQgMTQxDQo+PiBbICAgNzIuNDcwNzQwXSBVQklGUyAodWJpMDowKTog
TW91bnRpbmcgaW4gdW5hdXRoZW50aWNhdGVkIG1vZGUNCj4+IFsgICA3Mi40OTAyNDZdIFVCSUZT
ICh1YmkwOjApOiBiYWNrZ3JvdW5kIHRocmVhZCAidWJpZnNfYmd0MF8wIiBzdGFydGVkLCBQSUQg
MTQ0DQo+PiBbICAgNzIuNTI4MjcyXSBVQklGUyBlcnJvciAodWJpMDowIHBpZCAxNDMpOiB1Ymlm
c19yZWNvdmVyX21hc3Rlcl9ub2RlOiBmYWlsZWQgdG8gcmVjb3ZlciBtYXN0ZXIgbm9kZQ0KPj4g
WyAgIDcyLjU1MDEyMl0gVUJJRlMgKHViaTA6MCk6IGJhY2tncm91bmQgdGhyZWFkICJ1Ymlmc19i
Z3QwXzAiIHN0b3BzDQo+PiBbICAgNzIuNzEwNzIwXSBVQklGUyAodWJpMDowKTogTW91bnRpbmcg
aW4gdW5hdXRoZW50aWNhdGVkIG1vZGUNCj4+IFsgICA3Mi43MTc0NDddIFVCSUZTICh1YmkwOjAp
OiBiYWNrZ3JvdW5kIHRocmVhZCAidWJpZnNfYmd0MF8wIiBzdGFydGVkLCBQSUQgMTQ5DQo+PiBb
ICAgNzIuNzc3NjAyXSBVQklGUyBlcnJvciAodWJpMDowIHBpZCAxNDgpOiB1Ymlmc19yZWNvdmVy
X21hc3Rlcl9ub2RlOiBmYWlsZWQgdG8gcmVjb3ZlciBtYXN0ZXIgbm9kZQ0KPj4gWyAgIDcyLjc4
Nzc5Ml0gVUJJRlMgKHViaTA6MCk6IGJhY2tncm91bmQgdGhyZWFkICJ1Ymlmc19iZ3QwXzAiIHN0
b3BzDQo+Pg0KPj4gRnVsbCBkbWVzZyBvdXRwdXQgaXMgYXRbMl0NCj4+DQo+PiBnaXQgYmlzZWN0
IGxlYWQgbWUgdG8gY29tbWl0IDExODEzODU3ODY0ZiAoIm10ZDogc3BpLW5hbmQ6IG1hY3Jvbml4
OiBDb250aW51b3VzIHJlYWQgc3VwcG9ydCIpLiBSZXZlcnRpbmcgdGhlIGJsYW1lZA0KPj4gY29t
bWl0IGZyb20gNi4xMi1yYzUgc2VlbXMgdG8gYXZvaWQgdGhlIHByb2JsZW0uIFRoZSBmbGFzaCBj
aGlwIG9uIG15IGJvYXJkIGlzIGEgTVgzMExGMkcyOEFELVRJLiBJJ20gbm90IHN1cmUgaWYgdGhl
cmUNCj4+IGlzIGEgcHJvYmxlbSB3aXRoIDExODEzODU3ODY0ZiBvciB3aXRoIG15IHNwaS1tZW0g
ZHJpdmVyIHRoYXQgaXMNCj4+IGV4cG9zZWQgYWZ0ZXIgc3VwcG9ydCBmb3IgY29udGludW91cyBy
ZWFkIGlzIGVuYWJsZWQuDQo+IENyYXAuIEkgaGFkIGEgbG9vaywgYW5kIFRCSCBJIGRvbid0IGtu
b3cuIFRoZSBvbmx5IHRoaW5nIEkgc2VlIGluIHlvdXINCj4gZHJpdmVyIG1pZ2h0IGJlIHRoZSBE
TUEgdnMgUElPIGNob2ljZS4gQ291bGQgeW91IHRyeSB0byBhbHdheXMgcmV0dXJuDQo+IGZhbHNl
IGZyb20gcnRsX3NuYW5kX2RtYV9vcCgpPw0KDQpJdCB0dXJuZWQgb3V0IHRoZSBsaW1pdGF0aW9u
IHdhcyBpbiBteSBETUEgc3VwcG9ydC4gV2l0aCB0aGUgZml4IGZvciANCnRoYXRbMV0geW91ciBj
aGFuZ2VzIGFyZSBmaW5lLiBJJ20gYSBsaXR0bGUgc3VycHJpc2VkIEkgbmV2ZXIgaGl0IA0KcHJv
YmxlbXMgd2l0aCBETUEgcHJpb3IgdG8gdGhlIGNvbnRpbnVvdXMgcmVhZCBjaGFuZ2VzIGJ1dCBJ
IGd1ZXNzIHRoZSANCnBhZ2UgcmVhZHMgd291bGQgaGF2ZSBiZWVuIHVuZGVyIHRoZSBsaW1pdCBh
bmQgbXkgdGVzdGluZyBwcm9iYWJseSANCmRpZG4ndCB0cmlnZ2VyIGEgYmlnIGVub3VnaCB3cml0
ZS4NCg0KPiBIb3dldmVyIHlvdSBzYXkgeW91J3JlIHVzaW5nIGFuIE1YMzAqIGRldmljZSwgdGhp
cyBpcyBhIHJhdyBOQU5EIGNoaXAsDQo+IFNQSS1OQU5EIGNoaXBzIGFyZSBJIGJlbGlldmUgc3Rh
cnRpbmcgd2l0aCBNWDM1KiBpbiB0aGVpciBJRHMsIG5vPw0KSSB0aGluayBJIGNvcGllZCB0aGF0
IHBhcnQgbnVtYmVyIG9mZiB0aGUgd3JvbmcgZGF0YXNoZWV0IGluIG15IHVuc29ydGVkIA0KRG93
bmxvYWRzIGRpcmVjdG9yeS4gVGhlIHNjaGVtYXRpYyBmb3IgdGhlIGJvYXJkIEkgaGF2ZSBzYXlz
IA0KTVgzNUxGMkdFNEFELVo0IGFuZCB0aGUgY29ycmVjdCBkYXRhc2hlZXQgaGFzIGFsbCB0aGUg
cmlnaHQgdGhpbmdzIGFib3V0IA0KU1BJLU5BTkQgYW5kIGNvbnRpbnVvdXMgcmVhZC4NCj4NCj4g
VGhhbmtzLA0KPiBNaXF1w6hsDQoNCg0KWzFdIC0gDQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9icm9vbmllL3NwaS5naXQvY29tbWl0Lz9pZD0yNWQyODQ3
MTU4NDVhNDY1YTFhMzY5M2EwOWNmOGI2YWI4YmQ5Y2FmDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
