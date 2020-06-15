Return-Path: <SRS0=kpjk=74=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA498C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jun 2020 10:19:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB6D0206B7
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jun 2020 10:19:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ow+8Lget"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB6D0206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zKvB2ijnO10CcIsfgyH1qae6b+qC1dut+LhwQMtw1mQ=; b=ow+8LgetZndECv
	9Dg/P4QTxEV8Y6BxczVSvYK84rAYJyx0kKY7VbL7EDLKpK94uZtRZvVDaDAV8+HXbYA35+lOqOYVJ
	1NQqAHlpDPCd+aK+JTk0EeFn3Cgyhrt1BfGKRqMRftLG46bFDKASkci8RMU2awowtCKO/KQpV+iEn
	pjqIXL9+0CEA7orIJ3At+T0yF/O92ZSuwwK7oNmBwV/B0iAeALUYHUeuRdg1j+NyZQXJW/JYVhRZg
	XpemRt88UnJywovKTg4tokhAaXt18jGm8MdXMgyJLYYOjoPqr5nm0guu+Cr76fltbn6NEM/pAmWOE
	dmB5RdVbrqUKPTqhhCrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkmCs-0006fe-SL; Mon, 15 Jun 2020 10:19:10 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkmCa-0006UL-Rj; Mon, 15 Jun 2020 10:18:55 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B6BCCC000C;
 Mon, 15 Jun 2020 10:18:44 +0000 (UTC)
Date: Mon, 15 Jun 2020 12:18:41 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?6LW15Luq5bOw?= <yifeng.zhao@rock-chips.com>
Subject: Re: [PATCH v6 2/8] mtd: rawnand: rockchip: NFC drivers for RK3308,
 RK2928 and others
Message-ID: <20200615121841.566b81f5@xps13>
In-Reply-To: <2020061517300662418531@rock-chips.com>
References: <20200609074020.23860-1-yifeng.zhao@rock-chips.com>
 <20200609074020.23860-3-yifeng.zhao@rock-chips.com>
 <7e4ce8b1-73c4-8b9a-5726-b121f53de8df@gmail.com>
 <2020061517300662418531@rock-chips.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_031853_175734_7F0E227C 
