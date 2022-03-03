Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5480C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Mar 2022 16:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZRZLxhDXgoizHYPsdQNUmgtCGFuXX/FJadf1+I59cQ=; b=NL5vSAZ/gp4Z4Oz3GxfUYeOlEm
	j9qbCVzUYuBmzdxcE+Y7Am33VYXkXrMZ/71sV7c0cj7JmiuzDuIdcbRXNOn7z0ZA9Pe3zQspGiArN
	wBIswdlHoyY4vIzatXeXXd/y+qsAPLziTlseyO8skWvmKLBzzGEyrRbUOqWG7w/4zReXIqIILbt/N
	QihJJA+gsSpBIPX7DFhXt6oqXq0Uq9BeLvCL7mjwBQKkRUE04NSmXazO/sGeffJp8WicvFqtujDQU
	U6LlG+FUdTroPeJ8Wygs8qJ3e4z7bir47gVcuX+6+sGAhf1LTXFy8oiuyds7RukaRG0QactuLXQjk
	oDfo0b0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPoU7-007CXm-5C; Thu, 03 Mar 2022 16:39:23 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPoTp-007CU6-VD; Thu, 03 Mar 2022 16:39:07 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 5BAE72223B;
 Thu,  3 Mar 2022 17:39:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1646325544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gqi6UW6yQa99ZgaEBkZ9cT7CZNpdyKSf2iCi3FV1d1E=;
 b=qp0jdZVBofT+g36Yvg/BzJXnu0mnz9/NQbBl18qZVyE1H1kcZ7Dhg3Ps3iHYfmQj9Upz0W
 aJziuCghJxahi69yCx0ZY9eW72XG80podomPXN6GVM8KNWEfIKf6Axxx4Lqcct17t3rCJc
 yCPYLSI7c+8mOgLWlevNAo+oG9UPp+Y=
MIME-Version: 1.0
Date: Thu, 03 Mar 2022 17:39:02 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v4 2/6] mtd: spi-nor: core: Handle ID collisions between
 SFDP & non-SFDP flashes
In-Reply-To: <239af41b-6f60-f7c6-3523-40f9e333c9db@microchip.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
 <20220228134505.203270-3-tudor.ambarus@microchip.com>
 <328762851786f1158505f9159ba3e5bc@walle.cc>
 <72679fc7-42e4-d7b8-1fb9-463f225217fc@microchip.com>
 <9ef79f480651777e0da4309a039070d0@walle.cc>
 <8c1b9274-ea45-6a79-b7a0-7674ef60ab80@microchip.com>
 <2df0febdcda22a1cfa13c091238c2e2c@walle.cc>
 <239af41b-6f60-f7c6-3523-40f9e333c9db@microchip.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <27c305208aba4b028a535ae68c9b3a77@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_083906_191003_0C14E220 
