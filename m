Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4F9C4167B
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jan 2023 09:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BWEtozA4XCHy5w2bCKmUef73BqRZPiiLb7O89L6iMQI=; b=RFAkrDIVmjDfUt
	1Q0JZv76l4S1fnwqSVk0vUsFjwomga3Pw1aVWlYZRr+JzGVIBNizvbp48q+BAVZUYLmu+mHA4Z2Ng
	9X3SuVKG6bgsY93Sx+gJ8PMCPOjcvPaGQBurcTD+hXQjeATAXQuWxBGaVVsF2uhSv9Td2J7j2H3pL
	c+JRvCE5W9k0z9WH4rw1gSzU5kLhm3FvgIsmn6YFtMcT4j8xVLttd7+0qYyzriGTBtsh836jA9Qt4
	7zL6gqu4sTmEpn1MY2/kgRWBcYRMC4D5VbU22jV8wnzFQh8UksU5/oZRyEbnfLmM8alBF+46b2szG
	UyDLo/jyG6O3+iy4kd7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCGip-009fAq-RS; Mon, 02 Jan 2023 09:03:08 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCGfE-009dtx-QH; Mon, 02 Jan 2023 08:59:28 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BD1BA1BF204;
	Mon,  2 Jan 2023 08:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672649957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=onwm0vxTtpJ/7A/xd568TVQxILdHEoQevXcykzJqiG8=;
	b=Z//qXKKap68bm1zIwDki2VQy7UojW4glXIhi22NRwxF2GBP2wWOlV2q79Ns6y/YOPHaMMZ
	uEBpt/PV660NvzmLSutFmJpAvdsKvpDcn2Ns2QcdO3p+pPfkIx2s1SCngH2rQ41sa8m4ym
	w4uJmhemLJE8gJd3zH2Y+v1CHWCg1yNy3bSpqq0o42xcp4a243K7a+oW0F9vFx2ONK2muO
	CP2fsj+YnJZjXmDPTiQx9vgMUosfZ4B0TGmt8nuJf3t9iOdQv1lX+92zV4T0fSoRToNWks
	Dv9pJK4ngsM78ToMT+X1fcTPSFD85WV2qTkI8amBQ7SMVm9MacwpWUg5j7pmrA==
Date: Mon, 2 Jan 2023 09:59:11 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Brian
 Norris <computersforpeace@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/7] mtd: rawnand: sunxi: Remove an unnecessary check
Message-ID: <20230102095911.0243d5b8@xps-13>
In-Reply-To: <20221229181526.53766-3-samuel@sholland.org>
References: <20221229181526.53766-1-samuel@sholland.org>
	<20221229181526.53766-3-samuel@sholland.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_005925_262596_E8A33CA0 
X-CRM114-Status: GOOD (  15.10  )
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

SGkgU2FtdWVsLAoKc2FtdWVsQHNob2xsYW5kLm9yZyB3cm90ZSBvbiBUaHUsIDI5IERlYyAyMDIy
IDEyOjE1OjIxIC0wNjAwOgoKPiBzdW54aV9uYW5kLT5uc2VscyBjYW5ub3QgYmUgemVybywgc28g
dGhlIHNlY29uZCBjaGVjayBpbXBsaWVzIHRoZSBmaXJzdC4KCkFjdHVhbGx5IHRoaXMgY2hlY2sg
Y29tZXMgZnJvbSBhIHRpbWUgd2hlcmUgd2UgZGlkIGNoZWNrIGFnYWluc3QgLTEgOikKQnV0LCB5
ZWFoLCBub3cgaXQncyBhIGR1cGxpY2F0ZS4KCj4gU2lnbmVkLW9mZi1ieTogU2FtdWVsIEhvbGxh
bmQgPHNhbXVlbEBzaG9sbGFuZC5vcmc+Cj4gLS0tCj4gCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3
L3N1bnhpX25hbmQuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N1bnhp
X25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N1bnhpX25hbmQuYwo+IGluZGV4IDJlZTg2
ZjdiMDkwNS4uOGIyMjFmOWYxMGE3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3
L3N1bnhpX25hbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N1bnhpX25hbmQuYwo+
IEBAIC00MjEsNyArNDIxLDcgQEAgc3RhdGljIHZvaWQgc3VueGlfbmZjX3NlbGVjdF9jaGlwKHN0
cnVjdCBuYW5kX2NoaXAgKm5hbmQsIHVuc2lnbmVkIGludCBjcykKPiAgCXN0cnVjdCBzdW54aV9u
YW5kX2NoaXBfc2VsICpzZWw7Cj4gIAl1MzIgY3RsOwo+ICAKPiAtCWlmIChjcyA+IDAgJiYgY3Mg
Pj0gc3VueGlfbmFuZC0+bnNlbHMpCj4gKwlpZiAoY3MgPj0gc3VueGlfbmFuZC0+bnNlbHMpCj4g
IAkJcmV0dXJuOwo+ICAKPiAgCWN0bCA9IHJlYWRsKG5mYy0+cmVncyArIE5GQ19SRUdfQ1RMKSAm
CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
