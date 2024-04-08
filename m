Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24B5CD128A
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2024 13:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ku4Mu3UVWb5ZxXFZsAKIcYwzxPDt5S0NaQExL2ALGdQ=; b=DXLfbmSp7XdHDI
	iD7luqTdwTVPxuGTMFm4Ybb+5bCX5l8M3OwXCFgpczbhgipToctaMF7BCZY5CS+Ufo1NblBafGQl/
	aP5nAPAgBT98agFSPLHr7dNxCfKMOHQkYXMarK7HNz5KnS9DQ9fp+KptZPbr+0umx176D2Z2TBt+d
	fJcTpLqUUM55H2FQ1klflC7hYokmo2BKT4cwDXiU4UIKCNx5L1BzCQdXZXSSb/ospMywgvrOmLl0X
	+CapZUZfOWpZS/BrgYIPO+AYDT7gqxd47arcwm5NmEjB0DPykQpMm2/lYvZUJCu5zlrtw7u8sULeM
	x0AT0+dvk2Orlo9AHU7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtooL-0000000Ffsa-22mN;
	Mon, 08 Apr 2024 13:13:21 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtoo3-0000000Ffky-1e2j
	for linux-mtd@lists.infradead.org;
	Mon, 08 Apr 2024 13:13:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 387722000E;
	Mon,  8 Apr 2024 13:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712581979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L4sGAvmu2WBKS9a+UuFTscURHh9GQY36xbMpg8VE/qc=;
	b=SbAvpY6GdmVqtZm5zIx/MJnsKYTBK80BbSFPrRKsf8rOFXc1oMQNf57pDfMHtnvpglsmUV
	inR/QwyzN/FYbONPm7jSXTf2+r/LcJ5/FJxPEBDHvsj/c3TUv6678/svHAzhs/U/MtWm+p
	67kv5aYW+6m3QoUEZcFP70nABj61YgnlecopboIetW6NIYdPBvjlzTpgEgcX44shEbiHE9
	zWZHpyRJQ/wRrx+Ov2BCWV7XuZ6SS1/xomPw1cwqUkswa3azEdI0sfrrm6dMxmUxPQNrQS
	3dulRr1e59hbrVyUzJlH8x/nmH495ChGooqWHSEu4/ZIpLAy18tx7kke1MAA5A==
Date: Mon, 8 Apr 2024 15:12:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Michael Walle
 <michael@walle.cc>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v4] mtd: limit OTP NVMEM Cell parse to non Nand devices
Message-ID: <20240408151256.11d4e69c@xps-13>
In-Reply-To: <20240402212331.27328-1-ansuelsmth@gmail.com>
References: <20240402212331.27328-1-ansuelsmth@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_061304_154916_190D67D1 
X-CRM114-Status: GOOD (  25.44  )
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

