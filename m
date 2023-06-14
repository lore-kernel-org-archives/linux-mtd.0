Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55C7EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jun 2023 09:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oEMU0rO3ldHOZjIMagdJ4nhoKZZ53CViylSJO18xKhs=; b=PZY+KeK0VxRtga
	+T63nhym+bpYBZfE6GG9i6JrKHSKasmLpvHftdaKQvha3x31EyM8f7rmRr8oQ7/anDrjOrHTAZut5
	8/pQ3/BUkVYsxy0k19iAORg8v/Y91s5/3GDTlKdeIJElTY6hvoC2xmQLzqxx0YJjPPCaGsT4H8xkh
	2x5vgdxjw/sxBVrkpfLmkjjZx2EMcsO1FwiXjKXmksZPyFycW58E6BgXhY/R8IHf9Jq4Huc4fDXfw
	rGLpNe+0JTbBQPawg6saa4pHwiS/aY6S1nNqvK/KhA54wFujTJ6F7R3iIBB75H8Axc5czCDKq1KxR
	6T292LdlSe0dEAUCu4BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9MjI-00B2zY-1H;
	Wed, 14 Jun 2023 09:23:52 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9MjE-00B2yP-27;
	Wed, 14 Jun 2023 09:23:50 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51898b0c1a1so496801a12.3;
        Wed, 14 Jun 2023 02:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734626; x=1689326626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TF9DiKi27qDNuUORKCvbVYXEPKOZZECq30qh1+aywdA=;
        b=rIjL/AuuGxm8g0I/gXXOlG7SQwCLqNVbREffXbWpNuOobfQtt3cC6VMr3Nsr1+gsh2
         dWyZU+KmcTc8fc18xLButVlGxIIlCjRj9CbFYsi6aN4Z2Br73KPn0sZq/qxtQLTllW/5
         J0CbgpnT2DniCfBJiDhqwtewOMOm9/Q/TthFO9+FANEulXZ5ybXSGxOAWTwObR1BubNQ
         rwReNNTdIZBNN1tsO8jU7HWCTS1wFCP7Chwdifrxmfq94NIXTdspF3gVYOAiJDW5Ec3p
         57VBAiHr0iSrjzHNq7emV1P931O4GHXL38qkqgAHBhJKL4IPEB4YDZxvK8BwtRz8u1gM
         YYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734626; x=1689326626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TF9DiKi27qDNuUORKCvbVYXEPKOZZECq30qh1+aywdA=;
        b=P/KcOxQ7KKDRiL6fD+dNRO82ew7cDRQ8Ebb8JNQI8f8QmclqcXHPFAVwUFk3FuEAnl
         XTrB2OOskmdNaAf7axe3oX+rBV6BfoR6Uvw44TvQpzvAcukNYThYnHjbaS02JjbTPfGj
         tQvBoXfZWNxJmFA/P/nijj+gAc0s8dXqnpOJ8CHWHypFEMcO1FW0MrN4RWEMmUO7vJhV
         A8PrRUyUemfvV0VDpu5C0+9gBMk2IeHza5gYvwwWKHYfvp00mOofCq5HBKGLp6a8uJFn
         6UMSiv0UQCSkg9CSMj85auLFWYaI3BPMPldt9AtMawNiTF6WUwUiuu23IlLYbGiyZjMZ
         4cGg==
X-Gm-Message-State: AC+VfDw2vqKZnXD2Gy+Pr4Ii7iAkm0f0HPzT8Eaksy6PxjFa+BcxvXGn
	YVVYN+c38U00yUzpjoO6e9Vjvkm/JGU=
X-Google-Smtp-Source: ACHHUZ73ZIT1tNvI4o/D8vL9DseZfJLD3vBtHI1wqXykCmCHryA8gfFFkG3empnmjNtiii26jO5y+Q==
X-Received: by 2002:a17:907:3681:b0:96b:e93:3aa8 with SMTP id bi1-20020a170907368100b0096b0e933aa8mr17898748ejc.21.1686734626156;
        Wed, 14 Jun 2023 02:23:46 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id e26-20020a170906045a00b0096fc35ca733sm7696954eja.41.2023.06.14.02.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 02:23:45 -0700 (PDT)
