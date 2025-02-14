Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97394C02198
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Feb 2025 19:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=T6f4v4FPp0/P04pepmzE5cBAu/gn5n21lpiJra6Vfg4=; b=PYjuERQdPWSGgFxeNSeT5YDxsb
	Tb5AaASZaGi8ZOkZJTVgCY2ZE5g/IO+ztNHmyMLceaVBWePxZaDHRS+IVtrYUMdzLM7E1/OzINcrB
	1TPY2uiDeDVc5BoTJWj5/xHB+hvAQ+kcPFqkMR6qcnJiaNkyNF4JwffhJ8w+KihxyNgEJP+13IA0/
	zU2dagsT1vnG4yeNH25CkjlrIZ5+0lou6NcAI3HD6qF/5aTMOOHe15VIR201O6uGEdzXjyQ2wWJdi
	DrCjrjw3uZARw2/n3pjW57cGBzbJOsLFqpAfEYe66PogwWtNOsx2d8+L1teIUC9uCRL9NoYUpSYHj
	2xm1EOKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj1Da-0000000G0h8-3dyD;
	Fri, 14 Feb 2025 19:19:18 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj1DX-0000000G0gY-2GtQ
	for linux-mtd@lists.infradead.org;
	Fri, 14 Feb 2025 19:19:17 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id D044A2B03C5;
	Fri, 14 Feb 2025 20:19:10 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id g1ScPR7_6Z_g; Fri, 14 Feb 2025 20:19:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 27C5D2B4F81;
	Fri, 14 Feb 2025 20:19:10 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Yo7Iti6Cs6o2; Fri, 14 Feb 2025 20:19:10 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id EFFA32B03C5;
	Fri, 14 Feb 2025 20:19:09 +0100 (CET)
Date: Fri, 14 Feb 2025 20:19:09 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Ashley Herron <herroash@amazon.com>
Cc: alex <alex@nextthing.co>, 
	boris brezillon <boris.brezillon@free-electrons.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, rdlee <rdlee@amazon.com>
Message-ID: <279563562.5242299.1739560749636.JavaMail.zimbra@nod.at>
In-Reply-To: <20250214160419.18583-1-herroash@amazon.com>
References: <574215219.28176795.1739397523614.JavaMail.zimbra@nod.at> <20250214160419.18583-1-herroash@amazon.com>
Subject: Re: [RFC] UBI statistics and bitrot interface
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF135 (Linux)/8.8.12_GA_3809)
Thread-Topic: UBI statistics and bitrot interface
Thread-Index: 5Vt4Lqq2VqKbj3VKJYgEr5YkheuIBw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_111915_719192_B654AF43 
X-CRM114-Status: UNSURE (   6.69  )
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

QXNobGV5LAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkFzaGxleSBI
ZXJyb24iIDxoZXJyb2FzaEBhbWF6b24uY29tPgo+PiBXaGF0IGtpbmQgb2YgbWV0cmljcyBhcmUg
eW91IGxvb2tpbmcgZm9yPwo+PiBNYXliZSBzb21lIGVCUEYvdHJhY2luZyBtYWdpYyB3aWxsIGFs
cmVhZHkgc2VydmUgeW91IGVub3VnaCBkYXRhIHBvaW50cz8KPiAKPiBUaGUgZ29hbCBpcyB0byBj
YXB0dXJlIHNpbWlsYXIgZGF0YSBhcyBlTU1DIGFuZCBVRlMgZGV2aWNlcyByZXBvcnQgcmVnYXJk
aW5nCj4gdG90YWwgYnl0ZXMgd3JpdHRlbiB0byB0aGUgYmxvY2sgZGV2aWNlLiBTbyBJIHdhbnQg
dG8gY2FwdHVyZSB0b3RhbCAocGF5bG9hZCkKPiBieXRlcyB3cml0dGVuIGJ5IGNhbGxlcnMgdG8g
dGhlIFVCSSBsYXllciwgbm90IGluY2x1ZGluZyBVQkkgb3ZlcmhlYWQgKGhlYWRlcnMsCj4gd2Vh
ciBsZXZlbGluZykuIFRoaXMgaXMgZm9yIHRoZSBwdXJwb3NlIG9mIG1vbml0b3JpbmcgYW5kIGlk
ZW50aWZ5aW5nIGFueQo+IHBhdHRlcm4gb2YgZXhjZXNzaXZlIHdyaXRpbmcgb24gZGV2aWNlcyBp
biBvcGVyYXRpb24gdGhhdCBtYXkgZWZmZWN0IGl0cwo+IGxpZmV0aW1lLiBXZSBtYXkgd2FudCB0
byBtb25pdG9yIHRvdGFsIHdyaXRlcyB0byBhIFVCSSBkZXZpY2Ugb3ZlciBhIDI0IGhvdXIKPiBw
ZXJpb2RzIG9yIGxlc3MsIHNvIG9ubHkgdXNpbmcgZXJhc2UgY291bnRlciBtb25pdG9yaW5nIGRv
ZXNuJ3QgZ2l2ZSB1cyB0aGUKPiBsZXZlbCBvZiBtb25pdG9yaW5nIHdlIHJlcXVpcmUuIFdlIHdy
aXRlIHRvIHNvbWUgVUJJIHZvbHVtZXMgdXNpbmcgVUJJRlMKPiBhbmQgb3RoZXJzIHVzaW5nIFVC
SSBJTyBkaXJlY3RseS4gSSB3YXMgcGxhbm5pbmcgdG8gYWRkIChvciByZXF1ZXN0IHlvdSBhZGQp
IGEKPiB3YyAod3JpdGUgY291bnQpIHZhcmlhYmxlIHRvIHRoZSBjdXJyZW50IHN0cnVjdCB3aXRo
IGVjIGFuZCByYyBpbiB0aGlzIHBhdGNoc2V0LgoKTWF5YmUgdGhpcyBzdGFsZSBwYXRjaCBoZWxw
czoKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4LW10ZC9wYXRjaC8x
NTMyMzYwMzQyLTUyMDU1LTEtZ2l0LXNlbmQtZW1haWwtcGVyZm5AYXhpcy5jb20vCgpBcyBmYXIg
YXMgSSByZW1lbWJlciwgdGhlIHN1Ym1pdHRlciBuZXZlciBhbnN3ZXJlZCBub3IgYmxvY2sgbGF5
ZXIgZm9sa3Mgc3Bva2UgdXAuCkhvcGUgdGhpcyBoZWxwcyEKClRoYW5rcywKLy9yaWNoYXJkCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
