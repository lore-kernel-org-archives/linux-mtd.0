Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F024C2FC0E
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Aug 2023 08:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ie9xlaf5/xnz0Zi7ct9MBspSI6Fn4d6CKsOUT6K3ovc=; b=MYWw8kGQx0V8gz
	EPxMJhHimgux83rQC+ZVO1PNQEzlmpLapMFCMlI6JCJDg1v45S3QcmGq+3VPkAmuyqKCtjNIbGdcJ
	ufQaFeLXIMsfcyTOnDzmRdm9jwmfKt4Ds4jTzbbib2uApHZk0ssjuOTP+HRwt6EUOFgT6/CuYwiwn
	Ba5rwT3Vjpg7Cu4mlVeIaqskFg6syC0EFxgTbejUgGcoFnnS6XPXMNED/9hrqkTMrvLmAqXNn1r6x
	sy6Amm9DdZBQA6WAabfq82gCOCeaT30dTswhcFhny8/vdKXX5qOUU3IY0Rh0WQwlo7gMjxw44QZY/
	3skxB9mWHMKNdDPdy1FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWYbF-005qyJ-0C;
	Thu, 17 Aug 2023 08:43:25 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWYbC-005qxw-0B
	for linux-mtd@lists.infradead.org;
	Thu, 17 Aug 2023 08:43:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74A5A1BF20D;
	Thu, 17 Aug 2023 08:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692261798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UZTPzGWR823YG5jFJrtbSl0SkHcpjEiMeVAQSp30Zyg=;
	b=AXCaItneDiKmQZVzmSpvvVUGf/dhoyBk23IuegiE10XZWy/0yMUgAyYaoC7FPkhcDpLQv5
	KPgswpVotS+ApFCCfTjOz1oKns26teIl1mvr/mvXRlVbm2UXc96N7FIhh/3HKVkeT8b9Ai
	mjQ45ai64+wazBScB76VV5fmQacVd9MXJM2jFHyzhWNHNcgkZfPhDy6beiwYw75yRb4V9X
	gENUL2m3FBeh+k7506ftz7X/52ysnNTgrF6t+VbruaaVszkz5L/ao83cBdNCKW96K5GoPq
	aIlueyUYxwkChF4XXUc8g5a79Ay90iySe6Bgg3mNICpvSFXYqxq7TSxFoOvWig==
Date: Thu, 17 Aug 2023 10:43:16 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Justin Stitt <justinstitt@google.com>
Cc: Stefan Agner <stefan@agner.ch>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix
 <trix@redhat.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] mtd: rawnand: fix -Wvoid-pointer-to-enum-cast warning
Message-ID: <20230817104316.0ac684d0@xps-13>
In-Reply-To: <20230815-void-drivers-mtd-nand-raw-vf610_nfc-v1-1-7cc65314c56c@google.com>
References: <20230815-void-drivers-mtd-nand-raw-vf610_nfc-v1-1-7cc65314c56c@google.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_014322_396590_E39058CB 
X-CRM114-Status: GOOD (  12.20  )
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

SGkgSnVzdGluLAoKanVzdGluc3RpdHRAZ29vZ2xlLmNvbSB3cm90ZSBvbiBUdWUsIDE1IEF1ZyAy
MDIzIDIwOjU4OjQ3ICswMDAwOgoKPiBXaGVuIGJ1aWxkaW5nIHdpdGggY2xhbmcgMTggSSBzZWUg
dGhlIGZvbGxvd2luZyB3YXJuaW5nOgo+IHwgICAgICAgZHJpdmVycy9tdGQvbmFuZC9yYXcvdmY2
MTBfbmZjLmM6ODUzOjE3OiB3YXJuaW5nOiBjYXN0IHRvIHNtYWxsZXIgaW50ZWdlcgo+IHwgICAg
ICAgICAgICAgICB0eXBlICdlbnVtIHZmNjEwX25mY192YXJpYW50JyBmcm9tICdjb25zdCB2b2lk
IConIFstV3ZvaWQtcG9pbnRlci10by1lbnVtLWNhc3RdCj4gfCAgICAgICAgIDg1MyB8ICAgICAg
ICAgbmZjLT52YXJpYW50ID0gKGVudW0gdmY2MTBfbmZjX3ZhcmlhbnQpb2ZfaWQtPmRhdGE7Cj4g
Cj4gVGhpcyBpcyBkdWUgdG8gdGhlIGZhY3QgdGhhdCBgb2ZfaWQtPmRhdGFgIGlzIGEgdm9pZCog
d2hpbGUgYGVudW0KPiB2ZjYxMF9uZmNfdmFyaWFudGAgaGFzIHRoZSBzaXplIG9mIGFuIGludC4g
VGhpcyBsZWFkcyB0byB0cnVuY2F0aW9uIGFuZAo+IHBvc3NpYmxlIGRhdGEgbG9zcy4KCkNhbiB5
b3UgcGxlYXNlIHVwZGF0ZSB0aGlzIGNvbW1pdCBsb2cgdG8gd2hhdCBLcnp5c3p0b2Ygc3VnZ2Vz
dGVkIGluCnRoZSAibXRkOiBtYXBzOiBmaXggLVc8Zm9vPiB3YXJuaW5nIiB0aHJlYWQ/Cgo+IExp
bms6IGh0dHBzOi8vZ2l0aHViLmNvbS9DbGFuZ0J1aWx0TGludXgvbGludXgvaXNzdWVzLzE5MTAK
PiBSZXBvcnRlZC1ieTogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPgo+IFNp
Z25lZC1vZmYtYnk6IEp1c3RpbiBTdGl0dCA8anVzdGluc3RpdHRAZ29vZ2xlLmNvbT4KPiAtLS0K
PiBOb3RlOiBUaGVyZSBpcyBsaWtlbHkgbm8gZGF0YSBsb3NzIGFjdHVhbGx5IG9jY3VycmluZyBo
ZXJlIGR1ZSB0byB0aGUKPiBmYWN0IHRoYXQgYGVudW0gdmY2MTBfbmZjX3ZhcmlhbnRgIG9ubHkg
aGFzIGEgZmV3IGZpZWxkcyB3aGljaCBhcmUgbm90Cj4gbmVhcmx5IGxhcmdlIGVub3VnaCB0byBj
YXVzZSBkYXRhIGxvc3MuIFRoaXMgcGF0Y2ggaGVscHMgdG93YXJkcyB0aGUKPiBnb2FsIG9mIGV2
ZW50dWFsbHkgZW5hYmxpbmcgdGhpcyB3YXJuaW5nLgo+IAo+IEFsc28sIHNob3VsZCB3ZSB1c2Ug
YHVuc2lnbmVkIGxvbmdgIGhlcmUgaW5zdGVhZCBvZiBgdWludHB0cl90YD8gSSd2ZQo+IHNlZW4g
bWFpbnRhaW5lcnMgcmVxdWVzdCBib3RoIGFuZCBJJ20gZmxpcHBpbmcgYSBjb2luIGhlcmUuCgpJ
J20gZmluZSB3aXRoIHVpbnRwdHJfdC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
