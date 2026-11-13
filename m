Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48947607189D
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=abcFr6vF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VGamidWu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qk7jzE4usBoa1Ocjmc6ykCBb04OHUCUxOTxubFY459c=; b=abcFr6vFoQBdLqFPKAChIdRh+H
	0WtmaL2QpT/oEMQ/zl3cOVBdpWDJkayct0GqIFr65QMmcoBSuK9NiqI8Yxd/RpCGFXXDdTohUylNm
	/UR9fA12fZuq6t+WOWYpWutfHYaYMY6azUTf8snQ0LBZWKa9icPypsuPGdrAizr2cONzRtvEgH+J8
	ACvVq3oXdbuwGYZvQ0QRobP0Mk9jtt4O2I74TiiXOJ2bQU/1haltCzMZRaqlLtjy14wNgEAFXY1Za
	G061BlgeMo1C/8J0204Z4nK0zJJzhTW/l7FoDOguNiPxe1+pBE3AXDCk7KWpW7f3hooN57JjQJpjD
	BPSL0reg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwBZ-0000000DyIf-0JcZ;
	Fri, 13 Nov 2026 18:39:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwBX-0000000DyIV-389f
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:39:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CA22362990;
	Fri, 13 Nov 2026 18:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E01E1F000C8;
	Fri, 13 Nov 2026 18:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794595178;
	bh=0TQl+iLyjCTApz4emxCgseOhdQlESF8yHZ1WU8fHIrY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VGamidWukg5mnMhFWYMSvfMK3m6AWLYlhi6LiyohuRrQdpGhPL7H/VEJjRDieOXCC
	 Pvu+NjP3icTDo505K+0mWy6kUueSulcBRjiigwY2q1aY3eHigQHdU4tQlrd7H5z0oL
	 w4FyL6HGT2a3Dq8eF+SSys1cuiIpW0eI4dkMTQz033yWOL2vy51VN6Tb76YaRzAooT
	 uggy/wa69D3xSeX/lkCQYZdB4KVJ2V9wjDKCBdnaxTIsfNHQcFzzpUqVf69tCabEji
	 e5uz3YW5tJm7FcsC3x4V1vFYIpj9HTzbRm5EbTwvuhttitFULIZPAw31i7TGBr/my/
	 zIoslZdPT56pg==
Message-ID: <sashiko-outbox-213417@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 27/58] mtd: rawnand: technologic: retain open-handle
 state on removal
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-27-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
 <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-27-556b1d7c6221@gmail.com>
Date: Fri, 13 Nov 2026 18:39:37 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gbXRkOiByYXduYW5kOiB0ZWNo
bm9sb2dpYzogbWlzc2luZyBGaXhlcyB0cmFpbGVyIGZvciBjb21taXQKICA4NTMwMzRjN2Q4YzAK
LS0KCmNvbW1pdCA5YWNkNWI0NWEzZTkxZTY0NDZmYjE4ZWFjZDJjN2I3MWI5MzQ2YmExCkF1dGhv
cjogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cgo+IG10ZDogcmF3
bmFuZDogdGVjaG5vbG9naWM6IHJldGFpbiBvcGVuLWhhbmRsZSBzdGF0ZSBvbiByZW1vdmFsCj4K
PiBLZWVwIGNoaXAgbWV0YWRhdGEgYW5kIGNvbnRyb2xsZXIgc3RvcmFnZSBhbGl2ZSB1bnRpbCB0
aGUgZmluYWwgTVRECj4gcmVmZXJlbmNlIGlzIHJlbGVhc2VkLiBVbnJlZ2lzdGVyIGFuZCBkaXNj
b25uZWN0IGVhY2ggcHVibGlzaGVkIGNoaXAKPiBiZWZvcmUgcmVsZWFzaW5nIHRoZSByZXNvdXJj
ZXMgdXNlZCBieSBpdHMgaGFyZHdhcmUgb3BlcmF0aW9ucy4KPgo+IFRyYW5zZmVyIGZsYXNoLW5v
ZGUgb3duZXJzaGlwIHRvIHRoZSByZXRhaW5lZC1jaGlwIGhlbHBlci4KPgo+IFJ1biBOQU5EIGNs
ZWFudXAgZHVyaW5nIGRpc2Nvbm5lY3Rpb247IHRoZSBmaW5hbCBjb3JlLW93bmVkIHB1dCBvbmx5
Cj4gcmVsZWFzZXMgcmV0YWluZWQgYWxsb2NhdGlvbiBhbmQgbGF5b3V0IGRhdGEuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KCltT
ZXZlcml0eTogTG93XQpUaGlzIGZpeGVzIHRoZSBvcGVuLWhhbmRsZSByZW1vdmFsIGxpZmV0aW1l
IGFuZCB1bmJhbGFuY2VkCmZ3bm9kZV9oYW5kbGVfcHV0KCkgaW4gdHM3Mnh4X25hbmRfcmVtb3Zl
KCkgaW50cm9kdWNlZCB3aXRoIHRoZSBkcml2ZXIuClNob3VsZCB0aGlzIGluY2x1ZGU6CgogIEZp
eGVzOiA4NTMwMzRjN2Q4YzAgKCJtdGQ6IHJhd25hbmQ6IGFkZCBzdXBwb3J0IGZvciB0czcyeHgi
KQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNl
dC8yMDI2MTExMy1zdWJtaXQtcmF3bmFuZC1yZXRhaW5lZC1oYW5kbGUtbGlmZXRpbWUtdjEtdjQt
MC01NTZiMWQ3YzYyMjFAZ21haWwuY29tP3BhcnQ9MjcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
