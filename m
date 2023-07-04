Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592A6EB64D9
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 13:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FZinPiR4J9TLCNPj5/D5rmSC3ECpvObM0LQWWTAtLu0=; b=z4+doPonyskMek
	VvpH8brlM4zGS+m2N2kTflxzixTbU10TqcVI6HS4p9HQjVLN+tCE+ZtBZfXcz8+KAIsbQQYEM0Xz0
	IrO3dFQxmJgoPk41kYI+zY8dcVqYnusmFScK320s7e/wvX1NKI9vFrdj/cGs4oVHwnr6QK+nUM75h
	jdSFkmHYcF/KxMju/b4nSpVJmIVUUB4EzF5xF+9J1RjHUeT+FA9AOGV8p6ckzb8MAKpUr7ey0utpp
	2yxSQEzhyKpD0BKEgzW/OQXQqBmuOFW2CKElufPstarqLY89sMYw+HbfETbdsbme4ThkYpF5K51AS
	RZq4XMj/TKLemHeJmHCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGgUx-00DRyt-2S;
	Tue, 04 Jul 2023 13:55:19 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGgUt-00DRxI-2F
	for linux-mtd@lists.infradead.org;
	Tue, 04 Jul 2023 13:55:17 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688478909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LiM73AlJxucWg3z48BYnYknSUwAWZ4Kmkn1Nr2ACD0A=;
	b=IHfecc42WPCyTP/PnqTrZOs7N03YcFRFZJKCEFYdXufKv2oorUwKVv90kcwwrSH8eupA5j
	J9IMYOK67moY3cu0UZZrC5WIA3eH+SzLYpTQoETAR2OKPiRGoXPiLF6OCzIDP+nhwl48GD
	hQyHE29Sl3SyJ1JOMBNlgbgLrlYKynPFO5kzIOZBgGUPsQI24b9wkAinVfsttf2dpAfGw1
	KkR9F+qzDqirxssUAs+KlAqhI1g1l0LM6leHN2Ht1mQ8xE8pUSIJeI2yIQuN70PFC+NHBk
	OwnBMPh3GtF2vDNmt2+3YiQIny5Q/PLpLl//HsVQiMIxRdvaDND2Wi+cfkmWOQ==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59B4040009;
	Tue,  4 Jul 2023 13:55:08 +0000 (UTC)
Date: Tue, 4 Jul 2023 15:55:07 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Cc: Felix Matouschek <felix@matouschek.org>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] Bad ecc layout in drivers/mtd/nand/spi/xtx.c
Message-ID: <20230704155507.0643a856@xps-13>
In-Reply-To: <20230704123743.7f4c87af@ipc1.ka-ro>
References: <20230704123743.7f4c87af@ipc1.ka-ro>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_065515_998020_7AA60705 
X-CRM114-Status: GOOD (  23.55  )
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

