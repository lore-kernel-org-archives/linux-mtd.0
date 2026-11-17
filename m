Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD28606A337
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 09:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a6g1i2/G;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ammEKiKC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AGsbUP6jwz3HRimejq3aJbboisXEMIORzclldVqIk7A=; b=a6g1i2/GDKWVHMOx27Zs1wxAGE
	cWjgG0uqhu5V+qWmtAkf1W80rJmei+CR9e6hFeMP1QKhmu2szRL/FVeTxWl6iJVpXEFjPDao8+4dn
	KSgiVwc83/RKQEW4jLWqTZjnUw3/pNWmqnZFm5xNGnZFq5smuEav9gegbn5Sr37C1lwNamBhfYKWG
	m2fNWCyrBPuauAFvg9ITtWVaDBO8iaryKrG6hBNAH3Q2sf2xoj/Mwv6JGQergN16PTbhan9umOE4c
	m2bQ2qLiSzo4BBkN2HxWhsoLPYcq095u/LRAzmP24nxziXg3uqFWzNfTToTIaGa2i9PKUWKyMerip
	ZL/uJtjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFqW-00000005BuQ-2BYs;
	Tue, 17 Nov 2026 09:51:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFqV-00000005Bu4-3zRG
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 09:51:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E87D62F68;
	Tue, 17 Nov 2026 09:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D9C81F000C4;
	Tue, 17 Nov 2026 09:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794909082;
	bh=IgWorztv2BHlor1T6Axd/Nq2sNHTNA8oBQHQSlfJdi4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ammEKiKCdIdyCVZgC/j7JtdKyM6HDM47RW0+62Wq+RK1zS5F7otycEtBFf6a8b7GL
	 T8OFTwYhAT+rtnMSu4E4U2HOoFCrBq4YNpbs2byR8wgY0ul+t5h5uTPwotJ/pIJHJU
	 ZXc0vTVYbaSRx/nmmS9B3WwiJE7bzy+OmUITRwFeddJEwqg9ejhbZEbJOZBV1z8byG
	 tx2nM8Qy17jXG6sYjCTOH7SngDREzscNaNbgEhoirAzPZWru3N5P82mcN6Z673HN8q
	 4kD3T7R/SSAGgkoahMLNDdtftjITuqlozGsERONYZF8d1fAOaliy0JLkeBol/A8VOt
	 rZqE/leZAHe4A==
Message-ID: <sashiko-outbox-218535@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] exfat: keep the volume marked dirty after a
 shutdown
To: "Christian Brauner" <brauner@kernel.org>
Cc: "Jan Kara" <jack@suse.com>, linux-ext4@vger.kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, dsterba@suse.cz, tytso@mit.edu, "Mark
 Fasheh" <mark@fasheh.com>, "Joel Becker" <jlbec@evilplan.org>, "Joseph Qi" <joseph.qi@linux.alibaba.com>
In-Reply-To: <20261116-work-fs-sb_rdonly-fixes-v1-2-95a25ce917ad@kernel.org>
References: <20261116-work-fs-sb_rdonly-fixes-v1-0-95a25ce917ad@kernel.org>
 <20261116-work-fs-sb_rdonly-fixes-v1-2-95a25ce917ad@kernel.org>
