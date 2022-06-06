Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E63C43334
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jun 2022 13:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LxcKnCpTzXswFrmigzTfMCKxt66Y4W54JLC+MWAsAkc=; b=S/NtJS/OsRf+oQ
	jlv27Pgoz4wVrWNHW77NHqWrvIWJ0FpyeUjwQ0LzqpwvzSwmsk9uEjzjZvjLszA0F0dClSEUGlTYh
	Re5xlA3s6SNhf1n05CMi9Sk9JmiBsomkPSpN4xu+ADi3Mdp6UCpwIk+QA8zrnzU8zcsIwBLydv9y/
	Xk1nZlkCxV9k++ybUQrE2ZriulZBR0P9Rr3h6PggBjfo/pZjT2f8Qzpk0rpknatu9bQ07QgL6aadW
	KtuHGCoxP1DiNvgDxMiVNxFrM/rU3djYdpPucppaF1GAZKJ5Pi5AYRTc7jEz828RpUvKlSMHYWKc7
	7e+Mf8ntAmSkixVeujJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyCb2-001Jwi-BH; Mon, 06 Jun 2022 13:16:40 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyCaq-001JtA-RP; Mon, 06 Jun 2022 13:16:30 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7186BC0003;
	Mon,  6 Jun 2022 13:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654521383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dQDCUWiaArUFsK25Jve/jpN86Aw1Yf44ItEzqpSXpVs=;
	b=ioQTT1/+srI3Q+x8OAhYuiB9c098Zk08LyTJIlo7mME7F78c+Yvf3OuYhsfvDwgQdm8Jzg
	bwObpKik8g+LxLBua0SYuUmAmnUWxa+MBVXcTGsStITfE86XGlorfdha3Lk2RnOwLryRkD
	o6fG236aW7lXu+NEi9T7EMNUZsm5ShOcqfYVPwVMIriZ+AtxuGqz/9ecJg04IvWYGi/6F5
	95jS9ySNw2h/Babg7LQlic9Gdqm6+D/JxWHGKMddSg+PbnCUzYe3RcQwwfKvExMrGOhjFo
	SrW0aX6IRADS+VVxLXviLh09j9M2B/5eg4FaGCjMc3aPHaKiDBI0vjlLo14PSQ==
Date: Mon, 6 Jun 2022 15:16:20 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, kernel@pengutronix.de,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 08/14] mtd: rawnand: atmel: Warn about failure to
 unregister mtd device
Message-ID: <20220606151620.0282cece@xps-13>
In-Reply-To: <20220603210758.148493-9-u.kleine-koenig@pengutronix.de>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
	<20220603210758.148493-9-u.kleine-koenig@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_061629_222090_4F6D5886 
X-CRM114-Status: GOOD (  18.49  )
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

