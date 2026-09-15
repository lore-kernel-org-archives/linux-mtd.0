Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA892C88E7D
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2026 07:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+iqkd/N4R1xecaBZhYBY/NWAROdJlrt3UNLN/jZRfQw=; b=yfoOQxMrG6eM5P
	8D4KjLf5e/+JI/XOWO2323Rd9sHtdjEFNNv7lla+dhA9W+10IHB+NxBlH4/q6vPY+pC13ur8/Oz0/
	yIKnCofadKsiqX4f8gMXUTB2d4Tq+BO9CZAPM7y7BQGINs02XYDoWMFBJl59oQC5qLHd1bUFUAZ90
	Hu8fL7M0O9KeB+N7bc+5qf5Iqj/2TXdAjRnVEWCVim2d30pzK80+w6+/qz7KW2xpha7mKXjeOXOJw
	dxAhthb2+7ms+ip52oYTst7SbLkg+uIRmQN04ai+Dt4wyE9bRrZzp1Kh5HnRUrlBF7R9XJ1+/jw55
	a//dh568ILXJg8ZLxTyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Nci-00000005TR6-3kyU;
	Tue, 15 Sep 2026 07:30:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Nch-00000005TQs-1Jpx
	for linux-mtd@lists.infradead.org;
	Tue, 15 Sep 2026 07:30:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B2F4B4081A;
	Tue, 15 Sep 2026 07:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 269261F000FF;
	Tue, 15 Sep 2026 07:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789457434;
	bh=lKRIjL8U68hpYB4JrL02iKgw2lAfaABiPkDTv+XGsr8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ian72JLd0nsExFvCUXUX5ap90mqaVMjO+AQVR9GH3tiDjqjc3KOXZcKpqMTd+R5OV
	 Faan1Qz/WR6RrfVSbI9ArEukF9DTn3VBfHJ1Edijm4K56UD0kbK3qo0nfKdqXiJTzm
	 36Zyx9VENt+kU6ssvtKWZo8nkuXPgOt5xErQQlMXx7BeAdvClST0k42e3EXZHp+/GP
	 OeXKnLIxmW6WaTQAqMHcO6RP5iKJo52No+4cAtf6Bghosh+Z505Fvrw4Vd02o6Bpqq
	 wjSG1tCcyGvJWmvWbLy/eGbk94LT19q1UtkmOa1rQvQ+lOO6SFxB8RItW6NPREVreh
	 tFT0Rw6wKJJBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: cap the write-buffer chunk at 256
 bytes on an 8-bit bus
