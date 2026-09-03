Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3D8C624D7
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Sep 2026 10:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y0FFP6gk9Jnfp+18l1tyPAnUwUlSRgE4dJiMyIaTr4c=; b=R1afOX4mcExQX/
	RswHJVWGhvX0o1poJxaFXr1IPgtrMYvFBGzoqs47I04SpbG/IZSi8xk/KlzGaW7Bae/gLb6SHBEkS
	j/DjifJibrcQZjmYnWQxBG+rEuv/dqy4ZveVVw6rz7/K85Dyv1MIffm1X01NutTnV9LRlWudWHiwx
	Kk1lz4NlCqSx4PJUHBwdzLQ55mRghfr4vlPBxc+ijDI+oNcuTeF0Lj0yEh0xLiC6aio/uNcBCJ7y0
	OmkBqAksM771kXhPcqENreriDrYH6CAhl3dKBuc9T4ZaZ3I27JHrtedaEET5fmmyY2QUzNq6YFE03
	Jt/TqIfTkIj8mA6g6s6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24Qm-0000000H3N9-31Tv;
	Thu, 03 Sep 2026 10:12:28 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24Qj-0000000H3Lr-2BTb
	for linux-mtd@lists.infradead.org;
	Thu, 03 Sep 2026 10:12:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6779E1A1976;
	Thu,  3 Sep 2026 10:12:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A191602B8;
	Thu,  3 Sep 2026 10:12:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 71A6311C792CB;
	Thu,  3 Sep 2026 12:12:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788430337; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mmDiW4nL2EI7VVEvJaPt9BPba+nRmMBr4HdkzV+ci7U=;
	b=EDiSyxYIouHPQ3lMN0v8lPtyL0q1L+GgxjtQH5BYknT9kNKz8TX8n3ktWCa2aACcznksDP
	UYWGCXJpIp9sR2OCIFBelhFXERdWIDEskqeHQS+wbum/otRs2BkoyJWDg+4VzWiKxtvqhp
	2nbrJy6QbYJpvNQEEVnecAIrPA8KRwy7GJwloC+7DqPhCWARqgnfxV7JaPgke6lYoGJny6
	Wl8tnatAXSdyt4RTnUQT2XDcNviUlcztSi/gVhhZrqqPf/KTVXM1005gd2wRiSKirYA+g0
	dTZuSWlrQNajuiqWadqu+kApgiGvzBo8XHh2AhA3Myyplcxg94qbefJBMrTFAQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Nuno =?utf-8?Q?S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spinand: winbond: Add support for W25N08LW
