Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EFEC88CB2
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jun 2023 17:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qd1a4SK891ucWIs4/lPQG9LrpBc2sMvEhi34Von8ADY=; b=hgBdLY7oZXXjEv
	BLsDHs43e71nzlGmFm7oLzK3hf6oQp0top2fRw8PqI96gEXeEboxHCYQQqszhs70TfqRYnp03Xesj
	A5H5G3UX/p8WIf1ChFZu005Iqcjx62wdNxKdC3T7LQouM9EUDyOxzmCdwTCY+FUYK3KeV5o7OCr86
	oXNeh/FXrFwOwkd07mKWMCsS0heijav/79j5NHt9nljdJumNo3fCRcUlUTK+7K/dstQ5RdoURVAne
	XAJFqhDPIjTKH8C3nD54ImDWNH8OWLyBYYDY0bd6AUXVzzaBeX1ejldtzhLfFHMvh/V9rWjaLzoHO
	dGmMtd8OBH8B6Bw7xr7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8lJd-004l2p-1F;
	Mon, 12 Jun 2023 17:26:53 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8lJZ-004kzu-2T;
	Mon, 12 Jun 2023 17:26:51 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686590805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m9Ld3OwQozi+S0Y0u/WiINpRr2FYKCtYTGv24WgCdUw=;
	b=KAmFjkkHeR8C+bJJkvmf0Blk30klu1nOUq+nG09jWWZmumLatfuKnzxeo8/O49IsNiyhto
	5/bDH1HgX4sy0cIsK/zYMDgkRCxHPopLl3gItJVR5Dp67BcSo7e8axfNliTagtTE02480s
	Yc076fm8LD6+H+ybgK/Xr8p9+YshBepsfce5VV7Q8NtgOKr3/DjizZEP9TxvTucuZAktjB
	1vrBva4ofkHjnEWGPOVJm1I6JbFOy6DX7/vxxuB4kYGn9iWOYgHdiE86C1cJ94e29oze3X
	UrbZRvxkhN/OCGCAm2KSONQvkU85dl5tov1PHyqqliyVsmjriYuNYMLKxW2VGA==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 55B281C0003;
	Mon, 12 Jun 2023 17:26:41 +0000 (UTC)
Date: Mon, 12 Jun 2023 19:26:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Johan Jonker <jbx6244@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 yifeng.zhao@rock-chips.com
Subject: Re: [PATCH v2 3/5] mtd: nand: raw: rockchip-nand-controller: fix
 oobfree offset and description
Message-ID: <20230612192640.63baf3e8@xps-13>
In-Reply-To: <f2cebf54-a16c-c849-a988-bfd98c502748@gmail.com>
References: <11e16c3b-6f7b-a6a9-b0ed-b7ac0cd703e3@gmail.com>
	<f2cebf54-a16c-c849-a988-bfd98c502748@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_102650_072054_9926D2B4 
X-CRM114-Status: GOOD (  20.01  )
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

