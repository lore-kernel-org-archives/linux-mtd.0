Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA404C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 14:34:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 710D1610FB
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 14:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 710D1610FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s9QneVsuGLLegDd2NmN483gZ7OvwMFfIaZb8vC026O4=; b=u++QDJxp8vKums
	VpVh7XF8ct7O4AViXe7i2hv4kuOEvBFRAWimnPBEkYpLjro6sJR7qlf0nSHjaILMQpM20h3hXCiBW
	FKDhP//4c0OTUbZkS15eLM3jd4jbPcAZFMnrtSWo9k6zUZos+OUM1uZYOlZ17aIszPs8ixNlpLdi+
	yfGhFO2o1U7uI3tql0PvQB5sX7RUG71crLC8ibyoGrAoP1ehZsZZr+r0UuvyKJ7u57MItJ6oni8UZ
	0e4xStpYTzAMcuZJADACpnZsYrfVYuasP29J4ik0KwBCak1I6wJ/muTT8xUeWGkmfr+OwbTz44lNZ
	5avMtvGqQ0Qr6UHj9qOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mafKY-00HB9K-6d; Wed, 13 Oct 2021 14:34:06 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mafKU-00HB74-5v
 for linux-mtd@lists.infradead.org; Wed, 13 Oct 2021 14:34:04 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 346201BF208;
 Wed, 13 Oct 2021 14:33:58 +0000 (UTC)
Date: Wed, 13 Oct 2021 16:33:57 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Richard Weinberger <richard@nod.at>,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH v2 13/20] mtd: dataflash: Warn about failure to
 unregister mtd device
Message-ID: <20211013163357.41c7471d@xps13>
In-Reply-To: <20211013140835.olo2dxdno6zlom7n@pengutronix.de>
References: <20211012153945.2651412-1-u.kleine-koenig@pengutronix.de>
 <20211012153945.2651412-14-u.kleine-koenig@pengutronix.de>
 <20211013144429.65b294e5@xps13>
 <20211013140835.olo2dxdno6zlom7n@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_073402_423627_9A0462A9 
X-CRM114-Status: GOOD (  31.87  )
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