In-Reply-To: <20260831-mtd-nand-new-chip-support-v1-1-dca9f63ac0f9@analog.com>
	("Nuno =?utf-8?Q?S=C3=A1=22's?= message of "Mon, 31 Aug 2026 16:38:10
 +0100")
References: <20260831-mtd-nand-new-chip-support-v1-1-dca9f63ac0f9@analog.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 03 Sep 2026 12:12:15 +0200
Message-ID: <87h5k64pa8.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_031225_707683_B1CB7375 
X-CRM114-Status: GOOD (  21.49  )
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

T24gMzEvMDgvMjAyNiBhdCAxNjozODoxMCArMDEsIE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5j
b20+IHdyb3RlOgoKPiBBZGQgc3VwcG9ydCBmb3IgdGhlIFcyNU4wOExXLCBhIDEuOFYgOEdiaXQg
U1BJLU5BTkQgbWFkZSBvZiB0d28KPiA0R2JpdCBMVU5zLCB3aXRoIDQwOTYtYnl0ZSBwYWdlcyBh
bmQgMjU2IGJ5dGVzIG9mIHNwYXJlIGFyZWEuCj4KPiBUaGUgY2hpcCByZXVzZXMgdGhlIEtWIEVD
QyBzdGF0dXMgaGVscGVyLCBidXQgbmVlZHMgaXRzIG93biBPT0IKPiBsYXlvdXQgYmVjYXVzZSB0
aGUgZ2VvbWV0cnkgb2YgaXRzIHNwYXJlIGFyZWEgZGlmZmVycyBmcm9tIHRoZQo+IGV4aXN0aW5n
IFdpbmJvbmQgcGFydHMuIE9ubHkgaGFsZiBvZiBpdCBpcyB2aXNpYmxlIHdoaWxlIHRoZQo+IGlu
dGVybmFsIEVDQyBpcyBlbmFibGVkLCBzbyB0aGUgRUNDIHJlZ2lvbiBpcyByZXBvcnRlZCBhcwo+
IGluYWNjZXNzaWJsZSBhbmQganVzdCB0aGUgZnJlZSBieXRlcyBhcmUgZXhwb3NlZC4KPgo+IEFz
c2lzdGVkLWJ5OiBDbGF1ZGU6T3B1cy01Cj4gU2lnbmVkLW9mZi1ieTogTnVubyBTw6EgPG51bm8u
c2FAYW5hbG9nLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvd2luYm9uZC5jIHwg
NDUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFu
ZC9zcGkvd2luYm9uZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvd2luYm9uZC5jCj4gaW5kZXgg
OWI3OGMxZTZjYmM5Li5jMmM0Y2MzMDZmMDUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFu
ZC9zcGkvd2luYm9uZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvd2luYm9uZC5jCj4g
QEAgLTM0NSw2ICszNDUsNDEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGRfb29ibGF5b3V0X29w
cyB3MjVuMDJrdl9vb2JsYXlvdXQgPSB7Cj4gIAkuZnJlZSA9IHcyNW4wMmt2X29vYmxheW91dF9m
cmVlLAo+ICB9Owo+ICAKPiArc3RhdGljIGludCB3MjVuMDhsd19vb2JsYXlvdXRfZWNjKHN0cnVj
dCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwKPiArCQkJCSAgc3RydWN0IG10ZF9vb2JfcmVn
aW9uICpyZWdpb24pCj4gK3sKPiArCS8qCj4gKwkgKiBXaXRoIGVjYyBlbmFibGVkIHRoZSBwYXJp
dHkgYml0cyBhcmUgbm90IGFjY2Vzc2libGUuIFNvIHdlIGNhbgo+ICsJICogb25seSBzZWUgcGFn
ZSArIDEyOC4gV2l0aG91dCBlY2MgdGhlIGZ1bGwgcGFnZSArIDI1NiBpcyBhY2Nlc3NpYmxlLgo+
ICsJICogVG8gbWFrZSBpdCBzaW1wbGUganVzdCByZXR1cm4gdGhlIGFyZWEgYXMgbm90IGFjY2Vz
c2libGUuCj4gKwkgKi8KPiArCXJldHVybiAtRVJBTkdFOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50
IHcyNW4wOGx3X29vYmxheW91dF9mcmVlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlv
biwKPiArCQkJCSAgIHN0cnVjdCBtdGRfb29iX3JlZ2lvbiAqcmVnaW9uKQo+ICt7Cj4gKwlpZiAo
c2VjdGlvbiA+IDcpCj4gKwkJcmV0dXJuIC1FUkFOR0U7Cj4gKwo+ICsJcmVnaW9uLT5vZmZzZXQg
PSAoMTYgKiBzZWN0aW9uKTsKPiArCS8qIE5vdGUgdGhhdCB3ZSBpbmNsdWRlIFVzZXIgRGF0YSAy
IHdoaWNoIGlzIG5vdCBwcm90ZWN0ZWQgYnkgRUNDICovCgpUaGUgbW9yZSBJIHRoaW5rIGFib3V0
IHRoZXNlIGZyZWUgYnl0ZXMsIHRoZSBtb3JlIEkgZ2V0IGNvbnZpbmNlZCB0aGF0CndlIHNob3Vs
ZCBvbmx5IGV4cG9zZSBFQ0MgcHJvdGVjdGVkIGJ5dGVzLiBJIGhvbmVzdGx5IGRvIG5vdCByZW1l
bWJlcgphbnkgZ3VhcmFudGVlIHJlZ2FyZGluZyB0aGVzZSBvZmZpY2lhbGx5IHN0YXRlZCwgdGhl
IGNvbW1vbiBjYXNlCihlZy4gVUJJKSB0aGVyZSBpcyBubyBpbXBhY3QsIGJ1dCBtYXliZSBpdCBp
cyBiZXN0IHRvIG9ubHkgZXhwb3NlIHRoZQpieXRlcyB0aGF0IGFyZSBhY3R1YWxseSBwcm90ZWN0
ZWQsIHNpbmNlIHRoZSB0aHJlc2hvbGRzIGFyZSBnZXR0aW5nCmxvd2VyIGFuZCBsb3dlciAoYW5k
IGNoYW5jZXMgdG8gZ2V0IGJpdGZsaXBzIHRoZXJlIGluY3JlYXNlIHdpdGggdGhlCm9wdGltaXph
dGlvbnMgb2YgdGhlIHRlY2hub2xvZ3kpLgoKRG8geW91IG1pbmQgb25seSBleHBvc2luZyBVc2Vy
IERhdGEgMT8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