SGkgTG90aGFyLAoKVGhhbmtzIGZvciB0aGUgcmVwb3J0LgoKTFdAS0FSTy1lbGVjdHJvbmljcy5k
ZSB3cm90ZSBvbiBUdWUsIDQgSnVsIDIwMjMgMTI6Mzc6NDMgKzAyMDA6Cgo+IEhpLAo+IAo+IHdo
aWxlIHRyeWluZyB0byBhZGQgc3VwcG9ydCBmb3IgdGhlICdYVDI2RzAxQycgdmFyaWFudCBvZiB0
aGUgWFRYCj4gU1BJLW5hbmQgY2hpcCBJIG5vdGljZWQgYSBmbGF3IGluIHRoZSBFQ0MgbGF5b3V0
IG9mIHRoZSBleGlzdGluZwo+IGRyaXZlci4KPiBBY2NvcmRpbmcgdG8gdGhlICBYVDI2RzAxQSBk
YXRhc2hlZXQgdGhlIGZpcnN0IGVpZ2h0IGJ5dGVzIG9mIHRoZSBPT0IKPiBhcmVhIGFyZSBub3Qg
cHJvdGVjdGVkIGJ5IEVDQzoKPiBPZmZzZXQgICAgICBFQ0MgIEJ5dGVzICBBcmVhICAgICAgICAg
ICAgICAgRGVzY3JpcHRpb24KPiA4MDBIIDgwN0ggICAgTm8gICAgICA4ICBTcGFyZSA0LCBHcm91
cCBFICAgVGhpcyBBcmVhIGlzIG5vdCBjb3ZlcmVkIGJ5IGludGVybmFsIEVDQywKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgODAwSCBpcyByZXNlcnZlZCBmb3Ig
YmFkIGJsb2NrIG1hcmsgICAgICAgIAo+IDgwOEggODJGSCAgIFllcyA0MCBTcGFyZSA1ICwgR3Jv
dXAgRiAgICAgICBVc2VyIE1ldGEgRGF0YSBBcmVhIGNvdmVyZWQgYnkgaW50ZXJuYWwgRUNDLgo+
IDgzMEggODNGSCAgICBObyAxNiBTcGFyZSA2ICwgR3JvdXAgRyAgICAgICBFQ0NfRU49MTogdGhp
cyBhcmVhIGNvbnRhaW5zIEludGVybmFsIEVDQyBEYXRhLCBSZWFkLU9ubHksCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFByb2dyYW1taW5nIHRvIHRoaXMgYXJl
YSB3aWxsIGJlIGlnbm9yZWQKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgRUNDX0VOPTA6IHRoaXMgYXJlYSBpcyB3cml0YWJsZSBmb3IgdXNlcgo+IAo+IEJ1dCB0
aGUgZHJpdmVyIGRlZmluZXMgYnl0ZXMgMS4uNDcgYXMgdXNlciBPT0IgYXJlYToKPiB8c3RhdGlj
IGludCB4dDI2ZzB4YV9vb2JsYXlvdXRfZnJlZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50IHNl
Y3Rpb24sCj4gfAkJCQkgICBzdHJ1Y3QgbXRkX29vYl9yZWdpb24gKnJlZ2lvbikKPiB8ewo+IHwJ
aWYgKHNlY3Rpb24pCj4gfAkJcmV0dXJuIC1FUkFOR0U7Cj4gfAo+IHwJcmVnaW9uLT5vZmZzZXQg
PSAxOwo+IHwJcmVnaW9uLT5sZW5ndGggPSA0NzsKPiB8Cj4gfAlyZXR1cm4gMDsKPiB8fQo+IAo+
IElNTyB0aGlzIHNob3VsZCBiZToKPiB8CXJlZ2lvbi0+b2Zmc2V0ID0gODsKPiB8CXJlZ2lvbi0+
bGVuZ3RoID0gNDA7Cj4gdG8gaGF2ZSB0aGUgd2hvbGUgdXNlciBvb2IgYXJlYSBwcm90ZWN0ZWQg
YnkgRUNDLgo+IAo+IE9idmlvdXNseSB0aGlzIGNhbm5vdCBzaW1wbHkgYmUgY2hhbmdlZCBpbiB0
aGUgZHJpdmVyIGJlY2F1c2UgaXQgd291bGQKPiBicmVhayBhY2Nlc3MgdG8gZmxhc2ggdGhhdCB3
YXMgcHJvZ3JhbW1lZCB3aXRoIHRoZSBjdXJyZW50IHBhcmFtZXRlcnMuCj4gU2luY2UgdGhlIGRh
dGEgc3RydWN0dXJlcyB0aGF0IHByb3ZpZGUgdGhlIG9vYiBsYXlvdXQgYXJlIGNvbXBsZXRlbHkK
PiBzdGF0aWMgYW5kIGNhbm5vdCBiZSBtb2RpZmllZCBhdCBydW50aW1lIChlLmcuIGRlcGVuZGlu
ZyBvbiBzb21lIERUQgo+IHByb3BlcnR5KSB0aGUgb25seSB3YXkgSSBzZWUgdG8gcHJvdmlkZSBh
IGxheW91dCB3aXRoIEVDQyBwcm90ZWN0aW9uCj4gZm9yIHRoZSB3aG9sZSB1c2VyIG1ldGFkYXRh
IHdvdWxkIGJlIGEgS2NvbmZpZyBvcHRpb24gdG8gc2VsZWN0IG9uZSBvcgo+IHRoZSBvdGhlciBs
YXlvdXQgYXQgY29tcGlsZSB0aW1lLgo+IAo+IEFueSBjb21tZW50cyBvciBiZXR0ZXIgaWRlYXM/
CgpUaGVzZSBvZmZzZXRzIGRvIG5vdCByZWZsZWN0IHRoZSBwcm90ZWN0ZWQgYXJlYSBidXQgdGhl
IHVzZXIgYXJlYSwKd2hpY2ggY2FuIGJlIHVzZWQgKGF0IHRoZSB1c2VycyBvd24gcmlza3MpLiBT
b21laG93IHRoZSBvbmx5IHJlYWwgdXNlcgppcyBqZmZzMiB1cHN0cmVhbSwgYW5kIGpmZnMyIHdh
cyBtZWFudCB0byBiZSByZXBsYWNlZCBhIGxvbmcgdGltZSBhZ28KYnkgVUJJIHdoaWNoIGFjdHVh
bGx5IHdvcmthcm91bmQtZWQgdGhpcyBsaW1pdGF0aW9uIGJ5IG5vdCB1c2luZyB0aGUKT09CIGFy
ZWEgYXQgYWxsLiBXZSBkbyBub3QgaGF2ZSBhIHJlYWwgd2F5IHRvIGRpc3Rpbmd1aXNoIHdoYXQg
aXMgRUNDCnByb3RlY3RlZCBvciBub3QgaW4gdGhlIE9PQiBhcmVhLgoKU28gdW5sZXNzIHlvdSB3
YW50IHRvIHNvbHZlIGEgcmVhbCBwcm9ibGVtLCBJIHdvdWxkIGFkdmlzZSB0byBrZWVwIGl0CmFz
IGl0IGlzLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
