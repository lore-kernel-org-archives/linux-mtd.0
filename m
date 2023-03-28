Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073AEC76196
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 16:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3CTe9rX69vUHLAYCvJFCblYpKw8qwjHyVihsvNNeF6Y=; b=y/1ktY1RJ/SyaG
	xGI0wERlm2FiwfzVmHp7mGeMh6uRpVpy8f8PuLcwQN1YILKsD7ucIFQHwfdBD+ifsvFJKTZn9+rkU
	eZvM8iTzXZPzurdsKns0Bhx1gPBxxOesnX1XYmM6tePue8fxPqZglZUtTUVIN2w9vpQTfPhWwpUK9
	6TW/uf5k9j8tLELokvmD95UJKAMK8z3jdHupHsE+wpuV8MBLj4t5b8mR4Qd67Sf2rbQahFBKgJFeH
	pHkm9bozoJx3LFiBZr8SE/if3sJ43s7Ml9ahV2Bcq9y7F84qmaYbGXFOhO1KOGE+izgCs40lMuqa1
	t9TuTbKEXfCT+k/eT/UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phCSC-00FAru-2P;
	Tue, 28 Mar 2023 16:45:48 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phCS8-00FAqM-2k;
	Tue, 28 Mar 2023 16:45:46 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 19A7940005;
	Tue, 28 Mar 2023 16:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680021940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XMaA61+6AHp7BC6qLnPWLcrPDv2jJqnr+AmQBcAW7dE=;
	b=UXXXi+pXSuQ7TvvKTvf78klwtkOOAslKorGHLHYmk9hOjwmwuOHfOTrWeL0kR1LgvCJylF
	n4yCR2a0kBMqhgpCBj80F8Z7ptXTed9iJv0Ko+3dyYT5VHgK2ZXeXidnwWdAZZoNocFJA7
	A+M9vkkVOK0GRwtDJBgc1MZ1rl1hrmOv5CMlFlDivs6MVmBVCDU4cpvhm2VMpx4Y6LblVJ
	63cdBGUjgNEQCHjqE0l4y0I+LsbTZwIJtbOEMflDmUd/z/u4I4H1lM6mpG6QcuNsRWS9n2
	K488edCYsq6/hF3d3T+M2n13807oufdeyVN/QxQ2UKC4/Dqfy8FWoMoZzyG6ow==
Date: Tue, 28 Mar 2023 18:45:36 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>, Michael Walle
 <michael@walle.cc>, linux-mtd@lists.infradead.org, Julien Su
 <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>, Jaime Liao
 <jaimeliao.tw@gmail.com>, Alvin Zhou <alvinzhou@mxic.com.tw>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Michal Simek <monstr@monstr.eu>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 8/8] mtd: spi-nor: macronix: Add support for
 mx25uw51245g with RWW
Message-ID: <20230328184536.33f2f023@xps-13>
In-Reply-To: <8ade974e-eb68-f448-7ec5-91c6b636eacf@linaro.org>
References: <20230328154105.448540-1-miquel.raynal@bootlin.com>
	<20230328154105.448540-9-miquel.raynal@bootlin.com>
	<8ade974e-eb68-f448-7ec5-91c6b636eacf@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_094545_192872_C03F50A3 
