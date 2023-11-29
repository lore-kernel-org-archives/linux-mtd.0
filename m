Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDFFC4167B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Nov 2023 08:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mMLXOclrgxueZQrtqNvqwXtIrZaVeEQyQ8CD/5YOHmk=; b=dy9TxAVjaxxOru
	COtyNuL7fNF6X1hUao6v4NXpe9MDrDKFKvPN346oZsge8OCVb30FiSy1NX5LeqdQrs9pG3SDCvjcJ
	sNnc59f6J3pCdGY+NkXIgmGfiERsu3i+WkgJA6hbhCa496+X6h9AmZ+wd/Bx5pSxh9PNB2zg6QVBx
	fnjcPICb2dfcxM0SX3lcUNtf8/Ybjcjnb+DxWb4besr1141HSlV8VZC7rA977NNpngjSCf3tJEpIj
	sWVCOmkp8K+Rmq8wU7C07RIMRFsESMedacpqqtHDpgdUFozvKKnARHS3l0ZzdiCWpw90mDhMBcI0v
	zbw5Yp9mCBF3MwLz/PjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8G74-007V7j-00;
	Wed, 29 Nov 2023 08:40:06 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8G71-007V6L-2S
	for linux-mtd@lists.infradead.org;
	Wed, 29 Nov 2023 08:40:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 245C21BF20B;
	Wed, 29 Nov 2023 08:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701247199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AKfCywz8yVWhuffi+1nkdllKuJTy6/CWyrIaSRqsEDo=;
	b=idDYTh8FaXonBvu10jpAJAvqRXDUMcy3ydRDLkNHkYSI9BJ7ZZ9fS23LrJCTTpMILCV7Mi
	R1hPCxUzohf/QP4DrynIEonaYa9zr6MEo1daksb5YCCT4zwKrP7ain62v8qu/a4E+N7QN+
	JCt1cwaXAlGnow3OZZMcwB480LkPHgVRDNhAu+gHB6w0RR32dxFedr8Tu8QfTPRMhBgJqq
	xwr/qxKl9mGj0p88Y3w2fSz7MLsI1ATrVyrOevFeNrlTaHDQMEHQodqtGfzoqMtgBeTS4t
	uOhMqW2d2oMaG5zOlZ1dcHDDZ72G9Eeb+Z32AxpnBTKTQLLamuWPpoEDJMqqjQ==
Date: Wed, 29 Nov 2023 09:39:53 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Dhruva Gole <d-gole@ti.com>,
 linux-mtd@lists.infradead.org, Mark Brown <broonie@kernel.org>, Kamal Dasu
 <kamal.dasu@broadcom.com>, Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?=
 <j.neuschaefer@gmx.net>, Mario Kicherer <dev@kicherer.org>, Chuanhong Guo
 <gch981213@gmail.com>, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] spi: Unify error codes by replacing -ENOTSUPP
 with -EOPNOTSUPP
Message-ID: <20231129093953.00dc04da@xps-13>
In-Reply-To: <20231129064311.272422-1-acelan.kao@canonical.com>
References: <20231129064311.272422-1-acelan.kao@canonical.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_004004_086092_690B559B 
X-CRM114-Status: GOOD (  22.76  )
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

