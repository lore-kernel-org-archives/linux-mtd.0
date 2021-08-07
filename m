Return-Path: <SRS0=iVWO=M6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BD5C4338F
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 10:26:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D019D610CB
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 10:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D019D610CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2YH8Y/LeU5n40chkQpJxtHlkvwRZlBAQRPetWZToXLo=; b=wuNiiPFdQlBw3X
	E47NMG6f4rC2NuX9H+v00T9yWWrlQ6fuDtcjNjFlFqLC6WroYL2erKIYNRFOU0hZNR6qErrtg7U7Z
	BednXdqvg1IzAI0efRnZWZCatc244UeQ6KpX4xiiCFKaDwCXqHjPNtIz0EypGZwQleM2fRkxajAXt
	AVx7byl33IAbSC9bJKL8oVSIlZpLPYE4UqcG9kdzanyV4N/Rh1VVVaO1zssp/gKW5xZ5ICVPydYqu
	PcE02u4g+0zv9ar5S+9WTPjl8J7H39KjigW4lTh7enOMDafYo1JoP6385xZurvTF4g/1ZDcF9lNry
	+RBDYeMhbky6Ipo+1SUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCJWL-00EYe0-Gz; Sat, 07 Aug 2021 10:25:37 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCJWH-00EYdU-M1
 for linux-mtd@lists.infradead.org; Sat, 07 Aug 2021 10:25:35 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 55ABB1BF208;
 Sat,  7 Aug 2021 10:25:27 +0000 (UTC)
Date: Sat, 7 Aug 2021 12:25:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bert Vermeulen <bert@biot.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Mark Brown <broonie@kernel.org>,
 Alexander Lobakin <alobakin@pm.me>
Subject: Re: [V2] mtd: spinand: Add support for Etron EM73D044VCx
Message-ID: <20210807122526.3f9fec0b@xps13>
In-Reply-To: <ba6637f8-6ed0-262e-0229-1b449334cdd2@biot.com>
References: <20210729151829.703892-1-bert@biot.com>
 <20210806213410.7b1f74bd@xps13>
 <ba6637f8-6ed0-262e-0229-1b449334cdd2@biot.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210807_032533_903450_0FC2BF64 
X-CRM114-Status: GOOD (  17.80  )
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

