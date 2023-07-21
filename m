Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE90C0015E
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jul 2023 07:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UZdrtYI+cuyUVeYbadTU1zSzyAY90K1bPO+U3bWT3G8=; b=aKckaxgQl52yXN
	yRa8GdqUkj8xmTpNmUmmUzSW/IbhxKEYvbl0YbDmGfWRO50eQER54ZJrtGceQbgjTONgpbvUqZK3V
	XtmEFsrLle13X2fuVnUSCWiT39w2+pKaNgwRLT1t+O2mTUn0Bm/W+HxXCIKogNBRoN7AO2LFeJx2c
	wzR2H7os54Kshvd63Fwegg1knkbTnD8wPwymsLlCTPuoJnK2VwJwqApG4sIkfVtNH48QeQhjz6kt5
	wB6GTkOthp7Y9ixKUOC7BVN1bYZXREpQzCIG7/JzQ+W+KW9jNenBZC/2taZ6JxGIvKGPkwaZfFYBl
	F8ZqUjNjB1rN1MaUS/vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkj7-00DD4G-0A;
	Fri, 21 Jul 2023 07:39:01 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkj4-00DD2b-33
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jul 2023 07:39:00 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-98e39784a85so586093366b.1
        for <linux-mtd@lists.infradead.org>; Fri, 21 Jul 2023 00:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689925135; x=1690529935;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h6gaDGm8xhTQW0uR+rpIssaq/WM7/VtmKejL9L9a2xQ=;
        b=q7/wz12nRwrNHUPdeY3QDcwXq11aGczdhpgPkQvgtGBVGRWlHWbqejbpxTOYeTxaOc
         iH0xWYRiVSea5BVd/zn6Lm7/XPyVdEaYqDS3QsXJAv1pRwgjA5izjh3FkbIP8VkHZSIh
         cvl0vBbbkKYqeAhz6rFQpOwwmpJLD/t+WtbVCaorA0Bp62U3nVDy6KpBF9uW7TERhC3y
         BAH7KckBNIzpDJrYaVPVpc4qxBvaQ6CZLqjk5/5JN5geu0Xb2s65Q/vFKvet2HMugrUe
         pTAPB0D/w1EuDwlQRWMghp6xq+OwfCbRo0C2cbV1TuWvKoXCY8jeu5xVvqmmklje5AOm
         xbrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689925135; x=1690529935;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h6gaDGm8xhTQW0uR+rpIssaq/WM7/VtmKejL9L9a2xQ=;
        b=kSUTO0Dxtlt22v2R8AF8NE3TFPYKOTauxp3d6PNfdjrKMolY3EbP1+xciMggVgu4Af
         +ZJhiwGu3yrZxpCuQygUKckzGa03Ji4t0IY/tvXgbik8Olv5lKANRyWWUIbg/XTGWlG8
         kAVQeeRpKBqTG7YCdLYw5hVHlCMeRNf0pyNfDorqXCjjYY2eXp5mSOvHfS3ueT5JML+Z
         FHIEcuUbHWOiNRq7OxrKteQayfz1ySGW8uHTpod1eEZCAG/orjnU42ZjoLBfVdqCa1Tc
         Upbx0n6My9UutGBLxrpeSQ0XIsPuGT7l5OZtF5SWKQkxY40hhykijcyA+ew9DAyA5LN9
         qs0g==
X-Gm-Message-State: ABy/qLbnCuJMIyKKZd9hzGQPjAP/kT1wkTIalie3KN1Emp06IR7qXhxT
	onswcAc/YvE12K/eGZuZmY+f+A==
X-Google-Smtp-Source: APBJJlFtQLsBZCvEMhQHeyK6EMv2ZMDsXCkliBTUWmChT7TcmpdOPPQttmpErTW3znz3sro0pEp5zQ==
X-Received: by 2002:a17:907:1c26:b0:98d:4b97:acc8 with SMTP id nc38-20020a1709071c2600b0098d4b97acc8mr7572920ejc.25.1689925135164;
        Fri, 21 Jul 2023 00:38:55 -0700 (PDT)
Received: from [192.168.0.173] ([79.115.63.16])
        by smtp.gmail.com with ESMTPSA id t10-20020a1709064f0a00b009929d998abcsm1767908eju.209.2023.07.21.00.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 00:38:54 -0700 (PDT)
Message-ID: <130b3742-fe0b-2030-654f-0cf8863c1479@linaro.org>
Date: Fri, 21 Jul 2023 10:38:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V1 1/1] linux: drivers: mtd: spi-nor: gigadevice.c
Content-Language: en-US
To: Vlim <vlim@gigadevice.com>, Michael Walle <michael@walle.cc>
Cc: "pratyush@kernel.org" <pratyush@kernel.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "akumarma@amd.com" <akumarma@amd.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "vikhyat.goyal@amd.com" <vikhyat.goyal@amd.com>
References: <20230720042834.12296-1-vlim@gigadevice.com>
 <62663146a51c2beac4eff48abe1f61f8@walle.cc>
 <TY0PR06MB56580D3FEE55389F41E33398BB3EA@TY0PR06MB5658.apcprd06.prod.outlook.com>
 <55d60aec-3b20-d9d3-aeb2-77abbcc47d16@linaro.org>
 <TY0PR06MB56581B9A28DCD7A7270CFC0ABB3FA@TY0PR06MB5658.apcprd06.prod.outlook.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <TY0PR06MB56581B9A28DCD7A7270CFC0ABB3FA@TY0PR06MB5658.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_003858_985318_43E50CA6 
X-CRM114-Status: GOOD (  15.36  )
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

