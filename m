Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF862C76196
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Mar 2023 08:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5t82/MTg0Nr1o4QXufPIFmNOy6pV+/11bn0ZaS0co/0=; b=DOS1O1Wm8OgL0V
	1XZNA/51H9Zfwp5jzaDMZ2/+12PW+O9F7F62z/8rujEbj4vMzSbynQ/FG/0ZBOqS67B4loUZ5GYxF
	1zU/h9qWlnKk70P+5i44VxW4tD7NyfT8wbGXaeanPVbipqLMrJ6+CTYn4XjOIDhUNNM0RV7ISMyML
	OWrqLnIL47V+z/Lz3dv4k/6EQ06gx4MwX2T1CuTU6No7/gUapUOq7W+Ls01XS9+G9Ic9U3+6cu9mV
	NPrJtm7R4Y7keDFtAmoPaqPvo7PJYWVPoxpnVFaAWiWqO+01xoojH2QP8PhSYZ4NC2VCWh4XyxXWT
	hqHs1EAWaddMeMmWPeqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfFss-001CDf-2h;
	Thu, 23 Mar 2023 08:01:18 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfFso-001CC4-0D;
	Thu, 23 Mar 2023 08:01:16 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 5F4285FD45;
	Thu, 23 Mar 2023 11:01:09 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1679558469;
	bh=O7oYKc3LTw4AoaR0hMXQ+c+BRl+QFQbOY09tziUSnEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=c7xOLGbe7skXPzXF2yS/VEyLxNWBFVB7DBrvBlW/G6yZyEa/uAm8o/w1BTPJiEOEL
	 zxN2FAOEBTwz09bwFsZ3jlNS4TCQBf8phoB7T8hyCsluBT4PfEALHWOvJsL4Xq0PXA
	 xDkDpnfisQGv1mKmkU/gfIEgFg+z+VtzmEst051CZILhU+qRgyjI4pucTzN71U2PLJ
	 EWYY3JLzx8yU1QNa3TlqMm5g4EdNwrmICq1GMYnjXYi0eYbXn9C3CgnG0d7sD3p/6I
	 TQtuR6/7pFKyGyfcrzBRn+nk8XgrYF5CarIyMpDXYbztexd2KwmRx+OEmHhlLjp3br
	 yX60YAxpgfCJw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu, 23 Mar 2023 11:01:07 +0300 (MSK)
Message-ID: <fe2ed378-cdac-dbb3-acd2-ff542bd7e887@sberdevices.ru>
Date: Thu, 23 Mar 2023 10:57:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1] mtd: rawnand: meson: fix bitmask for length in command
 word
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@sberdevices.ru>, <oxffffaa@gmail.com>
References: <d4338bd5-125c-a9e7-cb46-6f5e1da05cfa@sberdevices.ru>
 <CAFBinCB3yuyNJD=7UJ7jzf45Masms_PD4sm42YNjO8M4cr+4wg@mail.gmail.com>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <CAFBinCB3yuyNJD=7UJ7jzf45Masms_PD4sm42YNjO8M4cr+4wg@mail.gmail.com>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/23 05:59:00 #20997558
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_010114_815005_6CD4F8F9 
X-CRM114-Status: GOOD (  17.89  )
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

