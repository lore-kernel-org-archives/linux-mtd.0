Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2465DC83F10
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Aug 2023 06:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUhNwB1yt6OwN+f8PNbAjim+IxFbbNHSe7HlVrcP7p4=; b=faAZl+if2A11W9+NllaCdhdrlt
	KHqKYc9i5clw5emqPnFUD2alQcqPpFZplTM53J3uOdxf1xa5mRmqZfP+GrGSB8j5gKG9y1fs3Rq6t
	maLrZkScdj+N+0yO/dBqSvwAWXhR2GeBEQuUz9gX3K5hboeOoL+vKK2a1wpoWTwGHaiZ6M2swBFjX
	FB8VngHfFM5Ksh6bgjQwFJX2JOtMJATOFKX69ktsYZyjQTRA4lEzJDFEbB9vSdJbivp3DHHfzTSFl
	UO4TyttejcH/7zNEGTkeeivppXd5HvkaeG+4AgNDTLV1rBlBOvroEh2TSDBagXfcuP5DYF3wxAn2m
	A45/r7hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbbMg-00Eljc-1l;
	Thu, 31 Aug 2023 06:41:14 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbbMd-00Elid-27
	for linux-mtd@lists.infradead.org;
	Thu, 31 Aug 2023 06:41:13 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 0C24B30A;
	Thu, 31 Aug 2023 08:41:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1693464063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0qlSvXs72kihayFUUjvnu+kLjorvIfsIcAxoti/RKzE=;
	b=aFV6oVgTw5GVt4vQrfNy1/y3LH+ddTydLGMJ4Q7XwyoYCdZXSVW/iFOFGp9NJoT098VstI
	MdlApVahHGk0shS3derZotrCHvA/U6X5b7/cTupVZWwB+4OsIplUFADNnJwzjZW9bp+aWH
	Sv2NepLDfqrJma7uZDUj+A1NL6Exjo3gdo/aA3sxC8zBprU38OJGHxhNQWR7KsxavYzK3t
	X+TRzLBXMx7FfSkN2Jd1MZ7aiZIyOoJbieKSVolVm7b2ojaKznNlUI/dbtTwTheXZCX0/9
	oqgUYCqW9YJGL6EyXuxH2q/Yy8QxbCFaknXH3BltgrHf6BSmNtzPi79zORry9Q==
MIME-Version: 1.0
Date: Thu, 31 Aug 2023 08:41:02 +0200
From: Michael Walle <michael@walle.cc>
To: SSunk <ssunkkan@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, pratyush@kernel.org, richard@nod.at,
 ssunkkan@gmail.com, tudor.ambarus@linaro.org, vigneshr@ti.com
Subject: Re: [PATCH] Add support for more XMC series
In-Reply-To: <20230831041344.4653-1-ssunkkan@gmail.com>
References: <1c04bbe2a65f13b9815ce465cc8dcdd5@walle.cc>
 <20230831041344.4653-1-ssunkkan@gmail.com>
