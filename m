Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D12C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 16:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NV2tjAndwxSYBPXxJoa8D+VM2qPPEbQIU/LszR5FJb0=; b=q6OcAZJ3tu9ZkB
	rruO5KtH25DgKLt0OY22Ykwly/IKE9JAM9bsWkSwWwNNThEbDdy9+dAOjgr6eBan4Vvb55NqKZDZi
	1Tk5fS3AoFrTHqTHMqm3ItPwMtcRI0gT6tMP4NnHDpUMWwOF1GcD7+Q8smo+qvyFeK2xFG683kqaq
	7T2+a1HuSKlDUz1oYybseieVNwJIlNvAn8WN7sbkmRFXG1cEKBSEGZRMeBmXOCp38hAhQYYSDov35
	eTHQG7J3We8RHLFsPSJ8UVm7Zv4ljFJ804oPABQLky4cbpiBAdn5PYk/kp546fVCeF+9P1wYqeEYS
	JUE1gp4ISu/9uOajo32A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEZM0-009oEc-Ds; Mon, 31 Jan 2022 16:16:32 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEZLm-009oBx-Pg; Mon, 31 Jan 2022 16:16:20 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 77408C0002;
 Mon, 31 Jan 2022 16:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643645773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gQZNpFwpLCJ2QyIMMCx53V4RScNFk6vSypQeECK4z4c=;
 b=NTnrvH4RJ0iYZUySnPLyEFtsw7hdyFpmXXaxYfRvf4A3oB2RQmWvP82HDlpnVT6zZDejcc
 yTFsBLtBz5DqIPbN+H06NMTb6Y7+uHUENEsCZvHZp492AHbg2rjLCFPLZpSRsZ8MvZjRRQ
 UZWGhs0QiHgHUn/8X4Y5ZwOoutcg4cRAlmQSrt3fWAyenVzewJ/5SlKAzeQAMRdrArCt4D
 D10feyLYD0zSL7OQriWl1VeVrZbKxPfQ0UEZpkr4RuJm8YyJHG0UHj6wER3s0Gz/kvab9L
 6RkRBbWqf07yn9B8QKjxLSYAR4KdniVXfMWbZsVj8pKFbayiVy1cebVNGquauw==
Date: Mon, 31 Jan 2022 17:16:06 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Xin Xiong <xiongx18@fudan.edu.cn>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, yuanxzhang@fudan.edu.cn, Xiyu Yang
 <xiyuyang19@fudan.edu.cn>, Xin Tan <tanxin.ctf@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: atmel: fix refcount issue in
 atmel_nand_controller_init
Message-ID: <20220131171606.2733d1a3@xps13>
In-Reply-To: <20220127084104.3683-1-xiongx18@fudan.edu.cn>
References: <20220127084104.3683-1-xiongx18@fudan.edu.cn>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_081619_487912_6113522B 
X-CRM114-Status: GOOD (  18.14  )
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

