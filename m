Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE210606A324
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 03:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DOLYR8Or;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XkN8OYAw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0odPAfLY8vurkSeEU+1xhK2LTMI6Eib9KkorGVkdUrc=; b=DOLYR8OrQ6UtuakAlLBNWVQRDy
	yt13XVbsZPDQ41peY+y8Svd6Kcp1RdJsL1f7O0/voEmSfdcOHMMsiQGahx33QUVXcKcuBzZ5Fs0yG
	ShlMA8y7NsHDLwTlQfUBwqSqXtkJAd4doYzGfTSdqPteLs4EQv3sqtcO4kSTRlAjtzydNNtn4m26W
	0ou1zKCt9tGACRABrBnePT/aPEdwMX8n/c2ciUiYFhPJNgrEQ1BZ345S1+IGqvNw8sFXd4YR8vnyi
	TLQL6D3YKT96MN6wYWndOsizgvj6SX7JlHRmTDutXKywVrew45FyYAP2c7/t9VUz34zMcMw1HRIVo
	twT0gqeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRLBU-00000008ako-1Sqh;
	Thu, 12 Nov 2026 03:09:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRLBT-00000008ajt-17Dn
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 03:09:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 58CDC633D1;
	Thu, 12 Nov 2026 03:09:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 672191F00A0E;
	Thu, 12 Nov 2026 03:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794452946;
	bh=G5ylE4aE9balVWcVDyIUbgbonXSkVFI3jL8JYk6rKbA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XkN8OYAwRPb1Xq8SgOE+sFaPVe3L/pGFtenXsjJLnfB9crmgZx2vSE6c3K+z+Yctt
	 qiVaeLdtEZT/thnsjmIseICYjmTkZ3Lj9MtFboRCCnQxuVXvKpqN9Md26HcdXREtD1
	 cLzHMgKV72CO//x5ArkCnUDD+nTUTuoPzFiRJ+DKWbZP24bf34wvaT2Q8t+2L1LjhC
	 xlhQ2EU0bWuJ+ByRzP4D1PhBsy3K5Swz0+FulCmkfr4gBDLrVdboER9gw+MF8VpIyp
	 ztOsqEzZvQ09OJDF/TqrUNsXMZNRK+HNBwj4rrKfJJxLNjK2lJjcJdAM+ffZBpK1T4
	 OgwzUpkb8frfw==
Message-ID: <sashiko-outbox-210241@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/58] mtd: retain virtual concatenations across
 component removal
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Yuqiang
 Sun" <izaiahsun@gmail.com>, "Amit Kumar Mahapatra" <amit.kumar-mahapatra@amd.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Bernhard Frauendienst" <kernel@nospam.obeliks.de>, "Gustavo
 A. R. Silva" <gustavoars@kernel.org>, "Kees Cook" <kees@kernel.org>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-4-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
 <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-4-ce537999741d@gmail.com>
