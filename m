Return-Path: <SRS0=wFkH=YL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8945CA9EA9
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Oct 2019 14:49:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4527421D7C
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Oct 2019 14:49:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QuRGW9PA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4527421D7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJ8BZcBYtaoBitFu2CBX5FGjuc9jS1Hm1EhtGU5hwlE=; b=QuRGW9PAiO6Q7j
	wbQkd1cDJnQDKV3n8qdlrv7efQtBeH0LfhFq2g+tv7K+jctSPaK6AVskdmw45F1lLNZ9fwMi06ar5
	P6DqZvUkhOAUYIv2dc3aPqho0j+ZbeCaCA2dWn7E5BTkzOKu205xz2PzUU10TNUQodnExjEcn+B4I
	VVPQXwG+SZWe1JcQNV+h1SvR7ECD7hokVrXghsCLCDD4DpLZjF0zPDVZC6v7p+0TEJt0JwARWM8bv
	e6DOMh+zfx8U/DxnSMjN51+UvxsTLpiWESrx4wW1NsAhd/GLsBrtvUfXTVItjDyiJLs9b1pKlIsU+
	T0c3/IkZwseoEat0JflA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLTZi-0003Ea-RM; Fri, 18 Oct 2019 14:49:54 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLTZJ-0002ol-UA; Fri, 18 Oct 2019 14:49:32 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 50B6860015;
 Fri, 18 Oct 2019 14:49:21 +0000 (UTC)
Date: Fri, 18 Oct 2019 16:49:20 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spear_smi: Fix nonalignment not handled in
 memcpy_toio
