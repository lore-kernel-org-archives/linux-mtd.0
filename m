Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E09606A327
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2026 06:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kXsDP4B/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oyFQ3JBu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UW50LNkpSKD7rvhjjm0P4uXIvi0ihoOBuAppB8PjE2A=; b=kXsDP4B/ybCkOplhlqT1Z/6LRa
	aQgP2kYjoWCRrMy2vYlOADcciFhSTGomqLcqAEqBvwq+fZhb7XAuM0adjFlB76Z+pbTefthuEUex7
	EilbfoHbWe+GCLFS9GgHnheNZchPgVxujlkZeYnM/y+/A6HQL8EjLkWG1pIlpY4Qo7Fy1c4Sju4VD
	PDmDYDqtuM7c/M9oPVsChRx9btlaUEj+8R/XOCdSaIHGVhorFWvbbDXnexkB92aOozrHvI15VgATL
	t8O/LE2c84EdJ6+OvKOjwD044nPONHpYESIfM53sADT5mmoOqWeIsn6UyUgvU5ZM1BCiDYEybIHg0
	UVrEh61A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVN7j-00000002M0F-3Cv0;
	Mon, 23 Nov 2026 06:01:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVN7h-00000002LzY-1pCy
	for linux-mtd@lists.infradead.org;
	Mon, 23 Nov 2026 06:01:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 349C4414F6;
	Mon, 23 Nov 2026 06:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D95D81F000C6;
	Mon, 23 Nov 2026 06:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795413713;
	bh=YyANkNn4uux/UrwhMCwsX5n0kr2qnLwJxXtaBu1bsDg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oyFQ3JBu4r1YvXsAwdlxUbKBiXguFsWfYXLmKAkeSuGZIIJZWtZMAo23vn1vNysAe
	 nvtX5JrY0uwDWr3k+/L6XGE2wWgE5WWFeF63jQTYm84eFO30QtEhma2ct2nekreR2S
	 WwVD5pbNv6/oEe4IB3JiU057LMWl3kqKARJ4UEK+7it5g68XFEFL7WuONCcFSzB5C9
	 31aGYdURtfIQDPdk2/N1IW2R0AiZ+TVjXlYTbKzEqLY/FdXp5oGd6s28jeeySgeRY5
	 F0Ipfw2WlTIm/+rEbe/Ytksb5MMcghbWEqqJ9PeoABerYPeH8mfNNkPluKWY+WS4dG
	 wSMTyZG07ZdwQ==
Message-ID: <sashiko-outbox-228750@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] mtd: rawnand: fsmc: declare NAND_USES_DMA
To: ping.li <leeonion.muyu@gmail.com>, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20261123055020.1995251-2-ping.li@horizon.auto>
References: <20261123055020.1995251-1-ping.li@horizon.auto>
 <20261123055020.1995251-2-ping.li@horizon.auto>
