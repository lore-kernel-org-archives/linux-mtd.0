Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F03C4167B
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Nov 2023 10:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cy75zuNI8s7+z0VgQMxBKiQPwQ2C9JBtIiLkJvh9iFE=; b=eReW9tlx8RRWL0
	gmhjzQAiDVdhaa/bZvKp+NFjrIxpHFmVDodp8rrTb0UAGWwACMKIeSBnYveXgzESJvPugL6vQ3mxJ
	RU7r13kzs50EOO3DCbCimk/JhBo4W1/75RBVvSHYycbs80ihGxn+OtkGJLo7FwYQEtsL9wBUH122p
	tbSIoOSwP2UEuq0bqa638a/Gt5I8xpzpv2yJwyFJAU5UXptWEaauMfcwIgrVGzbINEdV6o2Dwyut9
	NaMwmjm/VbBePDde45qpDF+4kWOo0BKJ3Z1rGQQHfsy7YJONrLyxqBKFsj6tR1sjZbQ3xrGh189AZ
	DKmk55g6sg/WVBGyiXFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7v8F-004q1U-0t;
	Tue, 28 Nov 2023 10:15:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7u05-004dsQ-2v
	for linux-mtd@bombadil.infradead.org;
	Tue, 28 Nov 2023 09:03:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WD8wV/VANG0qms5+pgg5WkXkGCgPD0uOURm4uNYIcnk=; b=nKej2Yc/NJyFT3dLhXAKzJ4iLJ
	GJp3vgOdVp6iZFYgPbj2NL6k4W/9MRHWAl0ibuqUwyAluQQi45Ynbrw3QQHdUm7rE9DnJk6mdm3Zq
	3GMehBWshObUtTwb41VoS1MjjnCeVTO64aDJc+gugIncU3s8O7CwCRCtj5BimgRlR/22dF+hEbCiQ
	3I1iFsEweGUXAaCw09ixcjMe5ZxaAhPnABLz8A6HC4dxSd/xWAQAmHXFHGXICANXVMTx7NN6PlL58
	GYr1mpMd16h3FjXG0yEVLJdGIQ644BsCxGIW7rlb4UaoNNdJeo7iq0EmRxfcJq8Du+7pf4glLFIFW
	O9zOz40A==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7u01-00GYhH-0P
	for linux-mtd@lists.infradead.org;
	Tue, 28 Nov 2023 09:03:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3278FF81E;
	Tue, 28 Nov 2023 09:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701162196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WD8wV/VANG0qms5+pgg5WkXkGCgPD0uOURm4uNYIcnk=;
	b=G0Ldjj+UYdmXqluksI3HIMDa7/JFXW5tsMHkFdZwUvvmwMR4bGZzbO/AyN/6Ee45f8dXAW
	prN9ilgyPrL0jo860pD/sNUENUaV6uf1tpoX+r50wA4LYx5GlvygxG6DtFhEvxqLRkjZN2
	XWZcqOqo/qwJSa+PSvWnPu4aXEaMcbaY+9rTXEXjJ5kaXSZH7BhPYEWULg3KknGYKl047U
	Bv5gcURtFFW8n+waV7V6wh/GWUcPmjdfYzJ8KfA9h0n2DO3whU5hFabN0UNYFFTITGmTzz
	TVtQDcmWv25BGEYN1Ibf7xFRP+tfyRuk76vteWsg6aWWZGj75ZKaixodJweRzA==
Date: Tue, 28 Nov 2023 10:03:13 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, jaimeliao.tw@gmail.com,
 jaimeliao@mxic.com.tw, pratyush@kernel.org, richard@nod.at,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: stop printing superfluous debug info
Message-ID: <20231128100313.3c990f69@xps-13>
In-Reply-To: <42c96d63d1ea4f7e8f16a3c8eb0a4cf1@walle.cc>
References: <20231127165908.1734951-1-tudor.ambarus@linaro.org>
	<42c96d63d1ea4f7e8f16a3c8eb0a4cf1@walle.cc>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_090321_471334_BBA4CB5D 