SGkgQ2hyaXN0aWFuLAoKYW5zdWVsc210aEBnbWFpbC5jb20gd3JvdGUgb24gVHVlLCAgMiBBcHIg
MjAyNCAyMzoyMzoxOSArMDIwMDoKCj4gTVREIE9UUCBsb2dpYyBpcyB2ZXJ5IGZyYWdpbGUgb24g
cGFyc2luZyBOVk1FTSBDZWxsIGFuZCBjYW4gYmUKPiBwcm9ibGVtYXRpYyB3aXRoIHNvbWUgc3Bl
Y2lmaWMga2luZCBvZiBkZXZpY2VzLgo+IAo+IFRoZSBwcm9ibGVtIHdhcyBkaXNjb3ZlcmVkIGJ5
IGU4NzE2MTMyMWE0MCAoIm10ZDogcmF3bmFuZDogbWFjcm9uaXg6Cj4gT1RQIGFjY2VzcyBmb3Ig
TVgzMExGeEcxOEFDIikgd2hlcmUgT1RQIHN1cHBvcnQgd2FzIGFkZGVkIHRvIGEgTkFORAo+IGRl
dmljZS4gV2l0aCB0aGUgY2FzZSBvZiBOQU5EIGRldmljZXMsIGl0IGRvZXMgcmVxdWlyZSBhIG5v
ZGUgd2hlcmUgRUNDCj4gaW5mbyBhcmUgZGVjbGFyZWQgYW5kIGFsbCB0aGUgZml4ZWQgcGFydGl0
aW9ucywgYW5kIHRoaXMgY2F1c2UgdGhlIE9UUAo+IGNvZGVwYXRoIHRvIHBhcnNlIHRoaXMgbm9k
ZSBhcyBPVFAgTlZNRU0gQ2VsbHMsIG1ha2luZyBwcm9iZSBmYWlsIGFuZAo+IHRoZSBOQU5EIGRl
dmljZSByZWdpc3RyYXRpb24gZmFpbC4KPiAKPiBNVEQgT1RQIHBhcnNpbmcgc2hvdWxkIGhhdmUg
YmVlbiBsaW1pdGVkIHRvIGFsd2F5cyB1c2luZyBjb21wYXRpYmxlIHRvCj4gcHJldmVudCB0aGlz
IGVycm9yIGJ5IHVzaW5nIG5vZGUgd2l0aCBjb21wYXRpYmxlICJvdHAtdXNlciIgb3IKPiAib3Rw
LWZhY3RvcnkiLgo+IAo+IE5WTUVNIGFjcm9zcyB0aGUgeWVhcnMgaGFkIHZhcmlvdXMgaXRlcmF0
aW9uIG9uIGhvdyBDZWxscyBjb3VsZCBiZQo+IGRlY2xhcmVkIGluIERULCBpbiBzb21lIG9sZCBp
bXBsZW1lbnRhdGlvbiwgbm9fb2Zfbm9kZSBzaG91bGQgaGF2ZSBiZWVuCj4gZW5hYmxlZCBidXQg
bm93IGFkZF9sZWdhY3lfZml4ZWRfb2ZfY2VsbHMgc2hvdWxkIGJlIHVzZWQgdG8gZGlzYWJsZQo+
IE5WTUVNIHRvIHBhcnNlIGNoaWxkIG5vZGUgYXMgTlZNRU0gQ2VsbC4KPiAKPiBUbyBmaXggdGhp
cyBhbmQgbGltaXQgYW55IHJlZ3Jlc3Npb24gd2l0aCBvdGhlciBNVEQgdGhhdCBtYWtlcyB1c2Ug
b2YKPiBkZWNsYXJpbmcgT1RQIGFzIGRpcmVjdCBjaGlsZCBvZiB0aGUgZGV2IG5vZGUsIGRpc2Fi
bGUKPiBhZGRfbGVnYWN5X2ZpeGVkX29mX2NlbGxzIGlmIHdlIGRldGVjdCB0aGUgTVREIHR5cGUg
aXMgTmFuZC4KPiAKPiBXaXRoIHRoZSBmb2xsb3dpbmcgbG9naWMsIHRoZSBPVFAgTlZNRU0gZW50
cnkgaXMgY29ycmVjdGx5IGNyZWF0ZWQgd2l0aAo+IG5vIENlbGxzIGFuZCB0aGUgTVREIE5hbmQg
aXMgY29ycmVjdGx5IHByb2JlZCBhbmQgcGFydGl0aW9ucyBhcmUKPiBjb3JyZWN0bHkgZXhwb3Nl
ZC4KPiAKPiBGaXhlczogNGIzNjFjZmE4NjI0ICgibXRkOiBjb3JlOiBhZGQgT1RQIG52bWVtIHBy
b3ZpZGVyIHN1cHBvcnQiKQo+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyB2Ni43Kwo+
IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBNYXJhbmdpIDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4K
CkZlZWxzIG9rYXkgdG8gbWUsIGJ1dCBJJ2QgbGlrZSB0byBnZXQgdmFsaWRhdGlvbiBmcm9tIFJh
ZmHFgiBhcyB3ZWxsIHdobwpleHRlbnNpdmVseSB3b3JrZWQgb24gdGhpcyBhc3BlY3QgYW5kIG11
c3QgaGF2ZSBhIHNoYXJwZW5lZCBleWVkIGZvcgp0aGlzIGtpbmQgb2YgaXNzdWUgOi0pCgo+IC0t
LQo+IAo+IFRvIGJhY2twb3J0IHRoaXMgdG8gdjYuNiBhbmQgcHJldmlvdXMsCj4gCj4gY29uZmln
Lm5vX29mX25vZGUgPSBtdGRfdHlwZV9pc19uYW5kKG10ZCk7Cj4gCj4gc2hvdWxkIGJlIHVzZWQg
YXMgaXQgZG9lcyBwb3NlIHRoZSBzYW1lIHVzYWdlIG9mCj4gYWRkX2xlZ2FjeV9maXhlZF9vZl9j
ZWxscy4KPiAKPiBDaGFuZ2VzIHY0Ogo+IC0gQWRkIGluZm8gb24gaG93IHRvIGJhY2twb3J0IHRo
aXMgdG8gcHJldmlvdXMga2VybmVsCj4gLSBGaXggRml4ZXMgdGFnCj4gLSBSZWZvcm1hdCBjb21t
aXQgZGVzY3JpcHRpb24gYXMgaXQgd2FzIHVucHJlY2lzZSBhbmQKPiAgIGhhZCBmYWxzZSBzdGF0
ZW1lbnQKPiBDaGFuZ2VzIHYzOgo+IC0gRml4IGNvbW1pdCBkZXNjcmlwdGlvbgo+IENoYW5nZXMg
djI6Cj4gLSBVc2UgbXRkX3R5cGVfaXNfbmFuZCBpbnN0ZWFkIG9mIG5vZGUgbmFtZSBjaGVjawo+
IAo+ICBkcml2ZXJzL210ZC9tdGRjb3JlLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9t
dGRjb3JlLmMgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPiBpbmRleCA1ODg3ZmViMzQ3YTQuLjBk
ZTg3YmM2Mzg0MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPiArKysgYi9k
cml2ZXJzL210ZC9tdGRjb3JlLmMKPiBAQCAtOTAwLDcgKzkwMCw3IEBAIHN0YXRpYyBzdHJ1Y3Qg
bnZtZW1fZGV2aWNlCj4gKm10ZF9vdHBfbnZtZW1fcmVnaXN0ZXIoc3RydWN0IG10ZF9pbmZvICpt
dGQsIGNvbmZpZy5uYW1lID0KPiBjb21wYXRpYmxlOyBjb25maWcuaWQgPSBOVk1FTV9ERVZJRF9B
VVRPOwo+ICAJY29uZmlnLm93bmVyID0gVEhJU19NT0RVTEU7Cj4gLQljb25maWcuYWRkX2xlZ2Fj
eV9maXhlZF9vZl9jZWxscyA9IHRydWU7Cj4gKwljb25maWcuYWRkX2xlZ2FjeV9maXhlZF9vZl9j
ZWxscyA9ICFtdGRfdHlwZV9pc19uYW5kKG10ZCk7Cj4gIAljb25maWcudHlwZSA9IE5WTUVNX1RZ
UEVfT1RQOwo+ICAJY29uZmlnLnJvb3Rfb25seSA9IHRydWU7Cj4gIAljb25maWcuaWdub3JlX3dw
ID0gdHJ1ZTsKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
