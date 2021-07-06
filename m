Return-Path: <SRS0=yrYE=L6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8802C07E96
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 16:14:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9603A619D2
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 16:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9603A619D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kfjfiR+tgMkqXyaX6r1r8LytSLQuONJe412t0KY6WTM=; b=3bk/FCi446EpWK
	jsidKl0GqDEnrldYtRVztJtCuDzxWZtagVa9m9L5n/3SD7KDUz8p8m96tU3+hEMU51ihejOFwvPz+
	vvLQmg1pmH4MWtylodZ/fabDCtWavZKIxv9XTBx66ldvqKncZ5Ia6IhKizrQ9/G4vuJO3hb2OUUVZ
	88j1cfb5IGMLjoA/kA+7v+4e3hWXRSDl/d8vn9Gf0mxR6sQoTTvyTwsalel65Dm+PuyOiXuujOIKW
	qIaIV0kumsOm5F035m/FqARanlce7h/YNDEbmqRTc7I2rw9evsiD/RdGfi1k2xFCJuHqQ3Gy5VmdB
	jMSN0WH9v9D4kny4uBBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0nhK-00CEaW-RF; Tue, 06 Jul 2021 16:13:22 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0nhF-00CEXG-PX
 for linux-mtd@lists.infradead.org; Tue, 06 Jul 2021 16:13:21 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 705A840009;
 Tue,  6 Jul 2021 16:13:09 +0000 (UTC)
Date: Tue, 6 Jul 2021 18:13:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stefan Riedmueller <s.riedmueller@phytec.de>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Fabio Estevam
 <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Boris Brezillon
 <boris.brezillon@collabora.com>, Dan Brown <dan_brown@ieee.org>, David
 Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: nand_bbt: Skip bad blocks when searching
 for the BBT in NAND
Message-ID: <20210706181308.1aa21d00@xps13>
In-Reply-To: <20210625123821.207458-1-s.riedmueller@phytec.de>
References: <20210625123821.207458-1-s.riedmueller@phytec.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_091318_129333_9728CB76 
X-CRM114-Status: GOOD (  38.18  )
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