X-CRM114-Status: GOOD (  24.21  )
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

SGVsbG8sCgptaWNoYWVsQHdhbGxlLmNjIHdyb3RlIG9uIFR1ZSwgMjggTm92IDIwMjMgMDk6NDc6
MjggKzAxMDA6Cgo+IEhpLAo+IAo+ID4gVGhlIG10ZCBkYXRhIGNhbiBiZSBvYnRhaW4gd2l0aCB0
aGUgbXRkIGlvY3RscyBhbmQgdGhlIFNQSSBOT1IKPiA+IGZsYXNoIG5hbWUgY2FuIGJlIGRldGVy
bWluZWQgaW50ZXJyb2dhdGluZyB0aGUgc3lzZnMgZW50cmllcy4KPiA+IFN0b3AgcG9sbHV0aW5n
IHRoZSBrZXJuZWwgbG9nLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBUdWRvciBBbWJhcnVzIDx0
dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+Cj4gPiAKPiA+IC0tLQo+ID4gIGRyaXZlcnMvbXRkL3Nw
aS1ub3IvY29yZS5jIHwgMTkgLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAxOSBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1u
b3IvY29yZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiA+IGluZGV4IDI1YTY0YzY1
NzE3ZC4uNmRlNzZmZDAwOWQxIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9j
b3JlLmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4gPiBAQCAtMzUxNywy
NSArMzUxNyw2IEBAIGludCBzcGlfbm9yX3NjYW4oc3RydWN0IHNwaV9ub3IgKm5vciwgY29uc3Qg
Y2hhciA+ICpuYW1lLAo+ID4gIAkvKiBObyBtdGRfaW5mbyBmaWVsZHMgc2hvdWxkIGJlIHVzZWQg
dXAgdG8gdGhpcyBwb2ludC4gKi8KPiA+ICAJc3BpX25vcl9zZXRfbXRkX2luZm8obm9yKTsKPiA+
IAo+ID4gLQlkZXZfaW5mbyhkZXYsICIlcyAoJWxsZCBLYnl0ZXMpXG4iLCBpbmZvLT5uYW1lLAo+
ID4gLQkJCShsb25nIGxvbmcpbXRkLT5zaXplID4+IDEwKTsgIAo+IAo+IEknZCBsb3dlciB0aGlz
IHRvIGRldl9kYmcoKSBhbmQgcHJpbnQgdGhlIGplZGVjIGlkLiBJdCBtaWdodCBjb21lIGluCj4g
aGFuZHkgZm9yIGEgcXVpY2sgZ2xhbmNlIGR1cmluZyBib290dXAgaWYgZGVidWcgaXMgZW5hYmxl
ZC4KCkFjay4gQWx0aG91Z2gsIHlvdXIgYm9vdCB0aW1lIHdpbGwgYWxtb3N0IGJlIHVuYWZmZWN0
ZWQgaWYgeW91IGRvbid0CnByaW50IHRoZSBpbmZvIG1lc3NhZ2VzIHRvIHRoZSBjb25zb2xlLiBX
aGF0IHRha2VzIHRoZSBtb3N0IHRpbWUgaXMgbm90CndyaXRpbmcgdG8gdGhlIGtlcm5lbCBidWZm
ZXIsIGl0J3MgdG8gZGlzcGxheSB0aGUgbGluZXMgb24gYSBzZXJpYWwKY29uc29sZSwgYW5kIGRl
dl9pbmZvKCkgYXJlIGJ5IGRlZmF1bHQgZGlzY2FyZGVkLCB5b3UgbmVlZCB0byBzZWxlY3QgYQps
b3dlciBsb2cgbGV2ZWwgbWFudWFsbHksIGFuZCBpZiB5b3UgZG8gdGhhdCBpdCBtZWFucyB5b3Un
cmUgbm90Cmxvb2tpbmcgZm9yIHF1aWNrIGJvb3QgdGltZXMgYnV0IHJhdGhlciBtb3JlIGZvciBh
ZGRpdGlvbmFsIGluZm9ybWF0aW9uLgoKPiA+IC0JZGV2X2RiZyhkZXYsCj4gPiAtCQkibXRkIC5u
YW1lID0gJXMsIC5zaXplID0gMHglbGx4ICglbGxkTWlCKSwgIgo+ID4gLQkJIi5lcmFzZXNpemUg
PSAweCUuOHggKCV1S2lCKSAubnVtZXJhc2VyZWdpb25zID0gJWRcbiIsCj4gPiAtCQltdGQtPm5h
bWUsIChsb25nIGxvbmcpbXRkLT5zaXplLCAobG9uZyBsb25nKShtdGQtPnNpemUgPj4gMjApLAo+
ID4gLQkJbXRkLT5lcmFzZXNpemUsIG10ZC0+ZXJhc2VzaXplIC8gMTAyNCwgbXRkLT5udW1lcmFz
ZXJlZ2lvbnMpOwo+ID4gLQo+ID4gLQlpZiAobXRkLT5udW1lcmFzZXJlZ2lvbnMpCj4gPiAtCQlm
b3IgKGkgPSAwOyBpIDwgbXRkLT5udW1lcmFzZXJlZ2lvbnM7IGkrKykKPiA+IC0JCQlkZXZfZGJn
KGRldiwKPiA+IC0JCQkJIm10ZC5lcmFzZXJlZ2lvbnNbJWRdID0geyAub2Zmc2V0ID0gMHglbGx4
LCAiCj4gPiAtCQkJCSIuZXJhc2VzaXplID0gMHglLjh4ICgldUtpQiksICIKPiA+IC0JCQkJIi5u
dW1ibG9ja3MgPSAlZCB9XG4iLAo+ID4gLQkJCQlpLCAobG9uZyBsb25nKW10ZC0+ZXJhc2VyZWdp
b25zW2ldLm9mZnNldCwKPiA+IC0JCQkJbXRkLT5lcmFzZXJlZ2lvbnNbaV0uZXJhc2VzaXplLAo+
ID4gLQkJCQltdGQtPmVyYXNlcmVnaW9uc1tpXS5lcmFzZXNpemUgLyAxMDI0LAo+ID4gLQkJCQlt
dGQtPmVyYXNlcmVnaW9uc1tpXS5udW1ibG9ja3MpOwo+ID4gIAlyZXR1cm4gMDsgIAo+IAo+IFBh
cnQgb2YgdGhpcyBpcyBhbHJlYWR5IGF2YWlsYWJsZSB0aHJvdWdoIHRoZSBzcGktbm9yIGRlYnVn
ZnMsIGFsdGhvdWdoIG5vdAo+IHRoZSBhY3R1YWwgbXRkIHByb3BlcnRpZXMuIFRoZXNlIEkgdGhp
bmssIHNob3VsZCBnbyBpbnRvIHRoZSBtdGRjb3JlCj4gaXRzZWxmIGlmIHJlYWxseSBuZWVkZWQu
IEVpdGhlciB0aHJvdWdoIGRldl9kYmcoKSBvciBkZWJ1Z2ZzLgoKTWF5YmUgd2UgZG9uJ3QgbmVl
ZCB0aGlzIGF0IGFsbCwgYXMgbG9uZyBhcyBvbmUgbWVzc2FnZSByZW1haW5zIGFib3V0CnRoZSBK
RURFQyBJRCwgYnV0IGtlZXAgaW4gbWluZCB0aGF0IHNwaS1ub3JzIGFyZSBjb21tb25seSBzdG9y
aW5nIHRoZQpyb290ZnMgYW5kIGlmIHlvdXIgc3BpLW5vciBkb2VzIG5vdCBib290IHlvdSBkb24n
dCBoYXZlIGEgdXNlcnNwYWNlIHlldAphbmQgYWxsIHRoZSBkZWJ1Z2ZzIGVudHJpZXMgYXJlIHB1
cmVseSB1c2VsZXNzLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