To: "Orgad Shaneh" <orgads@gmail.com>, vigneshr@ti.com, miquel.raynal@bootlin.com, richard@nod.at
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260915071339.15172-1-orgads@gmail.com>
References: <20260915071339.15172-1-orgads@gmail.com>
Date: Tue, 15 Sep 2026 07:30:33 +0000
Message-Id: <20260915073034.269261F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogaW5jb21wbGV0
ZSB3cml0ZS1idWZmZXIgc2l6ZSBjbGFtcCBmb3IgaW50ZXJsZWF2ZWQgOC1iaXQgY2hpcHMKLS0K
CmNvbW1pdCBlZmVmNjVjNmU4ZGUzMjNlNDI5NGZkMTU3ZjdmODY1ZDEyZTM1MjkyCkF1dGhvcjog
T3JnYWQgU2hhbmVoIDxvcmdhZHNAZ21haWwuY29tPgoKbXRkOiBjZmlfY21kc2V0XzAwMDI6IGNh
cCB0aGUgd3JpdGUtYnVmZmVyIGNodW5rIGF0IDI1NiBieXRlcyBvbiBhbiA4LWJpdCBidXMKClRo
aXMgY29tbWl0IGxpbWl0cyB0aGUgd3JpdGUgYnVmZmVyIGNodW5rIHNpemUgdG8gMjU2IGJ5dGVz
IHdoZW4gdGhlIGJhbmsKd2lkdGggaXMgZXhhY3RseSBvbmUgYnl0ZS4gSXQgcHJldmVudHMgcHJv
Z3JhbSBhYm9ydHMgb24gOC1iaXQgYnVzZXMgd2hlcmUKdGhlIGNoaXAgYWR2ZXJ0aXNlcyBhIGxh
cmdlciB3cml0ZSBidWZmZXIgdGhhbiB0aGUgc2luZ2xlIGJ1cyB3b3JkIGNhbiBob2xkLgoKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMgYi9kcml2ZXJz
L210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYwo+IGluZGV4IDUxN2RiMmYyNzA3ZjQuLjY0ZmRl
ODExOTFkMTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAy
LmMKPiArKysgYi9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYwo+IEBAIC0yODMs
NiArMjgzLDE3IEBAIHN0YXRpYyB2b2lkIGZpeHVwX3VzZV93cml0ZV9idWZmZXJzKHN0cnVjdCBt
dGRfaW5mbyAqbXRkKQpbIC4uLiBdCj4gKwkvKgo+ICsJICogVGhlIHdvcmQgY291bnQgb2YgdGhl
IFdyaXRlIHRvIEJ1ZmZlciBjb21tYW5kIGlzIGEgc2luZ2xlIGJ1cwo+ICsJICogd29yZCwgc28g
b24gYW4gOC1iaXQgYnVzIGEgY2h1bmsgaG9sZHMgYXQgbW9zdCAyNTYgYnl0ZXMgbm8KPiArCSAq
IG1hdHRlciBob3cgbGFyZ2UgYSBidWZmZXIgdGhlIGNoaXAgYWR2ZXJ0aXNlcy4KPiArCSAqLwo+
ICsJaWYgKG1hcF9iYW5rd2lkdGhfaXNfMShtYXApICYmIGNmaS0+Y2ZpcS0+TWF4QnVmV3JpdGVT
aXplID4gOCkgewpbU2V2ZXJpdHk6IEhpZ2hdCkRvZXMgdGhpcyBjb25kaXRpb24gcHJvcGVybHkg
aGFuZGxlIGludGVybGVhdmVkIGNvbmZpZ3VyYXRpb25zIHdoZXJlIG11bHRpcGxlCjgtYml0IGNo
aXBzIGFyZSB1c2VkIG9uIGEgd2lkZXIgYnVzPwoKVGhlIG1hcF9iYW5rd2lkdGhfaXNfMSgpIG1h
Y3JvIGNoZWNrcyBpZiB0aGUgdG90YWwgYWdncmVnYXRlIHN5c3RlbSBidXMgd2lkdGgKaXMgMSBi
eXRlLiBJZiB0d28gOC1iaXQgY2hpcHMgYXJlIGludGVybGVhdmVkIG9uIGEgMTYtYml0IGJ1cywg
dGhlIGFnZ3JlZ2F0ZQpidXMgd2lkdGggaXMgMiBieXRlcywgY2F1c2luZyBtYXBfYmFua3dpZHRo
X2lzXzEoKSB0byBldmFsdWF0ZSB0byBmYWxzZSBhbmQKYnlwYXNzIHRoZSBjbGFtcC4KCldoZW4g
d3JpdGluZyBhIGxhcmdlIGJ1ZmZlciBpbiBhbiBpbnRlcmxlYXZlZCBzZXR1cCAoZS5nLiwgTWF4
QnVmV3JpdGVTaXplID0gOQphbmQgaW50ZXJsZWF2ZSA9IDIpLCBjZmlfYW1kc3RkX3dyaXRlX2J1
ZmZlcnMoKSB3aWxsIHBhc3MgdXAgdG8gMTAyNCBieXRlcyB0bwpkb193cml0ZV9idWZmZXIoKS4g
VGhlIGxvb3AgZGl2aWRlcyB0aGlzIGJ5IG1hcF9iYW5rd2lkdGggdG8gY29tcHV0ZSA1MTIgd29y
ZHMuCgpJdCB3cml0ZXMgYSBjb21tYW5kIG9mIDUxMSAoMHgxRkYpIHRvIHRoZSBidXMsIHdoaWNo
IGNmaV9idWlsZF9jbWQoKQpkdXBsaWNhdGVzIHRvIDB4MUZGRkYuIFRoaXMgZ2V0cyB0cnVuY2F0
ZWQgdG8gMHhGRkZGIG9uIHRoZSAxNi1iaXQgYnVzLCBzbwplYWNoIDgtYml0IGNoaXAgcmVjZWl2
ZXMgMHhGRiAoMjU1KSBhcyB0aGUgd29yZCBjb3VudC4gVGhleSB3aWxsIGV4cGVjdCBleGFjdGx5
CjI1NiB3b3JkcyAoYnl0ZXMpLgoKSG93ZXZlciwgdGhlIHN1YnNlcXVlbnQgZGF0YSBsb29wIGlu
IGRvX3dyaXRlX2J1ZmZlcigpIHdvdWxkIHdyaXRlIDUxMiB3b3Jkcwp0byBlYWNoIGNoaXAsIGNh
dXNpbmcgdGhlbSB0byBhYm9ydCB0aGUgcHJvZ3JhbSBvbiB0aGUgMjU3dGggYnl0ZS4KClNob3Vs
ZCB0aGlzIGNvbmRpdGlvbiBjaGVjayB0aGUgcGVyLWNoaXAgZGF0YSB3aWR0aCBpbnN0ZWFkIG9m
IHRoZSBhZ2dyZWdhdGUKc3lzdGVtIGJ1cyB3aWR0aD8gRm9yIGV4YW1wbGUsIGNoZWNraW5nIGlm
Cm1hcF9iYW5rd2lkdGgobWFwKSAvIGNmaV9pbnRlcmxlYXZlKGNmaSkgPT0gMT8KCj4gKwkJY2Zp
LT5jZmlxLT5NYXhCdWZXcml0ZVNpemUgPSA4Owo+ICsJCW10ZC0+d3JpdGVidWZzaXplID0gY2Zp
X2ludGVybGVhdmUoY2ZpKSA8PAo+ICsJCQkJICAgIGNmaS0+Y2ZpcS0+TWF4QnVmV3JpdGVTaXpl
Owo+ICsJfQo+ICB9CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRl
di8jL3BhdGNoc2V0LzIwMjYwOTE1MDcxMzM5LjE1MTcyLTEtb3JnYWRzQGdtYWlsLmNvbT9wYXJ0
PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
