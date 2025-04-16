Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59D0C369BD
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Apr 2025 12:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FdFoPiZ+A8o+zZowRP1f7IM1nONWLTF6hLrEtNLStQE=; b=j2zNHfrF/2odmC
	dQ3EXuJXAbR8C8RHhwFbCZz7dX3/83sivH+UZ+UqLvljNB2q2Ey/TlA4EjRnYWaNfs1H/ie9O0ikm
	LG7FiBzIu/6YPNDpLxNtjcxoY5r9z/utLUm2KqBGFBq+i2i942qZ6Q3FpuVf0qM9cQ1TnbKMaBZVi
	pgNkBSVQg9qmOVFRA2Gd8dv6k+3S2ixuAgvDtCqJhNucZYVPstsd1HsPHqqKeLF6WYyVAvC+RlzEr
	FXf9JckoL9EVQ3Y6c43Cvd3QitHUQ/ZjjByt2ubV/nkd99LiNoBkK7z3OO619n8yIZNbpXYYA8AJN
	4whEr1lQ2tbLgtKRJzqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u524D-00000009Y9n-1SMV;
	Wed, 16 Apr 2025 12:40:37 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u522D-00000009Xp6-0ozW
	for linux-mtd@lists.infradead.org;
	Wed, 16 Apr 2025 12:38:35 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 88E23A0370;
	Wed, 16 Apr 2025 14:38:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=xsYHMRwdAPxJj2dHnliF
	eUoFCJ2odDE4jo/I+AoFunY=; b=VXjEW+aFzazkOEWeNCFankADBtRmZQRw+kvy
	m1+CWvgni2he7gLoaP7p6ZLpfJ6vEFHJpiNuxjf0fMcNJcwBjMUtB32D/ZNZZpmO
	ZZ+wqzN+PxZjz1WBKoTO9JD3YD0QMRzoHJdBc0en2GQ0/rK7ESjikTC8VWhzd4g6
	UttxTm8HC3u+v1oGtg1WYcZqexEJPn5Mj3gFgjO1nz0yLTTRQDpePMcWB+XntaES
	0cH1k94gB7q0rw/iCfGZ7EisGORNI4qYM5ZedvZ7hEgi5PCeAK5Qo3PCpSeWPglB
	lkh+xdt5mDaEHPXB2tfWFeMoFzWK5g5GhLjY/K9mWUvCZg0KGbTSUKejTUtTvfk8
	8Y2oGySiljEnUVtTiQgIforP1rFR6C5AaPhfDCYd0EFpzMhQZM4G7EFLg/4UpyTi
	F0TNRJldqo6VYMeqkzjkeoButVtLe1GoI7Uxotp73zhwuW6xqHBWiTHDDxcmZ3IY
	1ZEAKT9xFPMGT5OBtpkS3NC8azeBFb78Iu9sZPhPfze9PYJNlQ1+kB6sIC/jy7zv
	a0hy2aenBGAxGzarfcT/EoLg9CHb4JgbF3NZrj1dFFja8ll1nVCrgQjfOkSUkKFr
	zr2/GyYCLCeE/PsutpwOXs0gOh418856FvrKxNfPFeZ4vuiHWVh0Bg8MlT/w3yMs
	3caiB0k=
Message-ID: <dd3c7cc0-a568-4046-b105-e6786b5c80f8@prolan.hu>
Date: Wed, 16 Apr 2025 14:38:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi-nor: Verify written data in paranoid mode
To: Michael Walle <mwalle@kernel.org>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?Q?Szentendrei=2C_Tam=C3=A1s?= <szentendrei.tamas@prolan.hu>,
	"Tudor Ambarus" <tudor.ambarus@linaro.org>, Pratyush Yadav
	<pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20250415180434.513405-1-csokas.bence@prolan.hu>
 <D981O3AA6NK9.2EEVUPM62EV6S@kernel.org>