Message-ID: <8457ff3d-f033-8d06-42ca-d95f77ec8145@gmail.com>
Date: Wed, 14 Jun 2023 11:23:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/5] mtd: nand: raw: rockchip-nand-controller: fix
 oobfree offset and description
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 yifeng.zhao@rock-chips.com
References: <11e16c3b-6f7b-a6a9-b0ed-b7ac0cd703e3@gmail.com>
 <f2cebf54-a16c-c849-a988-bfd98c502748@gmail.com>
 <20230612192640.63baf3e8@xps-13>
Content-Language: en-US
From: Johan Jonker <jbx6244@gmail.com>
In-Reply-To: <20230612192640.63baf3e8@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_022348_693404_8ACF550F 
X-CRM114-Status: GOOD (  28.88  )
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

CgpPbiA2LzEyLzIzIDE5OjI2LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEpvaGFuLAo+IAo+
IGpieDYyNDRAZ21haWwuY29tIHdyb3RlIG9uIE1vbiwgMTIgSnVuIDIwMjMgMTc6MDM6MTggKzAy
MDA6Cj4gCj4+IFRoZSBNVEQgZnJhbWV3b3JrIHJlc2VydmVzIDEgb3IgMiBieXRlcyBmb3IgdGhl
IGJhZCBibG9jayBtYXJrZXIKPj4gZGVwZW5kaW5nIG9uIHRoZSBidXMgc2l6ZS4gVGhlIHJvY2tj
aGlwLW5hbmQtY29udHJvbGxlciBkcml2ZXIKPj4gY3VycmVudGx5IG9ubHkgc3VwcG9ydHMgYSA4
IGJpdCBidXMsIGJ1dCByZXNlcnZlcyBzdGFuZGFyZCAyIGJ5dGVzCj4+IGZvciB0aGUgQkJNLgo+
IAo+IFdlIGFsd2F5cyByZXNlcnZlIDIgYnl0ZXMsIG5vPwoKTm90IGFsd2F5cyB1c2VkLCBidXQg
Zm9yIGNvbnNpc3RlbmN5L3NpbXBsaWNpdHkgdGhlIGF1dGhvciBhc3N1bWVzL3Jlc2VydmVzIDIg
Ynl0ZXMuIAoKPiAKPj4gVGhlIGZpcnN0IGZyZWUgT09CIGJ5dGUgaXMgdGhlcmVmb3JlIE9PQjIg
YXQgb2Zmc2V0IDIuCj4+IFBhZ2UgYWRkcmVzcyhQQSkgYnl0ZXMgYXJlIG1vdmVkIHRvIHRoZSBs
YXN0IDQgcG9zaXRpb25zIGJlZm9yZQo+PiBFQ0MuIFVwZGF0ZSB0aGUgZGVzY3JpcHRpb24gZm9y
IExpbnV4Lgo+IAo+IFRoZSBkZXNjcmlwdGlvbiBzaG91bGQganVzdCBiZToKPiAKCj4gTW92ZSBQ
YWdlIEFkZHJlc3MgKFBBKSBieXRlcyB0byB0aGUgbGFzdCA0IHBvc2l0aW9ucyBiZWZvcmUgRUND
LgoKU3BhY2UgaXMgYWxyZWFkeSByZXNlcnZlZCwgYnV0IG92ZXJ3cml0dGVuLgoKPiAKPiBBbmQg
dGhlbiB5b3Ugc2hvdWxkIGp1c3RpZnkgd2h5IHRoaXMgaXMgbmVlZGVkLiBBbHNvLCB0aGlzIHdv
dWxkIGJyZWFrCj4gYWxsIGV4aXN0aW5nIGpmZnMyIHVzZXJzLCByaWdodD8KCkhpIE1pcXVlbCwK
CkZyb20geW91ciBjb21tZW50cyBpdCBzZWVtcyB0aGF0IHRoZSBjaGlwLT5vb2JfcG9pIGJ1ZmZl
ciBsYXlvdXQgaXMgc3RpbGwgbm90IGNsZWFyIHRvIHlvdS4KSG9wZSB0aGF0IHRoaXMgdGV4dCBi
ZWxvdyBoZWxwcy4KSWYgZXhpc3RpbmcgamZmczIgdXNlcnMgb2YgZnJlZSBPT0IgYXJlIHdyaXRp
bmcgdGhleSBhcmUgY29ycnVwdGluZyBvdXIgUEEgZGF0YSBpbiBSQVcgbW9kZS4KU28gdGhhdCBt
dXN0IGJlIGZpeGVkLiBQbGVhc2UgYWR2aXNlIGhvdyB3ZSBzcGxpdCBwcmUgYW5kIHBvc3QgY2hh
bmdlIHVzZXJzLgooV2l0aCBhIE1vZHVsZSBwYXJhbWV0ZXIgbGlrZSBza2lwYmJ0IHJlbmFtZWQg
dG8gInVzZXJfbW9kZSIgPSAwIG9mZnNldCA2LCAidXNlcl9tb2RlIiA9IDEgb2Zmc2V0IDIpCkNv
cHlpbmcgUEEgZGF0YSBpbiBib3RoIFJBVyBhbmQgSFcgbW9kZSBoYXMgYWxyZWFkeSByZXNlcnZl
ZCBzcGFjZSBpbiB0aGUgbGF5b3V0LgpMZXQgbWUga25vdyBpZiBJIGNhbiBoZWxwIHRvIGdldCBm
b3J3YXJkIGhlcmUuCgpKb2hhbgoKPT09CgpHaXZlbjoKClJvY2tjaGlwIHJrMzA2NiBNSzgwOCB3
aXRoIE5BTkQ6Cm5hbmQ6IEh5bml4IEgyN1VDRzhUMkFUUi1CQyA2NEcgMy4zViA4LWJpdApuYW5k
OiA4MTkyIE1pQiwgTUxDLCBlcmFzZSBzaXplOiAyMDQ4IEtpQiwgcGFnZSBzaXplOiA4MTkyLCBP
T0Igc2l6ZTogNjQwCgo9PT0KCkNhbHVsYXRpb25zOgoKI2RlZmluZSBORkNfU1lTX0RBVEFfU0la
RQkJKDQpIC8qIDQgYnl0ZXMgc3lzIGRhdGEgaW4gb29iIHByZSAxMDI0IGRhdGEuKi8KClNvIHBl
ciBzdGVwIG9ubHkgNCBieXRlcyBvZiBPT0IgY2FuIGJlIHJlYWQuCgo9PT0KClRoZSBORkMgY2Fu
IHJlYWQvd3JpdGUgaW4gMTAyNCBkYXRhIGJ5dGVzIHBlciBzdGVwLgpUbyByZWFkL3dyaXRlIGEg
ZnVsbCBwYWdlIGl0IG5lZWRzIDggc3RlcHMuCgpjaGlwLT5lY2Muc2l6ZSA9IDEwMjQ7CmNoaXAt
PmVjYy5zdGVwcyA9IG10ZC0+d3JpdGVzaXplIC8gY2hpcC0+ZWNjLnNpemU7CiAgICAgICAgICAg
ICAgICA9IDgxOTIgLyAxMDI0CiAgICAgICAgICAgICAgICA9IDggc3RlcHMKPT09CgpUaGUgdG90
YWwgc2l6ZSBvZiB1c2VmdWxsIE9PQiBiZWZvcmUgRUNDOgoKcmtuYW5kLT5tZXRhZGF0YV9zaXpl
ID0gTkZDX1NZU19EQVRBX1NJWkUgKiBlY2MtPnN0ZXBzOwogICAgICAgICAgICAgICAgICAgICAg
PSA0ICogOAogICAgICAgICAgICAgICAgICAgICAgPSAzMgo9PT0KCldyb25nIGZyZWUgT09CIG9m
ZnNldCBzdGFydHMgYXQgT09CNjoKb29iX3JlZ2lvbi0+b2Zmc2V0ID0gTkZDX1NZU19EQVRBX1NJ
WkUgKyAyOwogICAgICAgICAgICAgICAgICAgPSA0ICsgMgogICAgICAgICAgICAgICAgICAgPSA2
CgpXaXRoIGEgZnJlZSBPT0Igb2Zmc2V0IG9mIDYgYW5kIGEgbGVuZ3RoIG9mIDI2ID09PiA2ICsg
MjYgPSAzMiB3ZSBjb3JydXB0IHRoZSBQQSBhZGRyZXNzIHN0YXJ0aW5nIGF0IG9mZnNldCAyOC4K
Ck5ldyBvZmZzZXQgT09CMjoKb29iX3JlZ2lvbi0+b2Zmc2V0ID0gMjsKClRoZSBmdWxsIHJhbmdl
IG9mIGZyZWUgcnVucyBmcm9tIE9PQjIgdGlsbC9pbmNsdWRpbmcgT09CMjcuCj09PQoKVGhlIGxh
c3QgNCBieXRlcyBvZiBtZXRhZGF0YSBhcmUgcmVzZXJ2ZWQgZm9yIHRoaXMgUGFnZSBBZGRyZXNz
KFBBKSBmb3IgdGhlIGJvb3Ryb20uCkN1cnJlbnRseSBvbmx5IGluIHVzZSBpbiBSQVcgbW9kZS4K
VGhlIGN1cnJlbnQgUEEgY2FsY3VsYXRpb24gbmVlZGVkIHRvIHdyaXRlIGJvb3QgYmxvY2tzIGZv
ciBhbGwgUm9ja2NoaXAgU29DcyBpcyBob3dldmVyIHVzZWxlc3MuClRoZSBwYXR0ZXJuIG9mIHdo
ZXJlIHRoZSBuZXh0IHBhZ2UgaXMgd3JpdHRlbiBkZXBlbmRzIG9uIHRoZSBjaGlwIElELgpBcyB0
aGUgTVREIGZyYW1ld29yayBkb2Vzbid0IHBhc3MgdGhpcyBjaGlwIElEIGluIGl0J3MgZGF0YSBz
dHJ1Y3R1cmVzLAp3ZSBtdXN0IGNhbGN1bGF0ZSB0aGF0IGluIHVzZXJzcGFjZS4KClRoZXJlZm9y
ZSBib3RoIFJBVyBhbmQgSFcgbW9kZSBtdXN0IHBhc3MgdGhlIFBBIGJ5dGVzLgoKPT09CgpUaGUg
TkZDIGhhcmR3YXJlIGlzIGNhcGFibGUgZm9yIGEgMTYgYml0IGJ1cywgYnV0IG5vdCBpbXBsZW1l
bnRlZCB5ZXQuClJlc2VydmVkIGFyZSBzdGFuZGFyZCAyIGJpdHMgZm9yIHRoZSBCQk0gZm9yIGEg
Y29uc2lzdGFudGVuY3kgYnkgdGhlIG9yaWdpbmFsIGF1dGhvci4KCj09PQoKY2hpcC0+b29iX3Bv
aSBidWZmZXIgbGF5b3V0IGZvciA4IHN0ZXBzOgoKQkJNMCAgIEJCTTEgIE9PQjIgIE9PQjMgIHwg
T09CNCAgT09CNSAgT09CNiAgT09CNwoKT09COCAgIE9PQjkgIE9PQjEwIE9PQjExIHwgT09CMTIg
T09CMTMgT09CMTUgT09CMTUKT09CMTYgIE9PQjE3IE9PQjE4IE9PQjE5IHwgT09CMjAgT09CMjEg
T09CMjIgT09CMjMKCk9PQjI0ICBPT0IyNSBPT0IyNiBPT0IyNyB8IFBBMCAgIFBBMSAgIFBBMiAg
IFBBMwoKRUNDMCAgIEVDQzEgIEVDQzIgIEVDQzMgIHwgLi4uICAgLi4uICAgLi4uICAgLi4uCgo9
PT0KCnJrX25mY19vb2JsYXlvdXRfZnJlZToKb29iX3JlZ2lvbi0+bGVuZ3RoID0gcmtuYW5kLT5t
ZXRhZGF0YV9zaXplIC0gTkZDX1NZU19EQVRBX1NJWkUgLSAyOwogICAgICAgICAgICAgICAgICAg
PSAzMiAtIDQgLSAyCiAgICAgICAgICAgICAgICAgICA9IDI2Cgpvb2JfcmVnaW9uLT5vZmZzZXQg
PSAyOwoKRnJlZSBPT0Igc2hvdWxkIHN0YXJ0IGF0IE9PQjIgdG8gbm90IG92ZXJ3cml0ZSBQQSBk
YXRhLgoKPT09Cgpya19uZmNfb29ibGF5b3V0X2VjYzoKCW9vYl9yZWdpb24tPmxlbmd0aCA9IG10
ZC0+b29ic2l6ZSAtIHJrbmFuZC0+bWV0YWRhdGFfc2l6ZTsKCSAgICAgICAgICAgICAgICAgICA9
IDY0MCAtIDMyCgkgICAgICAgICAgICAgICAgICAgPSA2MDgKCW9vYl9yZWdpb24tPm9mZnNldCA9
IHJrbmFuZC0+bWV0YWRhdGFfc2l6ZTsKCSAgICAgICAgICAgICAgICAgICA9IDMyCgpFQ0MgZGF0
YSBzdGFydHMgYXQgb2Zmc2V0IDMyLgoKPT09CgoKPiAKPj4KPj4gU2lnbmVkLW9mZi1ieTogSm9o
YW4gSm9ua2VyIDxqYng2MjQ0QGdtYWlsLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9yb2NrY2hpcC1uYW5kLWNvbnRyb2xsZXIuYyB8IDExICsrKystLS0tLS0tCj4+ICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcm9ja2NoaXAtbmFuZC1jb250cm9sbGVyLmMgYi9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9yb2NrY2hpcC1uYW5kLWNvbnRyb2xsZXIuYwo+PiBpbmRleCAz
MWQ4YzdhODcuLmZjZGE0Yzc2MCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
cm9ja2NoaXAtbmFuZC1jb250cm9sbGVyLmMKPj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
cm9ja2NoaXAtbmFuZC1jb250cm9sbGVyLmMKPj4gQEAgLTU2Niw5ICs1NjYsMTAgQEAgc3RhdGlj
IGludCBya19uZmNfd3JpdGVfcGFnZV9yYXcoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgY29uc3Qg
dTggKmJ1ZiwKPj4gIAkJICogICAgQkJNICBPT0IxIE9PQjIgT09CMyB8Li4uLi4ufCAgUEEwICBQ
QTEgIFBBMiAgUEEzCj4+ICAJCSAqCj4+ICAJCSAqIFRoZSBya19uZmNfb29ibGF5b3V0X2ZyZWUo
KSBmdW5jdGlvbiBhbHJlYWR5IGhhcyByZXNlcnZlZAo+PiAtCQkgKiB0aGVzZSA0IGJ5dGVzIHdp
dGg6Cj4+ICsJCSAqIHRoZXNlIDQgYnl0ZXMgdG9nZXRoZXIgd2l0aCAyIGJ5dGVzIGZvciBCQk0K
Pj4gKwkJICogYnkgcmVkdWNpbmcgaXQncyBsZW5ndGg6Cj4+ICAJCSAqCj4+IC0JCSAqIG9vYl9y
ZWdpb24tPm9mZnNldCA9IE5GQ19TWVNfREFUQV9TSVpFICsgMjsKPj4gKwkJICogb29iX3JlZ2lv
bi0+bGVuZ3RoID0gcmtuYW5kLT5tZXRhZGF0YV9zaXplIC0gTkZDX1NZU19EQVRBX1NJWkUgLSAy
Owo+PiAgCQkgKi8KPj4gIAkJaWYgKCFpKQo+PiAgCQkJbWVtY3B5KHJrX25mY19vb2JfcHRyKGNo
aXAsIGkpLAo+PiBAQCAtOTQ1LDEyICs5NDYsOCBAQCBzdGF0aWMgaW50IHJrX25mY19vb2JsYXlv
dXRfZnJlZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50IHNlY3Rpb24sCj4+ICAJaWYgKHNlY3Rp
b24pCj4+ICAJCXJldHVybiAtRVJBTkdFOwo+Pgo+PiAtCS8qCj4+IC0JICogVGhlIGJlZ2lubmlu
ZyBvZiB0aGUgT09CIGFyZWEgc3RvcmVzIHRoZSByZXNlcnZlZCBkYXRhIGZvciB0aGUgTkZDLAo+
PiAtCSAqIHRoZSBzaXplIG9mIHRoZSByZXNlcnZlZCBkYXRhIGlzIE5GQ19TWVNfREFUQV9TSVpF
IGJ5dGVzLgo+PiAtCSAqLwo+PiAgCW9vYl9yZWdpb24tPmxlbmd0aCA9IHJrbmFuZC0+bWV0YWRh
dGFfc2l6ZSAtIE5GQ19TWVNfREFUQV9TSVpFIC0gMjsKPj4gLQlvb2JfcmVnaW9uLT5vZmZzZXQg
PSBORkNfU1lTX0RBVEFfU0laRSArIDI7Cj4+ICsJb29iX3JlZ2lvbi0+b2Zmc2V0ID0gMjsKPj4K
Pj4gIAlyZXR1cm4gMDsKPj4gIH0KPj4gLS0KPj4gMi4zMC4yCj4+Cj4gCj4gCj4gVGhhbmtzLAo+
IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
