Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5C5CE8D6B
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Nov 2025 10:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZrhGE9oYd2oI58s8SX5vaZ6ajLb0n8FUSmKMv9t0XG8=; b=4XVry33BgljtdO
	Twi7o2UP2O6NQqetd3v3jFeN8wDi9XbLkafWVKhuEJ7KpSlIeBTDMWYG0izrdN0JsoSqlbfjrAUnu
	S0HaPDFuRQ3NpQvGY9InrQ31KiennTydfCvflg4x/If3iAOobEl6raLMWzdcVP4RXtoM5owqc6bIU
	ov5tB7HRw1dCuysA99zbpIdwI6mnLggEa+TkFewT7SURNRLpyquTZ1Dzd+EZEBFy0Qkr1oHEM3jxL
	uCqpEA595ZvxZWVtaUgaAC80SV/8BLsK4uRRuqCFiyAvqH6oo/kTdM7MjHfCj1k7Sc8XoscCZkxiA
	/QBlHdlGXWgoxI+OzlGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwsl-0000000Fv1G-08II;
	Mon, 17 Nov 2025 10:54:51 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwsh-0000000Fv0b-3Ec3
	for linux-mtd@lists.infradead.org;
	Mon, 17 Nov 2025 10:54:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6D5E61A1A1C;
	Mon, 17 Nov 2025 10:54:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FF85606B9;
	Mon, 17 Nov 2025 10:54:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BEF9310371C4A;
	Mon, 17 Nov 2025 11:54:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763376883; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mMectNnRPab7BhFVYKDAdCzLnLVlb2FUpd/eKC07nLU=;
	b=acRHh+hSRhww8tgmKa/NtJk5CI7EcOPC/Oqw8ciXO9z3nMeuawl1c1sVuUTNXbZVpqAUYy
	ctGW9kyePbWaev3o2znY9xjvH1OFmVxjbLBMcVZ8udGlzyOekkObvjCmrnU61A0YuOr1wq
	lw6rK3mbKg6R3z8TYXG/eq9YpDbPXqm67DsNMRqcwb+1n/j8HOPGacvBeMyMrZn2ylxNmW
	0Scm9bQhKdIXwHgP5LlaR6tvTYaz6IY0lB0Dx96pbWwOuJpkhJJbZvnwCMq40B/jq0m31U
	eE3ucWFUL6cpc2fqZOL6ssMgCwrxuCFCQaKfID7LzabBN41kg3XDWIMBEady3A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Christian Marangi <ansuelsmth@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] mtd: mtdpart: ignore error -ENOENT from parsers on subpartitions
Date: Mon, 17 Nov 2025 11:54:33 +0100
Message-ID: <176337662462.1740091.7879288362167135698.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251109115247.15448-1-ansuelsmth@gmail.com>
References: <20251109115247.15448-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_025447_951196_E24AB09F 
X-CRM114-Status: GOOD (  11.18  )
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

T24gU3VuLCAwOSBOb3YgMjAyNSAxMjo1Mjo0NCArMDEwMCwgQ2hyaXN0aWFuIE1hcmFuZ2kgd3Jv
dGU6Cj4gQ29tbWl0IDVjMmY3NzI3ZDQzNyAoIm10ZDogbXRkcGFydDogY2hlY2sgZm9yIHN1YnBh
cnRpdGlvbnMgcGFyc2luZwo+IHJlc3VsdCIpIGludHJvZHVjZWQgc29tZSBraW5kIG9mIHJlZ3Jl
c3Npb24gd2l0aCBwYXJzZXIgb24gc3VicGFydGl0aW9ucwo+IHdoZXJlIGlmIGEgcGFyc2VyIGVt
aXRzIGFuIGVycm9yIHRoZW4gdGhlIGVudGlyZSBwYXJzaW5nIHByb2Nlc3MgZnJvbSB0aGUKPiB1
cHBlciBwYXJzZXIgZmFpbHMgYW5kIHBhcnRpdGlvbnMgYXJlIGRlbGV0ZWQuCj4gCj4gTm90IGNo
ZWNraW5nIGZvciBlcnJvciBpbiBzdWJwYXJ0aXRpb25zIHdhcyBvcmlnaW5hbGx5IGludGVuZGVk
IGFzCj4gc3BlY2lhbCBwYXJzZXIgY2FuIGVtaXQgZXJyb3IgYWxzbyBpbiB0aGUgY2FzZSBvZiB0
aGUgcGFydGl0aW9uIG5vdAo+IGNvcnJlY3RseSBpbml0IChmb3IgZXhhbXBsZSBhIHdpcGVkIHBh
cnRpdGlvbikgb3Igc3BlY2lhbCBjYXNlIHdoZXJlIHRoZQo+IHBhcnRpdGlvbiBzaG91bGQgYmUg
c2tpcHBlZCBkdWUgdG8gc29tZSBFTlYgdmFyaWFibGVzIGV4dGVybmFsbHkKPiBwcm92aWRlZCAo
ZnJvbSBib290bG9hZGVyIGZvciBleGFtcGxlKQo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG10ZC9u
ZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6IG10ZHBhcnQ6IGlnbm9yZSBlcnJvciAtRU5PRU5UIGZy
b20gcGFyc2VycyBvbiBzdWJwYXJ0aXRpb25zCiAgICAgIGNvbW1pdDogNjRlZjVmNDU0ZTE2N2Ji
NjZjZjcwMTA0ZjAzM2MzZDcxZTZlZjljMAoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUg
b24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRl
ZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
