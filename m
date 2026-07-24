Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D91C531FA
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jul 2026 09:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3KZqBhCsrKS8fUBzTVrR7cBc0Se3VCO9fum7B1nkmeE=; b=AAWSmEvrC4vxzu
	MRGTddX7T+54sOEI34hKuU4rlKMRxKLQxtrukM8bwBMl0sqWnBW3F89DkZCAcIgcJSEYnQV8QrUDJ
	+bzkjSJIk61ceuw8XE+x1gMDNuud2TezmtpaBcbOMuO9FVW47odMdTMBF07v4m7UXz8N76kqOL/pl
	X8dJPeHFK8LE+ij+Z0wgUtjoPIc+s1yOeGj5V8jgH62flubZn0xwNL3bulSaUBc7CvNkZc76F6zwZ
	aRmTBYxtQNx9zjkrv8eyV+kDapYgXfEwA8ZfVeGQi790uvuwTBI7C01KQvtVyrCX3TflMvex5XeD3
	aC9fjU6bAGTjxYcXl9yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCN8-0000000Fz0n-30NR;
	Fri, 24 Jul 2026 09:39:14 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCN5-0000000Fz0B-2Occ
	for linux-mtd@lists.infradead.org;
	Fri, 24 Jul 2026 09:39:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BA2744E40F22;
	Fri, 24 Jul 2026 09:39:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8B38F60395;
	Fri, 24 Jul 2026 09:39:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A26FA11C11DD9;
	Fri, 24 Jul 2026 11:39:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784885945; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=A27jFx12vXNfjqH81hfxNYD7vviQVQL2KMKHCn7ENQs=;
	b=PhkQHF76iDWeAc/yIL0oAMk9si6TAkOpEkfCminZH90M0OrakeDBQs5z+RcUCSswqer+SM
	sifbA+TlFcuiAeXoE5Bgsrjf6dkFEcDtA4YXnVtdOLSfUkofFS9vEeow7+HDVC/mE2PgAF
	Xnbp5x5L1d5gCP/rFO7lFz9zxX9HSgtlD4CRJL0pMA85zZ3pJ4fkHxuPjgsX4qMeoGHO/W
	f34VcwRJBruNvVXK5XQgm5Fm+eZ4eY4Bupkjm+dBichPKyXkGrXaI6H1NaBSXD+fuCh1LN
	m8pnvEs2kNSX9umJfx5Et7D89RK4Fm6JzENQ+2BVWDP9/e/dUj1NQ6yEQoGSoA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
  Luca Ceresoli <luca.ceresoli@bootlin.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [RFC] mtd: virt-concat: define duplicate partition handling
In-Reply-To: <20260722041925.31407-1-pengpeng@iscas.ac.cn> (Pengpeng Hou's
	message of "Wed, 22 Jul 2026 12:19:25 +0800")
References: <20260722041925.31407-1-pengpeng@iscas.ac.cn>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 24 Jul 2026 11:39:01 +0200
Message-ID: <874ihosp56.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_023911_757182_2488F4FB 
X-CRM114-Status: GOOD (  17.50  )
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

