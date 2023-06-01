Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25D6C7EE29
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jun 2023 22:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pxqSbmSew5MqtI0/h4MFOAT8fBMjHz7QdfZ8nkYsyT0=; b=XV14nwbbFlH/Tb
	03erayqqBTJhG1LDd6xMSEIrL14pnGvvrIRYgIGe65kBEhSK1OeQVa5tRivRZxhdCPwlfzbjsP1/w
	lReRJJC1fbep244OlaHFG/U4ztQO37kJXztX1PmWjgoV77vbckse9AY3fIYWYEth1Uw0XdXOYYgAk
	A2z9CQeLQRTqz7hm+DrQzf+oBEdE/69c9P8Fxy10TEFsF9FIBV+fcE6VcRmaMioxCkkmXuARXnbeN
	WKhcilLcVs0UML2LZ29rz8Xadd8k7YRIVxgy7I/gkyx3tK/Z8hbp8KPiwbeLWvXV/aoJ/ylY32SMN
	JpqMB/mje6JMxkOThcAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4r6I-005Ake-1q;
	Thu, 01 Jun 2023 22:48:58 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4r6E-005AjH-0M;
	Thu, 01 Jun 2023 22:48:56 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 31F6C5FD02;
	Fri,  2 Jun 2023 01:48:45 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1685659725;
	bh=VFidQvl3y3zrfaQQyb5A6bOTwv1n+pl8gYzCSMq0tZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=FS5h0aamVGhHwetjkii0tUR+hbLjg73z7zFfXQlLo/OpJBiu7G/MtEI0/iaSq4JB2
	 SQQf9eKnTP+OytF8lMuTnAcLoXhIFl9W9Q+ys+agut3gcLDBRNMHK/7nuwYqiIq8vH
	 A9V8JTsry+C99zNvqM/at4z5o0FKP0VBvS3AD5Gs+1txf6FXtx5bqNco5+KyqB5i8i
	 Mr5N6hLknC/h8ATutHtWkYBNOVulF6egVpICdP8SWOLtjAwKfe4lxLbs2RZpuocZPo
	 zFR/pUXqM2cGSXn+Y2HVZH2y2ocNSe1PJsbiMSTB6FxgpHpktoaOjz1EfVqNrQT/Yw
	 /ooU8aGmJomFQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri,  2 Jun 2023 01:48:43 +0300 (MSK)
Message-ID: <1ede0f53-8513-e346-b5a8-fc8a804cfa8d@sberdevices.ru>
Date: Fri, 2 Jun 2023 01:44:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v5 1/6] mtd: rawnand: meson: fix ready/busy command
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
	<kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20230601061850.3907800-1-AVKrasnov@sberdevices.ru>
 <20230601061850.3907800-2-AVKrasnov@sberdevices.ru>
 <20230601095142.3a611b5a@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230601095142.3a611b5a@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/01 16:24:00 #21397712
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_154854_662798_9015E33C 
X-CRM114-Status: GOOD (  13.58  )
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

SGVsbG8gTWlxdWVsIQoKTWF5IGJlIEkgY2FuIGV4Y2x1ZGUgdGhpcyBwYXRjaCBmcm9tIHRoaXMg
cGF0Y2hzZXQgYW5kIHNlbmQgaXQgYXMgYSBzaW5nbGUgcGF0Y2gKYXMgaXQgaXMgZml4IGFuZCBu
b3QgcmVsYXRlZCB3aXRoIG90aGVyIHBhdGNoZXM/CgpUaGFua3MsIEFyc2VuaXkKCk9uIDAxLjA2
LjIwMjMgMTA6NTEsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkgQXJzZW5peSwKPiAKPiBBVkty
YXNub3ZAc2JlcmRldmljZXMucnUgd3JvdGUgb24gVGh1LCAxIEp1biAyMDIzIDA5OjE4OjQ0ICsw
MzAwOgo+IAo+PiBUaGlzIGZpeGVzIHJlYWR5L2J1c3kgY29tbWFuZCB2YWx1ZS4KPiAKPiBuaXQ6
ICJGaXggdGhlIHJlYWR5L2J1c3kgY29tbWFuZCB2YWx1ZS4iCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IEFyc2VuaXkgS3Jhc25vdiA8QVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1Pgo+PiAtLS0KPj4gIGRy
aXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYyB8IDIgKy0KPj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25f
bmFuZC5jCj4+IGluZGV4IDA3NGUxNDIyNWMwNi4uOWRkNGE2NzY0OTdiIDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4gKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvbWVzb25fbmFuZC5jCj4+IEBAIC0zNyw3ICszNyw3IEBACj4+ICAjZGVmaW5lIE5G
Q19DTURfU0NSQU1CTEVSX0VOQUJMRQlCSVQoMTkpCj4+ICAjZGVmaW5lIE5GQ19DTURfU0NSQU1C
TEVSX0RJU0FCTEUJMAo+PiAgI2RlZmluZSBORkNfQ01EX1NIT1JUTU9ERV9ESVNBQkxFCTAKPj4g
LSNkZWZpbmUgTkZDX0NNRF9SQl9JTlQJCUJJVCgxNCkKPj4gKyNkZWZpbmUgTkZDX0NNRF9SQl9J
TlQJCSgoMHhiIDw8IDEwKSB8IEJJVCgxOCkgfCBCSVQoMTYpKQo+PiAgCj4+ICAjZGVmaW5lIE5G
Q19DTURfR0VUX1NJWkUoeCkJKCgoeCkgPj4gMjIpICYgR0VOTUFTSyg0LCAwKSkKPj4gIAo+IAo+
IAo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
