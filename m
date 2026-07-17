Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446CFC4451B
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2026 15:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EmQ/+gQHXiIq0naeMRPxI62vfU2No1OeeNcIuKI2ymM=; b=YZJaf0LEYKbVpw
	C9dWR5pDihrP63hWYJFW+H2ij1zoez4rK+sUveCH3KUjEJ5AQ7+YGwjRbUeX8NHLKcW21AOZ8iClS
	yxTtFfFoqQ9m7gdL311MnH7jZskPADKf9CsHDR+AuulV420ES2ZoYLqCdcO2eESaY/cB0OjsyyXco
	GS3ZCK/kGhB7sWwloXMCHXvwToBcMCfmk2YquoEPvyCEa8OZ/21UkL53eSBf1ULqSSO36kqse4F3k
	v1UNqsArOaAwoIHC6iWvG5byhTGACy6hE2VuK9vbLpiKuxciWe9Tj6f6wBSoFFbvSzmzP9oEpfuaN
	9cXjGwnR040eahnkESzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkpt-00000002fCQ-0zPI;
	Fri, 17 Jul 2026 15:50:49 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkpq-00000002f8d-0P86
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jul 2026 15:50:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 95C1A4E40E20;
	Fri, 17 Jul 2026 15:50:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6306E60361;
	Fri, 17 Jul 2026 15:50:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD60211BD091E;
	Fri, 17 Jul 2026 17:50:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784303443; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=B/rbdOZKw//vikPJYlkiiNZdWdaqryk4H4yoO6Hdcac=;
	b=vDvsyNiYnt6TNQOmTkTP8NaGA3jyOqgFRzISCQoXme27o3TqBa4PyZmv3H2b9n4AwSJTB1
	KRPBU4iKAJhfMlae2ejyiy+pooYYi6DZ2ltD92jLw0krBUc5JHNvioL/tpm6WI9wvvv0vs
	NGDnFm746w8Vd+n451UsTLeFX8GHX353mrXzmUW1QyHL5H08IMyCfa238X2bgdkpB+L/rA
	VVzQe6UAWcx1BYKtvw4fLxugzGr9Lk7lU7Q2l8upswO9H7i/imixAEAH4vqqppeFG7Oavd
	X84oq9ABGV+riq61N4x41GBRnKi/y8zkMwyEzBBJfwyW4UalHl2kEzAIfJOJYA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, Ruoyu Wang <ruoyuw560@gmail.com>
Cc: mrugiero@gmail.com, computersforpeace@gmail.com, bbrezillon@kernel.org, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260708143355.3166755-1-ruoyuw560@gmail.com>
References: <20260708143355.3166755-1-ruoyuw560@gmail.com>
Subject: Re: [PATCH] mtd: mtdswap: Avoid freeing registered blktrans device
 twice
Message-Id: <178430344276.4129650.13411948212723306640.b4-ty@bootlin.com>
Date: Fri, 17 Jul 2026 17:50:42 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_085046_276875_460532C1 
X-CRM114-Status: UNSURE (   4.98  )
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

T24gV2VkLCAwOCBKdWwgMjAyNiAyMjozMzo1NSArMDgwMCwgUnVveXUgV2FuZyB3cm90ZToKPiBJ
biBtdGRzd2FwX2FkZF9tdGQoKSwgZGVidWdmcyBzZXR1cCBmYWlsdXJlIGFmdGVyIHN1Y2Nlc3Nm
dWwgYmxrdHJhbnMKPiByZWdpc3RyYXRpb24gY2FuIGZyZWUgbWJkX2RldiB0d2ljZS4KPiAKPiBh
ZGRfbXRkX2Jsa3RyYW5zX2RldigpIGluaXRpYWxpemVzIHRoZSBibGt0cmFucyBkZXZpY2UgcmVm
ZXJlbmNlIGFuZAo+IHB1Ymxpc2hlcyB0aGUgZGlzay4gT25jZSB0aGF0IHN1Y2NlZWRzLCBkZWxf
bXRkX2Jsa3RyYW5zX2RldigpIHRlYXJzIHRoZQo+IGRpc2sgZG93biBhbmQgZHJvcHMgdGhlIGJs
a3RyYW5zIHJlZmVyZW5jZTsgd2hlbiB0aGF0IHJlZmVyZW5jZSByZWFjaGVzCj4gemVybywgYmxr
dHJhbnNfZGV2X3JlbGVhc2UoKSBmcmVlcyB0aGUgbXRkX2Jsa3RyYW5zX2Rldi4KPiAKPiBbLi4u
XQoKQXBwbGllZCB0byBtdGQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRkOiBtdGRzd2FwOiBBdm9p
ZCBmcmVlaW5nIHJlZ2lzdGVyZWQgYmxrdHJhbnMgZGV2aWNlIHR3aWNlCiAgICAgIGNvbW1pdDog
Nzc5YWE0YzY2YTk2YmY0M2QyZDYyOTgyZWExYTkwOTZhOTEyOGQ4NwoKUGF0Y2hlKHMpIHNob3Vs
ZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBu
ZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQg
cmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
