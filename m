Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2085C25B10
	for <linux-mtd@archiver.kernel.org>; Mon, 13 May 2024 07:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IT0gqauHEoMCdHug+NP8QCpJ245XnPmVitkjz2ecU7s=; b=x1mu202UzcNzRI
	FJ4yIERQ4GbEJtSLFb2VTMXKlKxAIE5a/ooq6eP9zEs5CvpTukn84E+MrkQpSA/aoiBhnuGl9SUkj
	3ssQwy/d/plUHjjrcYRZZ6+TMGgsdMuxJJnIZS+nBIkSA5hYdSGKIfq+ZsQ919u4w7HhmQAzpEfZe
	t4MMyLNzeLBCIyhTJprmxFZfzywKbkJmN2wQzoifwpIDtG7BKgothsDB5ivcz/mtauLB6JLMwqZQU
	GRzI2tGIeNu8VEK19SjT3E+O+w9a9tBVSQw/JLSnyLLLWxfTBwcA2BKTutrvcaG9gOuMQybyyfjg6
	JiqoKymu7vrWlUgMKluA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Pxs-0000000Bz4R-1Ob3;
	Mon, 13 May 2024 07:19:16 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Pxo-0000000Bz2l-1vpc
	for linux-mtd@lists.infradead.org;
	Mon, 13 May 2024 07:19:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0D062000B;
	Mon, 13 May 2024 07:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715584744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MskvBFMd+qrWo6ZlXiGYpEMPTg9+CeZ7e/xPiSpgH0I=;
	b=o8xjLf6la1MFScVJaaomzFUintfjoKeox0Jnm2kqn8DKwyzhVGO/4lF6NrUJRl5Z4I9q9J
	oRy/I/rNdVwyXvzj7//rrtkDvyKXnzhZYaFAXrD/Zc83SprlwtntyjetidJko0cq7zSgLA
	A5INzDQwCogSzlyjZ9dsZQulGyMwEG/1AdvAEYWldFX6VQluvq+yJXItvLq3N7mnCvFFF8
	7Q6PHKNmlCpX6mcVvLVWeNPon/BLQipCED5qc1bCdOmHH0XUnrgN32iiJ430fU9Dd25hSW
	9GY/Civp5NArumrtglL7+ebosj4k5+M7pjRlMb8YO+T//8bj/KIW34k0RlII+w==
Date: Mon, 13 May 2024 09:19:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] mtd: nand: mxc_nand: implement exec_op
Message-ID: <20240513091902.2c00d30a@xps-13>
In-Reply-To: <20240508-mtd-nand-mxc-nand-exec-op-v2-2-6b7366b7831f@pengutronix.de>
References: <20240508-mtd-nand-mxc-nand-exec-op-v2-0-6b7366b7831f@pengutronix.de>
	<20240508-mtd-nand-mxc-nand-exec-op-v2-2-6b7366b7831f@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_001912_789683_CF5F5AC6 
X-CRM114-Status: GOOD (  16.92  )
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

