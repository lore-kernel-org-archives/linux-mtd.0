Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A22CD5BD1
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2026 07:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=evdSP6FflhpOOm4aP8/vKdpwzjm+Ggr7x/TBy+bY658=; b=tcPKYsz3Ij20Hc
	930XvRjuzOafzlDBkhTsvuFrgFI0HtqLWSjCMBGOyHDZNl2dpFVWLtcjoOUg5LkjOP6tHJRaPmdn4
	xpSYORXcdM8hv/GHYkio5njtk/dQzPA3IqjMr63UB3b1sOlOQ/moKgGZl7XKpWjjcVcXDtxKetTmB
	P7+KVUZc32NgUmzfPNQNapQlUQgP6uRogfEaZYpH1CSSj36uOcV+z9lzuGLMJrWzRiLnZuRspfKuh
	K+mXgBRCvCNZTGAisD7T5bG7uokFE0/aZt+W6T3LH0t6iWLP3GgjIkAg9iiB52oAVRHqtvI2lJHm2
	bfFcVojfLHDd8TCwwRVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVNj-00000005HwU-2j3J;
	Thu, 28 May 2026 07:42:19 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVNg-00000005Hrs-2SbA
	for linux-mtd@lists.infradead.org;
	Thu, 28 May 2026 07:42:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F25C2C62443;
	Thu, 28 May 2026 07:42:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0DB060495;
	Thu, 28 May 2026 07:42:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 310C51088806E;
	Thu, 28 May 2026 09:42:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779954130; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JG+4WJntSimt2FPv7soTEK4i7pajIv6cOg6yuhgnh2o=;
	b=nk8AdHTskLd24iFJo+Muuy6Y2J/PSUg/ztetS7mediHMLwiTkvVg4S7XDJed4dShSjLu/X
	TtBudKv7nziTpJGHNa1pExRv+Skp7HkIH5NR0ZdDS9At+sR5dMwpsJ3qRunRyUEy+KZ8Sn
	G+vmOa4/hCL0MjSBD8K0VNh8Ceq1K1KurS7kkLEjGWJWwS44xaLgr9a3YaupkbL6xJWm/0
	Dv8lwv5Dej2np5PlcCtiIZZd9K6lP7x6S0LZpUyNL7aRONeaBuIZqKZnSSdV5Zea1cS+yf
	8l9PuKHUlB/kXzIKIirX53J1aDoRad2GfEll/nSLmaGjKcTwuQDSPQBnOku8AQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: Michael Walle <mwalle@kernel.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  alvinzhou@mxic.com.tw,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>
