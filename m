Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0E4606A31A
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 02:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=urBcOA6U;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mC6MH6Ne
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vSn27LPpNUrWBJz7bKa5mT57M35k/3QWnEEzko/7lEI=; b=urBcOA6UXTebPlwbYEPyGpfRn+
	Wv3zz3iCgq/2LnTDIQYuUzkx0R9Zin0RYTtweqWjc55wN3v0KZ9vkZDJyO5H1OU660TmnwQz8Ix7v
	012V9LstsPz871NxFiJcppBV07U8OFRD28oc4Tmxa8tpfJ3EJRx0TDlWvkWtCjXIGkq8IdhWGVF9+
	O9sl4ci0NKhk2Sz5loTHo6x5RDgzouGT/zhJ5UN4q8LkjLfRlYGl/BBn2Vzizbe7JPfPXlr/OnRgx
	siIuBprtLze+4sDUE+QMiyLxOIB9c71MmHM4ovSh1HQD7FKxkqVoD3VLLZvSJKGViORW4VOad3n+M
	CacKvVUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPseN-0000000FcRb-0PCB;
	Sun, 08 Nov 2026 02:28:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPseM-0000000FcRN-0BUc
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 02:28:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F749612B9;
	Sun,  8 Nov 2026 02:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F1D41F0089F;
	Sun,  8 Nov 2026 02:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794104932;
	bh=zx36C1SVMILKY04uLf3pJrx82s8p0IJQ5WlBjXujXzk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mC6MH6Ne7Y9YYQKsiWFV4WoMOlzFBw0a3DCNbwn60R0+39CMYWYkheTdK0SnXdlG4
	 GVef//Kr/ybZzR4Eof5eGNl4/YZ3BmHHm45pVa6Yrbdl7V01Zou2NHVEYrXG0Ge3gT
	 iZDcpwYjKiA3sajLRFREB7n/mn53/P4Z/duJ060UgZQrSpQxHs8rgc43lj6cnzJq/N
	 axlRBzyITNrpiuRtJQRQTMQ9owF1mPJEPYhtTMDElCnRyrV/hRm5STFUIeAJ/h/Q9X
	 pe/Hg1xcPcc/q4LuqnX79+C6rxs1VDC64oMWlDHLVcdqmPy688dHR0sAaRymEYmCmL
	 SNqoTx1p5Oi8A==
Message-ID: <sashiko-outbox-203520@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: spi-nor: gigadevice: Add support for GigaDevice
 GD25B512
To: "Matthew Parker" <mparker@arista.com>, pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, "Adam Calabrigo" <adamc@arista.com>
In-Reply-To: <20261108022011.898185-1-mparker@arista.com>
References: <20261108022011.898185-1-mparker@arista.com>
Date: Sun, 08 Nov 2026 02:28:51 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogc3BpLW5vcjogZ2ln
YWRldmljZTogaW52YWxpZCAuZml4dXBfZmxhZ3MgaW5pdGlhbGl6ZXIgaW4KICBmbGFzaF9pbmZv
Ci0tCgpjb21taXQgZmY3M2MyZWVhM2I1OWE3OGY0YzlhY2MwNWJiZDE0Y2MzZmIyMmJmMgpBdXRo
b3I6IE1hdHRoZXcgUGFya2VyIDxtcGFya2VyQGFyaXN0YS5jb20+CgptdGQ6IHNwaS1ub3I6IGdp
Z2FkZXZpY2U6IEFkZCBzdXBwb3J0IGZvciBHaWdhRGV2aWNlIEdEMjVCNTEyCgpUaGlzIGNvbW1p
dCBhZGRzIGEgZmxhc2hfaW5mbyBlbnRyeSBmb3IgdGhlIEdpZ2FEZXZpY2UgR0QyNUI1MTIgNjQg
TWlCIFNQSQpOT1IgZmxhc2ggdG8gZ2lnYWRldmljZV9ub3JfcGFydHNbXS4KCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvZ2lnYWRldmljZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5v
ci9naWdhZGV2aWNlLmMKPiBpbmRleCA2YTJlNmViZGExNDgzLi5kZTk2Y2VmZGU1MTZiIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvZ2lnYWRldmljZS5jCj4gKysrIGIvZHJpdmVy
cy9tdGQvc3BpLW5vci9naWdhZGV2aWNlLmMKPiBAQCAtNjQsNiArNjQsMTAgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBmbGFzaF9pbmZvIGdpZ2FkZXZpY2Vfbm9yX3BhcnRzW10gPSB7Cj4gIAkJLmlk
ID0gU05PUl9JRCgweGM4LCAweDQwLCAweDE5KSwKPiAgCQkubmFtZSA9ICJnZDI1cTI1NiIsCj4g
IAkJLmZsYWdzID0gU1BJX05PUl9IQVNfTE9DSyB8IFNQSV9OT1JfSEFTX1RCIHwgU1BJX05PUl9U
Ql9TUl9CSVQ2LAo+ICsJfSwgewo+ICsJCS5pZCA9IFNOT1JfSUQoMHhjOCwgMHg0NywgMHgxYSks
Cj4gKwkJLmZsYWdzID0gU1BJX05PUl9IQVNfTE9DSywKPiArCQkuZml4dXBfZmxhZ3MgPSBTUElf
Tk9SXzRCX09QQ09ERVMsCgpbU2V2ZXJpdHk6IEhpZ2hdCkRvZXMgdGhpcyBicmVhayB0aGUgYnVp
bGQgd2hlbiBDT05GSUdfTVREX1NQSV9OT1IgaXMgZW5hYmxlZD8gIHN0cnVjdApmbGFzaF9pbmZv
IGhhcyBubyAuZml4dXBfZmxhZ3MgbWVtYmVyIChmaXh1cF9mbGFncyBsaXZlcyBpbiBzdHJ1Y3QK
c3BpX25vcl9maXh1cCkuICBTaW5jZSB0aGUgY2hpcCBleHBvc2VzIGFuIFNGRFAgNC1ieXRlIEFk
ZHJlc3MgSW5zdHJ1Y3Rpb24KVGFibGUsIHNwaV9ub3JfcGFyc2VfNGJhaXQoKSBhbHJlYWR5IHNl
dHMgU05PUl9GXzRCX09QQ09ERVMsIHNvIHRoZQouZml4dXBfZmxhZ3MgaW5pdGlhbGl6ZXIgY2Fu
IGJlIGRyb3BwZWQuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRl
di8jL3BhdGNoc2V0LzIwMjYxMTA4MDIyMDExLjg5ODE4NS0xLW1wYXJrZXJAYXJpc3RhLmNvbT9w
YXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
