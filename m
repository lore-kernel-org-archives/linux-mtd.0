Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C60C5AE49
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 14:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yvmsSfTMeuRUth7kZkS/nDG4Mew+Pdtp8SOimSxNJEY=; b=UMGATokFAMUmOW
	czDtV4qgQTd/gtuYe1NFfQL8OU9NAGkuvlIygN6MD21qy8dpjngn4jpMhsc5G2jnD29nhYeCc2oLW
	Xp58T/GjHuspwcCllvMQSXMhyxCGv81LmyAKEpvH+UV0GAey2gzwSdyt+3ryqdEoXPHs77iCcvApH
	yOMtUHEu54tC+Z8AZ+feiy7uOFfBrE+Y+fwJYreYyKyliUW7NIRdaJ3L1HGLg4Dzls3JceeD9SsaA
	1n0C9EoVYnSHGE72Qh0z/Pr6X3yiQppA+McHe0URiHGHlZUjR56p60qVcPn8eSu4oScYrSifwUwKg
	RmikPTkpnVWn3do3RIcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQx4-0000000C0OE-0gMk;
	Mon, 10 Aug 2026 14:26:06 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQx1-0000000C0N8-2MOp
	for linux-mtd@lists.infradead.org;
	Mon, 10 Aug 2026 14:26:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3FB444E411AA;
	Mon, 10 Aug 2026 14:26:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 113176033B;
	Mon, 10 Aug 2026 14:26:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3546011C4A8B9;
	Mon, 10 Aug 2026 16:25:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786371955; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wO+cXkZt+topJfy8NdQFR79mWwPl4kfgdmUuuL3DDzA=;
	b=0Hv6b62vBOPQbozjljwug2VfT0fSg943Beu1OT2NhDbVVnhDhIkUY9PBI2m6S5t6cOg/pa
	WH97Ch6PZaAtdOwW5bS0xdGxazCL9apKC63/y3MysUwKJbyI6PhST+lF2db45YAyP3oubg
	pVDuwQzW4czhB8640hKUOmTL4lqckHMefpnSCoCOGi53qz4vgXi2LtQae2gxFlp5xj+6fC
	s07S9J0QepWqPDA1tSQs7N/LOq+6DSUEMPVAjwhmfWfQn9BdYcBt+DgUayegJa2isuFS+d
	KTGErDZ/axKgn1aLlixEADItLpzNVpiDNrlxr9o5uumfcDKvzdYi6tI+0l7ncw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20260807-submit-sunxi-nand-h6-h616-timings-v3-0-91287b543f41@gmail.com>
References: <20260807-submit-sunxi-nand-h6-h616-timings-v3-0-91287b543f41@gmail.com>
Subject: Re: [PATCH v3 0/3] mtd: rawnand: sunxi: fix H6/H616 controller
 timings
Message-Id: <178637195198.1098769.15933415840493831349.b4-ty@bootlin.com>
Date: Mon, 10 Aug 2026 16:25:51 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_072603_735368_C2F42CB5 
X-CRM114-Status: UNSURE (   7.32  )
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

T24gRnJpLCAwNyBBdWcgMjAyNiAwOTozODo1OCAtMDYwMCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6
Cj4gVGhlIHN1bnhpIE5BTkQgdGltaW5nIHNvbHZlciBjdXJyZW50bHkgYXBwbGllcyB0aGUgb3Jp
Z2luYWwgQTEwIE5ERkMKPiB0aW1pbmcgY2hhcmFjdGVyaXN0aWNzIHRvIGV2ZXJ5IHN1cHBvcnRl
ZCBjb250cm9sbGVyLiBUaGUgSDYvSDYxNiBOREZDCj4gdXNlcyB0d28gaW50ZXJuYWwgY3ljbGVz
IGZvciBzZXZlcmFsIHNldHVwIGFuZCBob2xkIGludGVydmFscyBhbmQgaGFzCj4gZGlmZmVyZW50
IGRlbGF5LWZpZWxkIGVuY29kaW5ncywgc28gdGhlIHJlc3VsdGluZyBjbG9jayBhbmQgdGltaW5n
Cj4gcmVnaXN0ZXIgdmFsdWVzIGRvIG5vdCBtYXRjaCB0aGUgaGFyZHdhcmUuCj4gCj4gUHJlcGFy
ZSBmb3IgcGVyLWNvbnRyb2xsZXIgdGltaW5nIGRhdGEgaW4gdHdvIGJlaGF2aW9yYWxseSBmb2N1
c2VkCj4gcGF0Y2hlcywgdGhlbiBhZGQgYW5kIHNlbGVjdCB0aGUgSDYxNiBjaGFyYWN0ZXJpc3Rp
Y3MgaW4gdGhlIGZpbmFsIGZpeC4KPiBMZWdhY3kgY29udHJvbGxlcnMgcmV0YWluIHRoZWlyIGV4
aXN0aW5nIHNldHVwLWN5Y2xlIGJlaGF2aW9yIGFuZCBkZWxheQo+IGVuY29kaW5ncy4KPiAKPiBb
Li4uXQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzNdIG10ZDogcmF3bmFuZDog
c3VueGk6IGdyb3VwIGNvbnRyb2xsZXIgZGVsYXkgdGFibGVzCiAgICAgIGNvbW1pdDogOWYyZTAz
Mzc1NGM2YzAyMzE1MGYxODRiNGU3MmJiY2M1ZDZlZWExMwpbMi8zXSBtdGQ6IHJhd25hbmQ6IHN1
bnhpOiBkZXNjcmliZSB0QURMIGFuZCB0V0hSIGRlbGF5cwogICAgICBjb21taXQ6IDE0N2YyYTU3
NDNmODg2NGJmYzI2NTY1NGIxODU2YWYxMWM4YzAwMzEKWzMvM10gbXRkOiByYXduYW5kOiBzdW54
aTogZml4IEg2L0g2MTYgY29udHJvbGxlciB0aW1pbmdzCiAgICAgIGNvbW1pdDogMTVhM2NiY2Uz
Mjk5NDE0MTI1MmJiNGVjZmUzZmYzYTVkMjJkMGI0ZgoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFp
bGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChw
cm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywK
TWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