SGkgUGVuZ3BlbmcsCgpPbiAyMi8wNy8yMDI2IGF0IDEyOjE5OjI1ICswOCwgUGVuZ3BlbmcgSG91
IDxwZW5ncGVuZ0Bpc2Nhcy5hYy5jbj4gd3JvdGU6Cgo+IG10ZF9kZXZpY2VfcGFyc2VfcmVnaXN0
ZXIoKSBjb250YWlucyBjb21wYXRpYmlsaXR5IGhhbmRsaW5nIGZvciBkcml2ZXJzIHRoYXQKPiBj
YWxsIGl0IG1vcmUgdGhhbiBvbmNlLCB3aGlsZSBpdHMgY29tbWVudCBub3RlcyB0aGF0IHBhcnRp
dGlvbiBwYXJzaW5nIGNhbgo+IHJlZ2lzdGVyIHRoZSBzYW1lIHBhcnRpdGlvbnMgYWdhaW4uCgpJ
cyB0aGlzIGZlYXR1cmUgcmVhbGx5IHJlbGV2YW50PyBXaG8gdXNlcyB0aGF0PwoKPiBXaGVuIENP
TkZJR19NVERfUEFSVElUSU9ORURfTUFTVEVSIGlzIGRpc2FibGVkIGFuZCB0aGUgZmlyc3QgY2Fs
bCBmaW5kcwo+IHBhcnRpdGlvbnMsIHRoZSBtYXN0ZXIgaXRzZWxmIGlzIG5vdCByZWdpc3RlcmVk
IGJlZm9yZSBwYXJzaW5nLiBBIGxhdGVyIGNhbGwKPiBjYW4gdGhlcmVmb3JlIHJlYWNoIHBhcnRp
dGlvbiBwYXJzaW5nIGFnYWluLgo+Cj4gV2l0aCBDT05GSUdfTVREX1ZJUlRfQ09OQ0FULCBlYWNo
IG5ld2x5IGFsbG9jYXRlZCBwYXJ0aXRpb24gd2hvc2UgT0Ygbm9kZQo+IGJlbG9uZ3MgdG8gYSB2
aXJ0dWFsIGNvbmNhdGVuYXRpb24gcmVhY2hlcyBtdGRfdmlydF9jb25jYXRfYWRkKCkuIFRoYXQK
PiBmdW5jdGlvbiBhcHBlbmRzIHRoZSBwYXJ0aXRpb24gYmFzZWQgb25seSBvbiB0aGUgT0Ygbm9k
ZSBhbmQgaW5jcmVtZW50cwo+IG51bV9zdWJkZXYgd2l0aG91dCBjaGVja2luZyB3aGV0aGVyIHRo
ZSBub2RlIHdhcyBhbHJlYWR5IGFkZGVkIG9yIHdoZXRoZXIKPiB0aGUgZml4ZWQgc3ViZGV2W10g
YXJyYXkgaXMgZnVsbC4KPgo+IEEgcmVwZWF0ZWQgcGFyc2UgY2FuIHRoZXJlZm9yZSBhcHBlbmQg
dGhlIHNhbWUgbm9kZSBhZ2Fpbi4gSWYgYWxsIGNvbmZpZ3VyZWQKPiBzbG90cyB3ZXJlIGFscmVh
ZHkgcG9wdWxhdGVkLCB0aGUgYXBwZW5kIGlzIG91dCBvZiBib3VuZHMuIElmIG90aGVyIG1lbWJl
cnMKPiBhcmUgc3RpbGwgbWlzc2luZywgdGhlIGR1cGxpY2F0ZSBjYW4gbWFrZSBudW1fc3ViZGV2
IHJlYWNoIHRoZSBjb25maWd1cmVkCj4gY291bnQgd2l0aCB0aGUgd3JvbmcgbWVtYmVyc2hpcC4K
Pgo+IEEgbG9jYWwgYm91bmRzIGNoZWNrIGRvZXMgbm90IHNlZW0gc3VmZmljaWVudCBmb3IgYSBj
b3JyZWN0IHBhdGNoOgo+Cj4gICAtIGNvbmNhdF9ub2RlX2xpc3QgYW5kIHRoZSBjb25jYXQgcG9w
dWxhdGlvbiBzdGF0ZSBhcmUgZ2xvYmFsLCBidXQgbm9kZQo+ICAgICBjcmVhdGlvbiwgYWRkaXRp
b24sIGpvaW4gY3JlYXRpb24gYW5kIGRlc3RydWN0aW9uIGhhdmUgbm8gY29tbW9uCj4gICAgIHNl
cmlhbGl6YXRpb24uCgpCdXQgYXJlbid0IHRoZXNlIG9wZXJhdGlvbnMgc2VyaWFsaXplZCBqdXN0
IGJlY2F1c2Ugb2YgaG93IHRoZSBNVEQgY29yZQppcyBkZXNpZ25lZD8KCj4gICAtIG10ZF92aXJ0
X2NvbmNhdF9hZGQoKSByZXR1cm5zIGJvb2wuIGZhbHNlIG1lYW5zIGJvdGggIm5vdCBhIGNvbmNh
dAo+ICAgICBtZW1iZXIiIGFuZCAibm90IGFkZGVkIi4gUmV0dXJuaW5nIGZhbHNlIGZvciBhIGR1
cGxpY2F0ZSBtYWtlcwo+ICAgICBhZGRfbXRkX3BhcnRpdGlvbnMoKSByZWdpc3RlciBpdCBhcyBh
biBvcmRpbmFyeSBwYXJ0aXRpb24sIHdoaWxlIHJldHVybmluZwo+ICAgICB0cnVlIHdpdGhvdXQg
c3RvcmluZyBpdCB3b3VsZCBsZWFrIHRoZSBuZXdseSBhbGxvY2F0ZWQgcGFydGl0aW9uLgo+ICAg
LSBqb2luIGNyZWF0aW9uIGFuZCBkZXN0cnVjdGlvbiBjYWxsIGJhY2sgaW50byBNVEQgcmVnaXN0
cmF0aW9uIGhlbHBlcnMsIHNvCj4gICAgIGEgZHJpdmVyLWdsb2JhbCBtdXRleCBtdXN0IGhhdmUg
YSBjYXJlZnVsbHkgZGVmaW5lZCBzY29wZSB0byBhdm9pZAo+ICAgICByZWN1cnNpdmUgbG9ja2lu
Zy4KPgo+IE15IGN1cnJlbnQgdmlldyBpcyB0aGF0IHRoZSBmaXggbmVlZHMgYm90aCBhIHNlcmlh
bGl6YXRpb24gY29udHJhY3QgZm9yIHRoZQo+IGdsb2JhbCB2aXJ0dWFsLWNvbmNhdCBzdGF0ZSBh
bmQgYSB0cmktc3RhdGUgYWRkIHJlc3VsdCwgc28gdGhlIGNhbGxlciBjYW4KPiBkaXN0aW5ndWlz
aCAibm90IGEgbWVtYmVyIiBmcm9tIGEgZHVwbGljYXRlIG9yIGNhcGFjaXR5IGVycm9yIGFuZCBm
cmVlIHRoZQo+IG5ldyBwYXJ0aXRpb24gb24gZXJyb3IuCj4KPiBXb3VsZCB5b3UgcHJlZmVyIHRo
aXMgc2VyaWFsaXphdGlvbiB0byBsaXZlIGluc2lkZSBtdGRfdmlydF9jb25jYXQsIG9yIHNob3Vs
ZAo+IHRoZSBNVEQgcmVnaXN0cmF0aW9uIGxheWVyIHNlcmlhbGl6ZSB0aGUgbm9kZS1jcmVhdGUv
cGFydGl0aW9uLWFkZC9qb2luCj4gdHJhbnNhY3Rpb24/IEkgaGF2ZSBub3QgYXR0YWNoZWQgYSBw
YXRjaCBiZWNhdXNlIGNob29zaW5nIGVpdGhlciBzY29wZQo+IHdpdGhvdXQgYWdyZWVtZW50IHdv
dWxkIGVuY29kZSBhIG5ldyBsaWZldGltZSBhbmQgZXJyb3ItaGFuZGxpbmcgY29udHJhY3QuCgpJ
ZiBpdCBpcyBzcGVjaWZpYyB0byB0aGUgdmlydCBjb25jYXQgbGF5ZXIsIEkgd291bGQgdHJ5IHRv
IGtlZXAgdGhlCmNoYW5nZXMgY29udGFpbmVkIGluIHRoZSB2aXJ0IGNvbmNhdCBkcml2ZXIuCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
