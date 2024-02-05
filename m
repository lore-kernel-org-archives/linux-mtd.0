Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D090C48295
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Feb 2024 13:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R8U8B2Awr8vjkU2ZrKgTpThIHsPM/AkcMXm7mlKGXeQ=; b=KGnAzx0y64vlz9
	//2ykwUOxTnlerFzclY9eEAovDpnBlGev7cAFxsLIFbvz65yXRspFe8hHri1bJPUDlCazwRi7m79g
	tk6+JadF8Lcd49w3MlavUq0NcLCqraGZZHwFo2BhSZdsCGnyCMizSD0w2PjL470DNpXJfZCq90yLx
	tRp5wM3IBiOg0lcDqJlWqlmaQTw1F38ZSdNV64iw5chqfgwhHompncj8lg1oAAQwDJ+ku9L6TfZNp
	eGEsGDn0s2BBCI2vXzTIRqwhB3JRj3O5npKObZQAHfonq+o5UEPyxpXGeCAmOcbdhpdLYIaSZ6BKf
	jk7HnTVyrtKmHz+4N+AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWzAW-00000003RyT-0yow;
	Mon, 05 Feb 2024 13:37:52 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWzAS-00000003RwJ-1A9Q;
	Mon, 05 Feb 2024 13:37:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0B28FF80A;
	Mon,  5 Feb 2024 13:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707140266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gmo5Tbcnd6hBEUVcUcmoKYDOTr9Bxvr6QlF36iEzjhg=;
	b=EtlhRWyVcFv1F7humVGz3aiopPeU08j0j0yTyAWqwlRpiX/iskZcIkrWV1wrbMbXY4/XlJ
	df769TiJpjYY4SZiuixWyXdOyIWumHD8EKT9rdMD9IOPavyTN123AA8r3n5y7QmCLNLPSO
	Z0Z49HLKbZyI9vKeMdauBBK0cxtBnHtO+tTzO/fmFjGkNmvB65pEk58ziHOu8xGB7ntqlM
	rjLiX8o0y4y/uBPOrl+LCf3uEsZFO7QMYdlq2PiDloz6U8Q9avHtACUARwdFypyaQfZpPm
	kAxXeF+xjKYacRIxHwMxlTGs0OwMfQelzOGJbpqCQm3gB8FqeOTZMJzqXlKy8g==
Date: Mon, 5 Feb 2024 14:37:45 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>
Cc: Linux MTD List <linux-mtd@lists.infradead.org>, Linux ARM List
 <linux-arm-kernel@lists.infradead.org>, Broadcom Kernel List
 <bcm-kernel-feedback-list@broadcom.com>, f.fainelli@gmail.com,
 kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 anand.gore@broadcom.com, dregan@mail.com, kamal.dasu@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com, David Regan
 <dregan@broadcom.com>, linux-kernel@vger.kernel.org, Vignesh Raghavendra
 <vigneshr@ti.com>, Brian Norris <computersforpeace@gmail.com>, Richard
 Weinberger <richard@nod.at>
Subject: Re: [PATCH v4 12/12] mtd: rawnand: brcmnand: update log level
 messages
Message-ID: <20240205143745.5a1036c6@xps-13>
In-Reply-To: <20240203002834.171462-13-william.zhang@broadcom.com>
References: <20240203002834.171462-1-william.zhang@broadcom.com>
	<20240203002834.171462-13-william.zhang@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_053748_599285_6918467C 
X-CRM114-Status: GOOD (  16.52  )
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

SGkgV2lsbGlhbSwKCndpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tIHdyb3RlIG9uIEZyaSwgIDIg
RmViIDIwMjQgMTY6Mjg6MzMgLTA4MDA6Cgo+IEZyb206IERhdmlkIFJlZ2FuIDxkcmVnYW5AYnJv
YWRjb20uY29tPgo+IAo+IFVwZGF0ZSBsb2cgbGV2ZWwgbWVzc2FnZXMgc28gdGhhdCBtb3JlIGNy
aXRpY2FsIG1lc3NhZ2VzCj4gY2FuIGJlIHNlZW4uCgpUaGlzIGNvbW1pdCBsb2cgZG9lcyBub3Qg
Y29udmluY2UgbWUuIFdhcm5pbmcgbWVzc2FnZXMgYXJlIHZpc2libGUsCnRoZXkgYXJlIGluIGRt
ZXNnLiBJZiB5b3Ugd2FudCB0aGVtIG9uIHlvdXIgY29uc29sZSwgbG93ZXIgeW91ciBkZWZhdWx0
CmNvbnNvbGUgbGV2ZWwgYnkgMSBhbmQgdGhleSB3aWxsIGFwcGVhci4gSSdtIGZpbmUgaW5jcmVh
c2luZyB0aGUgbG9nCmxldmVsIG9uIGVycm9yIG1lc3NhZ2VzLCBidXQgdGhlIGp1c3RpZmljYXRp
b24gY2Fubm90IGJlIHNwZWNpZmljIHRvCnlvdXIgb3duIHNldHVwLgoKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBEYXZpZCBSZWdhbiA8ZHJlZ2FuQGJyb2FkY29tLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBX
aWxsaWFtIFpoYW5nIDx3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbT4KPiBSZXZpZXdlZC1ieTog
V2lsbGlhbSBaaGFuZyA8d2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5jb20+Cj4gCj4gLS0tCj4gCj4g
Q2hhbmdlcyBpbiB2NDoKPiAtIFJldmVydCB0aGUgbG9nIGxldmVsIGNoYW5nZSBmb3IgY29ycmVj
dGFibGUgZWNjIGVycm9yCj4gCj4gQ2hhbmdlcyBpbiB2MzogTm9uZQo+IENoYW5nZXMgaW4gdjI6
Cj4gLSBBZGRlZCB0byBwYXRjaCBzZXJpZXMKPiAKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJj
bW5hbmQvYnJjbW5hbmQuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9icmNtbmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJj
bW5hbmQuYwo+IGluZGV4IDdjZTJiMjY3Njc2Zi4uZTUwNTgyYjQ1MTgyIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiArKysgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gQEAgLTExNDMsNyArMTE0Myw3IEBA
IHN0YXRpYyBpbnQgYmNtbmFuZF9jdHJsX3BvbGxfc3RhdHVzKHN0cnVjdCBicmNtbmFuZF9ob3N0
ICpob3N0LAo+ICAJaWYgKCh2YWwgJiBtYXNrKSA9PSBleHBlY3RlZF92YWwpCj4gIAkJcmV0dXJu
IDA7Cj4gIAo+IC0JZGV2X3dhcm4oY3RybC0+ZGV2LCAidGltZW91dCBvbiBzdGF0dXMgcG9sbCAo
ZXhwZWN0ZWQgJXggZ290ICV4KVxuIiwKPiArCWRldl9lcnIoY3RybC0+ZGV2LCAidGltZW91dCBv
biBzdGF0dXMgcG9sbCAoZXhwZWN0ZWQgJXggZ290ICV4KVxuIiwKPiAgCQkgZXhwZWN0ZWRfdmFs
LCB2YWwgJiBtYXNrKTsKPiAgCj4gIAlyZXR1cm4gLUVUSU1FRE9VVDsKPiBAQCAtMjE5Niw3ICsy
MTk2LDcgQEAgc3RhdGljIGludCBicmNtbmFuZF9yZWFkKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBz
dHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAo+ICAJCQkJcmV0dXJuIGVycjsKPiAgCQl9Cj4gIAo+IC0J
CWRldl9kYmcoY3RybC0+ZGV2LCAidW5jb3JyZWN0YWJsZSBlcnJvciBhdCAweCVsbHhcbiIsCj4g
KwkJZGV2X2VycihjdHJsLT5kZXYsICJ1bmNvcnJlY3RhYmxlIGVycm9yIGF0IDB4JWxseFxuIiwK
PiAgCQkJKHVuc2lnbmVkIGxvbmcgbG9uZyllcnJfYWRkcik7Cj4gIAkJbXRkLT5lY2Nfc3RhdHMu
ZmFpbGVkKys7Cj4gIAkJLyogTkFORCBsYXllciBleHBlY3RzIHplcm8gb24gRUNDIGVycm9ycyAq
LwoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
