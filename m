Return-Path: <SRS0=QRHZ=WD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D8BC433FF
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Aug 2019 09:10:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B417D21923
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Aug 2019 09:10:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uxJPtlk1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oQWJ7GVY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B417D21923
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zJAlIllHEyFBjxr9AI5qkEIaWTtsRfLIHgc/NSfxFVk=; b=uxJPtlk18pj8p1
	UdM7M04bmVmlbAx4ZoVw74VQNkyWsYYb79eLLmXKDTA7LUqSrnqtsAl8D6LZEthOqEsqjoM1cGtQL
	mBXofKXCioG7/rji3AyNila/fpQiEUwAh+DhYJy4a94jQKKx1mzExirVWLXNyjvz/Yrv+LguNQFZE
	j4YP/wizn9JxDiCJFqJpiOPMF0sd8t5rHb3fdoJNqh6GVHLF2TjBg/xmXXene7TUspeshtqFPKGtR
	Ka05uKoJmltkq4ShWzcWrPhBL2X7IuPijlJr2q4WxYolmuqVRFhpvih99njho6U7ee9djjQDdr93p
	q7kuHxZhinbz/X5Lf+gw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvHxc-00063b-UJ; Wed, 07 Aug 2019 09:10:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvHxb-00063K-GW
 for linux-mtd@bombadil.infradead.org; Wed, 07 Aug 2019 09:10:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jrDd8jgJXhJunZr0bNnncsVJsN3OgSrem2iNtGEXP/Q=; b=oQWJ7GVYEDUn3qaco7C1nBD+6t
 LXbin95zE1M41JSkU2gE6CueskSNnYJRm80ksCSSqvVbo9Qg/1fGYf9ZAtHbix7xiT3rIeYtsKpKh
 PJYjL4JasbspmcRdh16UJQOJiso+fLgjWO/xpGAUOlhx992mUaYqM28GQU7zomdTJBK2Eeqb2N5W+
 6VRVBwg37ZpkVqZ7itW60R4BY4SaYSZxTj40Clmy9iXE2OEzxxNWxWRf03FPKu8ujkXVRlWyfGowa
 w6dsZKHKlIyS+91hPIVgWqWdBqFWeg7WDFMLLeZibz/qUgrCROJ+s2OYcvMOhdk0vTQYkwGR1TwqL
 VtNnn8Bw==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by casper.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvHxo-0005m6-3v
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2019 09:10:34 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 5C81E60010;
 Wed,  7 Aug 2019 09:09:38 +0000 (UTC)
Date: Wed, 7 Aug 2019 11:09:37 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: shiva.linuxworks@gmail.com
Subject: Re: [PATCH 3/8] mtd: nand: create ONFI table parsing instance
Message-ID: <20190807110937.4dfe1746@xps13>
In-Reply-To: <20190722055621.23526-4-sshivamurthy@micron.com>
References: <20190722055621.23526-1-sshivamurthy@micron.com>
 <20190722055621.23526-4-sshivamurthy@micron.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190807_101032_231816_1D52FEF7 
