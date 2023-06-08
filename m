Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1C1C7EE2E
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jun 2023 04:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=68PsZrGwCtRVEq7dFGBt+iDJ+eFy21cYzsjZggKbpso=; b=InS0TAUzBqqBYn
	OihBa2pl4RM4O68ESX5HPb9x1H9ajKQJgm6mkExJrWjpvyXnoHdAZVjltVRiIrF/qjRHxdi6oJKMy
	itzGOibzgXIqQ+Xz3MnY/WQVPG4sUmB3bXdam3k9JXTLJsZc7e9v5warSHsnSW3Ot4SFHlWneQEom
	ggOdaQKGtUB91+l6hB99kJyu5ZmRMbZyEq4Qyw+P/0gANvbbvuXTnyJT33fabKjVmV7MJl6xOVrkD
	LOjpnvQVyTUI88Evt0F8sxU63vkIFPa6KYcXduJN4zbjSzCCK3VA+EL/JtaoteeOhRQE5h+RsJRqI
	P2HS8uTCg/TPeNa8mwDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q77Tk-00841j-0I;
	Thu, 08 Jun 2023 04:42:32 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q77Tf-0083z1-1y;
	Thu, 08 Jun 2023 04:42:29 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 776BE5FD71;
	Thu,  8 Jun 2023 07:42:25 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686199345;
	bh=IAnc+P5Gpmwrdbjcq4XWUi/tBUzXQwXd+sGwHhWawas=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=WHYQrPQ+dgjs+YVdjzC8s5JVHKusuiIVYP1bQoaSs/xFeWCL36GoeUL5hwN3q9Poa
	 uD/4BBrglS4yKmIC39oKK4qW3vQvfu6vtGrAEWeiJeD6AHcK3XVbk4K+fG/qiop0fP
	 6iDZktO8SG0gjU+eU2/2J7nYw3yFKrQXtm8/kP8ir9Wn/OGHWHqIqGfSzMlOa0SQIx
	 q3EfDdcMvTT6zUwIMxmpjTog+AqNuUpYuz2fKWlRPxftai1uxDD+DhBafX2FH49Yfo
	 GjcyEC3jwq17qy0R5nDRh8CvyiV+EBZ8U0G2u0SP5rbuN5CvOkOuC5QpjEipXHxYdk
	 Ar7NrR/PbohXw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu,  8 Jun 2023 07:42:25 +0300 (MSK)
Message-ID: <05cc07ce-f412-456f-74c0-57bfebe660da@sberdevices.ru>
Date: Thu, 8 Jun 2023 07:37:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1] mtd: rawnand: meson: remove unneeded bitwise OR with
 zeroes
Content-Language: en-US
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230605191508.1826853-1-AVKrasnov@sberdevices.ru>
 <9319a8f6-3774-0dc8-2262-8033f8016a50@sberdevices.ru>
 <429589f6-d946-9bc9-d54e-e892d513a91b@amlogic.com>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <429589f6-d946-9bc9-d54e-e892d513a91b@amlogic.com>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/08 00:23:00 #21457426
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_214227_989403_4BB73870 
X-CRM114-Status: GOOD (  13.21  )
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

CgpPbiAwOC4wNi4yMDIzIDA2OjIzLCBMaWFuZyBZYW5nIHdyb3RlOgo+IAo+IAo+IE9uIDIwMjMv
Ni84IDU6MTgsIEFyc2VuaXkgS3Jhc25vdiB3cm90ZToKPj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+
Cj4+IEhpIGFnYWluIE1pcXVlbCwgTGlhbmchCj4+Cj4+IFdoYXQgZG8gWW91IHRoaW5rIGFib3V0
IHRoaXMgcGF0Y2g/Cj4+Cj4+IFRoYW5rcywgQXJzZW5peQo+Pgo+PiBPbiAwNS4wNi4yMDIzIDIy
OjE1LCBBcnNlbml5IEtyYXNub3Ygd3JvdGU6Cj4+PiBCb3RoIG9wZXJhdGlvbnMgaGF2ZSBubyBl
ZmZlY3QuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQXJzZW5peSBLcmFzbm92IDxBVktyYXNub3ZA
c2JlcmRldmljZXMucnU+Cj4+PiAtLS0KPj4+IMKgIGRyaXZlcnMvbXRkL25hbmQvcmF3L21lc29u
X25hbmQuYyB8IDQgKystLQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
bWVzb25fbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4+PiBpbmRl
eCAwNzRlMTQyMjVjMDYuLjUwZDMxMTBhZDMyMSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L21lc29uX25hbmQuYwo+Pj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVz
b25fbmFuZC5jCj4+PiBAQCAtNTk1LDEyICs1OTUsMTIgQEAgc3RhdGljIGludCBtZXNvbl9uZmNf
cndfY21kX3ByZXBhcmVfYW5kX2V4ZWN1dGUoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwKPj4+IMKg
wqDCoMKgwqDCoCBjbWQwID0gaW4gPyBOQU5EX0NNRF9SRUFEMCA6IE5BTkRfQ01EX1NFUUlOOwo+
Pj4gwqDCoMKgwqDCoMKgIG5mYy0+Y21kZmlmby5ydy5jbWQwID0gY3MgfCBORkNfQ01EX0NMRSB8
IGNtZDA7Cj4+Pgo+Pj4gLcKgwqDCoMKgIGFkZHJzWzBdID0gY3MgfCBORkNfQ01EX0FMRSB8IDA7
Cj4+PiArwqDCoMKgwqAgYWRkcnNbMF0gPSBjcyB8IE5GQ19DTURfQUxFOwo+Pj4gwqDCoMKgwqDC
oMKgIGlmIChtdGQtPndyaXRlc2l6ZSA8PSA1MTIpIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgY21kX251bS0tOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByb3df
c3RhcnQgPSAxOwo+Pj4gwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGFkZHJzWzFdID0gY3MgfCBORkNfQ01EX0FMRSB8IDA7Cj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGFkZHJzWzFdID0gY3MgfCBORkNfQ01EX0FMRTsKPj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcm93X3N0YXJ0ID0gMjsKPj4+IMKgwqDCoMKgwqDCoCB9Cj4g
SGkgQXJzZW5peSBhbmQgTWlxdWVsLAo+IAo+IFRoZSB0d28gemVyb3MgaW5kY2F0ZXMgdHdvIGNv
bHVtbiBhZGRyZXNzLiBtYXliZSB3ZSBjb3VsZCB1c2UgdGhlIG1pY3JvICJDT0xVTU5fQUREUl8w
IiBhbmQgIkNPTFVNTl9BRERSXzEiIHRvIGtlZXAgdGhlIG5mYyBjb21tYW5kIGZvcm1hdCAiQ0Ug
fCBBTEUgfCBhZGRyIiBjb25zaXN0ZW5jeSBhbmQgYWxzbyBsZXQgZnVuY3Rpb24gIm1lc29uX25m
Y19yd19jbWRfcHJlcGFyZV9hbmRfZXhlY3V0ZSIgYmUgbW9yZSByZWFkYWJsZS4KCkxpYW5nLCBk
b25lIGluIHYyOikKClRoYW5rcywgQXJzZW5peQoKPiAKPiBUaGFua3MsCj4gTGlhbmcKPiAKPj4+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