SGkgU3RlZmFuLAoKU3RlZmFuIFJpZWRtdWVsbGVyIDxzLnJpZWRtdWVsbGVyQHBoeXRlYy5kZT4g
d3JvdGUgb24gRnJpLCAyNSBKdW4gMjAyMQoxNDozODoyMSArMDIwMDoKCj4gVGhlIGJsb2NrcyBj
b250YWluaW5nIHRoZSBiYWQgYmxvY2sgdGFibGUgY2FuIGJlY29tZSBiYWQgYXMgd2VsbC4gU28K
PiBtYWtlIHN1cmUgdG8gc2tpcCBhbnkgYmxvY2tzIHRoYXQgYXJlIG1hcmtlZCBiYWQgd2hlbiBz
ZWFyY2hpbmcgZm9yIHRoZQo+IGJhZCBibG9jayB0YWJsZS4KPiAKPiBPdGhlcndpc2UgaW4gdmVy
eSByYXJlIGNhc2VzIHdoZXJlIHR3byBCQlQgYmxvY2tzIHdlYXIgb3V0IGl0IG1pZ2h0Cj4gaGFw
cGVuIHRoYXQgYW4gb2Jzb2xldGUgQkJUIGlzIHVzZWQgaW5zdGVhZCBvZiBhIG5ld2VyIGF2YWls
YWJsZQo+IHZlcnNpb24uCj4gCj4gVGhpcyBvbmx5IGFwcGxpZXMgdG8gZHJpdmVycyB3aGljaCBt
YWtlIHVzZSBvZiBhIGJhZCBibG9jayBtYXJrZXIgaW4gZmxhc2guCj4gT3RoZXIgZHJpdmVycyB3
b24ndCBiZSBhYmxlIHRvIGlkZW50aWZ5IGJhZCBCQlQgYmxvY2tzIGFuZCB0aHVzIGNhbid0IHNr
aXAKPiB0aGVzZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gUmllZG11ZWxsZXIgPHMucmll
ZG11ZWxsZXJAcGh5dGVjLmRlPgoKQmVzaWRlcyB0aGUgYWxpZ25tZW50IG9mIHRoZSBoZWxwZXIg
cGFyYW1ldGVycyAobml0cGljaykgdGhlIHBhdGNoCmxvb2tzIGdvb2QgdG8gbWUuIElmIHdlIGNh
biBnZXQgc29tZW9uZSB0byB0ZXN0IGl0IGJlZm9yZSB0aGUgbWVyZ2UKd2luZG93IGNsb3NlcyBp
dCdzIHBlcmZlY3QuIE90aGVyd2lzZSBJJ2xsIGFwcGx5IGl0IGFuZCB3ZSdsbCBsZXQgcm9ib3Rz
CmRvIHRoZSBqb2IuCgo+IC0tLQo+IAo+IEhpLAo+IAo+IHRoaXMgaXMgdGhlIHNlY29uZCBhcHBy
b2FjaCBvZiB0aGlzIHBhdGNoLiBUaGUgZmlyc3Qgb25lIFsxXSB1bmZvcnR1bmF0ZWx5IGxlYWQK
PiB0byBib290IGZhaWx1cmVzIG9uIGkuTVggMjcgYm9hcmRzIFsyXSBzaW5jZSB0aGUgaS5NWCAy
NyBkcml2ZXIgdXNlcyB0aGUgYmFkCj4gYmxvY2sgbWFya2VyIHBvc2l0aW9uIGZvciB0aGUgYmFk
IGJsb2NrIHRhYmxlIG1hcmtlciB3aGljaCBsZWFkIHRvIGZhbHNlbHkKPiBpZGVudGlmeWluZyBh
bGwgQkJUIGJsb2NrcyBhcyBiYWQuCj4gCj4gVGhpcyBuZXcgcGF0Y2ggbm93IHNraXBzIHRoZSBj
aGVjayBmb3IgYmFkIEJCVCBibG9ja3MgaWYgdGhlIEJCVCBtYXJrZXIKPiBwb3NpdGlvbiBpbiBP
T0Igb3ZlcmxhcHMgd2l0aCB0aGUgYmFkIGJsb2NrIG1hcmtlciBwb3NpdGlvbiBvciBpZiBhIGRy
aXZlcgo+IGNhbid0IHVzZSBiYWQgYmxvY2sgbWFya2VycyBpbiBmbGFzaCBhdCBhbGwgKE5BTkRf
QkJUX05PX09PQl9CQk0gb3IKPiBOQU5EX05PX0JCTV9RVUlSSyBhcmUgc2V0KS4gVGhpcyBob3Bl
ZnVsbHkgbWFrZXMgc3VyZSB3ZSBkb24ndCBicmVhayBkcml2ZXJzCj4gd2hpY2ggY2Fubm90IGNo
ZWNrIGZvciBiYWQgQkJUIGJsb2NrcyBkdWUgdG8gdGhlIGxpbWl0YXRpb25zIG1lbnRpb25lZCBi
ZWZvcmUuCj4gCj4gSSB3YXMgb25seSBhYmxlIHRvIHRlc3QgdGhpcyBwYXRjaCBvbiBhIHBoeUNP
UkUtaS5NWCA2IGFuZCBhIHBoeUNBUkQtaS5NWCAyNy4KPiBUaGVyZm9yZSB3b3VsZCByZWFsbHkg
YXBwcmVjaWF0ZSBtb3JlIHBlb3BsZSB0ZXN0aW5nIHRoaXMgdG8gbWFrZSBzdXJlIEkgaGF2ZQo+
IG5vdCBtaXNzZWQgYW5vdGhlciB1c2UgY2FzZSB3aGVyZSB0aGUgYmFkIGJsb2NrIG1hcmtlciBw
b3NpdGlvbiBpbiBPT0IgaXMgdXNlZAo+IGluIGEgZGlmZmVyZW50IHdheSB0aGFuIGZvciB0aGUg
QkJNLgo+IAo+IFJlZ2FyZHMsCj4gU3RlZmFuCj4gCj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LW10ZC8yMDIxMDMyNTEwMjMzNy40ODExNzItMS1zLnJpZWRtdWVsbGVyQHBoeXRl
Yy5kZS8KPiBbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkL0NBT01aTzVEdWZW
Uj0rRXpDYTEtTVBVYytaZWZaVlRYYjVLZ3UzV3htczdjeHc5R21HZ0BtYWlsLmdtYWlsLmNvbS8K
PiAKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYnQuYyB8IDM0ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2JidC5jIGIvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbmFuZF9iYnQuYwo+IGluZGV4IGRjZWQzMmExMjZkOS4uMmEzMDcxNDM1
MGVlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmJ0LmMKPiArKysg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2JidC5jCj4gQEAgLTQ0Nyw2ICs0NDcsMzYgQEAg
c3RhdGljIGludCBzY2FuX2Jsb2NrX2Zhc3Qoc3RydWN0IG5hbmRfY2hpcCAqdGhpcywgc3RydWN0
IG5hbmRfYmJ0X2Rlc2NyICpiZCwKPiAgCXJldHVybiAwOwo+ICB9Cj4gIAo+ICsvKiBDaGVjayBp
ZiBhIHBvdGVudGlhbCBCQlQgYmxvY2sgaXMgbWFya2VkIGFzIGJhZCAqLwo+ICtzdGF0aWMgaW50
IGJidF9ibG9ja19jaGVja2JhZChzdHJ1Y3QgbmFuZF9jaGlwICp0aGlzLAo+ICsJCQkJICAgICAg
c3RydWN0IG5hbmRfYmJ0X2Rlc2NyICp0ZCwKPiArCQkJCSAgICAgIGxvZmZfdCBvZmZzLCB1aW50
OF90ICpidWYpCj4gK3sKPiArCXN0cnVjdCBuYW5kX2JidF9kZXNjciAqYmQgPSB0aGlzLT5iYWRi
bG9ja19wYXR0ZXJuOwo+ICsKPiArCS8qCj4gKwkgKiBObyBuZWVkIHRvIGNoZWNrIGZvciBhIGJh
ZCBCQlQgYmxvY2sgaWYgdGhlIEJCTSBhcmVhIG92ZXJsYXBzIHdpdGgKPiArCSAqIHRoZSBiYWQg
YmxvY2sgdGFibGUgbWFya2VyIGFyZWEgaW4gT09CIHNpbmNlIHdyaXRpbmcgYSBCQk0gaGVyZQo+
ICsJICogaW52YWxpZGF0ZXMgdGhlIGJhZCBibG9jayB0YWJsZSBtYXJrZXIgYW55d2F5Lgo+ICsJ
ICovCj4gKwlpZiAoISh0ZC0+b3B0aW9ucyAmIE5BTkRfQkJUX05PX09PQikgJiYKPiArCSAgICB0
ZC0+b2ZmcyA+PSBiZC0+b2ZmcyAmJiB0ZC0+b2ZmcyA8IGJkLT5vZmZzICsgYmQtPmxlbikKPiAr
CQlyZXR1cm4gMDsKPiArCj4gKwkvKgo+ICsJICogVGhlcmUgaXMgbm8gcG9pbnQgaW4gY2hlY2tp
bmcgZm9yIGEgYmFkIGJsb2NrIG1hcmtlciBpZiB3cml0aW5nCj4gKwkgKiBzdWNoIG1hcmtlciBp
cyBub3Qgc3VwcG9ydGVkCj4gKwkgKi8KPiArCWlmICh0aGlzLT5iYnRfb3B0aW9ucyAmIE5BTkRf
QkJUX05PX09PQl9CQk0gfHwKPiArCSAgICB0aGlzLT5vcHRpb25zICYgTkFORF9OT19CQk1fUVVJ
UkspCj4gKwkJcmV0dXJuIDA7Cj4gKwo+ICsJaWYgKHNjYW5fYmxvY2tfZmFzdCh0aGlzLCBiZCwg
b2ZmcywgYnVmKSA+IDApCj4gKwkJcmV0dXJuIDE7Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KPiAr
Cj4gIC8qKgo+ICAgKiBjcmVhdGVfYmJ0IC0gW0dFTkVSSUNdIENyZWF0ZSBhIGJhZCBibG9jayB0
YWJsZSBieSBzY2FubmluZyB0aGUgZGV2aWNlCj4gICAqIEB0aGlzOiBOQU5EIGNoaXAgb2JqZWN0
Cj4gQEAgLTU2MCw2ICs1OTAsMTAgQEAgc3RhdGljIGludCBzZWFyY2hfYmJ0KHN0cnVjdCBuYW5k
X2NoaXAgKnRoaXMsIHVpbnQ4X3QgKmJ1ZiwKPiAgCQkJaW50IGFjdGJsb2NrID0gc3RhcnRibG9j
ayArIGRpciAqIGJsb2NrOwo+ICAJCQlsb2ZmX3Qgb2ZmcyA9IChsb2ZmX3QpYWN0YmxvY2sgPDwg
dGhpcy0+YmJ0X2VyYXNlX3NoaWZ0Owo+ICAKPiArCQkJLyogQ2hlY2sgaWYgYmxvY2sgaXMgbWFy
a2VkIGJhZCAqLwo+ICsJCQlpZiAoYmJ0X2Jsb2NrX2NoZWNrYmFkKHRoaXMsIHRkLCBvZmZzLCBi
dWYpKQo+ICsJCQkJY29udGludWU7Cj4gKwo+ICAJCQkvKiBSZWFkIGZpcnN0IHBhZ2UgKi8KPiAg
CQkJc2Nhbl9yZWFkKHRoaXMsIGJ1Ziwgb2ZmcywgbXRkLT53cml0ZXNpemUsIHRkKTsKPiAgCQkJ
aWYgKCFjaGVja19wYXR0ZXJuKGJ1Ziwgc2NhbmxlbiwgbXRkLT53cml0ZXNpemUsIHRkKSkgewoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
