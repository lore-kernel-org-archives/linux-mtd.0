Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF16AC6FD18
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 16:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BoVIGg2NCaSzt77LgUxBiYmV9NOnphGrvh01DHORPDU=; b=qLeIX/mosJ3MD+
	nGoheyunu5h4LmP92HQM+g7W3AqogFqq50tWJ3bRuni0aMGYopEAWic1E3mgOJoxxpFryOQO4oW3z
	oxOPNISx0EdHSw4U5ke0uLpIkbu6IU4c2iL6aw1yj48zThQxbFHXUkS0fiG0mZT03eTUmVraqMfEG
	CAnD+nQAa1vFhxXy/HxUUNy0EIMpWasTZgcGRulXXbkFW2mwbcExWjC2Y79dGeTtTeKUePAbV4shH
	iZxnfs00MbOAodUyJhrmIoULw42vx+qlBlUKiA3pBeduB87cmaKdHcZrqPRJKMKHTGsr9N4DKeaMm
	+7tbXpj95ncQNm7vbu/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phBjn-00F3s4-2N;
	Tue, 28 Mar 2023 15:59:55 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phBjh-00F3pW-24;
	Tue, 28 Mar 2023 15:59:53 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id B5DBB5FD14;
	Tue, 28 Mar 2023 18:59:41 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1680019181;
	bh=+9QzWAPZdJiLUFjtZdhRNkgT3cxt2ae3HLNCpRJ9kPU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type;
	b=PwgMmjo/Kxzg/W6eWz0KRU0W4mpnwLI0b2PGpnnEHBendI5jN+SPPADZbqqLV6euH
	 ODQIzsGZOr4FywYx22t44lrXwORZSrVAnhznj8BlSlHtvlvU3l0UTZpU/jFgJMtymK
	 /aV2tVjrcNWOdy7PmlSZ0OXpohPZ0cLuNnWbpl2MX+YdNLhH+rWfpVB+MLnf/28Rwp
	 9Bkr8/nD29zsgiPZgEDYFr8dUvoXOjWiaY2T1bUnJHO7G3oh55KWzgA3kGk4QwZN6U
	 VE3a6Rq98oPpBFqZ89orGrucuBj8ixwkMLXkruYhGlFVCnqvpd47E1W9kKnLOWLcST
	 xpUmrL6S9Xi5w==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue, 28 Mar 2023 18:59:40 +0300 (MSK)
Message-ID: <81632eee-533e-5e44-1520-5321a06c6797@sberdevices.ru>
Date: Tue, 28 Mar 2023 18:56:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1] mtd: rawnand: meson: fix bitmask for length in command
 word
Content-Language: en-US
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
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
 <fe2ed378-cdac-dbb3-acd2-ff542bd7e887@sberdevices.ru>
In-Reply-To: <fe2ed378-cdac-dbb3-acd2-ff542bd7e887@sberdevices.ru>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/28 12:08:00 #21021610
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_085950_392299_FBA91E5F 
X-CRM114-Status: GOOD (  16.11  )
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

