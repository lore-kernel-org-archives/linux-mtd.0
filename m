Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718AAC25B4F
	for <linux-mtd@archiver.kernel.org>; Sun, 12 May 2024 17:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uMb+BI3iMlwyT6Noaf1r7k9/Nu2HnFvcvAZOXh2nYLA=; b=xGztLMtMJDnY5Y
	2hvGqRO+ZpbGpIazbF6NdPUs0aO+m2Jw57RDD63+z4DNu4t2N7FsR1hSFjz9G7TRjHo5svGxODQlP
	qi6KvQrF2CyFFhYpUaLAJMm61qXYXmpggoVI9zgEz3fnl9UXefcyid/XBmV4Gdi9dEvwtevJ4+A3j
	vEypzOiD5hrszpx0Iy3Mo0OesI5pTB+udkNV1l746PL2q309iyTMCQBVLQ0jSkseG9KS4Fux6v91F
	rfD4S7Y3zmVMMFxsfs5D1P3UrpRasdfJfs18T9f8kqRf3/FkmQBu+Q82aA8pm44ybt9YZhzA/tORF
	V0B2Lanf6lFnQb8g1N5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6D95-0000000ASDL-0WV1;
	Sun, 12 May 2024 17:37:59 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6D8y-0000000ASBb-10fW;
	Sun, 12 May 2024 17:37:54 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 4DD4F120002;
	Sun, 12 May 2024 20:37:43 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 4DD4F120002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1715535463;
	bh=uwsRFR9afraqpGHPq8DU2TSJXRBWv6wXpdPPQhQUsLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=MJWlGTEOl1552sZrUtJQGf6XyPUgf5YKCyzIZH/ZnvlUOVrcmO9vlSlrOeiKUUOpK
	 3DTB1ZTu5xJrJ5AGiLLm1D/uGN6J+i/LwWEZCab7wU2gTLos9fgSZMu0hiMMkMb3Hm
	 BsCUstwLD5Qmk10Eq4MKdGgfHdZknWmJcJLn/HUyZSCzECeazwPqvbZ65ifdTjFvsR
	 4+zM81xf0Qs1FkJv94UN0k+cFjS7UcmySsuk0hKzp1AZYywW0nGbM7aLB8Vflg9jgt
	 8L/qzVtlLCuxtVULswG4HAXTiDRfmucsTRZ/h4G1YP/z+mbKruUPPhKfE/aBCnlYBK
	 u8eJPbczokiYg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sun, 12 May 2024 20:37:43 +0300 (MSK)
Received: from [172.28.226.125] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 12 May 2024 20:37:42 +0300
Message-ID: <418e29c7-9baf-ee4c-7a24-49c196ac89b2@salutedevices.com>
Date: Sun, 12 May 2024 20:26:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v6 1/3] dt-bindings: mtd: amlogic,meson-nand: support
 fields for boot ROM code
Content-Language: en-US
To: Krasnov Arseniy <oxffffaa@gmail.com>, "Rob Herring (Arm)"
	<robh@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
	<devicetree@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	<linux-amlogic@lists.infradead.org>, <kernel@sberdevices.ru>, Jerome Brunet
	<jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
	<linux-kernel@vger.kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>
References: <20240507230903.3399594-1-avkrasnov@salutedevices.com>
 <20240507230903.3399594-2-avkrasnov@salutedevices.com>
 <171517732606.1572649.16193191353725811830.robh@kernel.org>
 <CAP_G_RUdN+6OcsQZUkqWQMYoH-ZvmPnskT3yONK_YssqUYhm9Q@mail.gmail.com>