X-CRM114-Status: GOOD (  20.72  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gVHVlLCAyOCBNYXIg
MjAyMyAxNzozMTo0NiArMDEwMDoKCj4gT24gMy8yOC8yMyAxNjo0MSwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiA+IERlc2NyaWJlIHRoaXMgbmV3IHBhcnQgYW5kIHByb3ZpZGUgdGhlIFJXVyBmbGFn
IGZvciBpdC4KPiA+IAo+ID4gVGhlcmUgaXMgbm8gcHVibGljIGRhdGFzaGVldCwgYnV0IGhlcmUg
YXJlIHRoZSBzZmRwIHRhYmxlcyBwbHVzIGJhc2UKPiA+IHRlc3RpbmcgdG8gc2hvdyBpdCB3b3Jr
cy4KPiA+IAo+ID4gbXgyNXV3NTEyNDVnCj4gPiBjMjgxM2EKPiA+IG1hY3Jvbml4Cj4gPiA1MzQ2
NDQ1MDA4MDEwNGZkMDAwNzAxMTQ0MDAwMDBmZjg3MDEwMTFjOTAwMDAwZmYwYTAwMDEwODAwMDEK
PiA+IDAwZmYwNTAwMDEwNTIwMDEwMGZmODQwMDAxMDIzNDAxMDBmZjAwMDAwMDAwMDAwMDAwMDBm
ZmZmZmZmZgo+ID4gZmZmZmZmZmZlNTIwOGFmZmZmZmZmZjFmMDBmZjAwZmYwMGZmMDBmZmVlZmZm
ZmZmZmZmZjAwZmZmZmZmCj4gPiAwMGZmMGMyMDEwZDgwMGZmMDBmZjg3NzkwMTAwODIxMjAwZTI3
NzA0Njc0NjMwYjAzMGIwZjRiZGQ1NWMKPiA+IDAwMDAwMGZmMTAxMDAwMjAwMDAwMDAwMDAwMDA3
Y2ExNDgwMDAwMDAwMDAwODg4ODAwMDAwMDAwMDAwMAo+ID4gMDA0MDBmZDFmZmYzMGZkMWZmZjMw
MDA1MDA5MDAwMDUwMGIxMDAyYjAwOTUwMDJiMDA5NjcyNzEwM2I4Cj4gPiA3MjcxMDNiODAwMDAw
MDAwOTBhMzE4ODIwMGMwNjk5NjAwMDAwMDAwMDAwMDAwMDA3MjcxMDA5ODcyNzEKPiA+IDAwYjg3
MjcxMDA5OTAwMDAwMDAwNzI3MTAwOTg3MjcxMDBmODcyNzEwMDk5NzI3MTAwZjkwMDAwMDAwMAo+
ID4gMDAwMDAwMDAwMTE1MDFkMDcyNzEwNmQ4MDAwMDg2NTAwMDAwMDYwMTAwMDAwMDAwMDIwMDAx
MDMwMDAyCj4gPiAwMDAwMDAwMDA2MDEwMDAwMDAwMDAwMDA3MjA2MDAwMjAwMDAwMGVlYzA2OTcy
NzI3MTcxMDBkOGY3ZjYKPiA+IDAwMGEwMDAwMTQ0NTk4ODA0MzA2MGYwMDIxZGNmZmZmCj4gPiAw
NDdhODg0Y2Y0NGQ5ZmZjMmE5NGQzYWIzN2I0OGM2MyAgL3N5cy9idXMvc3BpL2RldmljZXMvc3Bp
MC4wL3NwaS1ub3Ivc2ZkcCAgCj4gCj4gd2hpY2ggaGFzaCBhbGcgd2FzIHVzZWQsIHdhcyBpdCBz
aGExPyBObyBuZWVkIHRvIHJlc3VibW5pdCBqdXN0IGZvciB0aGlzLgoKQWN0dWFsbHkgZ2l0IGp1
c3QgaWdub3JlZCBhbGwgdGhlIGxpbmVzIHN0YXJ0aW5nIHdpdGggJyMnCmxpa2UgaWYgdGhleSB3
ZXJlIGNvbW1lbnRzIGFuZCBJIGRpZCBub3Qgbm90aWNlLi4uCgpJIHdpbGwgYW1lbmQgbXkgY29t
bWl0IGxvZ3MgYW5kIHJlc2VuZC4KCj4gPiAKPiA+IDYrMCByZWNvcmRzIGluCj4gPiA2KzAgcmVj
b3JkcyBvdXQKPiA+IENvcGllZCA2MjkxNDU2IGJ5dGVzIGZyb20gcXNwaV90ZXN0IHRvIGFkZHJl
c3MgMHgwMDAwMDAwMCBpbiBmbGFzaAo+ID4gRXJhc2VkIDYyOTE0NTYgYnl0ZXMgZnJvbSBhZGRy
ZXNzIDB4MDAwMDAwMDAgaW4gZmxhc2gKPiA+IENvcGllZCA2MjkxNDU2IGJ5dGVzIGZyb20gYWRk
cmVzcyAweDAwMDAwMDAwIGluIGZsYXNoIHRvIHFzcGlfcmVhZAo+ID4gMDAwMDAwMCBmZmZmIGZm
ZmYgZmZmZiBmZmZmIGZmZmYgZmZmZiBmZmZmIGZmZmYKPiA+ICoKPiA+IDA2MDAwMDAKPiA+IENv
cGllZCA2MjkxNDU2IGJ5dGVzIGZyb20gcXNwaV90ZXN0IHRvIGFkZHJlc3MgMHgwMDAwMDAwMCBp
biBmbGFzaAo+ID4gQ29waWVkIDYyOTE0NTYgYnl0ZXMgZnJvbSBhZGRyZXNzIDB4MDAwMDAwMDAg
aW4gZmxhc2ggdG8gcXNwaV9yZWFkCj4gPiBkMjRhOTUyM2RiODI5YTBkZjY4OGYzNGI4ZGM3NmEx
MzgzYjc0MDI0ICBxc3BpX3Rlc3QKPiA+IGQyNGE5NTIzZGI4MjlhMGRmNjg4ZjM0YjhkYzc2YTEz
ODNiNzQwMjQgIHFzcGlfcmVhZAo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFs
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9tdGQvc3Bp
LW5vci9tYWNyb25peC5jIHwgNCArKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9tYWNyb25peC5j
IGIvZHJpdmVycy9tdGQvc3BpLW5vci9tYWNyb25peC5jCj4gPiBpbmRleCA2ODUzZWM5YWU2NWQu
LmI2NWQ0MWU1Zjc0OSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9u
aXguYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9tYWNyb25peC5jCj4gPiBAQCAtODIs
NiArODIsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIG1hY3Jvbml4X25vcl9w
YXJ0c1tdID0gewo+ID4gIAl7ICJteDI1dTUxMjQ1ZyIsIElORk8oMHhjMjI1M2EsIDAsIDY0ICog
MTAyNCwgMTAyNCkKPiA+ICAJCU5PX1NGRFBfRkxBR1MoU0VDVF80SyB8IFNQSV9OT1JfRFVBTF9S
RUFEIHwgU1BJX05PUl9RVUFEX1JFQUQpCj4gPiAgCQlGSVhVUF9GTEFHUyhTUElfTk9SXzRCX09Q
Q09ERVMpIH0sCj4gPiArCXsgIm14MjV1dzUxMjQ1ZyIsIElORk9CKDB4YzI4MTNhLCAwLCAxNiAq
IDEwMjQsIDEwMjQsIDQpICAKPiAKPiBTZWN0b3Igc2l6ZSBhbmQgbnNlY3RvcnMgc2hhbGwgYmUg
ZGlzY292ZXJlZCBhdCBwYXJzZSBTRkRQIHRpbWUuCj4gRG9lcyBJTkZPQigweGMyODEzYSwgMCwg
MCwgMCwgNCkgd29yayBmb3IgeW91PwoKSSdsbCBjaGVjay4KCj4gCj4gPiArCQlQQVJTRV9TRkRQ
ICAKPiAKPiBZYWF5Cj4gCj4gPiArCQlGTEFHUyhTUElfTk9SX1JXVykKPiA+ICsJCUZJWFVQX0ZM
QUdTKFNQSV9OT1JfNEJfT1BDT0RFUykgfSwgIAo+IAo+IElzIFNQSV9OT1JfNEJfT1BDT0RFUyBm
bGFnIHJlYWxseSBuZWVkZWQ/CgpJIGhhdmUgbm8gaWRlYSwgSSB0b29rIHRoYXQgZnJvbSBvbGRl
ciBjb2RlLgoKSmFpbWUsIHdoYXQgZG8geW91IHRoaW5rPwoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
