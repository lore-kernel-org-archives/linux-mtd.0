Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CBE606A323
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AZ6mp/8t;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QeH1fZ6L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Tj24VmPE+Bo4d4nuWpSFbgjqSoa8HhJv5d3gqd1+aRU=; b=AZ6mp/8tO0l7oqEg1DPGT0HdOi
	0A3FlNUFscvRL/LbtCa/4SMQeC+ABDsheGidqHiWWiWa9batqPCMY+byi93bk/KJE1BEIMhFGY9qM
	wqsrlygmJBTnExkaFw3FmgIC8ayFXOBmolZKv4wKErR4CdLVwL5g1cmyx+6piqkz1pFzXh3e6yVPa
	nHhv9nRe5YEPdfMnjVZUHZILLnrOojcl8D9d2dPVUszkvvbnGR6yDPUpOaKMVdbNSR1CK4Q70ZlI2
	z2oy7v5WD7rZlxO9d94KU9qSOD+ze6yG+jd7GvswddmMkapr4OPlkAKiRRbhi7b+AD6ROPx5Vpamy
	G9fyQWcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqUr-00000001Khw-14W4;
	Mon, 16 Nov 2026 06:47:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqUp-00000001KhA-1RxN
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:47:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5876D61E8F;
	Mon, 16 Nov 2026 06:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC2581F000C6;
	Mon, 16 Nov 2026 06:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794811638;
	bh=ozI4S2Ae6lNCqjv/aeafG8Vn09WcFnFqY/Z5zkoIYjY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QeH1fZ6LFLZKlzZb4+3994H6/mhN3qPZRH+WmZ1uCGUoluPEUjLoPkgwJnrkSlHZC
	 SD1+wA339Bn0cWWp20QJhyb6CNld7nuJQCNcQs0bIhLz2JL7xoFSO8n4As8MCVTP8n
	 QVbLlZi7ol+p2d6nVXPn1O25BNDTIqW0fK1gzCQws0oaKv2HVjshqwDB2yC+0yN1xq
	 PiytCY7ree+52AqU/wf++joEcqnfhtmTKZU2s/THWPgYa6+aUqm2Iqh45q1UHQy/eF
	 5aEwraGO6VicxpnS65WBPWVD1w7iflwu4X+kmnE1j+ONbU1+QIa8Xu667HBMWf9+Bu
	 imbdSM/tgXByw==
Message-ID: <sashiko-outbox-216316@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 22/58] mtd: rawnand: pasemi: retain open-handle state
 on removal
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-22-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
 <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-22-cbc49c5c5e74@gmail.com>
Date: Mon, 16 Nov 2026 06:47:17 +0000
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gbXRkOiByYXduYW5kOiBwYXNl
bWk6IG1pc3NpbmcgRml4ZXMgdHJhaWxlciBmb3IgcmVtb3ZhbCBsaWZldGltZQogIGZpeAotLQoK
Y29tbWl0IGIwNzU0YTM1NTBmMmM4OWVlODJmNWNhMGJkOWI1NGI0ZTZhZGUxMGEKQXV0aG9yOiBK
YW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KCj4gbXRkOiByYXduYW5k
OiBwYXNlbWk6IHJldGFpbiBvcGVuLWhhbmRsZSBzdGF0ZSBvbiByZW1vdmFsCj4KPiBLZWVwIGNo
aXAgbWV0YWRhdGEgYW5kIGNvbnRyb2xsZXIgc3RvcmFnZSBhbGl2ZSB1bnRpbCB0aGUgZmluYWwg
TVRECj4gcmVmZXJlbmNlIGlzIHJlbGVhc2VkLiBVbnJlZ2lzdGVyIGFuZCBkaXNjb25uZWN0IGVh
Y2ggcHVibGlzaGVkIGNoaXAKPiBiZWZvcmUgcmVsZWFzaW5nIHRoZSByZXNvdXJjZXMgdXNlZCBi
eSBpdHMgaGFyZHdhcmUgb3BlcmF0aW9ucy4KPgo+IFJlbGVhc2UgdGhlIExQQyByZWdpb24gYW5k
IE5BTkQgbWFwcGluZyBhZnRlciBkaXNjb25uZWN0aW9uLgo+Cj4gUnVuIE5BTkQgY2xlYW51cCBk
dXJpbmcgZGlzY29ubmVjdGlvbjsgdGhlIGZpbmFsIGNvcmUtb3duZWQgcHV0IG9ubHkKPiByZWxl
YXNlcyByZXRhaW5lZCBhbGxvY2F0aW9uIGFuZCBsYXlvdXQgZGF0YS4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgoKW1NldmVyaXR5
OiBMb3ddClNpbmNlIHRoaXMgZml4ZXMgcHJlbWF0dXJlIGZyZWVpbmcgb2YgdGhlIE5BTkQgYW5k
IE1URCBzdHJ1Y3R1cmVzIG9uCmRyaXZlciByZW1vdmFsIHdoaWxlIG9wZW4gaGFuZGxlcyBzdGls
bCBleGlzdCwgc2hvdWxkIGl0IGluY2x1ZGUgYSBGaXhlczoKdGFnPwoKICBGaXhlczogODQ2ZmMz
MWQwNmU1ICgiW01URF0gW05BTkRdIHBhc2VtaV9uYW5kIGRyaXZlciIpCgotLSAKU2FzaGlrbyBB
SSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTE1LXN1Ym1p
dC1yYXduYW5kLXJldGFpbmVkLWhhbmRsZS1saWZldGltZS12MS12NS0wLWNiYzQ5YzVjNWU3NEBn
bWFpbC5jb20/cGFydD0yMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