X-CRM114-Status: GOOD (  16.24  )
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
Cc: sr@denx.de, vigneshr@ti.com, jaimeliao@mxic.com.tw, richard@nod.at,
 esben@geanix.com, linux@rasmusvillemoes.dk, knaerzche@gmail.com,
 Nicolas.Ferre@microchip.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, macromorgan@hotmail.com,
 miquel.raynal@bootlin.com, heiko.thiery@gmail.com, zhengxunli@mxic.com.tw,
 p.yadav@ti.com, mail@david-bauer.net, code@reto-schneider.ch
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMjAyMi0wMy0wMyAxNzowMywgc2NocmllYiBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb206
Ci4uCj4+Pj4+IFNvIHdoZW4gb25lCj4+Pj4+IGRlY2xhcmVzIGEgZmxhc2ggbGlrZToKPj4+Pj4g
K8KgwqDCoMKgwqAgeyAibXgyNWwzMjA1ZCIswqAgSU5GTygweGMyMjAxNiwgMCwgNjQgKiAxMDI0
LMKgIDY0KQo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIElEIGNvbGxpc2lvbiB3
aXRoIG14MjVsMzIzM2YuICovCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUEFSU0Vf
U0ZEUAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5PX1NGRFBfRkxBR1MoU0VDVF80
SykKPj4+PiAKPj4+PiBCdXQgd2hhdCBhYm91dAo+Pj4+ICvCoMKgwqDCoMKgIHsgImRpZmZlcmVu
dGZsYXNoIizCoCBJTkZPKDB4YzIyMDE2LCAwLCA2NCAqIDEwMjQswqAgNjQpCj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBJRCBjb2xsaXNpb24gd2l0aCBteDI1bDMyMzNmLiAqLwo+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUEFSU0VfU0ZEUAo+Pj4+IAo+Pj4+IFRoYXRz
IGFsc28gdmFsaWQsIG5vPyBXaHkgaXMgaGF2aW5nIDRrIHNlY3RvcnMgc3BlY2lhbD8gRldJVywg
dGhlCj4+PiAKPj4+IG5vLCBiZWNhdXNlIGp1c3QgdGhlIGZpcnN0IGVudHJ5IHdpdGggdGhlIDB4
YzIyMDE2IElEIHdpbGwgYmUgaGl0LCAKPj4+IHRoZQo+Pj4gc2Vjb25kIG9uZSB3aWxsIGJlIGln
bm9yZWQuIFdlIHVzZSBhIHNpbmdsZSBmbGFzaCBlbnRyeSBmb3IgYWxsIHRoZQo+Pj4gZmxhc2hl
cyB0aGF0IGNvbGxpZGUuCj4+IAo+PiBOb3QgaW4gYWRkaXRpb24gYnV0IGluc3RlYWQgb2YgeW91
cnMsIG9mIGNvdXJzZS4KPj4gCj4+PiBQQVJTRV9TRkRQIHRvZ2V0aGVyIHdpdGggYW55IG9mIHRo
ZToKPj4+ICNkZWZpbmUgU0VDVF80S8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBCSVQoMSkKPj4+ICNkZWZpbmUgU0VDVF80S19QTUPCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEJJVCgyKQo+Pj4gI2RlZmluZSBTUElfTk9SX0RV
QUxfUkVBRMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQklUKDMpCj4+PiAjZGVmaW5lIFNQ
SV9OT1JfUVVBRF9SRUFEwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBCSVQoNCkKPj4+ICNk
ZWZpbmUgU1BJX05PUl9PQ1RBTF9SRUFEwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQklUKDUp
Cj4+PiAjZGVmaW5lIFNQSV9OT1JfT0NUQUxfRFRSX1JFQUTCoMKgwqDCoMKgwqDCoMKgwqAgQklU
KDYpCj4+PiAjZGVmaW5lIFNQSV9OT1JfT0NUQUxfRFRSX1BQwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBCSVQoNykKPj4+IAo+Pj4gc3VnZ2VzdHMgdGhhdCB3ZSdkIGxpa2UgdG8gZGlmZmVyZW50aWF0
ZSBiZXR3ZWVuIGEgZmxhc2ggdGhhdCAKPj4+IHN1cHBvcnRzCj4+PiBTRkRQIGFuZCBjYW4gZGlz
Y292ZXIgaXRzIHBhcmFtcyB2aWEgU0ZEUCAobm9fc2ZkcF9mbGFncyB3aWxsIGJlCj4+PiBpZ25v
cmVkKSwKPj4+IGFuZCBhIGZsYXNoIHRoYXQgZG9lc24ndCBzdXBwb3J0IFNGRFAgYW5kIGl0J3Mg
Zm9yY2VkIHRvIGluaXRpYWxpemUgCj4+PiB0aGUKPj4+IHBhcmFtcyB2aWEgdGhlIG5vX3NmZHBf
ZmxhZ3MuCj4+IAo+PiBJIGdldCB0aGF0LCBidXQgd2hhdCBpZiBJIGhhdmUgYSBmbGFzaCwgd2hp
Y2ggZG9lc24ndCBoYXZlIDRrCj4+IHNlY3RvcnMgYnV0IG9yZGluYXJ5IDY0ayBzZWN0b3JzICh0
byBzdGljayB0byB5b3VyIGV4YW1wbGUpLiBJbgo+PiBnZW5lcmFsLCB3aGF0IGlmIEkgaGF2ZSBh
IGZsYXNoIHdoZXJlIG5vbmUgb2YgdGhlIGFib3ZlIGZsYWdzCj4+IGFyZSBzZXQuIFlvdSBvbmx5
IGNhbGwgdGhhdCBmdW5jdGlvbiBpZiB0aGVyZSBhcmUgYW55IG5vX3NmZHAgZmxhZ3MKPj4gc2V0
LCBidXQgdGhleSBhcmUgYWxsIG9wdGlvbmFsLCBubz8gV2hvIGlzIHNldHRpbmcgdGhlIGVyYXNl
IG9wY29kZQo+PiBmb3IgZmxhc2hlcyB3aXRoIHRoYXQgSUQgYnV0IHdpdGhvdXQgU0ZEUCwgdGhl
bj8KPiAKPiB0aGlzIHVzZSBjYXNlIGlzIG5vdCBoYW5kbGVkIGluIHRoaXMgcHJvcG9zYWwsIGlu
ZGVlZC4gSSdtIG5vdCBzdXJlCj4gaWYgdGhlcmUgYXJlIHN1Y2ggZmxhc2hlcyB0aG91Z2guIENh
bid0IHRoaW5rIG9mIGFuIGV4YW1wbGUuIFdlIHNlYXJjaAo+IGZvciBhIGZsYXNoIHRoYXQgb3Bl
cmF0ZXMgb25seSBpbiAxLTEtMSBhbmQgY2FuJ3QgZG8gNGsgZXJhc2UuCj4gSXMgdGhhdCBhIE5P
Uj8gQnV0IGlmIHlvdSBmZWVsIHdlIHNob3VsZCBjYXJlIGFib3V0IHRoaXMgY2FzZSB0b28sCj4g
SSdsbCBhZGRyZXNzIGl0LCBwcm9iYWJseSBJIHdpbGwgYmUgZm9yY2VkIHRvIGludHJvZHVjZSBh
IG5ldyBmbGFnIG9yCj4gYSBib29sLCBtZWguCgoxLTEtMSB3aXRoIDY0ayBzZWN0b3JzIHdvdWxk
IGJlIHRoZSB2ZXJ5IGJhc2ljIHNwaSBub3IgZmxhc2ggbm8/CkluIGFueSBjYXNlLCBubyBJIGRv
bid0IGNhcmUgdGhhdCBtdWNoIGFib3V0IHRoaXMsIGl0IHdhcyBqdXN0IG5vdAp0aGF0IGVhc3kg
dG8gdW5kZXJzdGFuZCB3aHkgeW91IGRpZCBpdCB0aGlzIHdheS4gU28gd2Ugc2hvdWxkCnJlYWxs
eSBhZGQgYSBjb21tZW50IHRoYXQgd2UgYXNzdW1lIGhlcmUgdGhhdCBhdCBsZWFzdCBvbmUKbm9z
ZmRwIGZsYWcgaXMgc2V0LgoKLW1pY2hhZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