Message-ID: <c7b200d180278b43ddf8e1f870c846df@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_234112_079842_C08A0770 
X-CRM114-Status: GOOD (  17.61  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgo+Pj4+IFNpbmNlIHRoaXMgaXMgdGhlIGZpcnN0IHRpbWUgSSd2ZSBzdWJtaXR0ZWQgY29k
ZSB0byB0aGUgTGludXgKPj4+PiBjb21tdW5pdHksIHBsZWFzZSBmb3JnaXZlIG1lIGZvciBzb21l
IG9mIHRoZSBtaXNzdGVwcyB0aGF0IEkndmUgCj4+Pj4gbWFkZS4KPj4+PiBJIHVwbG9hZGVkIHRo
ZSBpbmNvcnJlY3QgcGF0Y2ggZmlsZS4KPj4+PiBJbiBhIHByZXZpb3VzIGUtbWFpbCB5b3Ugc2Fp
ZO+8mgo+Pj4+IFhNQyBwYXJ0cyBzZWVtIHRvIGhhdmUgU0ZEUCB0YWJsZXMgYW5kIHRoZXkgc2hv
dWxkIHdvcmsgb3V0IG9mIHRoZSAKPj4+PiBib3gKPj4+PiB3aXRob3V0IGFueSBwYXRjaGVzIHdp
dGggdGhlIGdlbmVyaWMgc3BpIG5vciBkcml2ZXIgWzFdLiBUaGVyZWZvcmUsCj4+Pj4geW91IGRv
bid0IG5lZWQgYW55IGVudHJ5IGF0IGFsbC4KPj4+PiAKPj4+PiBJIHRoaW5rIGl0IGlzIHJlbGF0
ZWQgdG8gdGhlIFBBUlNFX1NGRFAgZmxhZy4KPj4+PiBUaGUgWE1DIGZsYXNoIHBhcnQgc3VwcG9y
dHMgU0ZEUCwgc28gaSBkb27igJl0IG5lZWQgdG8gYWRkCj4+Pj4gTk9fU0ZEUF9GTEFHUygpIG1h
Y3JvLgo+Pj4+IGRyaXZlcnMvbXRkL3NwaS1ub3IveG1jLmMgfCAxNyArKysrKysrKysrKysrLS0t
LQo+Pj4+IDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+
Pj4+IAo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL3htYy5jIGIvZHJpdmVy
cy9tdGQvc3BpLW5vci94bWMuYwo+Pj4+IGluZGV4IDA1MTQxMWU4NjMzOS4uZTc4YmYxMTc5MmQ5
IDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IveG1jLmMKPj4+PiArKysgYi9k
cml2ZXJzL210ZC9zcGktbm9yL3htYy5jCj4+Pj4gQEAgLTExLDExICsxMSwyMCBAQAo+Pj4+IHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5mbyB4bWNfbm9yX3BhcnRzW10gPSB7Cj4+Pj4gCS8q
IFhNQyAoV3VoYW4gWGlueGluIFNlbWljb25kdWN0b3IgTWFudWZhY3R1cmluZyBDb3JwLikgKi8K
Pj4+PiAJeyAiWE0yNVFINjRBIiwgSU5GTygweDIwNzAxNywgMCwgNjQgKiAxMDI0LCAxMjgpCj4+
Pj4gLQkJTk9fU0ZEUF9GTEFHUyhTRUNUXzRLIHwgU1BJX05PUl9EVUFMX1JFQUQgfAo+Pj4+IC0J
CQkgICAgICBTUElfTk9SX1FVQURfUkVBRCkgfSwKPj4+PiArCQlQQVJTRV9TRkRQIH0sCj4+Pj4g
CXsgIlhNMjVRSDEyOEEiLCBJTkZPKDB4MjA3MDE4LCAwLCA2NCAqIDEwMjQsIDI1NikKPj4+PiAt
CQlOT19TRkRQX0ZMQUdTKFNFQ1RfNEsgfCBTUElfTk9SX0RVQUxfUkVBRCB8Cj4+Pj4gLQkJCSAg
ICAgIFNQSV9OT1JfUVVBRF9SRUFEKSB9LAo+Pj4+ICsJCVBBUlNFX1NGRFAgfSwKPj4+PiArCXsg
IlhNMjVRSDEyOEMiLCBJTkZPKDB4MjA0MDE4LCAwLCA2NCAqIDEwMjQsIDI1NikKPj4+PiArCQlQ
QVJTRV9TRkRQIH0sCj4+Pj4gKwl7ICJYTTI1UUgyNTZDIiwgSU5GTygweDIwNDAxOSwgMCwgNjQg
KiAxMDI0LCA1MTIpCj4+Pj4gKwkJUEFSU0VfU0ZEUCB9LAo+Pj4+ICsJeyAiWE0yNVFVMjU2QyIs
IElORk8oMHgyMDQxMTksIDAsIDY0ICogMTAyNCwgNTEyKQo+Pj4+ICsJCVBBUlNFX1NGRFAgfSwK
Pj4+PiArCXsgIlhNMjVRSDUxMkMiLCBJTkZPKDB4MjA0MDIwLCAwLCA2NCAqIDEwMjQsIDEwMjQp
Cj4+Pj4gKwkJUEFSU0VfU0ZEUCB9LAo+Pj4+ICsJeyAiWE0yNVFVNTEyQyIsIElORk8oMHgyMDQx
MjAsIDAsIDY0ICogMTAyNCwgMTAyNCkKPj4+PiArCQlQQVJTRV9TRkRQIH0sCj4+Pj4gKwo+Pj4+
IH07Cj4+Pj4gCj4+Pj4gY29uc3Qgc3RydWN0IHNwaV9ub3JfbWFudWZhY3R1cmVyIHNwaV9ub3Jf
eG1jID0gewo+Pj4+PiBDb3JyZWN0LiBJZiB0aGUgZmxhc2ggaXMgd29ya2luZyB3aXRoIFBBUlNF
X1NGRFAsIGl0IGhhcyBTRkRQIGFuZAo+Pj4+PiBhbGwgdGhlIGluZm9ybWF0aW9uIG9mIHRoZSBm
bGFzaF9pbmZvIHRhYmxlIGlzIHB1bGxlZCBmcm9tIHRoZSBTRkRQCj4+Pj4+IHRhYmxlcywgZXhj
ZXB0IGZvciB0aGUgcGFydCBuYW1lLiBUaGVyZWZvcmUsIHlvdSBkb24ndCBuZWVkIGFueSAKPj4+
Pj4gZW50cnkKPj4+Pj4gYXQgYWxsLiBUaGUgZmxhc2ggc2hvdWxkIGp1c3Qgd29yayBvdXQgb2Yg
dGhlIGJveC4gQXJlIHlvdSB1c2luZyAKPj4+Pj4gdGhlCj4+Pj4+IGxhdGVzdCBrZXJuZWw/Cj4+
Pj4+IAo+Pj4+PiAtbWljaGFlbAo+Pj4gLS0KPj4+IEhpIE1pY2hhZWwsCj4+PiAKPj4+IEFjY29y
ZGluZyB0byB5b3UsIGRvZXMgdGhpcyBwaWVjZSBvZiBteSBjb2RlIHN0aWxsIG5lZWQgdG8gYmUg
Cj4+PiBtb2RpZmllZD8KPj4gCj4+IFlvdSBkb24ndCBuZWVkIGl0IGF0IGFsbC4gVGhlIGZsYXNo
IHdpbGwgd29yayBhcyBpcyAtIHRoYXQgaXMgd2l0aG91dAo+PiB0aGF0Cj4+IHBpZWNlIG9mIGNv
ZGUuCj4+IAo+PiAtbWljaGFlbAo+IC0tCj4gSGkgbWljaGFlbCwKPiAKPiBJZiB0aGVzZSBlbnRy
aWVzIGFyZSBub3QgYWRkZWQsIHRoZSBmbGFzaCBwYXJ0IG5hbWUgaXMgdW5rbm93biBhbmQgb3Vy
IAo+IGN1c3RvbWVycwo+IGNhbm5vdCBzZWUgb3VyIGZsYXNoIHBhcnQgbmFtZSBvbiB0aGUga2Vy
bmVsIGxvZy4KPiBTbyxJIHRoaW5rIGl0J3MgbmVjZXNzYXJ5IHRvIGFkZCB0aGVzZSBlbnRyaWVz
LgoKVGhleSBjYW4gc3RpbGwgc2VlIHRoZSBqZWRlYyBpZCBpbiB0aGUgc3lzZnMuIFdlIGRvbid0
IGFkZCBlbnRyaWVzIGp1c3QgCmZvciB0aGUKbmFtZXMuIFNvcnJ5LgoKLW1pY2hhZWwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