CgpPbiAyMi4wMy4yMDIzIDIzOjEwLCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdyb3RlOgo+IEhlbGxv
IEFyc2VuaXksCj4gCj4gdGhhbmsgeW91IGZvciBzdWJtaXR0aW5nIHRoaXMgZml4IQpUaGFua3Mh
Cj4gCj4gT24gV2VkLCBNYXIgMjIsIDIwMjMgYXQgNzo0NeKAr1BNIEFyc2VuaXkgS3Jhc25vdgo+
IDxhdmtyYXNub3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgo+Pgo+PiBWYWxpZCBtYXNrIGlzIDB4
M0ZGRiwgd2l0aG91dCB0aGlzIHBhdGNoIHRoZSBmb2xsb3dpbmcgcHJvYmxlbXMgd2VyZQo+PiBm
b3VuZDoKPj4KPj4gMSkgWyAgICAwLjkzODkxNF0gQ291bGQgbm90IGZpbmQgYSB2YWxpZCBPTkZJ
IHBhcmFtZXRlciBwYWdlLCB0cnlpbmcKPj4gICAgICAgICAgICAgICAgICAgYml0LXdpc2UgbWFq
b3JpdHkgdG8gcmVjb3ZlciBpdAo+PiAgICBbICAgIDAuOTQ3Mzg0XSBPTkZJIHBhcmFtZXRlciBy
ZWNvdmVyeSBmYWlsZWQsIGFib3J0aW5nCj4+Cj4+IDIpIFJlYWQgd2l0aCBkaXNhYmxlZCBFQ0Mg
bW9kZSB3YXMgYnJva2VuLgo+Pgo+PiBGaXhlczogOGZhZTg1NmM1MzUwICgibXRkOiByYXduYW5k
OiBtZXNvbjogYWRkIHN1cHBvcnQgZm9yIEFtbG9naWMgTkFORCBmbGFzaCBjb250cm9sbGVyIikK
Pj4gU2lnbmVkLW9mZi1ieTogQXJzZW5peSBLcmFzbm92IDxBVktyYXNub3ZAc2JlcmRldmljZXMu
cnU+Cj4gVGhpcyBtYXRjaGVzIHdoYXQgSSBjYW4gc2VlIGluIHRoZSBvbGQgdmVuZG9yIGRyaXZl
ciwgc286Ck1vcmVvdmVyIGl0IHdhcyBjbGVhciB0aGF0IG1hc2sgb2YgMHgzZiBpcyB0b28gc21h
bGwgZm9yIGxlbmd0aCBvZiBkYXRhIGluCmJ5dGVzLCBmb3IgZXhhbXBsZSBmb3IgMjA0OCArIE9P
QiBzaXplLgo+IEFja2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3Rp
bmdsQGdvb2dsZW1haWwuY29tPgo+IAo+IFsuLi5dCj4+IC0gICAgICAgICAgICAgICBjbWQgPSAo
bGVuICYgR0VOTUFTSyg1LCAwKSkgfCBzY3JhbWJsZXIgfCBETUFfRElSKGRpcik7Cj4+ICsgICAg
ICAgICAgICAgICBjbWQgPSAobGVuICYgR0VOTUFTSygxMywgMCkpIHwgc2NyYW1ibGVyIHwgRE1B
X0RJUihkaXIpOwo+IE15IHVuZGVyc3RhbmRpbmcgb2YgdGhlIHZlbmRvciBkcml2ZXIgaXMgdGhh
dCB0aGlzICJsZW4iIGlzIG9ubHkgdXNlZAo+IGZvciAicmF3IiBhY2Nlc3MgKG15IG93biB3b3Jk
czogYW55IGFjY2VzcyB0aGF0IGRvZXNuJ3QgdXNlIHRoZSBIVyBFQ0MKPiBlbmdpbmUpLgpFeGFj
dGx5LCAnbGVuJyBpcyBvbmx5IGZvciByYXcgYWNjZXNzLgo+IEFzIGEgZnV0dXJlIGltcHJvdmVt
ZW50IChubyBuZWVkIHRvIHVwZGF0ZSByZS1zZW5kIHRoaXMgcGF0Y2gpIGl0Cj4gd291bGQgYmUg
Z3JlYXQgdG8gaGF2ZSBhICNkZWZpbmUgd2l0aCBhIG1lYW5pbmdmdWwgbmFtZSBmb3IKPiAiR0VO
TUFTSygxMywgMCkiIChtYXliZSBzb21ldGhpbmcgbGlrZSBORkNfQ01EX1JBV19MRU5HVEgpIGFz
IGl0J3MKPiB1c2VkIGluIG11bHRpcGxlIHBsYWNlcyBub3cKQWNrCgpUaGFua3MsIEFyc2VuaXkK
PiAKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