SGVsbG8hCgpATWlxdWVsIFJheW5hbCwgd2hhdCBpcyB0aGUgc3RhdHVzIG9mIHRoaXMgcGF0Y2g/
CgpUaGFua3MsIEFyc2VuaXkKCk9uIDIzLjAzLjIwMjMgMTA6NTcsIEFyc2VuaXkgS3Jhc25vdiB3
cm90ZToKPiAKPiAKPiBPbiAyMi4wMy4yMDIzIDIzOjEwLCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdy
b3RlOgo+PiBIZWxsbyBBcnNlbml5LAo+Pgo+PiB0aGFuayB5b3UgZm9yIHN1Ym1pdHRpbmcgdGhp
cyBmaXghCj4gVGhhbmtzIQo+Pgo+PiBPbiBXZWQsIE1hciAyMiwgMjAyMyBhdCA3OjQ14oCvUE0g
QXJzZW5peSBLcmFzbm92Cj4+IDxhdmtyYXNub3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgo+Pj4K
Pj4+IFZhbGlkIG1hc2sgaXMgMHgzRkZGLCB3aXRob3V0IHRoaXMgcGF0Y2ggdGhlIGZvbGxvd2lu
ZyBwcm9ibGVtcyB3ZXJlCj4+PiBmb3VuZDoKPj4+Cj4+PiAxKSBbICAgIDAuOTM4OTE0XSBDb3Vs
ZCBub3QgZmluZCBhIHZhbGlkIE9ORkkgcGFyYW1ldGVyIHBhZ2UsIHRyeWluZwo+Pj4gICAgICAg
ICAgICAgICAgICAgYml0LXdpc2UgbWFqb3JpdHkgdG8gcmVjb3ZlciBpdAo+Pj4gICAgWyAgICAw
Ljk0NzM4NF0gT05GSSBwYXJhbWV0ZXIgcmVjb3ZlcnkgZmFpbGVkLCBhYm9ydGluZwo+Pj4KPj4+
IDIpIFJlYWQgd2l0aCBkaXNhYmxlZCBFQ0MgbW9kZSB3YXMgYnJva2VuLgo+Pj4KPj4+IEZpeGVz
OiA4ZmFlODU2YzUzNTAgKCJtdGQ6IHJhd25hbmQ6IG1lc29uOiBhZGQgc3VwcG9ydCBmb3IgQW1s
b2dpYyBOQU5EIGZsYXNoIGNvbnRyb2xsZXIiKQo+Pj4gU2lnbmVkLW9mZi1ieTogQXJzZW5peSBL
cmFzbm92IDxBVktyYXNub3ZAc2JlcmRldmljZXMucnU+Cj4+IFRoaXMgbWF0Y2hlcyB3aGF0IEkg
Y2FuIHNlZSBpbiB0aGUgb2xkIHZlbmRvciBkcml2ZXIsIHNvOgo+IE1vcmVvdmVyIGl0IHdhcyBj
bGVhciB0aGF0IG1hc2sgb2YgMHgzZiBpcyB0b28gc21hbGwgZm9yIGxlbmd0aCBvZiBkYXRhIGlu
Cj4gYnl0ZXMsIGZvciBleGFtcGxlIGZvciAyMDQ4ICsgT09CIHNpemUuCj4+IEFja2VkLWJ5OiBN
YXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgo+
Pgo+PiBbLi4uXQo+Pj4gLSAgICAgICAgICAgICAgIGNtZCA9IChsZW4gJiBHRU5NQVNLKDUsIDAp
KSB8IHNjcmFtYmxlciB8IERNQV9ESVIoZGlyKTsKPj4+ICsgICAgICAgICAgICAgICBjbWQgPSAo
bGVuICYgR0VOTUFTSygxMywgMCkpIHwgc2NyYW1ibGVyIHwgRE1BX0RJUihkaXIpOwo+PiBNeSB1
bmRlcnN0YW5kaW5nIG9mIHRoZSB2ZW5kb3IgZHJpdmVyIGlzIHRoYXQgdGhpcyAibGVuIiBpcyBv
bmx5IHVzZWQKPj4gZm9yICJyYXciIGFjY2VzcyAobXkgb3duIHdvcmRzOiBhbnkgYWNjZXNzIHRo
YXQgZG9lc24ndCB1c2UgdGhlIEhXIEVDQwo+PiBlbmdpbmUpLgo+IEV4YWN0bHksICdsZW4nIGlz
IG9ubHkgZm9yIHJhdyBhY2Nlc3MuCj4+IEFzIGEgZnV0dXJlIGltcHJvdmVtZW50IChubyBuZWVk
IHRvIHVwZGF0ZSByZS1zZW5kIHRoaXMgcGF0Y2gpIGl0Cj4+IHdvdWxkIGJlIGdyZWF0IHRvIGhh
dmUgYSAjZGVmaW5lIHdpdGggYSBtZWFuaW5nZnVsIG5hbWUgZm9yCj4+ICJHRU5NQVNLKDEzLCAw
KSIgKG1heWJlIHNvbWV0aGluZyBsaWtlIE5GQ19DTURfUkFXX0xFTkdUSCkgYXMgaXQncwo+PiB1
c2VkIGluIG11bHRpcGxlIHBsYWNlcyBub3cKPiBBY2sKPiAKPiBUaGFua3MsIEFyc2VuaXkKPj4K
Pj4KPj4gQmVzdCByZWdhcmRzLAo+PiBNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
