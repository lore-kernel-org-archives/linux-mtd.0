Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B601AC83F04
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jul 2025 17:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NoNysLBJ7CZyB7xpGERJTlKZ/s31OYG+iUqeY+OmV6M=; b=g2ac1ZjK5PFv+3
	zLP7FX2dyRinksHc3ShIUmjfivrneU0v2/hRBaXJ8nRwP8oU/Fiva3iZEkPEE5QejhH0BSQqBfLCl
	V8mt+NwmPECLlWTQ6WISGZxFbrMaUqwDVkQo0j1FVj56imB49DHnnzUs/sjNf5XfAylJEKxEIWHEx
	uzsXpDCiulEPy4mSvHDx1K8TK41KRpKauK8GfmLSGQr5czWnmI90lSLusxbCz1nUtVAoJpVj2d77/
	kDPODbEyeAMV/RKClyB5J5FZKUedJODOE/w7xQhbBSOuaaalYp2WUTzPtkRtTShDLEwA+ep0qNncQ
	cOVzYxonV5g9QsSZGLXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1ZQ-00000009Aa9-33fG;
	Wed, 02 Jul 2025 17:48:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX18c-000000097Co-0TK5;
	Wed, 02 Jul 2025 17:20:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0216322D9;
	Wed,  2 Jul 2025 10:20:33 -0700 (PDT)
Received: from [10.57.29.161] (unknown [10.57.29.161])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A5AF3F66E;
	Wed,  2 Jul 2025 10:20:45 -0700 (PDT)
Message-ID: <ec98776a-318e-4dc1-9d40-e9d8b1c4c28f@arm.com>
Date: Wed, 2 Jul 2025 18:20:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mtd: rawnand: atmel: ECC error after update to kernel 6.6
To: Zixun LI <admin@hifiphile.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 SoC support' <linux-arm-kernel@lists.infradead.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Ada Couprie Diaz <ada.coupriediaz@arm.com>
References: <CA+GyqebQnWQ3fj4Lrb4-hvzRpphuqw+jh4B9En1j2NDTNFumvQ@mail.gmail.com>
 <599c677a-ace0-41fe-b264-51de0fa7badf@arm.com>
 <CA+GyqebFpav_ixDyp84-XA2WcQdrm_t6nfaKckm98tt5MpM2EA@mail.gmail.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB
Organization: Arm Ltd.
In-Reply-To: <CA+GyqebFpav_ixDyp84-XA2WcQdrm_t6nfaKckm98tt5MpM2EA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_102050_190829_1508E0FD 
X-CRM114-Status: GOOD (  15.99  )
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

T24gMDEvMDcvMjAyNSAxOTowNCwgWml4dW4gTEkgd3JvdGU6Cgo+IE9uIFR1ZSwgSnVsIDEsIDIw
MjUgYXQgNTo0OeKAr1BNIEFkYSBDb3VwcmllIERpYXogPGFkYS5jb3VwcmllZGlhekBhcm0uY29t
PiB3cm90ZToKPj4gSGksCj4+Cj4+IEkndmUgd3JpdHRlbiBhIHNtYWxsIHBhdGNoIGJlbG93IHRo
YXQgSSB0aGluayBzaG91bGQgZml4IHRoZSBpc3N1ZSwgYnV0IGFnYWluCj4+IEkgZG9uJ3Qga25v
dyBpZiB0aGF0J3MgdXBzdHJlYW1hYmxlIGFzLWlzLgo+Pgo+Pj4gQmVzdCByZWdhcmRzLAo+Pj4g
Wml4dW4gTEkKPj4+Cj4+PiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Js
b2IvMTk1ODNjYTU4NGQ2ZjU3NDM4NGUxN2ZlNzYxM2RmYWVhZGNkYzRhNi9kcml2ZXJzL210ZC9u
YW5kL2F0bWVsX25hbmQuYyNMMTA1OAo+Pj4gWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxk
cy9saW51eC9ibG9iL2ZmYzI1MzI2M2ExMzc1YTY1ZmE2YzlmNjJhODkzZTk3NjdmYmViZmEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvYXRtZWwvcG1lY2MuYyNMNzcyCj4+Pgo+PiBIb3BlZnVsbHkgdGhh
dCBjYW4gaGVscCAhCj4+IEJlc3QgcmVnYXJkcywKPj4gQWRhCj4+Cj4gSGkgQWRhLAo+IFRoYW5r
IHlvdSBmb3IgbG9va2luZyBpbnRvIHRoaXMuIEludGVybmFsbHkgSSd2ZSB3cml0dGVuIHRoZSBz
YW1lIHBhdGNoIGFzCj4geW91cnMgYW5kIGl0IHdvcmtzIGZpbmUuCgpHbGFkIHRvIGtub3cgdGhh
dCB5b3UgYWxyZWFkeSBoYXZlIGEgd29ya2luZyBzb2x1dGlvbiBhbmQgdGhhdCBJIHdhc24ndCB0
b28gZmFyIG9mZiAhCkkgZ290IGludGVyZXN0ZWQgYW5kIHdhbnRlZCB0byBkaWcgaW50byBpdCwg
SSBob3BlIGl0IGRpZG4ndCBjb21lIG9mZiB3cm9uZy4KCj4gV2hhdCdzIG1vcmUgaW50ZXJlc3Rp
bmcgaXMgdGhlIGlzc3VlIGhhcHBlbnMgZGVwZW5kaW5nIG9uIGNoaXAgaW5kaXZpZHVhbAo+IGRp
ZmZlcmVuY2Ugb3IgYWdpbmcuIEFtb25nIDMgY2hpcHMgdGVzdGVkLCB0d28gd2l0aCBkYXRlIGNv
ZGUgb2YgMTkzMyBhbmQKPiBvbmUgd2l0aCAyMjIzLiBUaGUgMXN0IG9uZSBoYXMgbWFueSBFQ0Mg
ZXJyb3JzIGFzIGluIHRoZSBtYWlsLCAybmQgb25lCj4gaGFzIGxlc3MgZXJyb3JzLCB3aGlsZSB0
aGUgM3JkIG9uZSBwYXNzZWQgdGhlIG5hbmR0ZXN0IHdpdGhvdXQgZXJyb3IuCj4gTWF5YmUgdGhh
dCdzIHdoeSB0aGlzIGlzc3VlIGlzIG92ZXJsb29rZWQuCgpSZWFsbHkgaW50ZXJlc3RpbmcgYmVo
YXZpb3VyLCB0aGF0IGNvdWxkIGluZGVlZCBleHBsYWluIGhvdyBpdCBtaWdodCAKaGF2ZSBiZWVu
IG1pc3NlZCBkdXJpbmcgdGhlIG9yaWdpbmFsIHJlZmFjdG9yIGFzIGl0IHNlZW1zIGl0IHdhcyB0
ZXN0ZWQgCndpdGggc2ltaWxhciBTb0NzLgoKPiBCZXN0IHJlZ2FyZHMsCj4gWml4dW4gTEkKQmVz
dCByZWdhcmRzLApBZGEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
