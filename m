Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877E8C636CC
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Feb 2023 13:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FMuFxSpWm+XIKt7tvXT0UMc4FEJ1Y/aFtsHsMbwfBJI=; b=4pQB8a0jxfA/mM
	ylT9jBo+fSOm5hzR0dcYWiHrGKGrCzKXpTsXFfFyEkGmOm0Ab6uGA4V77tedWOt+pDB4mA6cp5+to
	sUzUiPLiC5U+7Nciz8M0BrbaBueZ9sKx9F8e16fm60hm8huGbi1+qkt+GEFGdxuka4Mi9neFaTpjt
	0bp3quqN+uGsuQ2iIWrIwrVwwF2ydSjh0Vhx7jpAiG5kejAL1tc4Fk1eJNGQBDht7E4t7xVTXoUaz
	YcG73GPUQaxANpr3zAUpBIDMSoX95Hz00UhRU7aSAf6wdsgVuJohHbI0C94VHYysKRQez2kGaQIUq
	qp7lDgBprNXOxb6jIP6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHXt-005vjW-So; Wed, 15 Feb 2023 13:10:01 +0000
Received: from relay10.mail.gandi.net ([2001:4b98:dc4:8::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHXq-005vhK-9G
	for linux-mtd@lists.infradead.org; Wed, 15 Feb 2023 13:10:00 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7F38024000E;
	Wed, 15 Feb 2023 13:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676466592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tQNw6Dq9MEONpewdlcGZDEALhVDCV7c2JF/ae4aR+zc=;
	b=Lb6Z+sWwhf/HaYVZ3oqF2F+/HNFVbkJEkNugc4G3shx/12OKTtKc5klA0fHtfIbLDXtikx
	0SQXZEIsJHvp0zow7IFM7zVwR/eKFiW1RPS9iT7aMiYyUubB5g5NV+HYZAlr0WAGZ08W87
	9QhkZlgVBCSqMvFSEriybxrKrG8vHYABGHcdMHewCooBcscnIG43XvHAXyLEgDAlmSUSa9
	zr+eQs83f0PO0YHWzLH8f1XV0i+4+sD47/qSWwfu342iiHHhI3GX2HbEGhjkS+/w3Jmi6i
	Mv4PQKDVufPvQoAfjE0dCxbR0gvlHqPOz/1v4FtorkW2/MhV/zANthyFvw5ldQ==
Date: Wed, 15 Feb 2023 14:09:50 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: mxic-ecc: Fix
 mxic_ecc_data_xfer_wait_for_completion() when irq is used
Message-ID: <20230215140950.2e7428b8@xps-13>
In-Reply-To: <beddbc374557e44ceec897e68c4a5d12764ddbb9.1676459308.git.christophe.jaillet@wanadoo.fr>
References: <beddbc374557e44ceec897e68c4a5d12764ddbb9.1676459308.git.christophe.jaillet@wanadoo.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_050958_507982_BB949C4F 
X-CRM114-Status: GOOD (  18.52  )
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

SGkgQ2hyaXN0b3BoZSwKCmNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZyIHdyb3RlIG9uIFdl
ZCwgMTUgRmViIDIwMjMgMTI6MDg6NDUgKzAxMDA6Cgo+IHdhaXRfZm9yX2NvbXBsZXRpb25fdGlt
ZW91dCgpIGFuZCByZWFkbF9wb2xsX3RpbWVvdXQoKSBkb24ndCBoYW5kbGUgdGhlaXIKPiByZXR1
cm4gdmFsdWUgdGhlIHNhbWUgd2F5Lgo+IAo+IHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgp
IHJldHVybnMgMCBvbiB0aW1lIG91dCAoYW5kID4wIGluIGFsbCBvdGhlcgo+IGNhc2VzKQo+IHJl
YWRsX3BvbGxfdGltZW91dCgpIHJldHVybnMgMCBvbiBzdWNjZXNzIGFuZCAtRVRJTUVET1VUIHVw
b24gYSB0aW1lb3V0LgoKVGhhdCdzIGEgc2hhbWUsIGJ1dCB5ZWFoLCBleGNlbGxlbnQgY2F0Y2gh
Cgo+IEluIG9yZGVyIGZvciB0aGUgZXJyb3IgaGFuZGxpbmcgcGF0aCB0byB3b3JrIGluIGJvdGgg
Y2FzZXMsIHRoZSBsb2dpYwo+IGFnYWluc3Qgd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCkg
bmVlZHMgdG8gYmUgaW52ZXJ0ZWQuCj4gCj4gRml4ZXM6IDQ4ZTY2MzNhOWZhMiAoIm10ZDogbmFu
ZDogbXhpYy1lY2M6IEFkZCBNYWNyb25peCBleHRlcm5hbCBFQ0MgZW5naW5lIHN1cHBvcnQiKQo+
IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgSkFJTExFVCA8Y2hyaXN0b3BoZS5qYWlsbGV0QHdh
bmFkb28uZnI+Cj4gLS0tCj4gQ29tcGlsZSB0ZXN0ZWQgb25seS4KPiAKPiBUaGlzIGlzIHJlYWxs
eSBzcHVyaW91cy4KPiBJZiBJJ20gcmlnaHQsIHRoaXMgbWVhbnMgdGhhdCBpdCBuZXZlciB3b3Jr
ZWQhCj4gCj4gQ2FuIGFueSBvbmUgd2l0aCB0aGUgaGFyZHdhcmUgdGVzdD8KClRoZSBkZXNpZ24g
SSB1c2VkIGZvciBkZXZlbG9wbWVudCBhbmQgdGVzdGluZyBoYWQgbm8gaW50ZXJydXB0IGxpbmUK
YXZhaWxhYmxlIGZvciB0aGF0IElJUkMsIHNvIEkgb25seSB0ZXN0ZWQgdGhlIHBvbGxpbmcgY2Fz
ZSAoJ2Vsc2UnCnNpZGUpIGFuZCBjb21wbGV0ZWx5IG92ZXJsb29rZWQgdGhhdCBkaWZmZXJlbmNl
LiBJIG1pZ2h0IGhhdmUgbWVudGlvbmVkCml0IGluIHRoZSBjb3ZlciBsZXR0ZXIsIGlmIEkgZGlk
bid0LCBpdCdzIGFuIG92ZXJzaWdodC4KCj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvZWNjLW14
aWMuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbmFuZC9lY2MtbXhpYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9lY2Mt
bXhpYy5jCj4gaW5kZXggOGFmZGNhNzMxYjg3Li42YjQ4N2ZmZTJmMmQgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9tdGQvbmFuZC9lY2MtbXhpYy5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9lY2Mt
bXhpYy5jCj4gQEAgLTQyOSw2ICs0MjksNyBAQCBzdGF0aWMgaW50IG14aWNfZWNjX2RhdGFfeGZl
cl93YWl0X2Zvcl9jb21wbGV0aW9uKHN0cnVjdCBteGljX2VjY19lbmdpbmUgKm14aWMpCj4gIAkJ
bXhpY19lY2NfZW5hYmxlX2ludChteGljKTsKPiAgCQlyZXQgPSB3YWl0X2Zvcl9jb21wbGV0aW9u
X3RpbWVvdXQoJm14aWMtPmNvbXBsZXRlLAo+ICAJCQkJCQkgIG1zZWNzX3RvX2ppZmZpZXMoMTAw
MCkpOwo+ICsJCXJldCA9IHJldCA/IDAgOiAtRVRJTUVET1VUOwo+ICAJCW14aWNfZWNjX2Rpc2Fi
bGVfaW50KG14aWMpOwo+ICAJfSBlbHNlIHsKPiAgCQlyZXQgPSByZWFkbF9wb2xsX3RpbWVvdXQo
bXhpYy0+cmVncyArIElOVFJQVF9TVFMsIHZhbCwKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
