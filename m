Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF52BEB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 06:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MnXfcAoGZaC8z1xHBO/0no8HY6vCU4wkUyHgrX+qgsQ=; b=roKTKum+JW/IUA
	a2FRPILP/zX49xwT5icfix58Dd+/HzQdv8hNz/dVHKv7YuOiGZQYt5QzcE3XSdARgINE8x+E+5wz3
	1f6WCcmnBLofgZW/ZjG9TAepQ5fAudkkptaMlTlcFiy6QAlVrYjm+bmpPTmR7Kwdh/bhmyin+tMy9
	V6emyQjp3GQkEPzTJAnWHOBD8X3n5biqMSbdWAsys+rMzqjcSwboOpAO+y8ppSglIirmlD81F24I0
	6fn0h+HcASEPtQD/7qIi0VF0tk0Cr3VPlR0BO9OjNUFOH2m/gfE1T4r5i9wH5NAOq3K9/iOpmCgkI
	T49rZW4gcsZ7DQ1QSHHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMN1X-009v78-2D;
	Thu, 20 Jul 2023 06:20:27 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMN1U-009v5g-0m
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jul 2023 06:20:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 899CF24000B;
	Thu, 20 Jul 2023 06:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689834019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qo33bqKLuCm7QxZTwOBtZygcUDKaOirIf2GIj2O2FT8=;
	b=p11VrJ4MQ6r5Gpsc/1YUvy/04d+R9JFaMFlat3LdQI6V8uP14EzkpilVTSCBpWlL6p8qxF
	bJLIZ2PNJc9JHUdLFj55HS30VhNQOZcD3uEZKy9GtEts4mvnfLyCmNdoulhdViJNZn56DV
	+GnRFt+2odFIVuIUl7qo5JIHTph0E8WD+5B7IK3oB05YTHYbLDv7ln3/XGQCuIuqzz7rsG
	H1VgQkdpD77CIQ8ulczdbmp3/ez6jyDKWL5Bad6FK6JWNpvaYM4iKqJrTNxBSWXCEEuUIT
	L0Q39fiusyJoeElwAOJnelpEPCBwtkzUX1Z6eSTCYwwsq0PzmTLmN6Fccc9aAw==
Date: Thu, 20 Jul 2023 08:20:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Julien Su <juliensu@mxic.com.tw>, Jaime
 Liao <jaimeliao@mxic.com.tw>, Alvin Zhou <alvinzhou@mxic.com.tw>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, JaimeLiao
 <jaimeliao.tw@gmail.com>, Alexander Shiyan <eagle.alexander923@gmail.com>,
 Domenico Punzo <dpunzo@micron.com>, Bean Huo <beanhuo@micron.com>
Subject: Re: [PATCH v2 3/3] mtd: rawnand: Support for sequential cache reads
Message-ID: <20230720082014.493dfec7@xps-13>
In-Reply-To: <yw1xpm4oxcsb.fsf@mansr.com>
References: <20230112093637.987838-1-miquel.raynal@bootlin.com>
	<20230112093637.987838-4-miquel.raynal@bootlin.com>
	<yw1xfs6j4k6q.fsf@mansr.com>
	<20230716174917.3a9ca7a7@xps-13>
	<yw1x7cqzzr4d.fsf@mansr.com>
	<20230717091900.52ed815a@xps-13>
	<yw1x351mznr0.fsf@mansr.com>
	<20230717183645.32ef90b0@xps-13>
	<yw1xy1jdxqot.fsf@mansr.com>
	<20230719102153.2ef93cfe@xps-13>
	<yw1xttu0xnf2.fsf@mansr.com>
	<20230719134445.08476f5c@xps-13>
	<yw1xpm4oxcsb.fsf@mansr.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_232024_576744_09C1FBE1 
X-CRM114-Status: GOOD (  43.06  )
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

