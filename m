Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701A5C10F12
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:08:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D11120835
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:08:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ac8wa140"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D11120835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqvamTumz1mUEuWXTwwX678F748RlunhycbAUTeQY3Q=; b=ac8wa14062tShr
	YTqKd65AT1or++DmgIiybm4jTJouOuL1Y1VZ400DotYJWoyxU1lr4V3fkl+9d6+K9dyGtDCMkUfhF
	Jhh5hYk8gYBcLUmjvCOL1Tu6VG7f7hC0qIhexPzdyRdV0C9tigv6m9t0+71GaoRlrnMpd1vi/M9OG
	XFosoyDYU9ybT0maFhGl+oqEUv+HQhVtlcLUsi84IBCoAk4sWwX9cgF86Ji21P5mf+ypxP64RHtcU
	A8HNveUq7PRRS8HJTKZhwLPt5LWBrNg3Z1wHi+EeJzmcPnS0ZWafS279/pL/WeyHeHQfcBibAJMHk
	U41xgcODz+L0MvQWrfng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGhUC-0001sK-Ad; Wed, 17 Apr 2019 10:08:12 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGhU9-0001rX-L1
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 10:08:11 +0000
X-Originating-IP: 90.88.160.238
Received: from xps13 (aaubervilliers-681-1-42-238.w90-88.abo.wanadoo.fr
 [90.88.160.238]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 69223C0007;
 Wed, 17 Apr 2019 10:08:06 +0000 (UTC)
Date: Wed, 17 Apr 2019 12:08:05 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v4 6/7] mtd: rawnand: ESMT: Also use the last page for
 bad block markers
Message-ID: <20190417120805.6727d78f@xps13>
In-Reply-To: <20190218104122.18788-7-frieder.schrempf@kontron.de>
References: <20190218104122.18788-1-frieder.schrempf@kontron.de>
 <20190218104122.18788-7-frieder.schrempf@kontron.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_030809_839883_703605F2 
X-CRM114-Status: GOOD (  15.86  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRnJpZWRlciwKClNjaHJlbXBmIEZyaWVkZXIgPGZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5k
ZT4gd3JvdGUgb24gTW9uLCAxOCBGZWIKMjAxOSAxMDo0Mjo0NSArMDAwMDoKCj4gRnJvbTogRnJp
ZWRlciBTY2hyZW1wZiA8ZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRlPgo+IAo+IEl0IGlzIGtu
b3duIHRoYXQgc29tZSBFU01UIFNMQyBOQU5EcyBoYXZlIGJlZW4gc2hpcHBlZAo+IHdpdGggdGhl
IGZhY3RvcnkgYmFkIGJsb2NrIG1hcmtlcnMgaW4gdGhlIGZpcnN0IG9yIGxhc3QgcGFnZQo+IG9m
IHRoZSBibG9jaywgaW5zdGVhZCBvZiB0aGUgZmlyc3Qgb3Igc2Vjb25kIHBhZ2UuIFRvIGJlIG9u
Cj4gdGhlIHNhZmUgc2lkZSwgbGV0J3MgY2hlY2sgYWxsIHRocmVlIGxvY2F0aW9ucy4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBGcmllZGVyIFNjaHJlbXBmIDxmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24u
ZGU+Cj4gUmV2aWV3ZWQtYnk6IEJvcmlzIEJyZXppbGxvbiA8YmJyZXppbGxvbkBrZXJuZWwub3Jn
Pgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2VzbXQuYyB8IDkgKysrKysrKyst
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9lc210LmMgYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9uYW5kX2VzbXQuYwo+IGluZGV4IDk5YTgwOTI5NjlhNy4uYjM3ZTBiNWFmNWFl
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfZXNtdC5jCj4gKysrIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9lc210LmMKPiBAQCAtMzYsNyArMzYsMTQgQEAgc3Rh
dGljIHZvaWQgZXNtdF9uYW5kX2RlY29kZV9pZChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+ICBz
dGF0aWMgaW50IGVzbXRfbmFuZF9pbml0KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gIHsKPiAg
CWlmIChuYW5kX2lzX3NsYyhjaGlwKSkKPiAtCQljaGlwLT5vcHRpb25zIHw9IE5BTkRfQkJNX0ZJ
UlNUUEFHRSB8IE5BTkRfQkJNX1NFQ09ORFBBR0U7Cj4gKwkJLyoKPiArCQkgKiBJdCBpcyBrbm93
biB0aGF0IHNvbWUgRVNNVCBTTEMgTkFORHMgaGF2ZSBiZWVuIHNoaXBwZWQKPiArCQkgKiB3aXRo
IHRoZSBmYWN0b3J5IGJhZCBibG9jayBtYXJrZXJzIGluIHRoZSBmaXJzdCBvciBsYXN0IHBhZ2UK
PiArCQkgKiBvZiB0aGUgYmxvY2ssIGluc3RlYWQgb2YgdGhlIGZpcnN0IG9yIHNlY29uZCBwYWdl
LiBUbyBiZSBvbgo+ICsJCSAqIHRoZSBzYWZlIHNpZGUsIGxldCdzIGNoZWNrIGFsbCB0aHJlZSBs
b2NhdGlvbnMuCj4gKwkJICovCj4gKwkJY2hpcC0+b3B0aW9ucyB8PSBOQU5EX0JCTV9GSVJTVFBB
R0UgfCBOQU5EX0JCTV9TRUNPTkRQQUdFIHwKPiArCQkJCSBOQU5EX0JCTV9MQVNUUEFHRTsKPiAg
Cj4gIAlyZXR1cm4gMDsKPiAgfQoKClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
