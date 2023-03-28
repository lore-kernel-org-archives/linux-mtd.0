Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAD6C76196
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 13:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1XqFvmkJyasNzsEQuW2Y3QgDGC/j8BNVRlhJgrKAPNI=; b=HV6hd2tj3jWYBqdlf/F8phordw
	EnHb5vSLv1HDI6n/Rnr4ZpglY38ryElA2tQ2gvy/QfJGhcGwXOx6eN4ksut9byueFhLIep4BFXR7T
	7R+1D2ekxIAQ1qCodOoath152EogyjYatMliWfLJHeuREyz+gUBDcECavxXcWmv9eUnnK8hTpFwIS
	X8NIgeSjVdGAvlNmOCsOi05Mfi0VN1Oar2YfpVIRh7mzj9yyYC7wJtItCfRDgXY0tA+B7RpxLIBsb
	RVrueMz/3mG7+mImTZIseclrUTPcmXpyUstoehYK/obAIn7sd0X/NTbP9lUsxZEDOhbgom9vqFjC8
	alCo9m9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph9H6-00EYbn-1p;
	Tue, 28 Mar 2023 13:22:08 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph9H3-00EYY9-0t
	for linux-mtd@lists.infradead.org;
	Tue, 28 Mar 2023 13:22:07 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 86ABF64548A5;
	Tue, 28 Mar 2023 15:21:51 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id xKZKaNllip0A; Tue, 28 Mar 2023 15:21:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 30EE864548B6;
	Tue, 28 Mar 2023 15:21:51 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id NMSP10wv6tYQ; Tue, 28 Mar 2023 15:21:51 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 1579B64548A5;
	Tue, 28 Mar 2023 15:21:51 +0200 (CEST)
Date: Tue, 28 Mar 2023 15:21:50 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Bang Li <libang.linuxer@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1785377500.357636.1680009710991.JavaMail.zimbra@nod.at>
In-Reply-To: <20230328145848.5c7e4f14@xps-13>
References: <20230323140350.69908-1-libang.linuxer@gmail.com> <20230328145848.5c7e4f14@xps-13>
Subject: Re: [PATCH] mtdblock: tolerate corrected bit-flips
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: mtdblock: tolerate corrected bit-flips
Thread-Index: IScXBlLI190GBUfLWxK6EVGzIzw6pA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_062205_483296_6C978D87 
X-CRM114-Status: UNSURE (   6.20  )
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

SGkhCgotLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gbGliYW5nLmxpbnV4ZXJAZ21h
aWwuY29tIHdyb3RlIG9uIFRodSwgMjMgTWFyIDIwMjMgMjI6MDM6NTAgKzA4MDA6Cj4gCj4+IG10
ZF9yZWFkKCkgbWF5IHJldHVybiAtRVVDTEVBTiBpbiBjYXNlIG9mIGNvcnJlY3RlZCBiaXQtZmxp
cHMuVGhpcwo+PiBwYXJ0aWN1bGFyIGNvbmRpdGlvbiBzaG91bGQgbm90IGJlIHRyZWF0ZWQgbGlr
ZSBhbiBlcnJvci4KPiAKPiBJJ20gZmluZSB3aXRoIHRoZSBwYXRjaCwgUmljaGFyZCwgYXJlIHlv
dSBva2F5IGFzIHdlbGw/CgpIbSB5ZXMuIEkgc2VlIHRoZSBidWcuIEkgdGhpbmsgaXQgYnJva2Ug
YWJvdXQgMTAgeWVhcnMgYWdvCmJ5IGU0N2Y2ODU4N2I4MiAoIm10ZDogY2hlY2sgZm9yIG1heF9i
aXRmbGlwcyBpbiBtdGRfcmVhZF9vb2IoKSIpLgoKSW4gdGhlIGVhcmx5IGRheSBJJ2QgZXhwZWN0
IHNvbWVvbmUgdG8gaGl0IHRoaXMgYnVnIGJ1dCBJIGd1ZXNzCm9uIHRoZSBsYXN0IDEwIHllYXJz
IG10ZGJsb2NrIGhhZCBubyByZWFsIHVzZXJzLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