Date: Mon, 23 Nov 2026 06:01:52 +0000
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MiBwb3RlbnRpYWwKaXNzdWVzIHRvIGNvbnNpZGVyOgotIFtNZWRpdW1dIG10ZDogcmF3bmFuZDog
ZnNtYzogdW5jb25kaXRpb25hbCBOQU5EX1VTRVNfRE1BIG9uIFBJTy1vbmx5CiAgcGF0aAotIFtM
b3ddIG10ZDogcmF3bmFuZDogZnNtYzogaW5hY2N1cmF0ZSBGaXhlcyB0cmFpbGVyIGNpdGluZyBt
dGRjaGFyCiAgY29tbWl0Ci0tCgpjb21taXQgZDhiOThhMmQ3ZjM3YWM4NzdlOTJiMjc1ODc2NjFj
OTQ0ZWM1N2Q3YgpBdXRob3I6IFBpbmcgTGkgPGxlZW9uaW9uLm11eXVAZ21haWwuY29tPgoKPiBt
dGQ6IHJhd25hbmQ6IGZzbWM6IGRlY2xhcmUgTkFORF9VU0VTX0RNQQo+Cj4gZnNtY19leGVjX29w
KCkgcGFzc2VzIHRoZSBkYXRhIGJ1ZmZlcnMgcHJvdmlkZWQgYnkgdGhlIE5BTkQgY29yZQo+IHN0
cmFpZ2h0IHRvIGRtYV9tYXBfc2luZ2xlKCkgd2hlbiB0aGUgY29udHJvbGxlciBydW5zIGluIERN
QSBtb2RlLAo+IGJ1dCB0aGUgZHJpdmVyIG5ldmVyIGRlY2xhcmVzIE5BTkRfVVNFU19ETUEuICBC
ZWNhdXNlIG9mIHRoaXMsCj4gbmFuZF9iYXNlIGNhbm5vdCBrbm93IHRoZSBjb250cm9sbGVyIERN
QXMgdGhlc2UgYnVmZmVycyBhbmQgbmV2ZXIKPiBib3VuY2VzIG5vbi1saW5lYXItbWFwIG9uZXMg
KHNlZSB0aGUgdXNlX2JvdW5jZV9idWYgbG9naWMgaW4KPiBuYW5kX2RvX3JlYWRfb3BzKCkvbmFu
ZF9kb193cml0ZV9vcHMoKSkuCj4KPiBTaW5jZSB0aGUgbXRkY2hhciBNRU1SRUFEL01FTVdSSVRF
IGlvY3RscyBhbGxvY2F0ZSB0aGVpciBidWZmZXJzCj4gd2l0aCBrdm1hbGxvYygpLCBhIGhlYXZp
bHkgZnJhZ21lbnRlZCBzeXN0ZW0gY2FuIGFscmVhZHkgZmVlZCBhCj4gdm1hbGxvYydkIGJ1ZmZl
ciBpbnRvIGZzbWMncyBETUEgZW5naW5lLCB3aGljaCBpcyBub3QgYSB2YWxpZAo+IGRtYV9tYXBf
c2luZ2xlKCkgaW5wdXQuCj4KPiBEZWNsYXJlIE5BTkRfVVNFU19ETUEgc28gdGhhdCBuYW5kX2Jh
c2UgYm91bmNlcyBub24tbGluZWFyLW1hcAo+IGJ1ZmZlcnMgdGhyb3VnaCBjaGlwLT5kYXRhX2J1
ZiwgYXMgdGhlIG90aGVyIERNQS1jYXBhYmxlCj4gY29udHJvbGxlcnMgKGFyYXNhbiwgZGVuYWxp
LCBtZXNvbiwgbXRrLCBudXZvdG9uLi4uKSBhbHJlYWR5IGRvLgo+Cj4gRml4ZXM6IDgzMjA4ZTEw
NmE4ZTggKCJtdGRjaGFyOiB1c2Uga3ZtYWxsb2MoKSBmb3IgcG90ZW50aWFsbHkgbGFyZ2UgYWxs
b2NhdGlvbnMiKQo+IFNpZ25lZC1vZmYtYnk6IFBpbmcgTGkgPGxlZW9uaW9uLm11eXVAZ21haWwu
Y29tPgoKW1NldmVyaXR5OiBMb3ddCkRvZXMgdGhlIEZpeGVzOiB0YWcgcG9pbnQgdG8gdGhlIHJp
Z2h0IGNvbW1pdD8gIDgzMjA4ZTEwNmE4ZSAoIm10ZGNoYXI6CnVzZSBrdm1hbGxvYygpIGZvciBw
b3RlbnRpYWxseSBsYXJnZSBhbGxvY2F0aW9ucyIpIG9ubHkgY2hhbmdlZAptdGRjaGFyX3dyaXRl
X2lvY3RsKCksIHdoZXJlYXMgdXBwZXIgTVREIGxheWVycyBzdWNoIGFzIFVCSUZTIGFuZCBKRkZT
MgpwYXNzZWQgdm1hbGxvYyBidWZmZXJzIGxvbmcgYmVmb3JlIHRoYXQ7IERNQSBzdXBwb3J0IGlu
IHRoaXMgZHJpdmVyIGNhbWUKZnJvbSA0Nzc0ZmIwYTQ4YWEgKCJtdGQ6IG5hbmQvZnNtYzogQWRk
IERNQSBzdXBwb3J0IikgYW5kIGJvdW5jZSBidWZmZXIKc3VwcG9ydCBpbiBuYW5kX2Jhc2UgY2Ft
ZSBmcm9tIDY2NTA3YzdiYzg4OSAoIm10ZDogbmFuZDogQWRkIHN1cHBvcnQgdG8KdXNlIG5hbmRf
YmFzZSBwb2kgZGF0YWJ1ZiBhcyBib3VuY2UgYnVmZmVyIikuCgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9mc21jX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2ZzbWNf
bmFuZC5jCj4gaW5kZXggZWVlMDBjNmY0M2UwNy4uMmMzZGE5MjQyYTE0YiAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9mc21jX25hbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L2ZzbWNfbmFuZC5jCj4gQEAgLTg3MSw3ICs4NzEsNyBAQCBzdGF0aWMgaW50IGZzbWNf
bmFuZF9wcm9iZV9jb25maWdfZHQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKPiAgCXUz
MiB2YWw7Cj4gIAlpbnQgcmV0Owo+ICAKPiAtCW5hbmQtPm9wdGlvbnMgPSAwOwo+ICsJbmFuZC0+
b3B0aW9ucyA9IE5BTkRfVVNFU19ETUE7CgpbU2V2ZXJpdHk6IE1lZGl1bV0KU2hvdWxkIG5hbmQt
Pm9wdGlvbnMgc2V0IE5BTkRfVVNFU19ETUEgdW5jb25kaXRpb25hbGx5IHdoZW4gdGhlIGRyaXZl
cgpuZXZlciBydW5zIGluIERNQSBtb2RlPwoKSW4gZnNtY19uYW5kX3Byb2JlKCksIGhvc3QgaXMg
emVyby1hbGxvY2F0ZWQgdmlhIGRldm1fa3phbGxvY19vYmooKSwKbGVhdmluZyBob3N0LT5tb2Rl
IGF0IDAsIGFuZCBldmVyIHNpbmNlIGExYjFlMWQ1YmRmZSAoIm10ZDogbmFuZDogZnNtYzoKZmlu
YWxseSByZW1vdmUgZnNtY19uYW5kX3BsYXRmb3JtX2RhdGEiKSBub3RoaW5nIGluIHRoZSBkcml2
ZXIgZXZlciBzZXRzCmhvc3QtPm1vZGUgdG8gVVNFX0RNQV9BQ0NFU1MgKDEpLiAgQXMgYSByZXN1
bHQsIGZzbWNfZXhlY19vcCgpIGFsd2F5cwp0YWtlcyB0aGUgTU1JTyBQSU8gcGF0aCAoZnNtY19y
ZWFkX2J1ZigpIGFuZCBmc21jX3dyaXRlX2J1ZigpKSwgYW5kCnNldHRpbmcgTkFORF9VU0VTX0RN
QSBmb3JjZXMgbmFuZF9kb19yZWFkX29wcygpIGFuZCBuYW5kX2RvX3dyaXRlX29wcygpCnRvIGJv
dW5jZSBldmVyeSB2bWFsbG9jIG9yIGt2bWFsbG9jIGJ1ZmZlciB0aHJvdWdoIGNoaXAtPmRhdGFf
YnVmIHZpYSBhbgp1bm5lY2Vzc2FyeSBmdWxsLXBhZ2UgY29weS4KCi0tIApTYXNoaWtvIEFJIHJl
dmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMjMwNTUwMjAuMTk5
NTI1MS0xLXBpbmcubGlAaG9yaXpvbi5hdXRvP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