SGkgVXdlLAoKdS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlIHdyb3RlIG9uIFdlZCwgMTMg
T2N0IDIwMjEgMTY6MDg6MzUgKzAyMDA6Cgo+IE9uIFdlZCwgT2N0IDEzLCAyMDIxIGF0IDAyOjQ0
OjI5UE0gKzAyMDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBVd2UsCj4gPiAKPiA+IHUu
a2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZSB3cm90ZSBvbiBUdWUsIDEyIE9jdCAyMDIxIDE3
OjM5OjM4ICswMjAwOgo+ID4gICAKPiA+ID4gV2hlbiBhbiBzcGkgZHJpdmVyJ3MgcmVtb3ZlIGZ1
bmN0aW9uIHJldHVybnMgYSBub24temVybyBlcnJvciBjb2RlICAKPiA+IAo+ID4gU2hvdWxkIHdl
IHMvYW4gc3BpL2EgU1BJLz8gIAo+IAo+IE15IChHZXJtYW4pIGtub3dsZWRnZSBhYm91dCB0aGUg
RW5nbGlzaCBHcmFtbWFyIGNsYWltcyB0aGF0IGluZGVwZW5kZW50Cj4gb2YgaG93IHlvdSBzcGVs
bCBTUEksIGl0IG11c3QgYmUgImFuIiBiZWNhdXNlIHdoZW4gSSBzYXkgaXQsIGl0J3MKPiBbyZtz
cGk6YcmqXSAodW5sZXNzIHlvdSBjYWxsIGl0IFtzcGHJql0/KQoKSSAocGVyc29uYWxseSkgcHJv
bm91bmNlIGl0IFtzcGHJql0gd2l0aCBteSBGcmVuY2ggYmFja2dyb3VuZCBhbmQgaXQKbG9va3Mg
d3JvbmcgdG8gbXkgZXllcyB0byB1c2UgImFuIiBiZWZvcmUgU1BJIGJlY2F1c2Ugb2YgdGhhdCwg
YnV0IHRoaXMKaXMgYmlhc2VkIGFuZCBwb3NzaWJseSB3cm9uZyBhcyB3ZWxsIHNvIHBsZWFzZSBr
ZWVwIGl0IHlvdXIgd2F5LCBpdCdzCmZpbmUuCgo+IEluIG15IGV5ZXMgInNwaSIgaXMgcmlnaHQs
IGJlY2F1c2UgU1BJIGlzIHRoZSBwcm90b2NvbCBhbmQgInNwaSIgaXMKPiB0aGUga2VybmVsIGZy
YW1ld29yay4gQnV0IEkgZG9uJ3QgZmVlbCBzdHJvbmcgaGVyZSBhbmQgeW91J3JlIGFscmVhZHkK
PiB0aGUgc2Vjb25kIHdobyBzdWdnZXN0cyBzb21ldGhpbmcgc2ltaWxhci4KCkkgZ2V0IGl0LiBJ
bmRlZWQgSSBhbHdheXMgdXNlIHVwcGVyY2FzZSBsZXR0ZXJzIHdoZW4gSSB1c2UgYWNyb255bXMK
KHN1Y2ggYXMgU1BJIG9yIE1URCkgYW5kIGl0J3MgdGhlIGZpcnN0IHRpbWUgSSBoZWFyIHRoYXQg
dGhlIGxvd2VyY2FzZQpsZXR0ZXIgcmVmZXJzIHRvIHRoZSBmcmFtZXdvcmsgbW9yZSB0aGFuIHRo
ZSBwcm90b2NvbCwgYnV0IFRCSCB0aGUKZXhwbGFuYXRpb24ga2luZCBvZiBzZWR1Y2VzIG1lIDop
Cgo+ID4gPiBub3RoaW5nIGhhcHBlbnMgYXBhcnQgZnJvbSBlbWl0dGluZyBhIGdlbmVyaWMgZXJy
b3IgbWVzc2FnZS4gTWFrZQo+ID4gPiB0aGlzIGVycm9yIG1lc3NhZ2UgbW9yZSBkZXZpY2Ugc3Bl
Y2lmaWMgYW5kIHJldHVybiB6ZXJvIGluc3RlYWQuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+ID4g
PiAtLS0KPiA+ID4gIGRyaXZlcnMvbXRkL2RldmljZXMvbXRkX2RhdGFmbGFzaC5jIHwgNSArKysr
LQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2RldmljZXMvbXRkX2RhdGFmbGFz
aC5jCj4gPiA+IGIvZHJpdmVycy9tdGQvZGV2aWNlcy9tdGRfZGF0YWZsYXNoLmMgaW5kZXgKPiA+
ID4gOTgwMmUyNjVmY2E4Li4yNjkxYjZiNzlkZjggMTAwNjQ0IC0tLQo+ID4gPiBhL2RyaXZlcnMv
bXRkL2RldmljZXMvbXRkX2RhdGFmbGFzaC5jICsrKwo+ID4gPiBiL2RyaXZlcnMvbXRkL2Rldmlj
ZXMvbXRkX2RhdGFmbGFzaC5jIEBAIC05MTksNyArOTE5LDEwIEBAIHN0YXRpYwo+ID4gPiBpbnQg
ZGF0YWZsYXNoX3JlbW92ZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKSBzdGF0dXMgPQo+ID4gPiBt
dGRfZGV2aWNlX3VucmVnaXN0ZXIoJmZsYXNoLT5tdGQpOyBpZiAoc3RhdHVzID09IDApCj4gPiA+
ICAJCWtmcmVlKGZsYXNoKTsKPiA+ID4gLQlyZXR1cm4gc3RhdHVzOwo+ID4gPiArCWVsc2UKPiA+
ID4gKwkJZGV2X3dhcm4oJnNwaS0+ZGV2LCAiRmFpbGVkIHRvIHVucmVnaXN0ZXIgbXRkCj4gPiA+
IGRldmljZSAoJXBlKVxuIiwKPiA+ID4gKwkJCSBFUlJfUFRSKHN0YXR1cykpOwo+ID4gPiArCXJl
dHVybiAwOyAgCj4gPiAKPiA+IEFzIHBhcnQgb2YgYSByZWNlbnQgTkFORCBjbGVhbnVwIHNlcmll
cyB3ZSBlbmRlZCB1cCBhZGRpbmcKPiA+IFdBUk5fT04oKSBbMV0gdG8gbWFrZSBpdCB2ZXJ5IGNs
ZWFyIHRoYXQgaWYgdGhpcyBoYXBwZW5zLCBpdCdzIG5vdAo+ID4gZXhwZWN0ZWQgYXQgYWxsIChp
dCB3YXMgQm9yaXMnIGFkdmljZSkuCj4gPiAKPiA+IEkgZG9uJ3QgdGhpbmsgdGhlcmUgaXMgb25s
eSBvbmUgZ29vZCBzb2x1dGlvbiBidXQgcGVyaGFwcyBpdHMgYmVzdAo+ID4gdG8ga2VlcCBpdCBz
eW5jJ2VkIHdpdGggdGhlIG90aGVyIGRyaXZlcnMgaW4gTVREPyAgCj4gCj4gV2VsbCwgaWYgV0FS
Tl9PTiBvciBkZXZfd2FybiBpcyB0aGUgcmlnaHQgdGhpbmcgaXMgc3ViamVjdGl2ZS4gWW91cgo+
IHN1YmplY3RpdmUgY291bnRzIG1vcmUgYXMgeW91J3JlIGFuIE1URCBtYWludGFpbmVyLiBDYW4g
cmV3b3JrCj4gYWNjb3JkaW5nbHkgZm9yIHYzLgoKVGhlbiBsZXQncyBhbGwgdXNlIFdBUk5fT04o
KSBmb3Igbm93LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
