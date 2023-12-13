Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14214C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Dec 2023 11:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lUJt9RTY58aXMXWtdePCyOisKm1qxl+ZJ4uU9NN3KYA=; b=11DCL/iPsLjrJ2
	S4HSL3Mi8UfB9ddwCQK7MouADvo1zVXoUni3SGjGmfyIfXF0VDdnybLvnikc1Q55QKJZD8l7uFy1G
	CNu3QqIGb3VrOhJW6k/2x0wRkhaWKmVrNzFdImXXvG8sfWEouZPj7V5p9h2nUznryaMD2o4uq3upx
	mOfVY6IZ7ZGc3K79bWD0ieWOQj1Jo9DmBwqZVMjRhinwzRRwoofbD52bnmYFYXeBXtjfsIrXCsRRh
	8GoO9np+96JEXrQT7UCGakV+CuOYpkx43LlQmftwHifPKtg5XhViwpiFsySv8LX6S++4NTNDVQgkc
	kXRA+ta8nzkAbo5UG7Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNd3-00EVmK-1k;
	Wed, 13 Dec 2023 11:42:17 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNd0-00EVlg-38
	for linux-mtd@lists.infradead.org;
	Wed, 13 Dec 2023 11:42:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 582DACE1DF5;
	Wed, 13 Dec 2023 11:42:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CFCBC433C7;
	Wed, 13 Dec 2023 11:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702467732;
	bh=1vE/zzbxSADW+upL7QWLplgWH0pgOZiq9dOEA6CmitU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KndCDJnulYRqiJ3doUao0vYtq17Ji+F+E3huOFCgEVjKCQSusaPJF6sGxezj+zB03
	 v57qlCpx5XoJbBrwuUcXCcqQRYv5bg8uZsdipbsSbYJ44xo4OzWJijSeH7gW4oyIPE
	 Uf1jIuIJRSvegnP04aUIVL2CqE5aJM2G2Ezhix4QsrMB0vpSjAOO53YhyTJ2v3neSQ
	 Klnk2TLdXhozpsA0payECkTpCtkUnkv0BdrHCwLiNoosRAc1V7I5J0h3um5wk/1a1A
	 BLTAK/kiBegGEYOdv7yz3a4GgCeHCW6sHwXdIB6QXDIRlAtR+ZMRpkCB8X1cMZCXyi
	 Yuf2szvDw7sqA==
Date: Wed, 13 Dec 2023 11:42:07 +0000
From: Lee Jones <lee@kernel.org>
To: Helge Deller <deller@gmx.de>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-fbdev@vger.kernel.org, linux-mtd@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>, Andy Lowe <alowe@mvista.com>,
	Thomas Hellstrom <thellstrom@vmware.com>,
	Alan Hourihane <alanh@fairlite.co.uk>
Subject: Re: [PATCH 1/2] fbdev: Remove support for Carillo Ranch driver
Message-ID: <20231213114207.GJ111411@google.com>
References: <20231208224703.1603264-1-willy@infradead.org>
 <1f800b42-03a2-452e-b2a3-912250936413@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1f800b42-03a2-452e-b2a3-912250936413@gmx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_034215_188420_73E3A2A4 
X-CRM114-Status: GOOD (  15.50  )
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

T24gVHVlLCAxMiBEZWMgMjAyMywgSGVsZ2UgRGVsbGVyIHdyb3RlOgoKPiBPbiAxMi84LzIzIDIz
OjQ3LCBNYXR0aGV3IFdpbGNveCAoT3JhY2xlKSB3cm90ZToKPiA+IEFzIGZhciBhcyBhbnlib2R5
IGNhbiB0ZWxsLCB0aGlzIHByb2R1Y3QgbmV2ZXIgc2hpcHBlZC4gIElmIGl0IGRpZCwKPiA+IGl0
IHNoaXBwZWQgaW4gMjAwNyBhbmQgbm9ib2R5IGhhcyBhY2Nlc3MgdG8gb25lIGFueSBtb3JlLiAg
UmVtb3ZlIHRoZQo+ID4gZmJkZXYgZHJpdmVyIGFuZCB0aGUgYmFja2xpZ2h0IGRyaXZlci4KPiA+
IAo+ID4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBXaWxjb3ggKE9yYWNsZSkgPHdpbGx5QGluZnJh
ZGVhZC5vcmc+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvS2NvbmZpZyAg
ICAgICAgICAgfCAgICA3IC0KPiA+ICAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvTWFrZWZpbGUg
ICAgICAgICAgfCAgICAxIC0KPiA+ICAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvY3JfYmxsY2Qu
YyAgICAgICAgfCAgMjY0IC0tLS0tCj4gPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvS2NvbmZpZyAg
ICAgICAgICAgICAgIHwgICAxNSAtCj4gPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvTWFrZWZpbGUg
ICAgICAgICAgICAgIHwgICAgMSAtCj4gPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvdmVybWlsaW9u
L01ha2VmaWxlICAgIHwgICAgNiAtCj4gPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvdmVybWlsaW9u
L2NyX3BsbC5jICAgIHwgIDE5NSAtLS0tCj4gPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvdmVybWls
aW9uL3Zlcm1pbGlvbi5jIHwgMTE3NSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ICAgZHJpdmVy
cy92aWRlby9mYmRldi92ZXJtaWxpb24vdmVybWlsaW9uLmggfCAgMjQ1IC0tLS0tCj4gPiAgIDkg
ZmlsZXMgY2hhbmdlZCwgMTkwOSBkZWxldGlvbnMoLSkKPiA+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2NyX2JsbGNkLmMKPiA+ICAgZGVsZXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvdmlkZW8vZmJkZXYvdmVybWlsaW9uL01ha2VmaWxlCj4gPiAgIGRlbGV0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3Zlcm1pbGlvbi9jcl9wbGwuYwo+ID4gICBk
ZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy92aWRlby9mYmRldi92ZXJtaWxpb24vdmVybWlsaW9u
LmMKPiA+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmlkZW8vZmJkZXYvdmVybWlsaW9u
L3Zlcm1pbGlvbi5oCj4gCj4gSSd2ZSBhcHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlIGZiZGV2IGdp
dCB0cmVlLgo+IEl0IHRvdWNoZXMgdGhlIGJhY2tsaWdodCB0cmVlLCBzbyBJIGhvcGUgaXQncyBv
ayBmb3IgYmFja2xpZ2h0IHBlb3BsZT8KCkJldHRlciB0byBhc2sgZm9yIGZvcmdpdmVuZXNzIHRo
YW4gcGVybWlzc2lvbiBpdCBzZWVtcyEgOikKCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
