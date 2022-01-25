Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08D4C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jan 2022 17:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y9ZdnVa+6PiStcOUYyUspWDikZ35ZLKsgrdSZe1iGjA=; b=FcqT7b5CZ9mUTZ
	Sg0VKnSAlCe1wT8XvWi6nNTlnKD+uwgZEjaa6FX3C7zaaX4bapgXJQ5Zs0zkX73SmwRQ+MS6fC16I
	W8UsNJhJ0RROiDxD6Ym1uI6h85PTF9qO2I9GKxziMECK7u268pR5QRC/7QOkJO8q3A8WtdtAfKu2v
	fS0K2mdt1hihQZiPfnco3dcH2ldSpeeP+U/uaiSMOUoWaE5NcZN3e52Ej1piwb+F7RACzTBAbbZTB
	T3o6aZBYFI7AnmSmFWkUrNiwvTcjLWI5d0QAgFmmrXiW9Jt6Qtb0G4miLB+F692xn1EkVcn2O6gyX
	GT3GZt9DWi8S8a9srwMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCQ3F-0097Se-HE; Tue, 25 Jan 2022 17:56:17 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCQ32-0097OJ-JM; Tue, 25 Jan 2022 17:56:06 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F0870FF803;
 Tue, 25 Jan 2022 17:55:57 +0000 (UTC)
Date: Tue, 25 Jan 2022 18:55:56 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Xin Xiong <xiongx18@fudan.edu.cn>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 yuanxzhang@fudan.edu.cn, Xiyu Yang <xiyuyang19@fudan.edu.cn>, Xin Tan
 <tanxin.ctf@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: atmel: fix refcount leaks in
 atmel_nand_controller_init
Message-ID: <20220125185556.6afb7eba@xps13>
In-Reply-To: <20220125123155.36891-1-xiongx18@fudan.edu.cn>
References: <20220125123155.36891-1-xiongx18@fudan.edu.cn>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_095604_958147_74B5041D 
X-CRM114-Status: GOOD (  21.84  )
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

