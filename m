Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BFDCA5FF0
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2026 21:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CB+bd83rWe8WFRa+GFFdf5MyoCTbCz9IJSbEeOpQdOc=; b=FC/F7uZIG+KcuR
	WtOBdSVJcr82HNyrVql7SJSRrwVGeKQPBbgTABzs47v6D44lIzKDBySWC6JnP4NdLInJioWPJPvPx
	ZC/SScY//H1THO/pVgRL4GFjJpmuM0J5pop2MH8A8Ytcwbpwx9AktrFWdwZ1tYmQgdY8dAz4y80NE
	LwSJAvvV8mieDFhIQaNfQ0gjfWPklfqntjX6Qvi+43Z30nxoI8Zmno4d+tyHiNd6D7Hj6MXiK3k9U
	dChDA+w40wwKGn952aV3eNnIP6zgVIlOXnN2+kPpyn2MRu5/Go9nKU9kfmV8bFaKvRXEU6fbxEh+2
	SEcD1JN0la0S2+Pmjd4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDU1U-0000000FO0o-2UBB;
	Sun, 04 Oct 2026 21:45:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDU1T-0000000FO0i-1qHu
	for linux-mtd@lists.infradead.org;
	Sun, 04 Oct 2026 21:45:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FE9D41415;
	Sun,  4 Oct 2026 21:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 837371F000FF;
	Sun,  4 Oct 2026 21:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791150331;
	bh=dYNWrtWYxeTtYnJXxEyF5VshTkgt8kkbZh89AuMatqE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hZHqAYVuzrVNjnonVvp/qZD0CUiSqgQfDnzMeA8wvk+QWknSDCXhVwdejv6e64zGc
	 s7jplRaMDvaaJnqZ+RrdT4LE1cNpcTnkRb6V1WLlQ5hMSEOWr4fgsfYPwoDxuHZlPw
	 wCaNPi0IYt04zm+WIFJEFEXKhn7dBhbWVf38J9iY5LdstAYCEkL2WOuLZlp+rvlSxV
	 CTxmVDcH2q+zoJAIPJ8/CdpAJa5mfCzvsWDVC8nwruVVQUHUzVMJtSDTYgpx5tQqW8
	 rcTZ5wlTZu0GYCOe4G+1TgI6CGOR7k46NQ+UkxxB6vtmrA89mdZchpOShpayuepuVn
	 qbPkyU2rHA+8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/17] mtd: spi-nor: winbond: Prepare the
 introduction of W35TxxNW parts
To: "Vignesh Raghavendra" <vigneshr@ti.com>, "Michael Walle" <mwalle@kernel.org>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>
Cc: "Steam Lin" <STLin2@winbond.com>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261004-winbond-master-spi-nor-w35t-v2-10-592f3300a70f@bootlin.com>
References: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
 <20261004-winbond-master-spi-nor-w35t-v2-10-592f3300a70f@bootlin.com>