SGVsbG8sCgphY2VsYW4ua2FvQGNhbm9uaWNhbC5jb20gd3JvdGUgb24gV2VkLCAyOSBOb3YgMjAy
MyAxNDo0MzoxMCArMDgwMDoKCj4gRnJvbTogIkNoaWEtTGluIEthbyAoQWNlTGFuKSIgPGFjZWxh
bi5rYW9AY2Fub25pY2FsLmNvbT4KPiAKPiBUaGlzIGNvbW1pdCB1cGRhdGVzIHRoZSBTUEkgc3Vi
c3lzdGVtLCBwYXJ0aWN1bGFybHkgYWZmZWN0aW5nICJTUEkgTUVNIgo+IGRyaXZlcnMgYW5kIGNv
cmUgcGFydHMsIGJ5IHJlcGxhY2luZyB0aGUgLUVOT1RTVVBQIGVycm9yIGNvZGUgd2l0aAo+IC1F
T1BOT1RTVVBQLgo+IAo+IFRoZSBrZXkgbW90aXZhdGlvbnMgZm9yIHRoaXMgY2hhbmdlIGFyZSBh
cyBmb2xsb3dzOgo+IDEuIFRoZSBzcGktbm9yIGRyaXZlciBjdXJyZW50bHkgdXNlcyBFT1BOT1RT
VVBQLCB3aGVyZWFzIGNhbGxzIHRvIHNwaS1tZW0KPiBtaWdodCByZXR1cm4gRU5PVFNVUFAuIFRo
aXMgdXBkYXRlIGFpbXMgdG8gdW5pZnkgdGhlIGVycm9yIHJlcG9ydGluZwo+IHdpdGhpbiB0aGUg
U1BJIHN1YnN5c3RlbSBmb3IgY2xhcml0eSBhbmQgY29uc2lzdGVuY3kuCj4gCj4gMi4gVGhlIHVz
ZSBvZiBFTk9UU1VQUCBoYXMgYmVlbiBmbGFnZ2VkIGJ5IGNoZWNrcGF0Y2ggYXMgaW5hcHByb3By
aWF0ZSwKPiBtYWlubHkgYmVpbmcgcmVzZXJ2ZWQgZm9yIE5GUy1yZWxhdGVkIGVycm9ycy4gVG8g
YWxpZ24gd2l0aCBrZXJuZWwgY29kaW5nCj4gc3RhbmRhcmRzIGFuZCByZWNvbW1lbmRhdGlvbnMs
IHRoaXMgY2hhbmdlIGlzIGJlaW5nIG1hZGUuCj4gCj4gMy4gQnkgdXNpbmcgRU9QTk9UU1VQUCwg
d2UgcHJvdmlkZSBtb3JlIHNwZWNpZmljIGNvbnRleHQgdG8gdGhlIGVycm9yLAo+IGluZGljYXRp
bmcgdGhhdCBhIHBhcnRpY3VsYXIgb3BlcmF0aW9uIGlzIG5vdCBzdXBwb3J0ZWQuIFRoaXMgaGVs
cHMKPiBkaWZmZXJlbnRpYXRlIGZyb20gdGhlIG1vcmUgZ2VuZXJpYyBFTk9UU1VQUCBlcnJvciwg
YWxsb3dpbmcgZHJpdmVycyB0bwo+IGJldHRlciBoYW5kbGUgYW5kIHJlc3BvbmQgdG8gZGlmZmVy
ZW50IGVycm9yIHNjZW5hcmlvcy4KPiAKPiBSaXNrcyBhbmQgQ29uc2lkZXJhdGlvbnM6Cj4gV2hp
bGUgdGhpcyBjaGFuZ2UgaXMgcHJpbWFyaWx5IGludGVuZGVkIGFzIGEgY29kZSBjbGVhbnVwIGFu
ZCBlcnJvciBjb2RlCj4gdW5pZmljYXRpb24sIHRoZXJlIGlzIGEgbWlub3IgcmlzayBvZiBicmVh
a2luZyB1c2VyLXNwYWNlIGFwcGxpY2F0aW9ucwo+IHRoYXQgcmVseSBvbiBzcGVjaWZpYyByZXR1
cm4gY29kZXMgZm9yIHVuc3VwcG9ydGVkIG9wZXJhdGlvbnMuIEhvd2V2ZXIsCj4gdGhpcyByaXNr
IGlzIGNvbnNpZGVyZWQgbG93LCBhcyBzdWNoIHVzZS1jYXNlcyBhcmUgdW5saWtlbHkgdG8gYmUg
Y29tbW9uCj4gb3IgY3JpdGljYWwuIE5ldmVydGhlbGVzcywgZGV2ZWxvcGVycyBhbmQgdXNlcnMg
c2hvdWxkIGJlIGF3YXJlIG9mIHRoaXMKPiBjaGFuZ2UsIGVzcGVjaWFsbHkgaWYgdGhleSBoYXZl
IHNjcmlwdHMgb3IgdG9vbHMgdGhhdCBzcGVjaWZpY2FsbHkgaGFuZGxlCj4gU1BJIGVycm9yIGNv
ZGVzLgo+IAo+IFRoaXMgY29tbWl0IGRvZXMgbm90IGludHJvZHVjZSBhbnkgZnVuY3Rpb25hbCBj
aGFuZ2VzIHRvIHRoZSBTUEkgc3Vic3lzdGVtCj4gb3IgdGhlIGFmZmVjdGVkIGRyaXZlcnMuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQ2hpYS1MaW4gS2FvIChBY2VMYW4pIDxhY2VsYW4ua2FvQGNhbm9u
aWNhbC5jb20+Cj4gCj4gLS0tCj4gdjUuIGRpc3Rpbmd1aXNoIC1FT1BOT1RTVVBQIGZyb20gLUVO
T1RTVVBQCj4gdjYuIGEuIHNwaV9ub3Jfc2V0XzRieXRlX2FkZHJfbW9kZSgpIHNob3VsZCBjaGVj
ayAtRU9QTk9UU1VQUCwgYWxsCj4gICAgICAgIGNhbGxiYWNrcyBvZiBzZXRfNGJ5dGVfYWRkcl9t
b2RlKCkgd2lsbCBldmVudHVhbGx5IHJldHVybgo+ICAgICAgICAtRU9QTk9UU1VQUCBpZiB0aGUg
Y2hlY2tpbmcgZmFpbGVkLgo+ICAgICBiLiBVcGRhdGUgY29tbWVudCB0byBkZXNjcmliZSB0aGUg
cmVhc29uIGZvciB0aGUgcGF0Y2ggYW5kIHRoZQo+ICAgICAgICBhZmZlY3RlZCBwYXJ0cy4KPiAg
ICAgYy4gVXBkYXRlIHRoZSBrZXJuZWwtZG9jIG9mIGV4ZWNfb3AoKSBpbiBzdHJ1Y3Qgc3BpX2Nv
bnRyb2xsZXJfbWVtX29wcwo+IHY3LiBhZGRlZCBjb21tZW50IGZvciB0aGUgcmV0dXJuIGNvZGUg
Y2hhbmdlcyBtYXkgYWZmZWN0IHVzZXJzcGFjZSwgYW5kCj4gICAgIHRoZSByaXNrIGFmdGVyIHRo
aXMgY2hhbmdlCj4gLS0tCgpMb29rcyBzZW5zaWJsZSB0byBtZSwgbGV0J3MgbWFrZSB0aGUgY29u
dmVyc2lvbi4KCkFja2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