Message-ID: <20191018164920.11250935@xps13>
In-Reply-To: <20191018143643.29676-1-miquel.raynal@bootlin.com>
References: <20191018143643.29676-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_074930_122041_7E991BA7 
X-CRM114-Status: GOOD (  21.07  )
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
Cc: stable@vger.kernel.org, Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 rmk+kernel@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgorUnVzc2VsbCB3aG8gbWlnaHQgaGF2ZSB0aG91Z2h0cyBhYm91dCB0aGUgaXNzdWUK
Ck1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlIG9uIEZyaSwg
MTggT2N0IDIwMTkKMTY6MzY6NDMgKzAyMDA6Cgo+IEFueSB3cml0ZSB3aXRoIGVpdGhlciBkZCBv
ciBmbGFzaGNwIHRvIGEgZGV2aWNlIGRyaXZlbiBieSB0aGUKPiBzcGVhcl9zbWkuYyBkcml2ZXIg
d2lsbCBwYXNzIHRocm91Z2ggdGhlIHNwZWFyX3NtaV9jcHlfdG9pbygpCj4gZnVuY3Rpb24uIFRo
aXMgZnVuY3Rpb24gd2lsbCBnZXQgY2FsbGVkIGZvciBjaHVua3Mgb2YgdXAgdG8gMjU2IGJ5dGVz
Lgo+IElmIHRoZSBhbW91bnQgb2YgZGF0YSBpcyBzbWFsbGVyLCB3ZSBtYXkgaGF2ZSBhIHByb2Js
ZW0gaWYgdGhlIGRhdGEKPiBsZW5ndGggaXMgbm90IDQtYnl0ZSBhbGlnbmVkLiBJbiB0aGlzIHNp
dHVhdGlvbiwgdGhlIGtlcm5lbCBwYW5pY3MKPiBkdXJpbmcgdGhlIG1lbWNweToKPiAKPiAgICAg
IyBkZCBpZj0vZGV2L3VyYW5kb20gYnM9MTAwMSBjb3VudD0xIG9mPS9kZXYvbXRkNgo+ICAgICBz
cGVhcl9zbWlfY3B5X3RvaW8gWzYyMF0gZGVzdCBjOTA3MDAwMCwgc3JjIGM3YmU4ODAwLCBsZW4g
MjU2Cj4gICAgIHNwZWFyX3NtaV9jcHlfdG9pbyBbNjIwXSBkZXN0IGM5MDcwMTAwLCBzcmMgYzdi
ZTg5MDAsIGxlbiAyNTYKPiAgICAgc3BlYXJfc21pX2NweV90b2lvIFs2MjBdIGRlc3QgYzkwNzAy
MDAsIHNyYyBjN2JlOGEwMCwgbGVuIDI1Ngo+ICAgICBzcGVhcl9zbWlfY3B5X3RvaW8gWzYyMF0g
ZGVzdCBjOTA3MDMwMCwgc3JjIGM3YmU4YjAwLCBsZW4gMjMzCj4gICAgIFVuaGFuZGxlZCBmYXVs
dDogZXh0ZXJuYWwgYWJvcnQgb24gbm9uLWxpbmVmZXRjaCAoMHg4MDgpIGF0IDB4YzkwNzAzZTgK
PiAgICAgWy4uLl0KPiAgICAgUEMgaXMgYXQgbWVtY3B5KzB4Y2MvMHgzMzAKPiAKPiBXb3JrYXJv
dW5kIHRoaXMgaXNzdWUgYnkgdXNpbmcgdGhlIGFsdGVybmF0ZSBfbWVtY3B5X3RvaW8oKSBtZXRo
b2QKPiB3aGljaCBhdCBsZWFzdCBkb2VzIG5vdCBwcmVzZW50IHRoZSBzYW1lIHByb2JsZW0uCj4g
Cj4gRml4ZXM6IGYxOGRiYmIxYmZlMCAoIm10ZDogU1QgU1BFQXI6IEFkZCBTTUkgZHJpdmVyIGZv
ciBzZXJpYWwgTk9SIGZsYXNoIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFN1Z2dl
c3RlZC1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29t
Pgo+IC0tLQo+IAo+IEhlbGxvLAo+IAo+IFRoaXMgcGF0Y2ggY291bGQgbm90IGJlIHRlc3RlZCB3
aXRoIGEgbWFpbmxpbmUga2VybmVsIChvbmx5IGNvbXBpbGVkKQo+IGJ1dCB3YXMgdGVzdGVkIHdp
dGggYSBzdGFibGUgNC4xNC54IGtlcm5lbC4gSSBoYXZlIHJlYWxseSBubyBpZGVhIHdoeQo+IG1l
bWNweSBmYWlscyBpbiB0aGlzIHNpdHVhdGlvbiB0aGF0J3Mgd2h5IEkgcHJvcG9zZSB0aGlzIHdv
cmthcm91bmQKPiBidXQgSSBiZXQgdGhlcmUgaXMgc29tZXRoaW5nIGRlZXBlciBub3Qgd29ya2lu
Zy4KCkkgZGlkIG5vdCBtZW50aW9uIHRoYXQgdGhlIG9wcG9zaXRlIGRpcmVjdGlvbiB1c2luZyBt
ZW1jcHlfZnJvbWlvKCkgZG9lcwpub3QgcHJlc2VudCBhbnkgaXNzdWUuCgo+IAo+IFRoYW5rcywK
PiBNaXF1w6hsCj4gCj4gIGRyaXZlcnMvbXRkL2RldmljZXMvc3BlYXJfc21pLmMgfCAyICstCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9kZXZpY2VzL3NwZWFyX3NtaS5jIGIvZHJpdmVycy9tdGQvZGV2
aWNlcy9zcGVhcl9zbWkuYwo+IGluZGV4IDk4NmY4MWQyZjkzZS4uZDg4ODYyNWEzMjQ0IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvbXRkL2RldmljZXMvc3BlYXJfc21pLmMKPiArKysgYi9kcml2ZXJz
L210ZC9kZXZpY2VzL3NwZWFyX3NtaS5jCj4gQEAgLTYxNCw3ICs2MTQsNyBAQCBzdGF0aWMgaW5s
aW5lIGludCBzcGVhcl9zbWlfY3B5X3RvaW8oc3RydWN0IHNwZWFyX3NtaSAqZGV2LCB1MzIgYmFu
aywKPiAgCWN0cmxyZWcxID0gcmVhZGwoZGV2LT5pb19iYXNlICsgU01JX0NSMSk7Cj4gIAl3cml0
ZWwoKGN0cmxyZWcxIHwgV0JfTU9ERSkgJiB+U1dfTU9ERSwgZGV2LT5pb19iYXNlICsgU01JX0NS
MSk7Cj4gIAo+IC0JbWVtY3B5X3RvaW8oZGVzdCwgc3JjLCBsZW4pOwo+ICsJX21lbWNweV90b2lv
KGRlc3QsIHNyYywgbGVuKTsKPiAgCj4gIAl3cml0ZWwoY3RybHJlZzEsIGRldi0+aW9fYmFzZSAr
IFNNSV9DUjEpOwo+ICAKCgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
