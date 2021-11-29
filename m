Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAC3C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Nov 2021 09:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/WyvZv4Rur1U110HAiqXGl1+XO/T6dWeleEMkZ24Lao=; b=pluJu53+gCAT2i
	cTubYV8lHi0YuAvghjYMpfzQV3ah1oLLnmuIf6IjEGbJ9WVgUm2DE7ggyERiIAPlL28bR2X2rrqy3
	NgPFoi9X5PW9SQRYMmqEmrtNH9puHrOITlox/KBqjJs3tGJY+T3SIWy8Ffzts7trYP2iH0jmJbPT/
	Z8ywXBEbK2nS15pn7RSgcG6OHwYXPArlOI2MTbCqO6bpxnUwyNzzqcfQnt8D9NcD59mUxYqYwgBfN
	94nTjpE9RHAAb7W9PJwZ3fbFONK0b/zuEaZHL3cXDdhrcGxjV+hjJbLD9Ouc0pTOdGQNPgL0l50wv
	OWCLxUo2l0vEymxkz13w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrcog-000Dc4-7u; Mon, 29 Nov 2021 09:19:18 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrcod-000Db5-LP
 for linux-mtd@lists.infradead.org; Mon, 29 Nov 2021 09:19:17 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 36F2E200008;
 Mon, 29 Nov 2021 09:19:09 +0000 (UTC)
Date: Mon, 29 Nov 2021 10:19:08 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Sean Nyekjaer <sean@geanix.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] mtd: core: protect access to MTD devices while
 in suspend
Message-ID: <20211129101908.6f1aa715@xps13>
In-Reply-To: <20211123140715.280b2f70@collabora.com>
References: <20211102110204.3334609-1-sean@geanix.com>
 <20211102110204.3334609-4-sean@geanix.com>
 <CGME20211123120353eucas1p2fb2561b7cfddd8d6e7decaef8b504f4c@eucas1p2.samsung.com>
 <21092c0f-e11b-ac16-ab96-2a0556c0e30a@samsung.com>
 <20211123125012.ibzqu44ixmykbhkt@skn-laptop>
 <20211123140715.280b2f70@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_011915_857327_FD527BE8 
X-CRM114-Status: GOOD (  13.54  )
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

SGkgU2VhbiwKCmJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tIHdyb3RlIG9uIFR1ZSwgMjMg
Tm92IDIwMjEgMTQ6MDc6MTUgKzAxMDA6Cgo+IE9uIFR1ZSwgMjMgTm92IDIwMjEgMTM6NTA6MTIg
KzAxMDAKPiBTZWFuIE55ZWtqYWVyIDxzZWFuQGdlYW5peC5jb20+IHdyb3RlOgo+IAo+ID4gQEJv
cmlzIGRvIHdlIG5lZWQgdG8gZG8gc29tZXRoaW5nIHNpbWlsYXIgaGVyZSB0byB3aGF0IHdlIGRp
ZCB3aXRoIHRoZQo+ID4gbXRkY29uY2F0IHN0dWZmPyAgCj4gCj4gQWJzb2x1dGVseSwgcGh5c21h
c3Agc3ViZGV2aWNlcyBhcmUgbmV2ZXIgaW5pdGlhbGl6ZWQvcmVnaXN0ZXJlZCwgc28KPiB5b3Ug
Y2FuJ3QgY2FsbCBhbnkgb2YgdGhlIG10ZCBoZWxwZXJzIHRha2luZyB0aGUgc3VzcGVuZCBsb2Nr
IG9uIHRob3NlLgo+IEkgZ3Vlc3MgaXQnZCBiZSBiZXR0ZXIgdG8gY2FsbCBtdGRfc3VzcGVuZC9y
ZXN1bWUoKSBvbiB0aGUgY29uY2F0IGRldmljZQo+IGluIHRob3VnaDoKCkFueSBjaGFuY2UgdGhh
dCB5b3Ugd2lsbCBjb21lIHVwIHdpdGggYSBmaXggb3IgdjYgb2YgdGhlIHNlcmllcyBhbnl0aW1l
CnNvb24/Cgo+IAo+IHN0YXRpYyB2b2lkIHBoeXNtYXBfZmxhc2hfc2h1dGRvd24oc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqZGV2KQo+IHsKPiAJc3RydWN0IHBoeXNtYXBfZmxhc2hfaW5mbyAqaW5m
byA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKGRldik7Cj4gCj4gCW10ZF9zdXNwZW5kKGluZm8tPmNt
dGQpOwo+IH0KCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