Date: Tue, 17 Nov 2026 09:51:21 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gZXhmYXQ6IEZpeGVzIHRyYWls
ZXIgY2l0ZXMgZjc2MWZjZGQyODlkIGluc3RlYWQgb2YgNDZhNTU3Njk0YjQ2Ci0tCgpjb21taXQg
YTFkM2RmZmRmYzJiOTM4NWNmMmU5YmEwZTdiOTliZDkxNmYyMmZmYQpBdXRob3I6IENocmlzdGlh
biBCcmF1bmVyIDxicmF1bmVyQGtlcm5lbC5vcmc+Cgo+IGV4ZmF0OiBrZWVwIHRoZSB2b2x1bWUg
bWFya2VkIGRpcnR5IGFmdGVyIGEgc2h1dGRvd24KPgo+IEFmdGVyIGEgc2h1dGRvd24gZXhmYXRf
d3JpdGVfaW5vZGUoKSBhbmQgZXhmYXRfd3JpdGVwYWdlcygpIGRyb3AKPiB3aGF0ZXZlciBpcyBz
dGlsbCBkaXJ0eS4gQnV0IGV4ZmF0X3B1dF9zdXBlcigpIGFuZCBhIHJlbW91bnQgdG8KPiByZWFk
LW9ubHkgc3RpbGwgY2xlYXIgVk9MVU1FX0RJUlRZIHRocm91Z2ggZXhmYXRfc2V0X3ZvbF9mbGFn
cygpIHdoaWNoCj4gb25seSBsZWF2ZXMgdGhlIGJvb3Qgc2VjdG9yIGFsb25lIG9uIGEgcmVhZC1v
bmx5IHN1cGVyYmxvY2suIFNvIGFmdGVyIGEKPiBzaHV0ZG93biB3aXRoIEVYRkFUX0dPSU5HX0RP
V05fTk9TWU5DIHRoZSB2b2x1bWUgZW5kcyB1cCBtYXJrZWQgY2xlYW4KPiBhbHRob3VnaCBpdCBt
YXkgYmUgaW5jb25zaXN0ZW50LiBMZWF2ZSB0aGUgYm9vdCBzZWN0b3IgYWxvbmUgYWZ0ZXIgYQo+
IHNodXRkb3duIHRvby4KPgo+IEZpeGVzOiBmNzYxZmNkZDI4OWQgKCJleGZhdDogSW1wbGVtZW50
IHNvcHMtPnNodXRkb3duIGFuZCBpb2N0bCIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcK
PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gQnJhdW5lciAoQW11dGFibGUpIDxicmF1bmVyQGtl
cm5lbC5vcmc+CgpbU2V2ZXJpdHk6IExvd10KU2hvdWxkIHRoZSBGaXhlcyB0YWcgcmVmZXJlbmNl
IDQ2YTU1NzY5NGI0NiAoImV4ZmF0OiBkbyBub3QgY2xlYXIgdm9sdW1lCmRpcnR5IGZsYWcgZHVy
aW5nIHN5bmMiKSBpbnN0ZWFkPwoKSW4gZjc2MWZjZGQyODlkICgiZXhmYXQ6IEltcGxlbWVudCBz
b3BzLT5zaHV0ZG93biBhbmQgaW9jdGwiKSwKZXhmYXRfY2xlYXJfdm9sdW1lX2RpcnR5KCkgd2Fz
IG9ubHkgY2FsbGVkIGZyb20gZXhmYXRfc3luY19mcygpLCB3aGljaApyZXR1cm5lZCBlYXJseSBv
biBleGZhdF9mb3JjZWRfc2h1dGRvd24oc2IpLiAgSXQgd2FzIDQ2YTU1NzY5NGI0NgooImV4ZmF0
OiBkbyBub3QgY2xlYXIgdm9sdW1lIGRpcnR5IGZsYWcgZHVyaW5nIHN5bmMiKSB0aGF0IHJlbW92
ZWQKZXhmYXRfc3luY19mcygpIGFsb25nIHdpdGggaXRzIHNodXRkb3duIGNoZWNrIGFuZCBtb3Zl
ZCB0aGUKZXhmYXRfY2xlYXJfdm9sdW1lX2RpcnR5KCkgY2FsbHMgaW50byBleGZhdF9wdXRfc3Vw
ZXIoKSBhbmQKZXhmYXRfcmVjb25maWd1cmUoKS4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBo
dHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMTYtd29yay1mcy1zYl9yZG9ubHkt
Zml4ZXMtdjEtMC05NWEyNWNlOTE3YWRAa2VybmVsLm9yZz9wYXJ0PTIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
