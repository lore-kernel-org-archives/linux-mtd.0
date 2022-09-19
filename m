Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF279ECAAD3
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Sep 2022 15:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gr9dngIDKJH4Go9xLQGjMwM/HoizWkIdWvqyiNT0He8=; b=QYFX9FJDBKnZZp
	PGzYPo1r87DENNfacPACBNdauBCYhSlzZUXkbJS1Tn+IFmTFsp8ZRqYp5zmJVX9exmk4U47FqGp5t
	ZoQypy7ZRvECqmNqNGhyeua51GMmmXvvOElWzcIdp4Fgv0DB1RajZpG5DhFgDPZd2DWMrNdzD1wA1
	OELqFwVmqGGroWsZy9jXQjO2tVSuJDaioVxG9B9P6UKi1Szk/3RRTf4hjD0H+0tf2l+yC9OACNe9e
	IjksePosjG2Om7ch2kWkjhzIybH+ufeA6vNNA56SU0td/O8TRdV3rcf7dtLfE0Px7vArKfd24cjIC
	AckmI+XsJSeEoWvg9YUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaIp3-00CXOL-DY; Mon, 19 Sep 2022 15:36:37 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaIiH-00CT8l-21; Mon, 19 Sep 2022 15:29:39 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 63EABC000F;
	Mon, 19 Sep 2022 15:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663601372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I4z0wAfhWmBzoy4sUboCNYs+LN4FIyNd2HWuXMFVd9g=;
	b=gJd8bul7ZIQzyBFirA9lSz/50UmUcod3OU/y7+q91EGzV+8Wg/xDxxqhCKlemJKa8M9Zs1
	7j9ncEw7AgQyGzQtrUTU1o55Dy+PG2hWXAvymqy3jMs1o9AtZ2ZQGb8NThOgjF/Dtx1SaZ
	vhkebnVVyRxyf/Be2NH3jsM+gvmYsmgzbzDyAYnh0lRpi+zdNG2sHWG8+C+zEcMtnymozs
	hseXuXkuRhSRXQlyeL7OKv8bECA7JM7YTYvYJKPNH71NgcxJojXRVV9k18EFXykWqqgsyR
	ANWAX6Ao//H8hBB//olHkgW7y5GxaT+tVlliQu5kVziFmK0Wu2AfMYpLt2LiVA==
Date: Mon, 19 Sep 2022 17:29:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <Tudor.Ambarus@microchip.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <peda@axentia.se>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <Claudiu.Beznea@microchip.com>, <bbrezillon@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH] mtd: rawnand: atmel: Unmap streaming DMA mappings
Message-ID: <20220919172928.6f918ab2@xps-13>
In-Reply-To: <86158844-b314-bee8-c5b8-0b757c6b6ab0@microchip.com>
References: <20220728074014.145406-1-tudor.ambarus@microchip.com>
	<86158844-b314-bee8-c5b8-0b757c6b6ab0@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_082937_435835_D4A3B6C4 
X-CRM114-Status: GOOD (  16.65  )
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

SGVsbG8gVHVkb3IsCgpUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb20gd3JvdGUgb24gV2VkLCA3
IFNlcCAyMDIyIDA5OjA2OjM5ICswMDAwOgoKPiBPbiA3LzI4LzIyIDEwOjQwLCBUdWRvciBBbWJh
cnVzIHdyb3RlOgo+ID4gRXZlcnkgZG1hX21hcF9zaW5nbGUoKSBjYWxsIHNob3VsZCBoYXZlIGl0
cyBkbWFfdW5tYXBfc2luZ2xlKCkgY291bnRlcnBhcnQsCj4gPiBiZWNhdXNlIHRoZSBETUEgYWRk
cmVzcyBzcGFjZSBpcyBhIHNoYXJlZCByZXNvdXJjZSBhbmQgb25lIGNvdWxkIHJlbmRlciB0aGUK
PiA+IG1hY2hpbmUgdW51c2FibGUgYnkgY29uc3VtaW5nIGFsbCBETUEgYWRkcmVzc2VzLgo+ID4g
Cj4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4gRml4ZXM6IGY4OGZjMTIyY2MzNCAo
Im10ZDogbmFuZDogQ2xlYW51cC9yZXdvcmsgdGhlIGF0bWVsX25hbmQgZHJpdmVyIikKPiA+IFNp
Z25lZC1vZmYtYnk6IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbWljcm9jaGlwLmNvbT4K
PiA+IC0tLQo+ID4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2F0bWVsL25hbmQtY29udHJvbGxlci5j
IHwgMSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPiAKPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9uYW5kLWNvbnRyb2xsZXIuYyBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L2F0bWVsL25hbmQtY29udHJvbGxlci5jCj4gPiBpbmRleCA2ZWYx
NDQ0MmM3MWEuLjMzMGQyZGFmZGQyZCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L2F0bWVsL25hbmQtY29udHJvbGxlci5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9hdG1lbC9uYW5kLWNvbnRyb2xsZXIuYwo+ID4gQEAgLTQwNSw2ICs0MDUsNyBAQCBzdGF0aWMg
aW50IGF0bWVsX25hbmRfZG1hX3RyYW5zZmVyKHN0cnVjdCBhdG1lbF9uYW5kX2NvbnRyb2xsZXIg
Km5jLAo+ID4gIAo+ID4gIAlkbWFfYXN5bmNfaXNzdWVfcGVuZGluZyhuYy0+ZG1hYyk7Cj4gPiAg
CXdhaXRfZm9yX2NvbXBsZXRpb24oJmZpbmlzaGVkKTsKPiA+ICsJZG1hX3VubWFwX3NpbmdsZShu
Yy0+ZGV2LCBidWZfZG1hLCBsZW4sIGRpcik7Cj4gPiAgCj4gPiAgCXJldHVybiAwOwo+ID4gICAg
Cj4gCj4gSGksIFJpY2hhcmQsIE1pcXVlbCwKPiAKPiBXb3VsZCB5b3UgcGxlYXNlIGNvbnNpZGVy
IHRvIGluY2x1ZGUgdGhpcyBwYXRjaCBpbiB5b3VyIHF1ZXVlPwoKSSdtIGNhdGNoaW5nIHVwIG9u
bHkgbm93IHNvIGFzIHdlJ3JlIGF0IC1yYzYgYW5kIEkgd2FudCB0aGluZ3MgdG8gbGF5IGEKYml0
IGluIC1uZXh0IEkgZG9uJ3QgcGxhbiB0byBzZW5kIGEgRml4ZXMgUFIsIGFsbCB0aGUgZml4ZXMK
ZXhjZXB0aW9uYWxseSB3aWxsIGdvIHRocm91Z2ggdGhlIHVzdWFsIFBSIGFzIGFueXdheSB0aGV5
IHdvbid0IGJlCnJlYWR5IGJlZm9yZSB0aGUgbWVyZ2Ugd2luZG93IG9wZW5zLgoKPiBJZiB5ZXMs
IHBsZWFzZSBhZGQgdGhlIGZvbGxvd2luZyB0YWcsIGl0IHNvbHZlcyBhIHJlZ3Jlc3Npb246Cj4g
Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8xM2M2YzlhMi02ZGI1LWMzYmYt
MzQ5Yi00YzEyN2FkMzQ5NmFAYXhlbnRpYS5zZS8KCk9rLgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