SGkgSm9oYW4sCgpqYng2MjQ0QGdtYWlsLmNvbSB3cm90ZSBvbiBNb24sIDEyIEp1biAyMDIzIDE3
OjAzOjE4ICswMjAwOgoKPiBUaGUgTVREIGZyYW1ld29yayByZXNlcnZlcyAxIG9yIDIgYnl0ZXMg
Zm9yIHRoZSBiYWQgYmxvY2sgbWFya2VyCj4gZGVwZW5kaW5nIG9uIHRoZSBidXMgc2l6ZS4gVGhl
IHJvY2tjaGlwLW5hbmQtY29udHJvbGxlciBkcml2ZXIKPiBjdXJyZW50bHkgb25seSBzdXBwb3J0
cyBhIDggYml0IGJ1cywgYnV0IHJlc2VydmVzIHN0YW5kYXJkIDIgYnl0ZXMKPiBmb3IgdGhlIEJC
TS4KCldlIGFsd2F5cyByZXNlcnZlIDIgYnl0ZXMsIG5vPwoKPiBUaGUgZmlyc3QgZnJlZSBPT0Ig
Ynl0ZSBpcyB0aGVyZWZvcmUgT09CMiBhdCBvZmZzZXQgMi4KPiBQYWdlIGFkZHJlc3MoUEEpIGJ5
dGVzIGFyZSBtb3ZlZCB0byB0aGUgbGFzdCA0IHBvc2l0aW9ucyBiZWZvcmUKPiBFQ0MuIFVwZGF0
ZSB0aGUgZGVzY3JpcHRpb24gZm9yIExpbnV4LgoKVGhlIGRlc2NyaXB0aW9uIHNob3VsZCBqdXN0
IGJlOgoKTW92ZSBQYWdlIEFkZHJlc3MgKFBBKSBieXRlcyB0byB0aGUgbGFzdCA0IHBvc2l0aW9u
cyBiZWZvcmUgRUNDLgoKQW5kIHRoZW4geW91IHNob3VsZCBqdXN0aWZ5IHdoeSB0aGlzIGlzIG5l
ZWRlZC4gQWxzbywgdGhpcyB3b3VsZCBicmVhawphbGwgZXhpc3RpbmcgamZmczIgdXNlcnMsIHJp
Z2h0PwoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb2hhbiBKb25rZXIgPGpieDYyNDRAZ21haWwuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9yb2NrY2hpcC1uYW5kLWNvbnRyb2xsZXIu
YyB8IDExICsrKystLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDcg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3JvY2tj
aGlwLW5hbmQtY29udHJvbGxlci5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcm9ja2NoaXAtbmFu
ZC1jb250cm9sbGVyLmMKPiBpbmRleCAzMWQ4YzdhODcuLmZjZGE0Yzc2MCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9yb2NrY2hpcC1uYW5kLWNvbnRyb2xsZXIuYwo+ICsrKyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L3JvY2tjaGlwLW5hbmQtY29udHJvbGxlci5jCj4gQEAgLTU2
Niw5ICs1NjYsMTAgQEAgc3RhdGljIGludCBya19uZmNfd3JpdGVfcGFnZV9yYXcoc3RydWN0IG5h
bmRfY2hpcCAqY2hpcCwgY29uc3QgdTggKmJ1ZiwKPiAgCQkgKiAgICBCQk0gIE9PQjEgT09CMiBP
T0IzIHwuLi4uLi58ICBQQTAgIFBBMSAgUEEyICBQQTMKPiAgCQkgKgo+ICAJCSAqIFRoZSBya19u
ZmNfb29ibGF5b3V0X2ZyZWUoKSBmdW5jdGlvbiBhbHJlYWR5IGhhcyByZXNlcnZlZAo+IC0JCSAq
IHRoZXNlIDQgYnl0ZXMgd2l0aDoKPiArCQkgKiB0aGVzZSA0IGJ5dGVzIHRvZ2V0aGVyIHdpdGgg
MiBieXRlcyBmb3IgQkJNCj4gKwkJICogYnkgcmVkdWNpbmcgaXQncyBsZW5ndGg6Cj4gIAkJICoK
PiAtCQkgKiBvb2JfcmVnaW9uLT5vZmZzZXQgPSBORkNfU1lTX0RBVEFfU0laRSArIDI7Cj4gKwkJ
ICogb29iX3JlZ2lvbi0+bGVuZ3RoID0gcmtuYW5kLT5tZXRhZGF0YV9zaXplIC0gTkZDX1NZU19E
QVRBX1NJWkUgLSAyOwo+ICAJCSAqLwo+ICAJCWlmICghaSkKPiAgCQkJbWVtY3B5KHJrX25mY19v
b2JfcHRyKGNoaXAsIGkpLAo+IEBAIC05NDUsMTIgKzk0Niw4IEBAIHN0YXRpYyBpbnQgcmtfbmZj
X29vYmxheW91dF9mcmVlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwKPiAgCWlm
IChzZWN0aW9uKQo+ICAJCXJldHVybiAtRVJBTkdFOwo+IAo+IC0JLyoKPiAtCSAqIFRoZSBiZWdp
bm5pbmcgb2YgdGhlIE9PQiBhcmVhIHN0b3JlcyB0aGUgcmVzZXJ2ZWQgZGF0YSBmb3IgdGhlIE5G
QywKPiAtCSAqIHRoZSBzaXplIG9mIHRoZSByZXNlcnZlZCBkYXRhIGlzIE5GQ19TWVNfREFUQV9T
SVpFIGJ5dGVzLgo+IC0JICovCj4gIAlvb2JfcmVnaW9uLT5sZW5ndGggPSBya25hbmQtPm1ldGFk
YXRhX3NpemUgLSBORkNfU1lTX0RBVEFfU0laRSAtIDI7Cj4gLQlvb2JfcmVnaW9uLT5vZmZzZXQg
PSBORkNfU1lTX0RBVEFfU0laRSArIDI7Cj4gKwlvb2JfcmVnaW9uLT5vZmZzZXQgPSAyOwo+IAo+
ICAJcmV0dXJuIDA7Cj4gIH0KPiAtLQo+IDIuMzAuMgo+IAoKClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
