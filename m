Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F7EC4828F
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Feb 2024 17:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=egDtUODq53zeluelt+RX+cH7fYn1kGu2MKpv2cYvIts=; b=n+NFnXgk5v8Q4U
	whxyx/5/eks0LVNKbWHq70pdAW7m0WsOooySHXhDMy9UaWf06gz3SnXuZIFyUO47fgwkBreKQ0WZc
	pNcPSra9OpVwO1bQA55/biqbY4umneQ41knJFK1sVN9k7wEMFl64xXR5NcrjcQdhDS3zWZ9EJMhHd
	SoLusfYxqamFGEBUB54DG0eRvl6JepOLwR45XGd1KSPcLsmVbDbv4afinZCHodqitunL+uGOITDvA
	mTKbHl0nrK6R2mIs3GaAIX0/JlMiUpbMhxIcUS3Qb29/K1VaNe6UQpcZAQ1IYYxBt7LgBKK04J6Tx
	G33OOc9BkWrcdpwmXDuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVxhX-0000000Chc8-2xK2;
	Fri, 02 Feb 2024 17:51:43 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVxhU-0000000Chaq-2PpI
	for linux-mtd@lists.infradead.org;
	Fri, 02 Feb 2024 17:51:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 994CBC0003;
	Fri,  2 Feb 2024 17:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706896296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c+i0KNFkQLJry8JHNqqs0bB55zvrtN8pQoNyzAB4M2M=;
	b=CHvVrTen1AyOXJTTsMly9SFxD6g8OgR9h2u2G+P7dJ+1A+5ZoI8o2iN5xBbEo89Mc0WdxH
	TPL192is4rWu+jDbyTxMsXU3N8LWzhIcWEbJgVKukJu3kuGFF3IRak3h2zxS2Dmq8OeiGl
	oJQV8z9rCjwfKa9IiaWyt+rJR0pNRXHgACsnZRPD/DeXQGKAoo1h5LjE0sArn5qesSdVbP
	KcJeJ3Ihs447fxSrhfUVmO9m0dXTFWq2W7WiD5m/WwnL09C15vt2t6l0SBkApwSQsH/sfU
	kVNIvqJnwX1DZC7CxkUCdZU5Kh6/AZn0JIqBqdD5fY5Z8e7k4YxBf432Xb4HLw==
Date: Fri, 2 Feb 2024 18:51:31 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mohamed Sardi <moh.sardi@skyhighmemory.com>
Cc: "Changsub.Shim" <changsub.shim@skyhighmemory.com>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "p.yadav@ti.com" <p.yadav@ti.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "richard@nod.at" <richard@nod.at>,
 Mohammad Nada <Mohammad.nada@skyhighmemory.com>
Subject: Re: [SkyHigh Memory SPI NAND Driver]
Message-ID: <20240202185131.6324896b@xps-13>
In-Reply-To: <5BBDC99B-BD4B-44C3-8371-B1B12A303A58@skyhighmemory.com>
References: <7C13C29F-DBE0-494F-8BA6-99BB68FD08AF@skyhighmemory.com>
	<20240108144719.3198373e@xps-13>
	<SE2P216MB2102316F0F2D8134C755C37283682@SE2P216MB2102.KORP216.PROD.OUTLOOK.COM>
	<20240111083838.7f215daf@xps-13>
	<880CF70D-DC61-4E18-9A31-48A82A45CA3E@skyhighmemory.com>
	<20240124180716.71e26b8c@xps-13>
	<D726EA9A-1C18-4720-A87C-0340D675B514@skyhighmemory.com>
	<20240202171136.41699985@xps-13>
	<5BBDC99B-BD4B-44C3-8371-B1B12A303A58@skyhighmemory.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_095140_780807_B0D4021E 
X-CRM114-Status: UNSURE (   7.11  )
X-CRM114-Notice: Please train this message.
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

SGkgTW9oYW1lZCwKCm1vaC5zYXJkaUBza3loaWdobWVtb3J5LmNvbSB3cm90ZSBvbiBGcmksIDIg
RmViIDIwMjQgMTY6MTc6NDMgKzAwMDA6Cgo+IEhlbGxvIE1pcXVlbAo+IE1heWJlIG15IHF1ZXN0
aW9uIGlzIG5vdCBjbGVhci4gSXMgdGkgcG9zc2libGUgdG8gc2V0dXAgYSB0aW1lIHRvIGRpc2N1
c3MgZnVydGhlciBuZXh0IHdlZWsuIAo+IAo+IEkgYW0gbG9jYXRlZCBpbiBQYWNpZmljIFRpbWUu
IEkgY2FuIHNldHVwIGEgY29uZmVyZW5jZSBjYWxsLi4uIENhbiB5b3UgbGV0IG1lIGtub3cgd2hh
dCBkYXkgYW5kIHRpbWUgd29yayBmb3IgeW91IHNvIEkgY2FuIHNlbmQgdGhlIFpPT00gY2FsbD8K
Ckkgd291bGQgcHJlZmVyIGlmIHlvdSBjb3VsZCBiZSBtb3JlIHByZWNpc2UgYnkgZS1tYWlsLiBZ
b3UgYXJlIHRhbGtpbmcKdG8gdGhlIGNvbW11bml0eSBoZXJlLCBub3QganVzdCBtZS4KClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
