Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024A2C2A09B
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 14:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=voixTr4kTYPfKpG+oVVfHdcE7+AInj2LpSBdAqUdjxQ=; b=pFnWUBfDnxcpe9
	xyMcilWac6UjNJlzDBJkApuidh1ab1R9FR97yRz5EquIbtkxPaynNKDDFUeLpwc1Z67v/a8lz6mHA
	kbeWgR+pOjJ9hHbDoQkZfBis+qQ78o74M6NHqulB1E/vmnqr6v+gzJCmo8xpphbZ0buGWK/QFs374
	H5U+E6cAaYFFbnKF3BVOZT/NDjjm1IvOVelgNpEpaAy62G/jbSsrzY80BiGxqxdw/RP004Hn0luqP
	A9bcBXpKRsMXAXqQ+2LquPc7wg9zh5e/I2iLFuezXZZAdcwTR9efAUtXPLcRyzh9WBfohG7DQqC0t
	3nFbpZYohYncqUxjO1Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL7K-00000008DIG-32kL;
	Fri, 07 Aug 2026 14:00:10 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL7I-00000008DGy-0ukt
	for linux-mtd@lists.infradead.org;
	Fri, 07 Aug 2026 14:00:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B68CD1A14AF;
	Fri,  7 Aug 2026 14:00:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8416C603F0;
	Fri,  7 Aug 2026 14:00:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6099811C37961;
	Fri,  7 Aug 2026 16:00:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786111205; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sB9VxuqALQwrBeXPwHmokBPdEY6c1fmoxnp6wovATlE=;
	b=epXFGuAfuU0GRB3UwM6B0HSdKC1jG/MpIUHuwmS511qPTiBwC5t+4XD/q6aDyEw9U/xxTw
	wJ4wN4QsECOaOC+u2ojQaQV8W2mPBpOwXVAwRKexYZKuOKxvwlcy5Y88vaI9vkzW8CH2J7
	RYcsnjbraQ2jQcaR9Xq8Fk7qblNEYxLBXdayPoasy3oupgYmqgUN1eK1yZtuc9hlvnPTlS
	4vdIQnNqTdYx3P1SljCfmgLrrY7OFL0tbf3cefSZNlOm/S9na4euFCs44oNCGB6GvPyeVK
	hr7SNHLFtzggk7tYOB1vbxM4jhaD/Zplhs3/00+xadU8Fw85WrZCkIiObqMcqQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260717164202.3099982-1-james.hilliard1@gmail.com>
References: <20260717164202.3099982-1-james.hilliard1@gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: sunxi: add H616 MBUS DMA support
Message-Id: <178611120394.758547.12981488112151990618.b4-ty@bootlin.com>
Date: Fri, 07 Aug 2026 16:00:03 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_070008_389479_3C9CF624 
X-CRM114-Status: UNSURE (   9.65  )
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

T24gRnJpLCAxNyBKdWwgMjAyNiAxMDo0MTo1OCAtMDYwMCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6
Cj4gVGhlIEg2MTYgTkFORCBjb250cm9sbGVyIHVzZXMgYSBkZXNjcmlwdG9yLWJhc2VkIGludGVy
bmFsIE1CVVMgRE1BCj4gZW5naW5lIGluc3RlYWQgb2YgdGhlIGRpcmVjdCBhZGRyZXNzIGFuZCBj
b3VudCByZWdpc3RlcnMgdXNlZCBieSB0aGUKPiBBMjMvQTMzIGNvbnRyb2xsZXIuIFNpbmNlIHRo
ZSBkcml2ZXIgZG9lcyBub3Qgc3VwcG9ydCB0aGVzZSBkZXNjcmlwdG9ycywKPiBpdCBjdXJyZW50
bHkgYXR0ZW1wdHMgdG8gcmVxdWVzdCBhbiBleHRlcm5hbCByeHR4IERNQSBjaGFubmVsIGFuZCBm
YWxscwo+IGJhY2sgdG8gUElPIHdoZW4gbm9uZSBpcyBwcm92aWRlZC4KPiAKPiBBZGQgYSBzaW5n
bGUtZGVzY3JpcHRvciBiYWNrZW5kIHRvIHRoZSBleGlzdGluZyBFQ0MgcGFnZSBETUEgcGF0aHMu
Cj4gQWxsb2NhdGUgdGhlIGRlc2NyaXB0b3IgY29oZXJlbnRseSwgY29uc3RyYWluIGRhdGEgbWFw
cGluZ3MgdG8gdGhlCj4gY29udHJvbGxlcidzIDMyLWJpdCBhZGRyZXNzIHJhbmdlLCBwcm9ncmFt
IHRoZSBINi1zdHlsZSBkYXRhIGJsb2NrIG1hc2ssCj4gYW5kIHJlcXVlc3QgYW4gaW50ZXJydXB0
IGZvciBib3RoIGNvbW1hbmQgYW5kIERNQSBjb21wbGV0aW9uLiBLZWVwIHRoZQo+IGV4aXN0aW5n
IGV4dGVybmFsIERNQSBhbmQgbGVnYWN5IE1CVVMgRE1BIHBhdGhzIHVuY2hhbmdlZCwgYW5kIGZh
bGwgYmFjawo+IHRvIFBJTyBpZiB0aGUgZGVzY3JpcHRvciBjYW5ub3QgYmUgYWxsb2NhdGVkLgo+
IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRkOiByYXdu
YW5kOiBzdW54aTogYWRkIEg2MTYgTUJVUyBETUEgc3VwcG9ydAogICAgICBjb21taXQ6IDVlZTM3
ZGIzNDYzN2NhNmUzM2NlMDFkNzA2MmNiMzEyNzU0ODQ0MDQKClBhdGNoZShzKSBzaG91bGQgYmUg
YXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQ
UiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2Fy
ZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