SGkgU2FzY2hhLAoKPiBAQCAtMTcxNyw5ICsxNDY1LDExMSBAQCBzdGF0aWMgaW50IG14Y25kX3Nl
dHVwX2ludGVyZmFjZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQgY2hpcG5yLAo+ICAJcmV0
dXJuIGhvc3QtPmRldnR5cGVfZGF0YS0+c2V0dXBfaW50ZXJmYWNlKGNoaXAsIGNoaXBuciwgY29u
Zik7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbnQgbXhjbmRfZXhlY19vcChzdHJ1Y3QgbmFuZF9jaGlw
ICpjaGlwLAo+ICsJCQkgY29uc3Qgc3RydWN0IG5hbmRfb3BlcmF0aW9uICpvcCwKPiArCQkJIGJv
b2wgY2hlY2tfb25seSkKPiArewo+ICsJc3RydWN0IG14Y19uYW5kX2hvc3QgKmhvc3QgPSBuYW5k
X2dldF9jb250cm9sbGVyX2RhdGEoY2hpcCk7Cj4gKwlzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5h
bmRfdG9fbXRkKGNoaXApOwo+ICsJaW50IGksIGosIGJ1Zl9sZW47Cj4gKwl2b2lkICpidWZfcmVh
ZCA9IE5VTEw7Cj4gKwljb25zdCB2b2lkICpidWZfd3JpdGUgPSBOVUxMOwo+ICsJY29uc3Qgc3Ry
dWN0IG5hbmRfb3BfaW5zdHIgKmluc3RyOwo+ICsJYm9vbCByZWFkaWQgPSBmYWxzZTsKPiArCWJv
b2wgc3RhdHVzcmVxID0gZmFsc2U7Cj4gKwo+ICsJZGV2X2RiZyhob3N0LT5kZXYsICIlczogJWQg
aW5zdHJ1Y3Rpb25zXG4iLCBfX2Z1bmNfXywgb3AtPm5pbnN0cnMpOwoKTWF5YmUgeW91IHdhbnQg
dG8gZ2V0IHJpZCBvZiB0aGlzIGRlYnVnIGxpbmUuCgo+ICsKPiArCWlmIChjaGVja19vbmx5KQo+
ICsJCXJldHVybiAwOwo+ICsKPiArCWZvciAoaSA9IDA7IGkgPCBvcC0+bmluc3RyczsgaSsrKSB7
Cj4gKwkJaW5zdHIgPSAmb3AtPmluc3Ryc1tpXTsKPiArCj4gKwkJbmFuZF9vcF90cmFjZSgiICAi
LCBpbnN0cik7Cj4gKwo+ICsJCXN3aXRjaCAoaW5zdHItPnR5cGUpIHsKPiArCQljYXNlIE5BTkRf
T1BfV0FJVFJEWV9JTlNUUjoKPiArCQkJLyoKPiArCQkJICogTkZDIGhhbmRsZXMgUi9CIGludGVy
bmFsbHkuIFRoZXJlZm9yZSwgdGhpcyBmdW5jdGlvbgo+ICsJCQkgKiBhbHdheXMgcmV0dXJucyBz
dGF0dXMgYXMgcmVhZHkuCgpUaGlzIGlzIG5vIGxvbmdlciBhIHN0YW5kYWxvbmUgZnVuY3Rpb24s
IG1heWJlOgoKIlRoZSBjb250cm9sbGVyIGhhbmRsZXMgdGhlIFIvQiBwaW4gaW50ZXJuYWxseSwg
dGhlcmVmb3JlIHRoZXJlIGlzCm5vdGhpbmcgdG8gZG8gaGVyZS4iCgo+ICsJCQkgKi8KPiArCQkJ
YnJlYWs7Cj4gKwkJY2FzZSBOQU5EX09QX0NNRF9JTlNUUjoKPiArCQkJaWYgKGluc3RyLT5jdHgu
Y21kLm9wY29kZSA9PSBOQU5EX0NNRF9QQUdFUFJPRykKPiArCQkJCWhvc3QtPmRldnR5cGVfZGF0
YS0+c2VuZF9wYWdlKG10ZCwgTkZDX0lOUFVUKTsKPiArCj4gKwkJCWhvc3QtPmRldnR5cGVfZGF0
YS0+c2VuZF9jbWQoaG9zdCwgaW5zdHItPmN0eC5jbWQub3Bjb2RlLCB0cnVlKTsKPiArCj4gKwkJ
CWlmIChpbnN0ci0+Y3R4LmNtZC5vcGNvZGUgPT0gTkFORF9DTURfUkVBRElEKQo+ICsJCQkJcmVh
ZGlkID0gdHJ1ZTsKPiArCQkJaWYgKGluc3RyLT5jdHguY21kLm9wY29kZSA9PSBOQU5EX0NNRF9T
VEFUVVMpCj4gKwkJCQlzdGF0dXNyZXEgPSB0cnVlOwo+ICsKPiArCQkJYnJlYWs7Cj4gKwkJY2Fz
ZSBOQU5EX09QX0FERFJfSU5TVFI6Cj4gKwkJCWZvciAoaiA9IDA7IGogPCBpbnN0ci0+Y3R4LmFk
ZHIubmFkZHJzOyBqKyspIHsKPiArCQkJCWJvb2wgaXNsYXN0ID0gaiA9PSBpbnN0ci0+Y3R4LmFk
ZHIubmFkZHJzIC0gMTsKPiArCQkJCWhvc3QtPmRldnR5cGVfZGF0YS0+c2VuZF9hZGRyKGhvc3Qs
IGluc3RyLT5jdHguYWRkci5hZGRyc1tqXSwgaXNsYXN0KTsKPiArCQkJfQo+ICsJCQlicmVhazsK
PiArCQljYXNlIE5BTkRfT1BfREFUQV9PVVRfSU5TVFI6Cj4gKwkJCWJ1Zl93cml0ZSA9IGluc3Ry
LT5jdHguZGF0YS5idWYub3V0Owo+ICsJCQlidWZfbGVuID0gaW5zdHItPmN0eC5kYXRhLmxlbjsK
PiArCj4gKwkJCW1lbWNweTMyX3RvaW8oaG9zdC0+bWFpbl9hcmVhMCwgYnVmX3dyaXRlLCBidWZf
bGVuKTsKPiArCQkJaWYgKGNoaXAtPm9vYl9wb2kpCj4gKwkJCQljb3B5X3NwYXJlKG10ZCwgZmFs
c2UsIGNoaXAtPm9vYl9wb2kpOwoKVGhpcyBjb3B5IHNob3VsZCBub3QgYmUgbmVlZGVkLiBJdCBz
aG91bGQgYmUgaW4geW91ciBwYWdlIGFjY2Vzc29ycyBpZgpuZWVkZWQuCgo+ICsKPiArCQkJYnJl
YWs7Cj4gKwkJY2FzZSBOQU5EX09QX0RBVEFfSU5fSU5TVFI6Cj4gKwo+ICsJCQlidWZfcmVhZCA9
IGluc3RyLT5jdHguZGF0YS5idWYuaW47Cj4gKwkJCWJ1Zl9sZW4gPSBpbnN0ci0+Y3R4LmRhdGEu
bGVuOwo+ICsKPiArCQkJaWYgKHJlYWRpZCkgewo+ICsJCQkJaG9zdC0+ZGV2dHlwZV9kYXRhLT5z
ZW5kX3JlYWRfaWQoaG9zdCk7Cj4gKwkJCQlyZWFkaWQgPSBmYWxzZTsKPiArCj4gKwkJCQltZW1j
cHkzMl9mcm9taW8oaG9zdC0+ZGF0YV9idWYsIGhvc3QtPm1haW5fYXJlYTAsIGJ1Zl9sZW4gKiAy
KTsKPiArCj4gKwkJCQlpZiAoY2hpcC0+b3B0aW9ucyAmIE5BTkRfQlVTV0lEVEhfMTYpIHsKPiAr
CQkJCQl1OCAqYnVmciA9IGJ1Zl9yZWFkOwo+ICsJCQkJCXUxNiAqYnVmdyA9IGhvc3QtPmRhdGFf
YnVmOwo+ICsJCQkJCWZvciAoaiA9IDA7IGogPCBidWZfbGVuOyBqKyspCj4gKwkJCQkJCWJ1ZnJb
al0gPSBidWZ3W2pdOwo+ICsJCQkJfSBlbHNlIHsKPiArCQkJCQltZW1jcHkoYnVmX3JlYWQsIGhv
c3QtPmRhdGFfYnVmLCBidWZfbGVuKTsKPiArCQkJCX0KPiArCQkJCWJyZWFrOwo+ICsJCQl9Cj4g
Kwo+ICsJCQlpZiAoc3RhdHVzcmVxKSB7Cj4gKwkJCQkqKHU4KilidWZfcmVhZCA9IGhvc3QtPmRl
dnR5cGVfZGF0YS0+Z2V0X2Rldl9zdGF0dXMoaG9zdCk7Cj4gKwkJCQlzdGF0dXNyZXEgPSBmYWxz
ZTsKPiArCQkJCWJyZWFrOwo+ICsJCQl9Cj4gKwo+ICsJCQlob3N0LT5kZXZ0eXBlX2RhdGEtPnJl
YWRfcGFnZShjaGlwKTsKPiArCj4gKwkJCWlmIChJU19BTElHTkVEKGJ1Zl9sZW4sIDQpKSB7Cj4g
KwkJCQltZW1jcHkzMl9mcm9taW8oYnVmX3JlYWQsIGhvc3QtPm1haW5fYXJlYTAsIGJ1Zl9sZW4p
Owo+ICsJCQl9IGVsc2Ugewo+ICsJCQkJbWVtY3B5MzJfZnJvbWlvKGhvc3QtPmRhdGFfYnVmLCBo
b3N0LT5tYWluX2FyZWEwLCBtdGQtPndyaXRlc2l6ZSk7Cj4gKwkJCQltZW1jcHkoYnVmX3JlYWQs
IGhvc3QtPmRhdGFfYnVmLCBidWZfbGVuKTsKPiArCQkJfQo+ICsKPiArCQkJYnJlYWs7Cj4gKwkJ
fQo+ICsJfQo+ICsKPiArCXJldHVybiAwOwo+ICt9CgpPdGhlcndpc2UgSSdtIHZlcnkgaGFwcHkg
d2l0aCB0aGUgbG9vay4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