Date: Sun, 04 Oct 2026 21:45:30 +0000
Message-Id: <20261004214530.837371F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogc3BpLW5vcjog
d2luYm9uZDogbWlzc2luZyBGbGFnIFJlZ2lzdGVyIHBvbGxpbmcgaWdub3JlcyBQL0UgZXJyb3Jz
Ci0tCgpjb21taXQgZWVmMWJkYWU5N2JmOGVjNmM1ZWU4ZjQ3ZjIzNThjYzQzNTFlMjU4YgpBdXRo
b3I6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgptdGQ6IHNwaS1u
b3I6IHdpbmJvbmQ6IFByZXBhcmUgdGhlIGludHJvZHVjdGlvbiBvZiBXMzVUeHhOVyBwYXJ0cwoK
VGhpcyBjb21taXQgcHJlcGFyZXMgZm9yIGEgbmV3IG9jdGFsIERUUiBmYW1pbHkgYnkgYWRkaW5n
IGNhbGxiYWNrcyBmb3Igb2N0YWwKRFRSIG1vZGVzIGFuZCBkdW1teSBjeWNsZXMgY29uZmlndXJh
dGlvbi4gSXQgYWxzbyBtZW50aW9ucyB0aGVzZSBjaGlwcyBmZWF0dXJlClNFQ0RFQyBhbmQgbGFj
ayBTUjIsIGJ1dCB0aGV5IGRvIGhhdmUgYSBmbGFnIHJlZ2lzdGVyLgoKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvc3BpLW5vci93aW5ib25kLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3dpbmJv
bmQuYwo+IGluZGV4IDUxZjZiY2QzZjhlNWIuLjA1OGEyOTUxYzE4NGUgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9tdGQvc3BpLW5vci93aW5ib25kLmMKPiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9y
L3dpbmJvbmQuYwo+IEBAIC0xMSw2ICsxMSwxMyBAQAo+ICAjZGVmaW5lIFdJTkJPTkRfTk9SX09Q
X1JERUFSCTB4YzgJLyogUmVhZCBFeHRlbmRlZCBBZGRyZXNzIFJlZ2lzdGVyICovCj4gICNkZWZp
bmUgV0lOQk9ORF9OT1JfT1BfV1JFQVIJMHhjNQkvKiBXcml0ZSBFeHRlbmRlZCBBZGRyZXNzIFJl
Z2lzdGVyICovCj4gICNkZWZpbmUgV0lOQk9ORF9OT1JfT1BfU0VMRElFCTB4YzIJLyogU2VsZWN0
IGFjdGl2ZSBkaWUgKi8KPiArI2RlZmluZSBXSU5CT05EX05PUl9PUF9XUl9WQ1IJMHg4MQkvKiBX
cml0ZSBWQ1IgcmVnaXN0ZXJzICovCj4gKyNkZWZpbmUgICBXSU5CT05EX05PUl9WQ1JfSU9fTU9E
RV9DRkdfUkVHIDB4MDAgLyogSU8gbW9kZSBjb25maWd1cmF0aW9uIGFkZHJlc3MgKFZDUikgKi8K
PiArI2RlZmluZSAgICAgV0lOQk9ORF9OT1JfVkNSX0lPX01PREVfU1NEUiAweEZGCj4gKyNkZWZp
bmUgICAgIFdJTkJPTkRfTk9SX1ZDUl9JT19NT0RFX09ERFIgMHhFNwo+ICsjZGVmaW5lICAgV0lO
Qk9ORF9OT1JfVkNSX0RVTU1ZX0NGR19SRUcgMHgwMSAvKiBEdW1teSBjeWNsZSBjb25maWd1cmF0
aW9uIGFkZHJlc3MgKFZDUikgKi8KPiArI2RlZmluZSBXSU5CT05EX05PUl9PUF9SRF9GUgkweDcw
CS8qIFJlYWQgRmxhZyByZWdpc3RlcnMgKi8KPiArI2RlZmluZSBXSU5CT05EX05PUl9PUF9DTF9G
UgkweDUwCS8qIENsZWFyIEZsYWcgcmVnaXN0ZXJzICovCgpbU2V2ZXJpdHk6IEhpZ2hdCkFyZSB0
aGVzZSBmbGFnIHJlZ2lzdGVyIG9wY29kZXMgb21pdHRlZCBmcm9tIHRoZSBkcml2ZXIgbG9naWM/
CgpUaGUgb3Bjb2RlcyBXSU5CT05EX05PUl9PUF9SRF9GUiBhbmQgV0lOQk9ORF9OT1JfT1BfQ0xf
RlIgYXJlIGRlZmluZWQgaGVyZQpmb3IgaW50ZXJhY3Rpbmcgd2l0aCB0aGUgRmxhZyBSZWdpc3Rl
ciwgYnV0IHRoZXkgZG8gbm90IGFwcGVhciB0byBiZSB1c2VkCmFueXdoZXJlLgoKWyAuLi4gXQoK
PiBAQCAtMjUyLDYgKzI2NSw4NyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNwaV9ub3JfZml4dXBz
IHdpbmJvbmRfbm9yX2VjY19jb25maWd1cmF0aW9uX2ZpeHVwcyA9IHsKPiAgCS5wb3N0X3NmZHAg
PSB3aW5ib25kX25vcl9lY2NfY29uZmlndXJhdGlvbl9wb3N0X3NmZHBfZml4dXBzLAo+ICB9Owo+
ICAKClsgLi4uIF0KCj4gK3N0YXRpYyBpbnQgd2luYm9uZF93MzV0eHhud19ub3JfbGF0ZV9pbml0
KHN0cnVjdCBzcGlfbm9yICpub3IpCj4gK3sKPiArCW5vci0+cGFyYW1zLT5zZXRfb2N0YWxfZHRy
ID0gd2luYm9uZF93MzV0eHhud19ub3Jfc2V0X29jdGFsX2R0cjsKPiArCW5vci0+cGFyYW1zLT5z
ZXRfZHVtbXkgPSB3aW5ib25kX3czNXR4eG53X25vcl9zZXRfZHVtbXk7Cj4gKwlub3ItPnBhcmFt
cy0+b3Bjb2Rlcy5yZWFkX3NyMiA9IDA7Cj4gKwlub3ItPnBhcmFtcy0+b3Bjb2Rlcy53cml0ZV9z
cjFfYW5kX3NyMiA9IDA7CgpbU2V2ZXJpdHk6IEhpZ2hdClNob3VsZCBhIGN1c3RvbSByZWFkeSBj
YWxsYmFjayBiZSBhc3NpZ25lZCBoZXJlIHRvIHBvbGwgdGhlIEZsYWcgUmVnaXN0ZXI/CgpTaW5j
ZSBubyBjdXN0b20gY2FsbGJhY2sgaXMgYXNzaWduZWQsIHRoZSBkcml2ZXIgZmFsbHMgYmFjayB0
byB0aGUgZGVmYXVsdApzcGlfbm9yX3NyX3JlYWR5LCB3aGljaCBvbmx5IGNoZWNrcyB0aGUgU1Ix
IFdJUCBiaXQgYW5kIGRvZXMgbm90IGNoZWNrIHRoZSAKRmxhZyBSZWdpc3RlciBmb3IgZXJyb3Jz
LgoKQ291bGQgdGhpcyBjYXVzZSBhIHJlZ3Jlc3Npb24gd2hlcmUgYW55IHByb2dyYW0gb3IgZXJh
c2Ugb3BlcmF0aW9uIHRoYXQgZmFpbHMKb24gYSBXMzVUeHhOVyBwYXJ0IChlLmcuLCBmcm9tIHdl
YXIgb3IgcHJvdGVjdGlvbiksIGFzIHdlbGwgYXMgRUNDIGVycm9ycywKYXJlIHNpbGVudGx5IGln
bm9yZWQ/IEluIHNvbWUgY2FzZXMsIHVuY2xlYXJlZCBlcnJvcnMgbGVhdmUgdGhlIGZsYXNoIHN0
dWNrLAphbmQgdGhlIE9TIHdpbGwgaW5jb3JyZWN0bHkgYXNzdW1lIGRhdGEgaXMgcGVyc2lzdGVk
LCBsZWFkaW5nIHRvIGRhdGEKY29ycnVwdGlvbi4KCkNvdWxkIHdlIGFzc2lnbiBhIGN1c3RvbSBy
ZWFkeSBjYWxsYmFjayAoc3VjaCBhcyB3aW5ib25kX3czNXR4eG53X25vcl9yZWFkeSkKdG8gY29y
cmVjdGx5IHV0aWxpemUgdGhlIEZsYWcgUmVnaXN0ZXI/Cgo+ICsKPiArCXJldHVybiAwOwo+ICt9
CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0
LzIwMjYxMDA0LXdpbmJvbmQtbWFzdGVyLXNwaS1ub3ItdzM1dC12Mi0wLTU5MmYzMzAwYTcwZkBi
b290bGluLmNvbT9wYXJ0PTEwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