From: Arseniy Krasnov <avkrasnov@salutedevices.com>
In-Reply-To: <CAP_G_RUdN+6OcsQZUkqWQMYoH-ZvmPnskT3yONK_YssqUYhm9Q@mail.gmail.com>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185167 [May 11 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 19 0.3.19 07c7fa124d1a1dc9662cdc5aace418c06ae99d2b, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/12 16:13:00 #25178084
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240512_103753_055554_9B09C06F 
X-CRM114-Status: GOOD (  14.80  )
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

U29ycnksIHNlbmRpbmcgZnJvbSBwcm9wZXIgbWFpbCBjbGllbnQgYWdhaW4gKG5vdCBzdXJlIGl0
IHdhcyBkZWxpdmVyZWQgc2VudCBmcm9tIGdtYWlsIGNsaWVudCBvbiAwOC4wNSkgOikKClItYiB3
YXMgcmVtb3ZlZCwgYmVjYXVzZSB0aGlzIHBhdGNoIHdhcyB1cGRhdGVkCgpUaGFua3MsIEFyc2Vu
aXkKCk9uIDA4LjA1LjIwMjQgMjA6MDcsIEtyYXNub3YgQXJzZW5peSB3cm90ZToKPiBIaSEgSSBy
ZW1vdmVkIFlvdXIgUi1iIGJlY2F1c2UgcGF0Y2ggd2FzIGNoYW5nZWQgaW4gdGhpcyB2ZXJzaW9u
LCBhZnRlcgo+IGNvbW1lbnRzIGZyb20gTWlxdWVsIFJheW5hbAo+IAo+IFRoYW5rcwo+IAo+INGB
0YAsIDgg0LzQsNGPIDIwMjQg0LMuLCAxNzowOSBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJu
ZWwub3JnPjoKPiAKPj4KPj4gT24gV2VkLCAwOCBNYXkgMjAyNCAwMjowOTowMSArMDMwMCwgQXJz
ZW5peSBLcmFzbm92IHdyb3RlOgo+Pj4gQm9vdCBST00gY29kZSBvbiBNZXNvbiByZXF1aXJlcyB0
aGF0IHNvbWUgcGFnZXMgb24gTkFORCBtdXN0IGJlIHdyaXR0ZW4KPj4+IGluIHNwZWNpYWwgbW9k
ZTogInNob3J0IiBFQ0MgbW9kZSB3aGVyZSBlYWNoIGJsb2NrIGlzIDM4NCBieXRlcyBhbmQKPj4+
IHNjcmFtYmxpbmcgbW9kZSBpcyBvbi4gU3VjaCBwYWdlcyBhcmUgbG9jYXRlZCBvbiB0aGUgY2hp
cCBpbiB0aGUKPj4+IGZvbGxvd2luZyB3YXkgKGZvciBleGFtcGxlKToKPj4+Cj4+PiBbIHAwIF1b
IHAxIF1bIHAyIF1bIHAzIF1bIHA0IF1bIHA1IF1bIHA2IF1bIHA3IF0gLi4uIFsgcE4gXQo+Pj4g
ICBeICAgICAgICAgICBeICAgICAgICAgICBeICAgICAgICAgICBeCj4+Pgo+Pj4gcFggaXMgcGFn
ZSBudW1iZXIgIlgiLiAiXiIgbWVhbnMgInNwZWNpYWwiIHBhZ2UgdXNlZCBieSBib290IFJPTSAt
IGUuZy4KPj4+IGV2ZXJ5IDJuZCBwYWdlIGluIHRoZSByYW5nZSBvZiBbMCwgN10uIFN0ZXAgKDIg
aW4gZXhhbXBsZSBpcyBzZXQgYnkKPj4+ICdhbWxvZ2ljLGJvb3QtcGFnZS1zdGVwJyBmaWVsZC4g
TGFzdCBwYWdlIGluIHJhbmdlICg3IGluIGV4YW1wbGUpIGlzCj4+PiBzZXQgYnkgJ2FtbG9naWMs
Ym9vdC1wYWdlcycgZmllbGQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQXJzZW5peSBLcmFzbm92
IDxhdmtyYXNub3ZAc2FsdXRlZGV2aWNlcy5jb20+Cj4+PiAtLS0KPj4+ICAuLi4vYmluZGluZ3Mv
bXRkL2FtbG9naWMsbWVzb24tbmFuZC55YW1sICAgICAgIHwgMTggKysrKysrKysrKysrKysrKysr
Cj4+PiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykKPj4+Cj4+Cj4+Cj4+IFBsZWFz
ZSBhZGQgQWNrZWQtYnkvUmV2aWV3ZWQtYnkgdGFncyB3aGVuIHBvc3RpbmcgbmV3IHZlcnNpb25z
LiBIb3dldmVyLAo+PiB0aGVyZSdzIG5vIG5lZWQgdG8gcmVwb3N0IHBhdGNoZXMgKm9ubHkqIHRv
IGFkZCB0aGUgdGFncy4gVGhlIHVwc3RyZWFtCj4+IG1haW50YWluZXIgd2lsbCBkbyB0aGF0IGZv
ciBhY2tzIHJlY2VpdmVkIG9uIHRoZSB2ZXJzaW9uIHRoZXkgYXBwbHkuCj4+Cj4+IElmIGEgdGFn
IHdhcyBub3QgYWRkZWQgb24gcHVycG9zZSwgcGxlYXNlIHN0YXRlIHdoeSBhbmQgd2hhdCBjaGFu
Z2VkLgo+Pgo+PiBNaXNzaW5nIHRhZ3M6Cj4+Cj4+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyAo
QXJtKSA8cm9iaEBrZXJuZWwub3JnPgo+Pgo+Pgo+Pgo+Pgo+IAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