SGkgTcOlbnMsCgptYW5zQG1hbnNyLmNvbSB3cm90ZSBvbiBXZWQsIDE5IEp1bCAyMDIzIDE0OjE1
OjQ4ICswMTAwOgoKPiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3
cml0ZXM6Cj4gCj4gPiBIaSBNw6VucywKPiA+Cj4gPiBtYW5zQG1hbnNyLmNvbSB3cm90ZSBvbiBX
ZWQsIDE5IEp1bCAyMDIzIDEwOjI2OjA5ICswMTAwOgo+ID4gIAo+ID4+IE1pcXVlbCBSYXluYWwg
PG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyaXRlczoKPiA+PiAgIAo+ID4+ID4gSGkgTcOl
bnMsCj4gPj4gPgo+ID4+ID4gbWFuc0BtYW5zci5jb20gd3JvdGUgb24gVHVlLCAxOCBKdWwgMjAy
MyAxNTowMzoxNCArMDEwMDoKPiA+PiA+ICAgIAo+ID4+ID4+IE1pcXVlbCBSYXluYWwgPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+IHdyaXRlczoKPiA+PiA+PiAgICAgCj4gPj4gPj4gPiBIaSBN
w6VucywKPiA+PiA+PiA+Cj4gPj4gPj4gPiBtYW5zQG1hbnNyLmNvbSB3cm90ZSBvbiBNb24sIDE3
IEp1bCAyMDIzIDE0OjExOjMxICswMTAwOgo+ID4+ID4+ID4gICAgICAKPiA+PiA+PiA+PiBNaXF1
ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cml0ZXM6Cj4gPj4gPj4gPj4g
ICAgICAgCj4gPj4gPj4gPj4gPiBTbywgSSBzaG91bGQgaGF2ZSBkb25lIHRoYXQgZWFybGllciBi
dXQsIGNvdWxkIHlvdSBwbGVhc2Ugc2xvdyB0aGUKPiA+PiA+PiA+PiA+IHdob2xlIG9wZXJhdGlv
biBkb3duLCBqdXN0IHRvIHNlZSBpZiB0aGVyZSBpcyBzb21ldGhpbmcgd3Jvbmcgd2l0aCB0aGUK
PiA+PiA+PiA+PiA+IHRpbWluZ3Mgb3IgaWYgd2Ugc2hvdWxkIGxvb2sgaW4gYW5vdGhlciBkaXJl
Y3Rpb24uCj4gPj4gPj4gPj4gPgo+ID4+ID4+ID4+ID4gTWF5YmUgeW91IGNvdWxkIGFkZCBhIGJv
b2xlYW4gdG8gZmxhZyBpZiB0aGUgbGFzdCBDTUQgd2FzIGEKPiA+PiA+PiA+PiA+IFJFQURDQUNI
RVNFUSwgUkVBRENBQ0hFU1RBUlQgb3IgUkVBRENBQ0hFRU5ELCBhbmQgaWYgdGhlIGZsYWcgaXMK
PiA+PiA+PiA+PiA+IHRydWUsIHBsZWFzZSBnZXQgdGhlIGppZmZpZXMgYmVmb3JlIGFuZCBhZnRl
ciBlYWNoIHdhaXRyZHkgYW5kCj4gPj4gPj4gPj4gPiBkZWxheV9ucy4gRmluYWxseSwgcGxlYXNl
IHByaW50IHRoZSBleHBlY3RlZCBkZWxheSBhbmQgdGhlIGFjdHVhbCBvbmUKPiA+PiA+PiA+PiA+
IGFuZCBjb21wYXJlIHRvIHNlZSBpZiBzb21ldGhpbmcgd2FzIHRvbyBmYXN0IGNvbXBhcmVkIHRv
IHdoYXQgd2UKPiA+PiA+PiA+PiA+IGV4cGVjdGVkLiAgICAgICAgCj4gPj4gPj4gPj4gCj4gPj4g
Pj4gPj4gQmV0d2VlbiB3aGljaCBwb2ludHMgZXhhY3RseSBzaG91bGQgdGhlIGRlbGF5IGJlIG1l
YXN1cmVkPyAgQWxzbywgdGhlcmUKPiA+PiA+PiA+PiBpcyBubyBjb21tYW5kIGNhbGxlZCBSRUFE
Q0FDSEVTVEFSVC4gIERpZCB5b3UgbWVhbiBSRUFEU1RBUlQgb3IKPiA+PiA+PiA+PiBzb21ldGhp
bmcgZWxzZT8gICAgICAKPiA+PiA+PiA+Cj4gPj4gPj4gPiBZZWFoLCB3aGF0ZXZlciBjb21tYW5k
IGlzIHNwZWNpZmljIHRvIHNlcXVlbnRpYWwgY2FjaGUgcmVhZHM6Cj4gPj4gPj4gPiBodHRwczov
L2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvbXRkL25hbmQv
cmF3L25hbmRfYmFzZS5jI0wxMjE4Cj4gPj4gPj4gPiBodHRwczovL2VsaXhpci5ib290bGluLmNv
bS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jI0wx
MjI4ICAgICAgCj4gPj4gPj4gCj4gPj4gPj4gSSdtIHN0aWxsIG5vdCBzdXJlIHdoYXQgZXhhY3Rs
eSB5b3Ugd2FudCB0byBtZSBtZWFzdXJlLiAgVGhlIHdhaXRyZHkgYW5kCj4gPj4gPj4gbmRlbGF5
IGNvbWJpbmVkLCBlYWNoIHNlcGFyYXRlbHksIG9yIHNvbWV0aGluZyBlbHNlPwo+ID4+ID4+ICAg
ICAKPiA+PiA+Cj4gPj4gPiBJIHdvdWxkIGxpa2UgdG8ga25vdywgaG93IG11Y2ggdGltZSB3ZSBz
cGVuZCB3YWl0aW5nIGluIGJvdGggY2FzZXMuICAgIAo+ID4+IAo+ID4+IFdoaWNoICJib3RoIiBj
YXNlcz8gIAo+ID4KPiA+IG5kZWxheSBhbmQgbW9yZSBpbXBvcnRhbnRseSwgd2FpdHJkeTogIAo+
IAo+IFsuLi5dCj4gCj4gPj4gPiBJcyB0aGVyZSBzb21ldGhpbmcgd3Jvbmcgd2l0aCB0aGUgIndh
aXQgcmVhZHkiPyBBcyB3ZSBjYW5ub3Qgb2JzZXJ2ZQo+ID4+ID4gdGhlIHRpbWluZ3Mgd2l0aCBh
IHNjb3BlLCBiZWNhdXNlIHdlIGFyZSB1c2luZyBhICJzb2Z0IiBjb250cm9sbGVyCj4gPj4gPiBp
bXBsZW1lbnRhdGlvbiBzb21laG93LCB3ZSBjYW4gZWFzaWx5IG1lYXN1cmUgaG93IG11Y2ggdGlt
ZSB3ZSBzcGVuZAo+ID4+ID4gaW4gZWFjaCBvcGVyYXRpb24gYnkgbWVhc3VyaW5nIHRoZSB0aW1l
IGJlZm9yZSBhbmQgYWZ0ZXIuCj4gPj4gPgo+ID4+ID4gVGhlc2UgaW5mb3JtYXRpb24gYXJlIG9u
bHkgdXNlZnVsIHdoZW4gd2UgYXJlIGRvaW5nIG9wZXJhdGlvbnMgcmVsYXRlZAo+ID4+ID4gdG8g
c2VxdWVudGlhbCByZWFkcy4gICAgCj4gPj4gCj4gPj4gSSBoYXZlIGhvb2tlZCB1cCBzb21lIHNw
YXJlIEdQSU9zIHRvIGEgc2NvcGUsIHdoaWNoIHNob3VsZCBiZSBtb3JlCj4gPj4gYWNjdXJhdGUg
KG5hbm9zZWNvbmQpIHRoYW4gc29mdHdhcmUgdGltZXN0YW1wcy4gIEFsbCBJIG5lZWQgdG8ga25v
dyBpcwo+ID4+IHdoYXQgdG8gbWVhc3VyZSBhbmQgd2hhdCB0byBsb29rIGZvciBpbiB0aG9zZSBt
ZWFzdXJlbWVudHMuICAKPiA+Cj4gPiBHcmVhdC4gVGhlIG9ubHkgaXNzdWUgd2l0aCB0aGUgc2Nv
cGUgaXMgdGhlIGZhY3QgdGhhdCB3ZSBtaWdodCBhY3R1YWxseQo+ID4gbG9vayBhdCBzb21ldGhp
bmcgdGhhdCBpcyBub3QgYSBmYXVsdHkgc2VxdWVudGlhbCByZWFkIG9wLiAgCj4gCj4gSG93IGV4
YWN0bHkgZG8gSSBrbm93IHdoaWNoIG9uZXMgYXJlIGZhdWx0eT8KClJpZ2h0IG5vdyBJIGV4cGVj
dCBhbGwgc2VxdWVudGlhbCBvcHMgdG8gYmUgZmF1bHR5LiBBcyBtZW50aW9uZWQgYWJvdmUsCkkg
ZG9uJ3QgdGhpbmsgd2UgYXJlIGludGVyZXN0ZWQgaW4gYWxsIHRoZSBjb21tYW5kcyB0aGF0IGFy
ZSBzZW50CnRocm91Z2ggdGhlIE5BTkQgYnVzLCBidXQganVzdCB0aGUgUkVBRFNUQVJUL1JFQURD
QUNIRVNFUS9SRUFEQ0FDSEVFTkQKc2VxdWVuY2VzLCBzZWUgdGhlc2UgdHdvIG9wcyB0aGVyZSwg
dGhhdCdzIHdoYXQgd2Ugd2FudCB0byBjYXB0dXJlOgoKPiA+PiA+PiA+IGh0dHBzOi8vZWxpeGly
LmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFu
ZF9iYXNlLmMjTDEyMTgKPiA+PiA+PiA+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4
L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMjTDEyMjggICAK
ClRoYXQncyB3aHkgYSByZWd1bGFyIHNjb3BlIGlzIG5vdCBhcyBlYXN5IGFzIGl0IHNvdW5kcyB0
byB1c2UgdG8KY2FwdHVyZSB0aGVzZSB0aW1pbmdzLgoKPiA+IFVubGVzcyB5b3UgaGFjayBpbnRv
IHRoZSBjb3JlIHRvIHBlcmZvcm0gdGhlc2UgaW4gYSBsb29wICh3aXRoIGEKPiA+IGJydXRhbCAi
d2hpbGUgKDEpIikuIEJ1dCBJIGRvbid0IHRoaW5rIHdlIHJlcXVpcmUgYmlnIHByZWNpc2lvbiBo
ZXJlLAo+ID4gYXQgbGVhc3QgYXMgYSBmaXJzdCBzdGVwLCBsb29raW5nIGF0IHNvZnR3YXJlIHRp
bWVzdGFtcHMgbGlrZSBoaW50ZWQKPiA+IGFib3ZlIGlzIGVub3VnaCBzbyB3ZSBjYW4gZWFzaWx5
IGlkZW50aWZ5IHRoZSBkaWZmZXJlbnQgZGVsYXlzIGFuZAo+ID4gY29tcGFyZSB0aGVtIHdpdGgg
bmFuZF90aW1pbmdzLmMuCj4gPgo+ID4gUGxlYXNlIHVzZSB3aGF0ZXZlciBtZXRob2QgaXMgZWFz
aWVyIGZvciB5b3UuICAKPiAKPiBXaGljaCB2YWx1ZXMgc2hvdWxkIGJlIGNvbXBhcmVkPwoKVGhl
IHNwZWNpZmljYXRpb24gZGVjbGFyZXMgbWluaW11bSBhbmQgbWF4aW11bSB0aW1lcyAoc2VlCm5h
bmRfdGltaW5ncy5jKS4gSSB3YW50IHRvIHNlZSBpZiB0aGVzZSB0aW1pbmdzLCB3aGljaCBhcmUg
cmVxdWVzdGVkIGJ5CnRoZSBjb3JlIChsaW5rcyBhYm92ZSkgYXJlIGNvcnJlY3RseSBvYnNlcnZl
ZCBvciBub3QuIFRoZSBvbmVzIHRoYXQgYXJlCnBhcnRpY3VsYXJseSBjcml0aWNhbCBiZWNhdXNl
IHRoZXkgYXJlIGRpZmZlcmVudCB0aGFuIHdoYXQgdGhlIG90aGVyCm9wcyB1c2UsIGFyZSB0aGUg
b25lcyBhcm91bmQgUkVBRFNUQVJUL1JFQURDQUNIRVNFUS9SRUFEQ0FDSEVFTkQuCkFueXRoaW5n
IGVsc2UsIHlvdSBhbHJlYWR5IHVzZSB0aGVtLCBzbyBpdCdzIHF1aXRlIGxpa2VseSB0aGF0IHRo
ZXkgYXJlCm5vdCBwcm9ibGVtYXRpYy4gVGhlc2UgYXJlIG5ldy4KCj4gU29ycnkgaWYgSSdtIGJl
aW5nIG9idHVzZSwgSSBkb24ndCBub3JtYWxseSBoYXZlIHRvIGRlYWwgd2l0aCB0aGVzZQo+IHRo
aW5ncy4KCk5vIHByb2JsZW0sIHRoYW5rcyBmb3IgdHJ5aW5nIHRvIGhlbHAuCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