CgpPbiAyMS4wNy4yMDIzIDA5OjUxLCBWbGltIHdyb3RlOgo+IFRoYW5rcywgVHVkb3IsCj4gCgp5
b3UncmUgd2VsY29tZQoKPiBJcyBQQVJTRV9TRkRQIHRoZSBjb21tYW5kIHRvIHJlYWQgdGhlIFNG
RFAgcGFyYW1ldGVycz8KCml0J3MgYSBmbGFnLCBub3QgYSBjb21tYW5kLCB0aGF0IHdoZW4gc2V0
IGF0IHByb2JlIHRpbWUgdGhlIFNGRFAgd2lsbCBiZQpyZWFkLgoKPiBJdCBsb29rcyB0byBtZSB0
aGF0IHRoZSBleGFtcGxlcyBiZWxvdyBhcmUgYm90aCB1c2luZyBTRkRQLiBCdXQgSSBkbyBub3QK
PiBzZWUgdGhlIGZsYWcgdGhhdCBzYXlpbmcgU0ZEUCBpcyB1c2VkLgoKbm90IHF1aXRlCgo+IAo+
IHsgImdkMjVxMTI4IiwgSU5GTygweGM4NDAxOCwgMCwgNjQgKiAxMDI0LCAyNTYpCj4g4oCC4oCC
4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCRkxBR1MoU1BJX05PUl9IQVNfTE9DSyB8IFNQ
SV9OT1JfSEFTX1RCKQoKVGhlIGxvY2tpbmcgc3VwcG9ydCBpcyBub3QgcGFydCBvZiB0aGUgSkVE
RUMgU0ZEUCBzdGFuZGFyZCwgYnV0IHZlbmRvcnMKY2FuIGRlZmluZSB0aGVpciBvd24gU0ZEUCB0
YWJsZXMgd2hlcmUgdGhleSBkZXNjcmliZSB0aGUgbG9ja2luZwpzdXBwb3J0LiBTbyBmb3Igbm93
LCBpZiB5b3Ugd2FudCB0byBlbmFibGUgbG9ja2luZyB5b3UgaGF2ZSB0byBzcGVjaWZ5CnRoZSBs
b2NraW5nIGZsYWdzLCB3aGF0ZXZlciB0aGV5IGFyZS4gVGhlcmUgYXJlIGRpZmZlcmVudCBmbGF2
b3JzIG9mCmJsb2NrIHByb3RlY3Rpb24gbG9ja2luZywgd2l0aCAzIG9yIDQgYmxvY2sgcHJvdGVj
dGlvbiBiaXRzLCB0aGVpcgpvcmRlciwgZXRjLiBZb3UnbGwgaGF2ZSB0byBjaGVjayB0aGUgZGF0
YXNoZWV0LgoKPiDigILigILigILigILigILigILigILigILigILigILigILigIJOT19TRkRQX0ZM
QUdTKFNFQ1RfNEsgfCBTUElfTk9SX0RVQUxfUkVBRCB8Cj4g4oCC4oCC4oCC4oCC4oCC4oCC4oCC
4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCIMKgIMKgIMKgU1BJX05PUl9RVUFEX1JF
QUQpIH0sCgpJZiB0aGUgZmxhc2ggc3VwcG9ydHMgU0ZEUCB0aGVuIHRoZSBmbGFncyBmcm9tIGFi
b3ZlIHNob3VsZCBiZSByZXBsYWNlZAp3aXRoIFBBUlNFX1NGRFAuCgpXZSBoYXZlIHNvbWUgcmVx
dWlyZW1lbnRzIHdoZW4gb25lIHVwZGF0ZXMgb3IgYWRkcyBuZXcgZmxhc2ggZW50cmllcy4KVGhl
eSBoYXZlIHRvIGR1bXAgdGhlIHN5c2ZzIGRhdGEsIGluY2x1ZGluZyB0aGUgU0ZEUCB0YWJsZXMs
IGFuZCBkbyBzb21lCnNhbml0eSBjaGVjayB3aXRoIG10ZF91dGlscy4gQ2hlY2sgdGhlIGZvbGxv
d2luZyBjb3ZlciBsZXR0ZXIgdG8gZmluZApvdXQgaG93IHRvIGRvIGl0OgpodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1tdGQvY292ZXIuMTY4NjU1NzEzOS5naXQuVGFrYWhpcm8uS3V3YW5v
QGluZmluZW9uLmNvbS8KCj4g4oCC4oCC4oCC4oCC4oCC4oCCeyAiZ2QyNXEyNTYiLCBJTkZPKDB4
Yzg0MDE5LCAwLCA2NCAqIDEwMjQsIDUxMikKPiDigILigILigILigILigILigILigILigILigILi
gILigILigIJQQVJTRV9TRkRQCj4g4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC
RkxBR1MoU1BJX05PUl9IQVNfTE9DSyB8IFNQSV9OT1JfSEFTX1RCIHwgU1BJX05PUl9UQl9TUl9C
SVQ2KQo+IOKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAgkZJWFVQX0ZMQUdTKFNQ
SV9OT1JfNEJfT1BDT0RFUykKPiDigILigILigILigILigILigILigILigILigILigILigILigIIu
Zml4dXBzID0gJmdkMjVxMjU2X2ZpeHVwcyB9LAoKdGhlc2UgYXJlIGFsbCBkaWZmZXJlbnQgdHlw
ZXMgb2YgZmxhZ3MuIFVzZSBnaXQgYmxhbWUgdG8gZmluZCB0aGUgcmVhc29uCndoeSBzb21lIHdl
cmUgc2V0LgoKQ2hlZXJzLAp0YQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