SGkgVXdlLAoKdS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlIHdyb3RlIG9uIEZyaSwgIDMg
SnVuIDIwMjIgMjM6MDc6NTIgKzAyMDA6Cgo+IFRoZSBMaW51eCBkZXZpY2UgY29yZSBkb2Vzbid0
IGludGVuZCByZW1vdmUgY2FsbGJhY2tzIHRvIGZhaWwuIElmIGFuCj4gZXJyb3IgY29kZSBpcyBy
ZXR1cm5lZCB0aGUgZGV2aWNlIGlzIHJlbW92ZWQgYW55aG93LiBTbyB3YWlsIGxvdWRseSBpZgo+
IHRoZSBhdG1lbCBzcGVjaWZpYyByZW1vdmUgY2FsbGJhY2sgZmFpbHMgYW5kIHJldHVybiAwIGFu
eWhvdyB0byBzdXBwcmVzcwo+IHRoZSBnZW5lcmljIChhbmQgbGl0dGxlIGhlbHBmdWwpIGVycm9y
IG1lc3NhZ2UgYnkgdGhlIGRldmljZSBjb3JlLgo+IAo+IEFsc28gY2hlY2sgdGhlIHJlbW92ZSBj
YWxsYmFjayB0byBhY3R1YWxseSBleGlzdCBiZWZvcmUgY2FsbGluZyBpdC4gVGhhdAo+IG1pZ2h0
IGhhcHBlbiBpZiBuYy0+Y2Fwcy0+b3BzIHBvaW50cyB0byBhdG1lbF9uYW5kX2NvbnRyb2xsZXJf
b3BzLgoKSSBiZWxpZXZlIHlvdSBnb3QgbWlzbGVhZCBieSBncmVwcGluZyB0aGUgY29kZSBiZWNh
dXNlIHRoZXJlIGlzOgoKKiBzdHJ1Y3QgbmFuZF9jb250cm9sbGVyX29wcyBhdG1lbF9uYW5kX2Nv
bnRyb2xsZXJfb3BzCiAgLT4gdGhpcyBpcyBhIE5BTkQtd2lkZSBjb250cm9sbGVyIG9wcyBzdHJ1
Y3R1cmUKCiogc3RydWN0IGF0bWVsX25hbmRfY29udHJvbGxlcl9vcHMgYXRtZWxfPHNtdGc+X25j
X29wcwogIC0+IHRoaXMgaXMgYSBkcml2ZXIgc3BlY2lmaWMgc3RydWN0dXJlIHRvIHByb3ZpZGUg
ZGlmZmVyZW50CiAgICAgcmVnaXN0cmF0aW9uIGhlbHBlcnMuCgpUaGUgbGF0dGVyIGFsd2F5cyBw
cm92aWRlIGEgcHJvYmUgYW5kIGEgcmVtb3ZlIGltcGxlbWVudGF0aW9uLCBzbyBJCmJlbGlldmUg
dGhlIGFkZGl0aW9uIGlmIHRoZSAiaWYgKG5jLT5jYXBzLT5vcHMtPnJlbW92ZSkiIGNoZWNrIGlz
IG5vdApyZWxldmFudCwgdW5sZXNzIEkgbWlzc2VkIHNvbWV0aGluZy4KCj4gVGhpcyBpcyBhIHBy
ZXBhcmF0aW9uIGZvciBtYWtpbmcgcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrcyByZXR1cm4gdm9p
ZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmln
QHBlbmd1dHJvbml4LmRlPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9uYW5k
LWNvbnRyb2xsZXIuYyB8IDUgKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9h
dG1lbC9uYW5kLWNvbnRyb2xsZXIuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2F0bWVsL25hbmQt
Y29udHJvbGxlci5jCj4gaW5kZXggNmVmMTQ0NDJjNzFhLi5iYzZlZTY5NGY0ZTIgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXRtZWwvbmFuZC1jb250cm9sbGVyLmMKPiArKysg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9uYW5kLWNvbnRyb2xsZXIuYwo+IEBAIC0yNjI5
LDcgKzI2MjksMTAgQEAgc3RhdGljIGludCBhdG1lbF9uYW5kX2NvbnRyb2xsZXJfcmVtb3ZlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIHsKPiAgCXN0cnVjdCBhdG1lbF9uYW5kX2Nv
bnRyb2xsZXIgKm5jID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7Cj4gIAo+IC0JcmV0dXJu
IG5jLT5jYXBzLT5vcHMtPnJlbW92ZShuYyk7Cj4gKwlpZiAobmMtPmNhcHMtPm9wcy0+cmVtb3Zl
KQo+ICsJCVdBUk5fT04obmMtPmNhcHMtPm9wcy0+cmVtb3ZlKG5jKSk7Cj4gKwo+ICsJcmV0dXJu
IDA7Cj4gIH0KPiAgCj4gIHN0YXRpYyBfX21heWJlX3VudXNlZCBpbnQgYXRtZWxfbmFuZF9jb250
cm9sbGVyX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
