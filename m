Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2271606A31C
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ctyQo5d3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ViPGtfXQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=g8klFlKKccpNeJOf89fcYKohfAgXhFSS9IeECXuq8yY=; b=ctyQo5d3do5fG+XgpachKlLE+B
	6Xn7utlYcDNH5/nHtrm0NPVtLqDdd9gxXRG42+Lpx8pOkP4Qf4WQaG/vSobouZUkvaeI3uB+FVt4h
	5OWgt2ivc0WLEP9qefQ2rldQ8SedFVuiqGV4BuIOG6BU4bk6IHC/dN6dgS4uxnpvVCbhMPrh0BNch
	93xFJKWz2SUk0P/duxVWtmz86NnuQgW5MmoKwQ5Pjw0KK53UzjfgMfY1AVORlTWEML89I6Yh0lrzr
	CQQQpcFkNwOWt89qo84tkw83i5MhjZlw7O9JDqvcmpbBrwITdBdg2VO+RlBMMJiAIKrP+ciwlheGV
	VOscGMDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqgE-00000001LyL-1N4Y;
	Mon, 16 Nov 2026 06:59:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqgB-00000001LyA-3H9r
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:59:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A1E241495;
	Mon, 16 Nov 2026 06:59:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85011F000C4;
	Mon, 16 Nov 2026 06:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794812342;
	bh=mv6kVSNK4dr7bTDuGSSMWFwYhTaPUL9ikDDioGEIGCI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ViPGtfXQFN49SWFLV+oGsQJwe0BG2mil1AEWvOsHhu1WbE9XKOYzvXYNhIJ8JJ5Gi
	 LfHB9yDIGcet3A2yiaZHbg+qIxfMwSoDOOmJz129lhZat7M5mhlVFNKTspWBl7nYXS
	 774hCe5QsjzdAOJAM5u5wI9TI7re1tEZ4DrweS/2ifr/Fv04VJwEE9TtPb9uLOkbPQ
	 WXroApFLHjl+v0H0DSYaJoIPCiMFPMwaKS3BChIeM7s9g2LoPjnj6xnKSgwKY8GEQ2
	 tmSbG/03vpfGEgeT6x9UuiOU8ARx9kJtVJawQoSxxImRc8bm1Jl0qSCt0owuiUDXcn
	 eL7iIXK3KOwvw==
Message-ID: <sashiko-outbox-216355@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 02/58] mtd: acquire an MTD handle from a referenced
 class device
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Richard
 Cochran" <richardcochran@gmail.com>, "Jonathan Lemon" <jonathan.lemon@gmail.com>, "Vadim
 Fedorenko" <vadim.fedorenko@linux.dev>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-2-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
 <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-2-cbc49c5c5e74@gmail.com>
Date: Mon, 16 Nov 2026 06:59:01 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gcHRwOiBvY3A6IG1pc3Npbmcg
Rml4ZXMgdHJhaWxlciBmb3IgcHRwX29jcF9kZXZsaW5rX2ZsYXNoKCkgYnVnCiAgZml4Ci0tCgpj
b21taXQgZTFiNmQ2ZjBmNjRlMGFkOWVkOGNhZDRlNDUyZjIyYjZjMjliZmJjOQpBdXRob3I6IEph
bWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgoKPiBtdGQ6IGFjcXVpcmUg
YW4gTVREIGhhbmRsZSBmcm9tIGEgcmVmZXJlbmNlZCBjbGFzcyBkZXZpY2UKPgo+IFBUUCBPQ1Ag
bG9jYXRlcyBmbGFzaCB0aHJvdWdoIHRoZSBkZXZpY2UgaGllcmFyY2h5IGFuZCB1c2VzIGRyaXZl
ciBkYXRhCj4gZGlyZWN0bHkuIEEgY2xhc3MtZGV2aWNlIHJlZmVyZW5jZSBkb2VzIG5vdCBrZWVw
IGFuIE1URCByZWdpc3RlcmVkIG9yIG93bgo+IHRoZSBiYWNraW5nIG9iamVjdCBuZWVkZWQgYnkg
YW4gZXJhc2Ugb3Igd3JpdGUuCj4KPiBMb29rIHVwIHRoZSBleGFjdCBkZXZpY2UgdW5kZXIgbXRk
X3RhYmxlX211dGV4IGFuZCBhY3F1aXJlIGFuIG9yZGluYXJ5IE1URAo+IGhhbmRsZSBiZWZvcmUg
cmV0dXJuaW5nIGl0LiBVc2UgdGhhdCBoYW5kbGUgZm9yIHRoZSBPQ1AgdXBkYXRlIGFuZCByZWxl
YXNlCj4gaXQgb24gZXZlcnkgZXhpdC4gQSByZW1vdmVkIGRldmljZSBjYW5ub3QgYmUgY29uZnVz
ZWQgd2l0aCBhIHJlcGxhY2VtZW50Cj4gdGhhdCByZXVzZXMgaXRzIG5hbWUgb3IgbnVtYmVyLgo+
Cj4gQ2M6IFJpY2hhcmQgQ29jaHJhbiA8cmljaGFyZGNvY2hyYW5AZ21haWwuY29tPgo+IENjOiBK
b25hdGhhbiBMZW1vbiA8am9uYXRoYW4ubGVtb25AZ21haWwuY29tPgo+IENjOiBWYWRpbSBGZWRv
cmVua28gPHZhZGltLmZlZG9yZW5rb0BsaW51eC5kZXY+Cj4gU2lnbmVkLW9mZi1ieTogSmFtZXMg
SGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CgpbU2V2ZXJpdHk6IExvd10KVGhp
cyBmaXhlcyBhIGxpZmV0aW1lIGFuZCByZWZlcmVuY2UtY291bnRpbmcgYnVnIGluCnB0cF9vY3Bf
ZGV2bGlua19mbGFzaCgpIHdoZXJlIGRldl9nZXRfZHJ2ZGF0YShkZXYpIHdhcyB1c2VkIGRpcmVj
dGx5CndpdGhvdXQgYWNxdWlyaW5nIGFuIE1URCBkZXZpY2UgcmVmZXJlbmNlLiAgU2hvdWxkIHRo
ZSBjb21taXQgbWVzc2FnZQppbmNsdWRlOgoKICBGaXhlczogNzczYmRhOTY0OTIxICgicHRwOiBv
Y3A6IEV4cG9zZSB2YXJpb3VzIHJlc291cmNlcyBvbiB0aGUgdGltZWNhcmQuIikKCi0tIApTYXNo
aWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMTUt
c3VibWl0LXJhd25hbmQtcmV0YWluZWQtaGFuZGxlLWxpZmV0aW1lLXYxLXY1LTAtY2JjNDljNWM1
ZTc0QGdtYWlsLmNvbT9wYXJ0PTIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