SGkgWGluLAoKeGlvbmd4MThAZnVkYW4uZWR1LmNuIHdyb3RlIG9uIFR1ZSwgMjUgSmFuIDIwMjIg
MjA6MzE6NTYgKzA4MDA6Cgo+IFRoZSByZWZlcmVuY2UgY291bnRpbmcgaXNzdWUgaGFwcGVucyBp
biBzZXZlcmFsIGVycm9yIGhhbmRsaW5nIHBhdGhzCj4gb24gYSByZWZjb3VudGVkIG9iamVjdCAi
bmMtPmRtYWMiLiBJbiB0aGVzZSBwYXRocywgdGhlIGZ1bmN0aW9uIHNpbXBseQo+IHJldHVybnMg
dGhlIGVycm9yIGNvZGUsIGZvcmdldHRpbmcgdG8gYmFsYW5jZSB0aGUgcmVmZXJlbmNlIGNvdW50
Cj4gaW5jcmVhc2VkIGVhcmxpZXIgYnkgZG1hX3JlcXVlc3RfY2hhbm5lbCgpLCB3aGljaCBtYXkg
Y2F1c2UgcmVmY291bnQKPiBsZWFrcy4gV2hhdCdzIG1vcmUsIHRoZSAibmMtPm1jayIgb2JqZWN0
IGFsc28gbmVlZHMgdG8gYmUgaGFuZGxlZAo+IGNvcnJlY3RseS4KCllvdSBtaWdodCB3YW50IHRv
IHNwbGl0IHRoaXMgaW50byB0d28gY29tbWl0cy4KCj4gCj4gRml4IGl0IGJ5IGFkZGluZyBzcGVj
aWZpYyBlcnJvciBoYW5kbGluZyBjb2RlIGluIHRob3NlIGVycm9yIHBhdGhzLgoKWW91IG5lZWQg
YSBGaXhlcyB0YWcgaGVyZS4KCj4gU2lnbmVkLW9mZi1ieTogWGluIFhpb25nIDx4aW9uZ3gxOEBm
dWRhbi5lZHUuY24+Cj4gU2lnbmVkLW9mZi1ieTogWGl5dSBZYW5nIDx4aXl1eWFuZzE5QGZ1ZGFu
LmVkdS5jbj4KPiBTaWduZWQtb2ZmLWJ5OiBYaW4gVGFuIDx0YW54aW4uY3RmQGdtYWlsLmNvbT4K
CllvdSBjYW4ndCBkbyB0aGF0LiBUaGUgcGF0Y2ggaXMgcmF0aGVyIHN0cmFpZ2h0Zm9yd2FyZCwg
c28gMwphdXRob3JzaGlwIHNlZW0gYSBsaXR0bGUgYml0IHRvbyBtdWNoLgoKSWYgc29tZW9uZSBz
dWdnZXN0ZWQgeW91IGEgY2hhbmdlLCBvciBzZW50IHlvdSBhIHByb3Bvc2FsLCB5b3Ugc2hvdWxk
CnVzZSBhIFN1Z2dlc3RlZC1ieS4gSWYgaXQgd2FzIHJlcG9ydGVkIGJ5IGEgY29sbGVhZ3VlLCB1
c2UgUmVwb3J0ZWQtYnkuCklmIGl0IHdhcyBjby1kZXZlbG9wcGVkLCB1c2UgdGhlIHJpZ2h0IHRh
ZyBhbmQgdGhlIHJpZ2h0IFNpZ25lZC1vZmYtYnkKYXMgZG9jdW1lbnRlZCBpbiB0aGUgc3VibWl0
dGVkLXByb2Nlc3MucnN0IGZpbGUuIElmIHlvdSBwaWNrZWQgdGhlCnBhdGNoIGZyb20gc29tZW9u
ZSBlbHNlLCB5b3UgbXVzdCBwcmVzZXJ2ZSB0aGUgYXV0aG9yc2hpcCBhbmQganVzdCBhZGQKeW91
ciBTb0IuCgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9uYW5kLWNvbnRyb2xs
ZXIuYyB8IDIyICsrKysrKysrKysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9hdG1lbC9uYW5kLWNvbnRyb2xsZXIuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2F0
bWVsL25hbmQtY29udHJvbGxlci5jCj4gaW5kZXggZjMyNzZlZTllLi5iMzgwMWViZDIgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXRtZWwvbmFuZC1jb250cm9sbGVyLmMKPiAr
KysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9uYW5kLWNvbnRyb2xsZXIuYwo+IEBAIC0y
MDYwLDEzICsyMDYwLDE1IEBAIHN0YXRpYyBpbnQgYXRtZWxfbmFuZF9jb250cm9sbGVyX2luaXQo
c3RydWN0IGF0bWVsX25hbmRfY29udHJvbGxlciAqbmMsCj4gIAluYy0+bWNrID0gb2ZfY2xrX2dl
dChkZXYtPnBhcmVudC0+b2Zfbm9kZSwgMCk7Cj4gIAlpZiAoSVNfRVJSKG5jLT5tY2spKSB7Cj4g
IAkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gcmV0cmlldmUgTUNLIGNsa1xuIik7Cj4gLQkJcmV0
dXJuIFBUUl9FUlIobmMtPm1jayk7Cj4gKwkJcmV0ID0gUFRSX0VSUihuYy0+bWNrKTsKPiArCQln
b3RvIG91dF9yZWxlYXNlX2RtYTsKPiAgCX0KPiAgCj4gIAlucCA9IG9mX3BhcnNlX3BoYW5kbGUo
ZGV2LT5wYXJlbnQtPm9mX25vZGUsICJhdG1lbCxzbWMiLCAwKTsKPiAgCWlmICghbnApIHsKPiAg
CQlkZXZfZXJyKGRldiwgIk1pc3Npbmcgb3IgaW52YWxpZCBhdG1lbCxzbWMgcHJvcGVydHlcbiIp
Owo+IC0JCXJldHVybiAtRUlOVkFMOwo+ICsJCXJldCA9IC1FSU5WQUw7Cj4gKwkJZ290byBvdXRf
cHV0X2NsazsKPiAgCX0KPiAgCj4gIAluYy0+c21jID0gc3lzY29uX25vZGVfdG9fcmVnbWFwKG5w
KTsKPiBAQCAtMjA3NCwxMCArMjA3NiwyNCBAQCBzdGF0aWMgaW50IGF0bWVsX25hbmRfY29udHJv
bGxlcl9pbml0KHN0cnVjdCBhdG1lbF9uYW5kX2NvbnRyb2xsZXIgKm5jLAo+ICAJaWYgKElTX0VS
UihuYy0+c21jKSkgewo+ICAJCXJldCA9IFBUUl9FUlIobmMtPnNtYyk7Cj4gIAkJZGV2X2Vycihk
ZXYsICJDb3VsZCBub3QgZ2V0IFNNQyByZWdtYXAgKGVyciA9ICVkKVxuIiwgcmV0KTsKPiAtCQly
ZXR1cm4gcmV0Owo+ICsJCWdvdG8gb3V0X3B1dF9jbGs7Cj4gIAl9Cj4gIAo+ICAJcmV0dXJuIDA7
Cj4gKwo+ICtvdXRfcHV0X2NsazoKPiArCWNsa19wdXQobmMtPm1jayk7Cj4gKwluYy0+bWNrID0g
TlVMTDsKPiArCj4gK291dF9yZWxlYXNlX2RtYToKPiArCWlmIChuYy0+Y2Fwcy0+aGFzX2RtYSAm
JiAhYXRtZWxfbmFuZF9hdm9pZF9kbWEpIHsKPiArCQlpZiAoIUlTX0VSUl9PUl9OVUxMKG5jLT5k
bWFjKSkgewoKCSAgICYmICFJU19FUlIuLi4KCj4gKwkJCWRtYV9yZWxlYXNlX2NoYW5uZWwobmMt
PmRtYWMpOwo+ICsJCQluYy0+ZG1hYyA9IE5VTEw7Cj4gKwkJfQo+ICsJfQo+ICsKPiArCXJldHVy
biByZXQ7Cj4gIH0KPiAgCj4gIHN0YXRpYyBpbnQKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