X-CRM114-Status: GOOD (  20.45  )
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
Cc: Chuanhong Guo <gch981213@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 liaoweixiong <liaoweixiong@allwinnertech.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Jeff Kletsky <git-commits@allycomm.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Shivamurthy Shastri <sshivamurthy@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2hpdmEsCgpzaGl2YS5saW51eHdvcmtzQGdtYWlsLmNvbSB3cm90ZSBvbiBNb24sIDIyIEp1
bCAyMDE5IDA3OjU2OjE2ICswMjAwOgoKPiBGcm9tOiBTaGl2YW11cnRoeSBTaGFzdHJpIDxzc2hp
dmFtdXJ0aHlAbWljcm9uLmNvbT4KCiJDcmVhdGUgb25lIGdlbmVyaWMgT05GSSB0YWJsZSBwYXJz
aW5nIGluc3RhbmNlIgoKPiAKPiBPTkZJIHRhYmxlIHBhcnNpbmcgaXMgY29tbW9uLCBhcyBtb3N0
IG9mIHRoZSB2YXJpYWJsZXMgYXJlIGNvbW1vbgo+IGJldHdlZW4gcmF3IGFuZCBTUEkgTkFORC4g
VGhlIHBhcnNpbmcgZnVuY3Rpb24gaXMgaW5zdGFudGlhdGVkIGluCj4gb25maS5jLCB3aGljaCBm
aWxscyBPTkZJIHBhcmFtZXRlcnMgaW50byBuYW5kX21lbW9yeV9vcmdhbml6YXRpb24uCgouLi4g
aW50byBuYW5kX21lbW9yeV9vcmdhbml6YXRpb24ganVzdCBhcyBiZWZvcmUuCgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFNoaXZhbXVydGh5IFNoYXN0cmkgPHNzaGl2YW11cnRoeUBtaWNyb24uY29tPgo+
IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL29uZmkuYyAgICAgICAgICB8IDMyICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfb25maS5j
IHwgMjIgKystLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBpbmNsdWRlL2xpbnV4L210ZC9vbmZpLmgg
ICAgICAgICB8ICAyICsrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgMjAg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvb25maS5jIGIv
ZHJpdmVycy9tdGQvbmFuZC9vbmZpLmMKPiBpbmRleCA3YWFmMzZkZmM1ZTAuLmU3ODcwMDg5NGFl
YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL29uZmkuYwo+ICsrKyBiL2RyaXZlcnMv
bXRkL25hbmQvb25maS5jCj4gQEAgLTg3LDMgKzg3LDM1IEBAIHZvaWQgc2FuaXRpemVfc3RyaW5n
KHU4ICpzLCBzaXplX3QgbGVuKQo+ICAJc3RyaW0ocyk7Cj4gIH0KPiAgRVhQT1JUX1NZTUJPTF9H
UEwoc2FuaXRpemVfc3RyaW5nKTsKPiArCj4gKy8qKgo+ICsgKiBmaWxsX25hbmRfbWVtb3JnKCkg
LSBQYXJzZSBPTkZJIHRhYmxlIGFuZCBmaWxsIG1lbW9yZwoKICAgICAgXiBwYXJzZV9vbmZpX3Bh
cmFtcygpIC0gUGFyc2UgYW4gT05GSSB0YWJsZSBhbmQgZmlsbCBhIG1lbW9yeQogICAgICBvcmdh
bml6YXRpb24gc3RydWN0dXJlCgo+ICsgKiBAbWVtb3JnOiBOQU5EIG1lbW9yZyB0byBiZSBmaWxs
ZWQKCiAgICAgICAgICAgICAgICAgICAgbWVtb3J5IG9yZ2FuaXphdGlvbiBjb3JlIHN0cnVjdHVy
ZSB0byBiZSBmaWxsZWQKCj4gKyAqIEBwOiBPTkZJIHRhYmxlIHRvIGJlIHBhcnNlZAo+ICsgKgo+
ICsgKi8KPiArdm9pZCBwYXJzZV9vbmZpX3BhcmFtcyhzdHJ1Y3QgbmFuZF9tZW1vcnlfb3JnYW5p
emF0aW9uICptZW1vcmcsCj4gKwkJICAgICAgIHN0cnVjdCBuYW5kX29uZmlfcGFyYW1zICpwKQo+
ICt7Cj4gKwltZW1vcmctPnBhZ2VzaXplID0gbGUzMl90b19jcHUocC0+Ynl0ZV9wZXJfcGFnZSk7
Cj4gKwo+ICsJLyoKPiArCSAqIHBhZ2VzX3Blcl9ibG9jayBhbmQgYmxvY2tzX3Blcl9sdW4gbWF5
IG5vdCBiZSBhIHBvd2VyLW9mLTIgc2l6ZQo+ICsJICogKGRvbid0IGFzayBtZSB3aG8gdGhvdWdo
dCBvZiB0aGlzLi4uKS4gTVREIGFzc3VtZXMgdGhhdCB0aGVzZQo+ICsJICogZGltZW5zaW9ucyB3
aWxsIGJlIHBvd2VyLW9mLTIsIHNvIGp1c3QgdHJ1bmNhdGUgdGhlIHJlbWFpbmluZyBhcmVhLgo+
ICsJICovCj4gKwltZW1vcmctPnBhZ2VzX3Blcl9lcmFzZWJsb2NrID0KPiArCQkJMSA8PCAoZmxz
KGxlMzJfdG9fY3B1KHAtPnBhZ2VzX3Blcl9ibG9jaykpIC0gMSk7Cj4gKwo+ICsJbWVtb3JnLT5v
b2JzaXplID0gbGUxNl90b19jcHUocC0+c3BhcmVfYnl0ZXNfcGVyX3BhZ2UpOwo+ICsKPiArCW1l
bW9yZy0+bHVuc19wZXJfdGFyZ2V0ID0gcC0+bHVuX2NvdW50Owo+ICsJbWVtb3JnLT5wbGFuZXNf
cGVyX2x1biA9IDEgPDwgcC0+aW50ZXJsZWF2ZWRfYml0czsKPiArCj4gKwkvKiBTZWUgZXJhc2Vz
aXplIGNvbW1lbnQgKi8KPiArCW1lbW9yZy0+ZXJhc2VibG9ja3NfcGVyX2x1biA9Cj4gKwkJMSA8
PCAoZmxzKGxlMzJfdG9fY3B1KHAtPmJsb2Nrc19wZXJfbHVuKSkgLSAxKTsKPiArCW1lbW9yZy0+
bWF4X2JhZF9lcmFzZWJsb2Nrc19wZXJfbHVuID0gbGUzMl90b19jcHUocC0+YmxvY2tzX3Blcl9s
dW4pOwo+ICsJbWVtb3JnLT5iaXRzX3Blcl9jZWxsID0gcC0+Yml0c19wZXJfY2VsbDsKPiArfQo+
ICtFWFBPUlRfU1lNQk9MX0dQTChwYXJzZV9vbmZpX3BhcmFtcyk7Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L25hbmRfb25maS5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFu
ZF9vbmZpLmMKPiBpbmRleCAyZThlZGZhNjM2ZWYuLjI2Mzc5NmQzMjk4YyAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX29uZmkuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L25hbmRfb25maS5jCj4gQEAgLTE4MSwzMCArMTgxLDEyIEBAIGludCBuYW5kX29uZmlf
ZGV0ZWN0KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gIAkJZ290byBmcmVlX29uZmlfcGFyYW1f
cGFnZTsKPiAgCX0KPiAgCj4gLQltZW1vcmctPnBhZ2VzaXplID0gbGUzMl90b19jcHUocC0+Ynl0
ZV9wZXJfcGFnZSk7Cj4gLQltdGQtPndyaXRlc2l6ZSA9IG1lbW9yZy0+cGFnZXNpemU7Cj4gKwlw
YXJzZV9vbmZpX3BhcmFtcyhtZW1vcmcsIHApOwo+ICAKPiAtCS8qCj4gLQkgKiBwYWdlc19wZXJf
YmxvY2sgYW5kIGJsb2Nrc19wZXJfbHVuIG1heSBub3QgYmUgYSBwb3dlci1vZi0yIHNpemUKPiAt
CSAqIChkb24ndCBhc2sgbWUgd2hvIHRob3VnaHQgb2YgdGhpcy4uLikuIE1URCBhc3N1bWVzIHRo
YXQgdGhlc2UKPiAtCSAqIGRpbWVuc2lvbnMgd2lsbCBiZSBwb3dlci1vZi0yLCBzbyBqdXN0IHRy
dW5jYXRlIHRoZSByZW1haW5pbmcgYXJlYS4KPiAtCSAqLwo+IC0JbWVtb3JnLT5wYWdlc19wZXJf
ZXJhc2VibG9jayA9Cj4gLQkJCTEgPDwgKGZscyhsZTMyX3RvX2NwdShwLT5wYWdlc19wZXJfYmxv
Y2spKSAtIDEpOwo+ICsJbXRkLT53cml0ZXNpemUgPSBtZW1vcmctPnBhZ2VzaXplOwo+ICAJbXRk
LT5lcmFzZXNpemUgPSBtZW1vcmctPnBhZ2VzX3Blcl9lcmFzZWJsb2NrICogbWVtb3JnLT5wYWdl
c2l6ZTsKPiAtCj4gLQltZW1vcmctPm9vYnNpemUgPSBsZTE2X3RvX2NwdShwLT5zcGFyZV9ieXRl
c19wZXJfcGFnZSk7Cj4gIAltdGQtPm9vYnNpemUgPSBtZW1vcmctPm9vYnNpemU7Cj4gIAo+IC0J
bWVtb3JnLT5sdW5zX3Blcl90YXJnZXQgPSBwLT5sdW5fY291bnQ7Cj4gLQltZW1vcmctPnBsYW5l
c19wZXJfbHVuID0gMSA8PCBwLT5pbnRlcmxlYXZlZF9iaXRzOwo+IC0KPiAtCS8qIFNlZSBlcmFz
ZXNpemUgY29tbWVudCAqLwo+IC0JbWVtb3JnLT5lcmFzZWJsb2Nrc19wZXJfbHVuID0KPiAtCQkx
IDw8IChmbHMobGUzMl90b19jcHUocC0+YmxvY2tzX3Blcl9sdW4pKSAtIDEpOwo+IC0JbWVtb3Jn
LT5tYXhfYmFkX2VyYXNlYmxvY2tzX3Blcl9sdW4gPSBsZTMyX3RvX2NwdShwLT5ibG9ja3NfcGVy
X2x1bik7Cj4gLQltZW1vcmctPmJpdHNfcGVyX2NlbGwgPSBwLT5iaXRzX3Blcl9jZWxsOwo+IC0K
PiAgCWlmIChsZTE2X3RvX2NwdShwLT5mZWF0dXJlcykgJiBPTkZJX0ZFQVRVUkVfMTZfQklUX0JV
UykKPiAgCQljaGlwLT5vcHRpb25zIHw9IE5BTkRfQlVTV0lEVEhfMTY7Cj4gIAo+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L210ZC9vbmZpLmggYi9pbmNsdWRlL2xpbnV4L210ZC9vbmZpLmgK
PiBpbmRleCAyYzhhMDVhMDJiYjAuLjRjYWNmNGU5ZGI2ZCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRl
L2xpbnV4L210ZC9vbmZpLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L210ZC9vbmZpLmgKPiBAQCAt
MTgzLDUgKzE4Myw3IEBAIHZvaWQgbmFuZF9iaXRfd2lzZV9tYWpvcml0eShjb25zdCB2b2lkICoq
c3JjYnVmcywKPiAgCQkJICAgIHZvaWQgKmRzdGJ1ZiwKPiAgCQkJICAgIHVuc2lnbmVkIGludCBi
dWZzaXplKTsKPiAgdm9pZCBzYW5pdGl6ZV9zdHJpbmcodTggKnMsIHNpemVfdCBsZW4pOwo+ICt2
b2lkIHBhcnNlX29uZmlfcGFyYW1zKHN0cnVjdCBuYW5kX21lbW9yeV9vcmdhbml6YXRpb24gKm1l
bW9yZywKPiArCQkgICAgICAgc3RydWN0IG5hbmRfb25maV9wYXJhbXMgKnApOwo+ICAKPiAgI2Vu
ZGlmIC8qIF9fTElOVVhfTVREX09ORklfSCAqLwoKCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