Date: Thu, 12 Nov 2026 03:09:04 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiBtdGRjb25jYXQ6
IG10ZF9jb25jYXRfY3JlYXRlKCkgY2hlY2tzIHN1YmRldiBvb2JsYXlvdXQKICBpbnN0ZWFkIG9m
IG1hc3RlcgotLQoKY29tbWl0IDM0YmQ2M2QzYzhiMzQzY2EzZmY2ZTE3MmFkYTcwOTMwNmU0Mjkx
YmQKQXV0aG9yOiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KCm10
ZDogcmV0YWluIHZpcnR1YWwgY29uY2F0ZW5hdGlvbnMgYWNyb3NzIGNvbXBvbmVudCByZW1vdmFs
CgpUaGlzIGNvbW1pdCByZXdvcmtzIHZpcnR1YWwgTVREIGNvbmNhdGVuYXRpb24gbGlmZXRpbWUg
bWFuYWdlbWVudCwgdXNpbmcKcmVmZXJlbmNlIGNvdW50aW5nIGZvciBzdGFnZWQgcGFydGl0aW9u
IGNvbXBvbmVudHMgYW5kIFNSQ1UgdG8gc3luY2hyb25pemUKZm9yd2FyZGluZyBvcGVyYXRpb25z
IGR1cmluZyBkaXNjb25uZWN0IGFuZCB0ZWFyZG93bi4KCkxpbms6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3IvMjAyNjExMDMxNDM5NTMuNjk2NDItMS1pemFpYWhzdW5AZ21haWwuY29tLwpMaW5r
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yL3Nhc2hpa28tb3V0Ym94LTE5NTU1MUBrZXJuZWwu
b3JnLwoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkY29uY2F0LmMgYi9kcml2ZXJzL210
ZC9tdGRjb25jYXQuYwo+IGluZGV4IGM5NzE2N2Q1MWZlMmQuLmNjZTNlMmZjYWZjODQgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9tdGQvbXRkY29uY2F0LmMKPiArKysgYi9kcml2ZXJzL210ZC9tdGRj
b25jYXQuYwpbIC4uLiBdCj4gQEAgLTczOCw3ICs4MjIsOCBAQCBzdHJ1Y3QgbXRkX2luZm8gKm10
ZF9jb25jYXRfY3JlYXRlKHN0cnVjdCBtdGRfaW5mbyAqc3ViZGV2W10sCS8qIHN1YmRldmljZXMg
dG8gYwo+ICAKPiAgCX0KPiAgCj4gLQltdGRfc2V0X29vYmxheW91dCgmY29uY2F0LT5tdGQsIHN1
YmRldlswXS0+b29ibGF5b3V0KTsKPiArCWlmIChzdWJkZXZbMF0tPm9vYmxheW91dCkKPiArCQlt
dGRfc2V0X29vYmxheW91dCgmY29uY2F0LT5tdGQsICZjb25jYXRfb29ibGF5b3V0X29wcyk7Cgpb
U2V2ZXJpdHk6IE1lZGl1bV0KU2hvdWxkIHRoaXMgY2hlY2sgbXRkX2dldF9tYXN0ZXIoc3ViZGV2
WzBdKS0+b29ibGF5b3V0IGluc3RlYWQgb2YKc3ViZGV2WzBdLT5vb2JsYXlvdXQ/CgphbGxvY2F0
ZV9wYXJ0aXRpb24oKSBkb2VzIG5vdCBjb3B5IG9vYmxheW91dCBvbnRvIGNoaWxkIHBhcnRpdGlv
biBtdGRfaW5mbwpzdHJ1Y3RzOyBtdGRfb29ibGF5b3V0X2VjYygpIGFuZCBtdGRfb29ibGF5b3V0
X2ZyZWUoKSBsb29rIGl0IHVwIG9uCm10ZF9nZXRfbWFzdGVyKG10ZCkuICBXaGVuIG10ZF9jb25j
YXRfY3JlYXRlKCkgaXMgY2FsbGVkIHdpdGggcGFydGl0aW9uCnN1YmRldmljZXMgKGFzIG10ZF92
aXJ0X2NvbmNhdF9yZWdpc3RlcigpIGFsd2F5cyBkb2VzKSwgc3ViZGV2WzBdLT5vb2JsYXlvdXQK
aXMgTlVMTCwgc28gY29uY2F0X29vYmxheW91dF9vcHMgaXMgbmV2ZXIgaW5zdGFsbGVkIGFuZCBP
T0IgbGF5b3V0IHF1ZXJpZXMgb24KdGhlIGNvbmNhdGVuYXRlZCBkZXZpY2UgZmFpbCB3aXRoIC1F
Tk9UU1VQUC4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMv
cGF0Y2hzZXQvMjAyNjExMTEtc3VibWl0LXJhd25hbmQtcmV0YWluZWQtaGFuZGxlLWxpZmV0aW1l
LXYxLXYzLTAtY2U1Mzc5OTk3NDFkQGdtYWlsLmNvbT9wYXJ0PTQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