Subject: Re: [PATCH] mtd: spi-nor: Add support for MX25L12833F and MX25L12845G
In-Reply-To: <CAAyq3SY86mVwYtQMqhcZHjTxiD93awQZPDzHr8e5-+B9caNgbA@mail.gmail.com>
	(Cheng Ming Lin's message of "Thu, 28 May 2026 15:19:36 +0800")
References: <20260528051751.1648246-1-linchengming884@gmail.com>
	<DIU3OK3ELUD5.CUL6R3KNX0O9@kernel.org>
	<CAAyq3SY86mVwYtQMqhcZHjTxiD93awQZPDzHr8e5-+B9caNgbA@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 28 May 2026 09:42:03 +0200
Message-ID: <87eciwhtf8.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_004216_809434_1AB3BC60 
X-CRM114-Status: GOOD (  16.02  )
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

SGkgQ2hlbmcgTWluZywKCj4+IEl0IGxvb2tzIGxpa2UgeW91J3JlIGdldHRpbmcgYml0dGVuIGJ5
IHRoZSBJRCByZXVzZS4gWW91IGNhbid0IGp1c3QKPj4gdW5jb25kaXRpb25hbGx5IGFkZCB0aGUg
cXVhZCBQUCBiZWNhdXNlIGFzIGZhciBhcyBJIGNhbiBzZWUgdGhlCj4+IE1YMjVMMTI4MDVEIFsx
XSBpcyBqdXN0IGEgc3RhbmRhcmQgc2luZ2xlIGJpdCBpL28gZmxhc2ggYW5kIGRvZXNuJ3QKPj4g
c3VwcG9ydCB0aGUgNFBQLgo+Cj4gWW91IGFyZSBhYnNvbHV0ZWx5IHJpZ2h0LiBUaGFua3MgZm9y
IGNhdGNoaW5nIHRoaXMuCj4KPiBUaGUgTVgyNUwxMjgwNUQgaXMgaW5kZWVkIGEgbXVjaCBvbGRl
ciBwcm9kdWN0IChyZWxlYXNlZCBhcm91bmQgMjAwOSkuCj4gU2luY2UgdGhlIGluaXRpYWwgSkVT
RDIxNiBTRkRQIHN0YW5kYXJkIHdhc24ndCBwdWJsaXNoZWQgdW50aWwgMjAxMSwKPiBJIGRvdWJs
ZS1jaGVja2VkIHdpdGggb3VyIGludGVybmFsIFBNIGFuZCBjb25maXJtZWQgdGhhdCB0aGUgTVgy
NUwxMjgwNUQKPiBkb2VzIG5vdCBzdXBwb3J0IFNGRFAgYXQgYWxsLgo+Cj4gU2luY2UgdGhlIG5l
d2VyIGZsYXNoZXMgKE1YMjVMMTI4MzNGIGFuZCBNWDI1TDEyODQ1RykgZG8gc3VwcG9ydCBTRkRQ
LAo+IHdlIGNvdWxkIHVzZSB0aGlzIGFzIGEgZGlmZmVyZW50aWF0b3IgdG8gZGlzdGluZ3Vpc2gg
dGhlbSBmcm9tIHRoZSBsZWdhY3kKPiBNWDI1TDEyODA1RC4KPgo+IFdoYXQgaWYgd2UgdHJ5IHRv
IHJlYWQgdGhlIFNGRFAgc2lnbmF0dXJlIChSRFNGRFApIGluIHRoZSBmaXh1cCBob29rPwo+IElm
IGEgdmFsaWQgU0ZEUCBzaWduYXR1cmUgaXMgZGV0ZWN0ZWQsIHdlIGNhbiBzYWZlbHkgaWRlbnRp
ZnkgaXQgYXMgdGhlCj4gbmV3ZXIgZmxhc2ggYW5kIGFwcGx5IHRoZSBTTk9SX0hXQ0FQU19QUF8x
XzRfNCBjYXBhYmlsaXR5LiBJZiB0aGVyZSBpcwo+IG5vIFNGRFAgc2lnbmF0dXJlLCB3ZSBsZWF2
ZSBpdCBhcyBpcyBmb3IgdGhlIGxlZ2FjeSBNWDI1TDEyODA1RC4KPgo+IERvIHlvdSB0aGluayB0
aGlzIGFwcHJvYWNoIGlzIGZlYXNpYmxlIGFuZCBhY2NlcHRhYmxlPyBJZiBzbywgSSB3aWxsCj4g
aW1wbGVtZW50IHRoaXMgbG9naWMgYW5kIHN1Ym1pdCBhIHYyIHBhdGNoLgoKVGhlIC0+cG9zdF9z
ZmRwKCkgZml4dXAgaG9vayBpcyBkb2N1bWVudGVkIGFzICJub3QgY2FsbGVkIGZvciBTUEkgTk9S
cwp0aGF0IGRvIG5vdCBzdXBwb3J0IFNGRFAiLiBBbHRlcm5hdGl2ZWx5LCBJIGJlbGlldmUgYW4g
ZWFybGllciBob29rLApsaWtlIC0+cG9zdF9iZnB0KCkgY291bGQgYWxzbyB3b3JrIHNpbmNlIGl0
IGRvZXMgbm90IHNlZW0gdG8gcnVuIG9uCm5vbiBTRkRQIGNvbXBhdGlibGUgZmxhc2hlcy4KClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