X-CRM114-Status: GOOD (  27.65  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 =?UTF-8?B?SGVpa29TdMO8Ym5lcg==?= <heiko@sntech.de>, richard <richard@nod.at>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 robh+dt <robh+dt@kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Johan Jonker <jbx6244@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 vigneshr <vigneshr@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkg6LW15Luq5bOwLAoK6LW15Luq5bOwIDx5aWZlbmcuemhhb0Byb2NrLWNoaXBzLmNvbT4gd3Jv
dGUgb24gTW9uLCAxNSBKdW4gMjAyMCAxNzozNDoxNAorMDgwMDoKCj4gSGkgSm9oYW4sCj4gCj4g
Sm9oYW4gSm9ua2VyIDxqYng2MjQ0QGdtYWlsLmNvbT4gd3JvdGUgb24gU2F0LCAxMyBKdW4gMjAy
MCAxNTozMTo1Mgo+ICswMjAwOgo+ID5IaSBZaWZlbmcsIE1pcXVlbCwKPiA+Cj4gPlNvbWUgbW9y
ZSBjb21tZW50cyBhYm91dCBzd2FwKCk7Cj4gPgo+ID5PbiA2LzkvMjAgOTo0MCBBTSwgWWlmZW5n
IFpoYW8gd3JvdGU6Cj4gPgo+ID5bLi5dCj4gPiAgCj4gPj4gK3N0YXRpYyBpbnQgcmtfbmZjX29v
YmxheW91dF9mcmVlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwKPiA+PiArCXN0
cnVjdCBtdGRfb29iX3JlZ2lvbiAqb29iX3JlZ2lvbikKPiA+PiArewo+ID4+ICsJc3RydWN0IG5h
bmRfY2hpcCAqY2hpcCA9IG10ZF90b19uYW5kKG10ZCk7Cj4gPj4gKyAgCj4gPiAgCj4gPj4gKwlp
ZiAoc2VjdGlvbiA+PSBjaGlwLT5lY2Muc3RlcHMpCj4gPj4gKwlyZXR1cm4gLUVSQU5HRTsgIAo+
ID4KPiA+R2l2ZW46Cj4gPgo+ID5ORkNfU1lTX0RBVEFfU0laRSA9IDQKPiA+Y2hpcC0+ZWNjLnN0
ZXBzID0gOAo+ID5zZWN0aW9uIFswLi43XQo+ID4KPiA+VG90YWwgZnJlZSBPT0Igc2l6ZSBhZHZl
cnRpc2VkIHRvIHRoZSBNVEQgZnJhbWV3b3JrIGlzOgo+ID4KPiA+ZWNjLnN0ZXBzICogTkZDX1NZ
U19EQVRBX1NJWkUgLSAxIEJCTQo+ID44ICogNCAtIDEgPSAzMSBieXRlcwo+ID4KPiA+V2l0aCBs
aW5rIGFkZHJlc3MgaW4gT09CIGJ5dGUgWzAuLjNdIHRoaXMgYmVjb21lOgo+ID4zMSAtIDQgPSAy
NyBieXRlcwo+ID4KPiA+RG9lcyB0aGF0IGdpdmUgZGF0YSBsb3N0Pwo+ID5TaG91bGQgd2UgbGlt
aXQgdGhlIG51bWJlciBvZiBmcmVlIE9PQiBieXRlcyBieSA0IG1vcmUgdG8gYmUgc2F2ZT8KPiA+
SXMgbXkgY2FsY3VsYXRpb24gY29ycmVjdD8KPiA+U2VlIGZ1cnRoZXIgcXVlc3Rpb25zIGFib3V0
IHRoaXMgYmVsb3cuCj4gPiAgCj4gPj4gKwo+ID4+ICsJaWYgKCFzZWN0aW9uKSB7Cj4gPj4gKwkv
KiBUaGUgZmlyc3QgYnl0ZSBpcyBiYWQgYmxvY2sgbWFzayBmbGFnLiAqLwo+ID4+ICsJb29iX3Jl
Z2lvbi0+bGVuZ3RoID0gTkZDX1NZU19EQVRBX1NJWkUgLSAxOwo+ID4+ICsJb29iX3JlZ2lvbi0+
b2Zmc2V0ID0gMTsKPiA+PiArCX0gZWxzZSB7Cj4gPj4gKwlvb2JfcmVnaW9uLT5sZW5ndGggPSBO
RkNfU1lTX0RBVEFfU0laRTsKPiA+PiArCW9vYl9yZWdpb24tPm9mZnNldCA9IHNlY3Rpb24gKiBO
RkNfU1lTX0RBVEFfU0laRTsKPiA+PiArCX0KPiA+PiArCj4gPj4gKwlyZXR1cm4gMDsKPiA+PiAr
fQo+ID4+ICsKPiA+PiArc3RhdGljIGludCBya19uZmNfb29ibGF5b3V0X2VjYyhzdHJ1Y3QgbXRk
X2luZm8gKm10ZCwgaW50IHNlY3Rpb24sCj4gPj4gKwlzdHJ1Y3QgbXRkX29vYl9yZWdpb24gKm9v
Yl9yZWdpb24pCj4gPj4gK3sKPiA+PiArCXN0cnVjdCBuYW5kX2NoaXAgKmNoaXAgPSBtdGRfdG9f
bmFuZChtdGQpOwo+ID4+ICsgIAo+ID4gIAo+ID4+ICsJaWYgKHNlY3Rpb24pCj4gPj4gKwlyZXR1
cm4gLUVSQU5HRTsgIAo+ID4KPiA+V2l0aCB0aGUgZm9ybXVsZSBhYm92ZSBhIHNlY3Rpb24gPiAw
IGRvZXMgbm90IGFsb3cgRUNDLgo+ID4KPiA+SnVzdCBhIHF1ZXN0aW9uIGFib3V0IHRoZSBNVEQg
aW5uZXIgd29ya2luZyBmb3IgTWlxdWVsOgo+ID4KPiA+V2l0aCBvb2JsYXlvdXRfZnJlZSB1c2lu
ZyA4IHN0ZXBzIGFuZCB0aGlzIGp1c3QgMSBkb2VzIGl0IHN0aWxsIGdlbmVyYXRlCj4gPnRoZSBj
b3JyZWN0IEVDQz8gRG9lcyBpdCBjYWxjdWxhdGUgRUNDIG92ZXIgMTAyNEIgb3Igb3ZlciA4KjEw
MjRCID8KPiA+Cj4gPlNob3VsZCB3ZSBtb3ZlIHRoZSB0ZXh0IHRoYXQgZXhwbGFpbnMgdGhlIGxh
eW91dCBjbG9zZXIgdG8gdGhlc2UKPiA+ZnVuY3Rpb25zIGFuZCBhZGQgYSBsaXR0bGUgbW9yZSB0
ZXh0IHRvIGV4cGxhaW4gd2h5IHdlIGNob29zZSB0aGlzCj4gPnBhcnRpY3VsYXIgbGF5b3V0Pwo+
ID4KPiA+LyoKPiA+ICogTkZDIFBhZ2UgRGF0YSBMYXlvdXQ6Cj4gPiAqCTEwMjQgQnl0ZXMgRGF0
YSArIDRCeXRlcyBzeXMgZGF0YSArIDI4Qnl0ZXN+MTI0Qnl0ZXMgZWNjICsKPiA+ICoJMTAyNCBC
eXRlcyBEYXRhICsgNEJ5dGVzIHN5cyBkYXRhICsgMjhCeXRlc34xMjRCeXRlcyBlY2MgKwo+ID4g
KgkuLi4uLi4KPiA+ICogTkFORCBQYWdlIERhdGEgTGF5b3V0Ogo+ID4gKgkxMDI0ICogbiBEYXRh
ICsgbSBCeXRlcyBvb2IKPiA+ICogT3JpZ2luYWwgQmFkIEJsb2NrIE1hc2sgTG9jYXRpb246Cj4g
PiAqCUZpcnN0IGJ5dGUgb2Ygb29iKHNwYXJlKS4KPiA+ICogbmFuZF9jaGlwLT5vb2JfcG9pIGRh
dGEgbGF5b3V0Ogo+ID4gKgk0Qnl0ZXMgc3lzIGRhdGEgKyAuLi4uICsgNEJ5dGVzIHN5cyBkYXRh
ICsgZWNjIGRhdGEuCj4gPiAqLwo+ID4KPiA+V2UgZXhwZWN0IG5vdyBFQ0MgZGF0YSBhZnRlciBu
IHN0ZXBzICogNCBPT0IgYnl0ZXMsCj4gPmJ1dCBhcmUgd2Ugc3RpbGwgdXNpbmcgaXQgd2l0aCBI
VyBFQ0Mgb3Igb25seSBmb3IgcmF3Pwo+ID4gIAo+ID4+ICsKPiA+PiArCW9vYl9yZWdpb24tPm9m
ZnNldCA9IE5GQ19TWVNfREFUQV9TSVpFICogY2hpcC0+ZWNjLnN0ZXBzOwo+ID4+ICsJb29iX3Jl
Z2lvbi0+bGVuZ3RoID0gbXRkLT5vb2JzaXplIC0gb29iX3JlZ2lvbi0+b2Zmc2V0Owo+ID4+ICsK
PiA+PiArCXJldHVybiAwOwo+ID4+ICt9Cj4gPj4gKwo+ID4+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IG10ZF9vb2JsYXlvdXRfb3BzIHJrX25mY19vb2JsYXlvdXRfb3BzID0gewo+ID4+ICsJLmZyZWUg
PSBya19uZmNfb29ibGF5b3V0X2ZyZWUsCj4gPj4gKwkuZWNjID0gcmtfbmZjX29vYmxheW91dF9l
Y2MsCj4gPj4gK307ICAKPiA+Cj4gPlsuLl0KPiA+ICAKPiA+PiArc3RhdGljIGludCBya19uZmNf
d3JpdGVfcGFnZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwK
PiA+PiArCcKgwqDCoMKgIGNvbnN0IHU4ICpidWYsIGludCBwYWdlLCBpbnQgcmF3KQo+ID4+ICt7
Cj4gPj4gKwlzdHJ1Y3QgcmtfbmZjICpuZmMgPSBuYW5kX2dldF9jb250cm9sbGVyX2RhdGEoY2hp
cCk7Cj4gPj4gKwlzdHJ1Y3QgcmtfbmZjX25hbmRfY2hpcCAqcmtfbmFuZCA9IHRvX3JrX25hbmQo
Y2hpcCk7Cj4gPj4gKwlzdHJ1Y3QgbmFuZF9lY2NfY3RybCAqZWNjID0gJmNoaXAtPmVjYzsKPiA+
PiArCWludCBvb2Jfc3RlcCA9IChlY2MtPmJ5dGVzID4gNjApID8gTkZDX01BWF9PT0JfUEVSX1NU
RVAgOgo+ID4+ICsJTkZDX01JTl9PT0JfUEVSX1NURVA7Cj4gPj4gKwlpbnQgcGFnZXNfcGVyX2Js
ayA9IG10ZC0+ZXJhc2VzaXplIC8gbXRkLT53cml0ZXNpemU7Cj4gPj4gKwlpbnQgcmV0ID0gMCwg
aSwgYm9vdF9yb21fbW9kZSA9IDA7Cj4gPj4gKwlkbWFfYWRkcl90IGRtYV9kYXRhLCBkbWFfb29i
Owo+ID4+ICsJdTMyIHJlZzsKPiA+PiArCXU4ICpvb2I7Cj4gPj4gKwo+ID4+ICsJbmFuZF9wcm9n
X3BhZ2VfYmVnaW5fb3AoY2hpcCwgcGFnZSwgMCwgTlVMTCwgMCk7Cj4gPj4gKwo+ID4+ICsJaWYg
KCFyYXcpIHsKPiA+PiArCW1lbWNweShuZmMtPnBhZ2VfYnVmLCBidWYsIG10ZC0+d3JpdGVzaXpl
KTsKPiA+PiArCW1lbXNldChuZmMtPm9vYl9idWYsIDB4ZmYsIG9vYl9zdGVwICogZWNjLT5zdGVw
cyk7Cj4gPj4gKwo+ID4+ICsJLyoKPiA+PiArCSogVGhlIGZpcnN0IDgoc29tZSBkZXZpY2VzIGFy
ZSA0IG9yIDE2KSBibG9ja3MgaW4gdXNlIGJ5Cj4gPj4gKwkqIHRoZSBib290IFJPTSBhbmQgdGhl
IGZpcnN0IDMyIGJpdHMgb2Ygb29iIG5lZWQgdG8gbGluawo+ID4+ICsJKiB0byB0aGUgbmV4dCBw
YWdlIGFkZHJlc3MgaW4gdGhlIHNhbWUgYmxvY2suCj4gPj4gKwkqIENvbmZpZyB0aGUgRUNDIGFs
Z29yaXRobSBzdXBwb3J0ZWQgYnkgdGhlIGJvb3QgUk9NLgo+ID4+ICsJKi8KPiA+PiArCWlmIChw
YWdlIDwgcGFnZXNfcGVyX2JsayAqIHJrX25hbmQtPmJvb3RfYmxrcyAmJgo+ID4+ICsJwqDCoMKg
IGNoaXAtPm9wdGlvbnMgJiBOQU5EX0lTX0JPT1RfTUVESVVNKSB7Cj4gPj4gKwlib290X3JvbV9t
b2RlID0gMTsKPiA+PiArCWlmIChya19uYW5kLT5ib290X2VjYyAhPSBlY2MtPnN0cmVuZ3RoKQo+
ID4+ICsJcmtfbmZjX2h3X2VjY19zZXR1cChjaGlwLCBlY2MsCj4gPj4gKwnCoMKgwqAgcmtfbmFu
ZC0+Ym9vdF9lY2MpOwo+ID4+ICsJfQo+ID4+ICsKPiA+PiArCS8qCj4gPj4gKwkqIFN3YXAgdGhl
IGZpcnN0IG9vYiB3aXRoIHRoZSBzZXZlbnRoIG9vYiBhbmQgYmFkIGJsb2NrCj4gPj4gKwkqIG1h
c2sgaXMgc2F2ZWQgYXQgdGhlIHNldmVudGggb29iLgo+ID4+ICsJKi8KPiA+PiArCXN3YXAoY2hp
cC0+b29iX3BvaVswXSwgY2hpcC0+b29iX3BvaVs3XSk7ICAKPiA+Cj4gPkFkZCBtb3JlIGluZm8g
b24gd2h5IHRoaXMgaXMgc3dhcHBlZC4KPiA+Cj4gPkxBWzAuLjNdIGlzIGEgbGluayBhZGRyZXNz
IHRoYXQgdGhlIEJCTSBzaG91bGRuJ3Qgb3ZlciB3cml0ZS4KPiA+Rm9yIFlpZmVuZzogSXMgdGhl
cmUgYW4gb3RoZXIgcmVhc29uPyAgCj4gCj4gTm8gb3RoZXIgcmVhc29u77yMdGhpcyBzd2FwIG9w
cyBvbmx5IGZvciB0aGUgbGluayBhZGRyZXNzLgo+IAo+ID5CZWZvcmUgc3dhcDoKPiA+Cj4gPkJC
TcKgIE9PQjEgT09CMiBPT0IzLCBPT0I0IE9PQjUgT09CNiBPT0I3LCBPT0I4IC4uLi4KPiA+Cj4g
PkFmdGVyIHN3YXA6Cj4gPgo+ID5PT0I3IE9PQjEgT09CMiBPT0IzLCBPT0I0IE9PQjUgT09CNiBC
Qk0gLCBPT0I4IC4uLi4KPiA+Cj4gPklmICghaSAmJiBib290X3JvbV9tb2RlKToKPiA+Cj4gPkxB
MMKgIExBMcKgIExBMsKgIExBMyAsIE9PQjQgT09CNSBPT0I2IEJCTSAsIE9PQjggLi4uLgo+ID4K
PiA+UmVhZCBiYWNrIGFmdGVyIHN3YXAgYWdhaW46Cj4gPgo+ID5CQk3CoCBMQTHCoCBMQTLCoCBM
QTMgLCBPT0I0IE9PQjUgT09CNiBMQTAgLCBPT0I4IC4uLi4KPiA+Cj4gPlF1ZXN0aW9uOgo+ID5B
cmUgZGF0YSBPT0I3IE9PQjEgT09CMiBPT0IzIGxvc3Qgbm93Pwo+ID5JcyB0aGlzIGNvcnJlY3Q/
ICAKPiAKPiBZZXMsIHRoZSBkYXRhIE9PQjcgT09CMSBPT0IyIE9PQjMgd2lsbCBsb3N0IGluIHRo
ZSBibG9ja3Mgd2hpY2ggdXNlZCBmb3IgdGhlIGJvb3QgUk9NLgo+IAo+ID4jIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gPlByb3Bvc2FsOgo+ID5TaG91
bGQgd2UgcmVkdWNlIHRoZSBmcmVlIE9PQiBzaXplIGJ5IDQKPiA+YW5kIHNoaWZ0IGV2ZXJ5dGhp
bmcgNCBieXRlcyB0byByZWNvdmVyIGFsbCBieXRlcz8KPiA+UmVwbGFjZSB0aGUgZmlyc3QgNCBi
eXRlcyB3aXRoIDBYRkYgb3IgTEFbMC4uM10uCj4gPgo+ID5Ob3JtYWw6Cj4gPjB4RkYgMFhGRiAw
WEZGIDB4RkYsIEJCTcKgIE9PQjEgT09CMiBPT0IzLCBPT0I0Cj4gPgo+ID5JZiAoIWkgJiYgYm9v
dF9yb21fbW9kZSk6Cj4gPkxBMMKgIExBMcKgIExBMsKgIExBMyAsIEJCTcKgIE9PQjEgT09CMiBP
T0IzLCBPT0I0Cj4gPgo+ID5RdWVzdGlvbiBmb3IgTWlxdWVsIGFuZCBZaWZlbmc6Cj4gPkRvZXMg
dGhpcyB3b3JrPyBDb3VsZCB5b3UgdGVzdD8gIAo+IAo+IEkgd2FudCB0byBtb2RpZnkgdGhlIGRy
aXZlcnMgaW4gbmV4dCB2ZXJzaW9uOgo+IFRoZSBkYXRhIHN3YXAgb3BzIG9ubHkgZG9uZSBmb3Ig
dGhlIGJsb2NrcyB3aGljaCB1c2VkIGZvciB0aGUgYm9vdCBST03vvIxJbiB0aGlzIHdheSwKPiB0
aGUgc3BlY2lhbGx5IHByb2Nlc3NlZCBjb2RlIHdpbGwgbm90IGFmZmVjdCB0aGUgcmVzdCBibG9j
a3MuCj4gRm9yIE1pcXVlbCBhbmQgWWlmZW5nOgo+IElzIHRoaXMgT0vvvJ8KClNvIEkgZ3Vlc3Mg
dGhpcyBsaW5raW5nIHByb3BlcnR5IGlzIG9ubHkgZm9yIHRoZSBCb290Uk9NPyBJIGFtIG5vdCBz
dXJlCndoYXQgaXMgYmVzdCBidXQgSSBndWVzcyBrZWVwaW5nIHRoZSBzYW1lIGxheW91dCBldmVy
eXdoZXJlIGlzIGJldHRlci4KSm9oYW4gcHJvcG9zYWwgd291bGQgYmUgZ29vZCB0byB0cnkuCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