SGkgQmVydCwKCkJlcnQgVmVybWV1bGVuIDxiZXJ0QGJpb3QuY29tPiB3cm90ZSBvbiBTYXQsIDcg
QXVnIDIwMjEgMDk6MzE6NTUgKzAyMDA6Cgo+IE9uIDgvNi8yMSA5OjM0IFBNLCBNaXF1ZWwgUmF5
bmFsIHdyb3RlOgo+IAo+IEhpIE1pcXVlbCwKPiAKPiBUaGFua3MgZm9yIHJldmlld2luZy4gSSds
bCBzZW5kIGluIGEgdjIgd2l0aCBmaXhlcy4gSG93ZXZlci4uLgo+IAo+ID4gQmVydCBWZXJtZXVs
ZW4gPGJlcnRAYmlvdC5jb20+IHdyb3RlIG9uIFRodSwgMjkgSnVsIDIwMjEgMTc6MTg6MjMgKzAy
MDA6ICAKPiA+PiArc3RhdGljIGludCBldHJvbl9vb2JsYXlvdXRfZWNjKHN0cnVjdCBtdGRfaW5m
byAqbXRkLCBpbnQgc2VjdGlvbiwKPiA+PiArCQkJCQlzdHJ1Y3QgbXRkX29vYl9yZWdpb24gKm9v
YnJlZ2lvbikKPiA+PiArewo+ID4+ICsJaWYgKHNlY3Rpb24pCj4gPj4gKwkJcmV0dXJuIC1FUkFO
R0U7Cj4gPj4gKwo+ID4+ICsJb29icmVnaW9uLT5vZmZzZXQgPSA3MjsKPiA+PiArCW9vYnJlZ2lv
bi0+bGVuZ3RoID0gNTY7ICAKPiA+IAo+ID4gVGhpcyBsb29rcyBoaWdobHkgZGVwZW5kZW50IG9u
IGEgc2luZ2xlIGNoaXAsIGNvdWxkIHlvdSBtYWtlIHRoZXNlCj4gPiB2YWx1ZXMgKGF0IGxlYXN0
IHRoZSBvZmZzZXQpIGRlcGVuZGVudCBvbiB0aGUgTVREIGRldmljZT8KPiA+ICAgCj4gPj4gKwo+
ID4+ICsJcmV0dXJuIDA7Cj4gPj4gK30KPiA+PiArCj4gPj4gK3N0YXRpYyBpbnQgZXRyb25fb29i
bGF5b3V0X2ZyZWUoc3RydWN0IG10ZF9pbmZvICptdGQsIGludCBzZWN0aW9uLAo+ID4+ICsJCQkg
ICBzdHJ1Y3QgbXRkX29vYl9yZWdpb24gKm9vYnJlZ2lvbikKPiA+PiArewo+ID4+ICsJaWYgKHNl
Y3Rpb24pCj4gPj4gKwkJcmV0dXJuIC1FUkFOR0U7Cj4gPj4gKwo+ID4+ICsJb29icmVnaW9uLT5v
ZmZzZXQgPSAxOwo+ID4+ICsJb29icmVnaW9uLT5sZW5ndGggPSA3MTsgIAo+ID4gCj4gPiBTYW1l
IGhlcmUuICAKPiAKPiBJIHdhcyByYXRoZXIgaG9waW5nIGZvciBzb21lIGd1aWRhbmNlIG9uIHRo
ZSBfZWNjIGFuZCBfZnJlZQo+IG9mZnNldC9sZW5ndGggbnVtYmVycy4gVGhlcmUncyBub3QgbXVj
aCBpbmZvIGFyb3VuZCBvbiB3aGF0J3MgYmVzdAo+IHByYWN0aWNlIGhlcmUsIGFuZCBJIGhhdmVu
J3QgcGxheWVkIHdpdGggTkFORCBjaGlwcyBlbm91Z2ggdG8gYWN0dWFsbHkKPiB0ZXN0IHRoZSBp
bi1rZXJuZWwgRUNDIHN0dWZmLgo+IAo+IFRoZSBfZnJlZSBvZmZzZXQgb2YgMSBpcyBmb3IgdGhl
IGJhZCBibG9jayBieXRlLCB3aGljaCBJIHNhdyBpbiBhbm90aGVyCj4gTkFORCBjaGlwIGRyaXZl
ciwgYnV0IEkgZG9uJ3QgcmVtZW1iZXIgd2hlcmUgSSBnb3QgdGhlIG90aGVyIG51bWJlcnMKPiBm
cm9tLCBhbmQgcmVhbGx5IG5lZWQgc29tZWJvZHkgdG8gZG91YmxlLWNoZWNrIHRoYXQuCgpUaGVz
ZSB2YWx1ZXMgc2hvdWxkIGJlIGluIHRoZSBkYXRhc2hlZXQgc29tZWhvdy4KCkRlcGVuZGluZyBv
biB0aGUgYWxnb3JpdGhtIChleDogQkNIKSBhbmQgdGhlIHN0cmVuZ3RoIChleDogNGIvNTEyQikg
eW91CndpbGwgbmVlZCBhIGNlcnRhaW4gbnVtYmVyIG9mIEVDQyBieXRlcyBwZXIgY2h1bmsuIFRo
ZW4geW91IG11bHRpcGx5CnRoYXQgbnVtYmVyIGJ5IHRoZSBudW1iZXIgb2YgY2h1bmtzIGFuZCB5
b3UgZ2V0IHRoZSB0b3RhbCBudW1iZXIgb2YgRUNDCmJ5dGVzLiBBc3N1bWluZyB5b3Uga25vdyBh
biBvZmZzZXQgZnJvbSB0aGUgc3RhcnQgb3IgdGhlIGVuZCBvZiB0aGUgT09CCnNlY3Rpb24sIHlv
dSBtaWdodCB3cml0ZSBzb21ldGhpbmcgbGlrZSB0aGF0OgoKCWxlbmd0aCA9IG10ZC0+d3JpdGVz
aXplIC8gY2h1bmtfc2l6ZSAqIG5iX2VjY19ieXRlcy9jaHVuazsKCW9mZnNldCA9IG10ZC0+b29i
c2l6ZSAtIGxlbmd0aDsKCkFsc28gcGxlYXNlIHJlc2VydmUgdHdvIGJ5dGVzIGZvciBPT0IgKGV2
ZW4gaWYgc28gZmFyIHdlIGVuY291bnRlcmVkCm9ubHkgMUIgbWFya2VycykuCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