SGkgWGluLAoKeGlvbmd4MThAZnVkYW4uZWR1LmNuIHdyb3RlIG9uIFRodSwgMjcgSmFuIDIwMjIg
MTY6NDE6MDUgKzA4MDA6Cgo+IFRoZSByZWZlcmVuY2UgY291bnRpbmcgaXNzdWUgaGFwcGVucyBp
biBzZXZlcmFsIGVycm9yIGhhbmRsaW5nIHBhdGhzCj4gb24gYSByZWZjb3VudGVkIG9iamVjdCAi
bmMtPmRtYWMiLiBJbiB0aGVzZSBwYXRocywgdGhlIGZ1bmN0aW9uIHNpbXBseQo+IHJldHVybnMg
dGhlIGVycm9yIGNvZGUsIGZvcmdldHRpbmcgdG8gYmFsYW5jZSB0aGUgcmVmZXJlbmNlIGNvdW50
IG9mCj4gIm5jLT5kbWFjIiwgaW5jcmVhc2VkIGVhcmxpZXIgYnkgZG1hX3JlcXVlc3RfY2hhbm5l
bCgpLCB3aGljaCBtYXkKPiBjYXVzZSByZWZjb3VudCBsZWFrcy4KPiAKPiBGaXggaXQgYnkgZGVj
cmVtZW50aW5nIHRoZSByZWZjb3VudCBvZiBzcGVjaWZpYyBvYmplY3QgaW4gdGhvc2UgZXJyb3IK
PiBwYXRocy4KPiAKPiBGaXhlczogZjg4ZmMxMjJjYzM0ICgibXRkOiBuYW5kOiBDbGVhbnVwL3Jl
d29yayB0aGUgYXRtZWxfbmFuZCBkcml2ZXIiKQo+IENvLWRldmVsb3BlZC1ieTogWGl5dSBZYW5n
IDx4aXl1eWFuZzE5QGZ1ZGFuLmVkdS5jbj4KPiBTaWduZWQtb2ZmLWJ5OiBYaXl1IFlhbmcgPHhp
eXV5YW5nMTlAZnVkYW4uZWR1LmNuPgo+IENvLWRldmVsb3BlZC1ieTogWGluIFRhbiA8dGFueGlu
LmN0ZkBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWGluIFRhbiA8dGFueGluLmN0ZkBnbWFp
bC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWGluIFhpb25nIDx4aW9uZ3gxOEBmdWRhbi5lZHUuY24+
Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2F0bWVsL25hbmQtY29udHJvbGxlci5jIHwg
MTggKysrKysrKysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9h
dG1lbC9uYW5kLWNvbnRyb2xsZXIuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2F0bWVsL25hbmQt
Y29udHJvbGxlci5jCj4gaW5kZXggZjMyNzZlZTllNGZlLi43MDAzODc3NjMyZmIgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXRtZWwvbmFuZC1jb250cm9sbGVyLmMKPiArKysg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9uYW5kLWNvbnRyb2xsZXIuYwo+IEBAIC0yMDYw
LDEzICsyMDYwLDE1IEBAIHN0YXRpYyBpbnQgYXRtZWxfbmFuZF9jb250cm9sbGVyX2luaXQoc3Ry
dWN0IGF0bWVsX25hbmRfY29udHJvbGxlciAqbmMsCj4gIAluYy0+bWNrID0gb2ZfY2xrX2dldChk
ZXYtPnBhcmVudC0+b2Zfbm9kZSwgMCk7Cj4gIAlpZiAoSVNfRVJSKG5jLT5tY2spKSB7Cj4gIAkJ
ZGV2X2VycihkZXYsICJGYWlsZWQgdG8gcmV0cmlldmUgTUNLIGNsa1xuIik7Cj4gLQkJcmV0dXJu
IFBUUl9FUlIobmMtPm1jayk7Cj4gKwkJcmV0ID0gUFRSX0VSUihuYy0+bWNrKTsKPiArCQlnb3Rv
IG91dF9yZWxlYXNlX2RtYTsKPiAgCX0KPiAgCj4gIAlucCA9IG9mX3BhcnNlX3BoYW5kbGUoZGV2
LT5wYXJlbnQtPm9mX25vZGUsICJhdG1lbCxzbWMiLCAwKTsKPiAgCWlmICghbnApIHsKPiAgCQlk
ZXZfZXJyKGRldiwgIk1pc3Npbmcgb3IgaW52YWxpZCBhdG1lbCxzbWMgcHJvcGVydHlcbiIpOwo+
IC0JCXJldHVybiAtRUlOVkFMOwo+ICsJCXJldCA9IC1FSU5WQUw7Cj4gKwkJZ290byBvdXRfcmVs
ZWFzZV9kbWE7Cj4gIAl9Cj4gIAo+ICAJbmMtPnNtYyA9IHN5c2Nvbl9ub2RlX3RvX3JlZ21hcChu
cCk7Cj4gQEAgLTIwNzQsMTAgKzIwNzYsMjAgQEAgc3RhdGljIGludCBhdG1lbF9uYW5kX2NvbnRy
b2xsZXJfaW5pdChzdHJ1Y3QgYXRtZWxfbmFuZF9jb250cm9sbGVyICpuYywKPiAgCWlmIChJU19F
UlIobmMtPnNtYykpIHsKPiAgCQlyZXQgPSBQVFJfRVJSKG5jLT5zbWMpOwo+ICAJCWRldl9lcnIo
ZGV2LCAiQ291bGQgbm90IGdldCBTTUMgcmVnbWFwIChlcnIgPSAlZClcbiIsIHJldCk7Cj4gLQkJ
cmV0dXJuIHJldDsKPiArCQlnb3RvIG91dF9yZWxlYXNlX2RtYTsKPiAgCX0KPiAgCj4gIAlyZXR1
cm4gMDsKPiArCj4gK291dF9yZWxlYXNlX2RtYToKPiArCWlmIChuYy0+Y2Fwcy0+aGFzX2RtYSAm
JiAhYXRtZWxfbmFuZF9hdm9pZF9kbWEpIHsKPiArCQlpZiAoIUlTX0VSUl9PUl9OVUxMKG5jLT5k
bWFjKSkgewoKaWYgKCFuYy0+ZG1hYykgewoKPiArCQkJZG1hX3JlbGVhc2VfY2hhbm5lbChuYy0+
ZG1hYyk7Cj4gKwkJCW5jLT5kbWFjID0gTlVMTDsKClRoaXMgaXMgdGhlbiB1bm5lY2Vzc2FyeSBh
bmQgdGhlIHdob2xlIGJsb2NrIGFuZCB0aGUgdHdvIGZpcnN0IGNoZWNrcwpjYW4gdGhlbiBiZSBp
Z25vcmVkIGFzIGRtYWMgd2lsbCBub3QgYmUgc2V0IG90aGVyd2lzZSAoYW5kIHdpbGwgc3RheQpO
VUxMKS4KCj4gKwkJfQo+ICsJfQo+ICsKPiArCXJldHVybiByZXQ7Cj4gIH0KPiAgCj4gIHN0YXRp
YyBpbnQKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