Content-Language: en-US, hu-HU
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <D981O3AA6NK9.2EEVUPM62EV6S@kernel.org>
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94853647664
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_053833_694864_EBDF396A 
X-CRM114-Status: GOOD (  16.34  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAyMDI1LiAwNC4gMTYuIDEzOjU5LCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEhpLAo+
IAo+PiBBZGQgTVREX1NQSV9OT1JfUEFSQU5PSUQgY29uZmlnIG9wdGlvbiBmb3IgdmVyaWZ5aW5n
IGFsbCB3cml0dGVuIGRhdGEgdG8KPj4gcHJldmVudCBzaWxlbnQgYml0IGVycm9ycyB0byBiZSB1
bmRldGVjdGVkLCBhdCB0aGUgY29zdCBvZiBoYWx2aW5nIFNQSQo+PiBiYW5kd2lkdGguCj4gCj4g
V2hhdCBpcyB0aGUgdXNlIGNhc2UgZm9yIHRoaXM/IFdoeSBpcyBpdCBzcGVjaWZpYyB0byBTUEkt
Tk9SCj4gZmxhc2hlcz8gT3Igc2hvdWxkIGl0IHJhdGhlciBiZSBhbiBNVEQgImZlYXR1cmUiLiBJ
J20gbm90IHN1cmUKPiB3aGV0aGVyIHRoaXMgaXMgdGhlIHJpZ2h0IHdheSB0byBkbyBpdCwgdGh1
cyBJJ2QgbG92ZSB0byBoZWFyIG1vcmUKPiBhYm91dCB0aGUgYmFja2dyb3VuZCBzdG9yeSB0byB0
aGlzLgoKV2VsbCwgb3VyIGNhc2UgaXMgcXVpdGUgc3BlY2lmaWMsIGJ1dCB3ZSB3YW50ZWQgdG8g
cHJvdmlkZSBhIGdlbmVyYWwgCnNvbHV0aW9uIGZvciB1cHN0cmVhbS4gSW4gb3VyIGNhc2Ugd2Ug
aGF2ZSBhIGNvbXBvbmVudCBpbiB0aGUgZGF0YSBwYXRoIAp0aGF0IGNhbiBjYXVzZSBhIGJ1cnN0
IGJpdCBlcnJvciwgb24gYXZlcmFnZSBhZnRlciBhYm91dCBhIGh1bmRyZWQgCm1lZ2FieXRlcyB3
cml0dGVuLgoKV2UgX2NvdWxkXyBtYWtlIGl0IE1URC13aWRlLCBpbiBvdXIgY2FzZSB3ZSBvbmx5
IGhhdmUgYSBOT1IgRmxhc2ggCm9uYm9hcmQgc28gdGhpcyBpcyB3aGVyZSB3ZSBhZGRlZCBpdC4g
SWYgaXQgd2VyZSBpbiB0aGUgTVREIGNvcmUsIHdoZXJlIAp3b3VsZCBpdCBtYWtlIHNlbnNlPwoK
KiBtdGRfd3JpdGUoKQoqIG10ZF93cml0ZV9vb2IoKQoqIG10ZF93cml0ZV9vb2Jfc3RkKCkKKiBv
ciBzb21ld2hlcmUgZWxzZSBlbnRpcmVseT8KCj4+IENvLWRldmVsb3BlZC1ieTogU3plbnRlbmRy
ZWksIFRhbcOhcyA8c3plbnRlbmRyZWkudGFtYXNAcHJvbGFuLmh1Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBTemVudGVuZHJlaSwgVGFtw6FzIDxzemVudGVuZHJlaS50YW1hc0Bwcm9sYW4uaHU+Cj4+IFNp
Z25lZC1vZmYtYnk6IENzw7Nrw6FzLCBCZW5jZSA8Y3Nva2FzLmJlbmNlQHByb2xhbi5odT4KPj4g
LS0tCj4+ICAgZHJpdmVycy9tdGQvc3BpLW5vci9LY29uZmlnIHwgMTAgKysrKysrKysrKwo+PiAg
IGRyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jICB8IDMzICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9LY29uZmlnIGIvZHJpdmVycy9tdGQvc3Bp
LW5vci9LY29uZmlnCj4+IGluZGV4IDI0Y2QyNWRlMmI4Yi4uNDI1ZWE5YTIyNDI0IDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL0tjb25maWcKPj4gKysrIGIvZHJpdmVycy9tdGQv
c3BpLW5vci9LY29uZmlnCj4+IEBAIC02OCw2ICs2OCwxNiBAQCBjb25maWcgTVREX1NQSV9OT1Jf
U1dQX0tFRVAKPj4gICAKPj4gICBlbmRjaG9pY2UKPj4gICAKPj4gK2NvbmZpZyBNVERfU1BJX05P
Ul9QQVJBTk9JRAo+PiArCWJvb2wgIlJlYWQgYmFjayB3cml0dGVuIGRhdGEgKHBhcmFub2lkIG1v
ZGUpIgo+IAo+IE5vIGtlcm5lbCBjb25maWdzIHBsZWFzZS4gVGhpcyBkb2Vzbid0IHNjYWxlLiBX
aGF0IGlmIHlvdSBoYXZlIHR3bwo+IGZsYXNoZXMgYW5kIG9uZSBzaG91bGQgaGF2ZSB0aGlzIGFu
ZCBvbmUgZG9lcyBub3Q/CgpZZXMsIHdlIGhhdmUgdGhvdWdodCBhYm91dCB0aGlzLCBidXQgY29u
Y2x1ZGVkIHRoYXQgInBhcmFub2lkIG1vZGUiIGlzIApub3QgZGV2aWNlLXNwZWNpZmljLCB5b3Ug
ZWl0aGVyIGhhdmUgYSByZXF1aXJlbWVudCB0byBiZSBleHRyYSBzdXJlIAphYm91dCBkYXRhIGlu
dGVncml0eSwgb3IgeW91IGNhbiBiZSBmYWlybHkgc3VyZSB5b3VyIHN5c3RlbSBpcyBzYW5lLCBp
biAKYm90aCBjYXNlcyBpdCBpcyBhIGp1ZGdlbWVudCBhYm91dCB0aGUgZW50aXJlIHN5c3RlbS4g
SSBhbHNvIHRob3VnaHQgCnRoYXQgbWF5YmUgc29tZSBkZXZpY2VzIGNvdWxkIGJlIGV4ZW1wdCBm
cm9tIHRoaXMsIGNvbnRpbmdlbnQgb24gYSAKYG5vLXBhcmFub2lhYCBEZXZpY2UgVHJlZSBwcm9w
ZXJ0eSwgdG8gc2VsZWN0aXZlbHkgc2FjcmlmaWNlIGludGVncml0eSAKZm9yIHBlcmZvcm1hbmNl
IGV2ZW4gaW4gcGFyYW5vaWQgbW9kZSwgYnV0IHdlIG9ubHkgaGF2ZSBvbmUgRmxhc2ggCmFueXdh
eSwgc28gSSBkaWRuJ3QgaW1wbGVtZW50IGl0LgoKPiAtbWljaGFlbAoKQmVuY2UKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
