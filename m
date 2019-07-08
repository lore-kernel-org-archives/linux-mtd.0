Return-Path: <SRS0=ZMxb=VF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04132C606AF
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jul 2019 12:55:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC0032064B
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jul 2019 12:54:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lTiTOnzo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC0032064B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i3K/9tjtZGzxWO4tUuQ5Edk9WF8kG1Z36I3h1aVfwGU=; b=lTiTOnzoKWsYqt
	+otc3Dyzqz5YT0i1yAWZmVhNPEjhB5tN6GRBkU5dSslwkokxENn4mv/pybfqYtHT9GeQrMLo7j4Jx
	G9HeoLBg5x6Gn7j5NtcmlI23cs06QuZ41F2GRzm4R58rNU+bMw8i+6uzMidOOG1FSc/CMFR3k67aS
	a0RStLVsn2GbpNo9ZqcthVm+pRUfba4RRNb/sc4ukaGNOlONE42pR3FaHHDDc0DEhfUM+NFzLt5td
	VCgpcsASEfM3+IJvucIJlwFSGb6LKcNb+6IKnurHJ512JSPcwO8JgOyCb6ZW3QlX0PsP5vQPj9i1Z
	m9JRfqOZOa1hQjwjEq7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hkTAL-0005ad-SD; Mon, 08 Jul 2019 12:54:45 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hkTAI-0005aF-F6
 for linux-mtd@lists.infradead.org; Mon, 08 Jul 2019 12:54:45 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 78D0A1C0012;
 Mon,  8 Jul 2019 12:54:27 +0000 (UTC)
Date: Mon, 8 Jul 2019 14:54:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] mtd: remove c++ comments from uapi header
Message-ID: <20190708145426.62b4aabd@xps13>
In-Reply-To: <20190708124946.3679242-1-arnd@arndb.de>
References: <20190708124946.3679242-1-arnd@arndb.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190708_055442_662031_578D64B0 
X-CRM114-Status: GOOD (  16.59  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org,
 clang-built-linux@googlegroups.com, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQXJuZCwKCkFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+IHdyb3RlIG9uIE1vbiwgIDgg
SnVsIDIwMTkgMTQ6NDk6MzkgKzAyMDA6Cgo+IENoZWNraW5nIHRoZSB1YXBpIGhlYWRlcnMgbm93
IHByb2R1Y2VzIGEgd2FybmluZyB3aXRoIGNsYW5nOgo+IAo+IC4vdXNyL2luY2x1ZGUvbXRkL210
ZC1hYmkuaDoxMTY6Mjg6IGVycm9yOiAvLyBjb21tZW50cyBhcmUgbm90IGFsbG93ZWQgaW4gdGhp
cyBsYW5ndWFnZSBbLVdlcnJvciwtV2NvbW1lbnRdCj4gCj4gQ2hhbmdlIHRoZXNlIGludG8gc3Rh
bmRhcmQgQyBjb21tZW50cyBoZXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4g
PGFybmRAYXJuZGIuZGU+Cj4gLS0tCj4gIGluY2x1ZGUvdWFwaS9tdGQvbXRkLWFiaS5oIHwgMTAg
KysrKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbXRkL210ZC1hYmkuaCBiL2luY2x1
ZGUvdWFwaS9tdGQvbXRkLWFiaS5oCj4gaW5kZXggYWZmNWI1ZTU5ODQ1Li40N2ZmZTMyMDhjMjcg
MTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS91YXBpL210ZC9tdGQtYWJpLmgKPiArKysgYi9pbmNsdWRl
L3VhcGkvbXRkL210ZC1hYmkuaAo+IEBAIC0xMTMsMTEgKzExMywxMSBAQCBzdHJ1Y3QgbXRkX3dy
aXRlX3JlcSB7Cj4gICNkZWZpbmUgTVREX0NBUF9OVlJBTQkJKE1URF9XUklURUFCTEUgfCBNVERf
QklUX1dSSVRFQUJMRSB8IE1URF9OT19FUkFTRSkKPiAgCj4gIC8qIE9ic29sZXRlIEVDQyBieXRl
IHBsYWNlbWVudCBtb2RlcyAodXNlZCB3aXRoIG9ic29sZXRlIE1FTUdFVE9PQlNFTCkgKi8KPiAt
I2RlZmluZSBNVERfTkFOREVDQ19PRkYJCTAJLy8gU3dpdGNoIG9mZiBFQ0MgKE5vdCByZWNvbW1l
bmRlZCkKPiAtI2RlZmluZSBNVERfTkFOREVDQ19QTEFDRQkxCS8vIFVzZSB0aGUgZ2l2ZW4gcGxh
Y2VtZW50IGluIHRoZSBzdHJ1Y3R1cmUgKFlBRkZTMSBsZWdhY3kgbW9kZSkKPiAtI2RlZmluZSBN
VERfTkFOREVDQ19BVVRPUExBQ0UJMgkvLyBVc2UgdGhlIGRlZmF1bHQgcGxhY2VtZW50IHNjaGVt
ZQo+IC0jZGVmaW5lIE1URF9OQU5ERUNDX1BMQUNFT05MWQkzCS8vIFVzZSB0aGUgZ2l2ZW4gcGxh
Y2VtZW50IGluIHRoZSBzdHJ1Y3R1cmUgKERvIG5vdCBzdG9yZSBlY2MgcmVzdWx0IG9uIHJlYWQp
Cj4gLSNkZWZpbmUgTVREX05BTkRFQ0NfQVVUT1BMX1VTUiAJNAkvLyBVc2UgdGhlIGdpdmVuIGF1
dG9wbGFjZW1lbnQgc2NoZW1lIHJhdGhlciB0aGFuIHVzaW5nIHRoZSBkZWZhdWx0Cj4gKyNkZWZp
bmUgTVREX05BTkRFQ0NfT0ZGCQkwCS8qIFN3aXRjaCBvZmYgRUNDIChOb3QgcmVjb21tZW5kZWQp
ICovCj4gKyNkZWZpbmUgTVREX05BTkRFQ0NfUExBQ0UJMQkvKiBVc2UgdGhlIGdpdmVuIHBsYWNl
bWVudCBpbiB0aGUgc3RydWN0dXJlIChZQUZGUzEgbGVnYWN5IG1vZGUpICovCj4gKyNkZWZpbmUg
TVREX05BTkRFQ0NfQVVUT1BMQUNFCTIJLyogVXNlIHRoZSBkZWZhdWx0IHBsYWNlbWVudCBzY2hl
bWUgKi8KPiArI2RlZmluZSBNVERfTkFOREVDQ19QTEFDRU9OTFkJMwkvKiBVc2UgdGhlIGdpdmVu
IHBsYWNlbWVudCBpbiB0aGUgc3RydWN0dXJlIChEbyBub3Qgc3RvcmUgZWNjIHJlc3VsdCBvbiBy
ZWFkKSAqLwo+ICsjZGVmaW5lIE1URF9OQU5ERUNDX0FVVE9QTF9VU1IgCTQJLyogVXNlIHRoZSBn
aXZlbiBhdXRvcGxhY2VtZW50IHNjaGVtZSByYXRoZXIgdGhhbiB1c2luZyB0aGUgZGVmYXVsdCAq
Lwo+ICAKPiAgLyogT1RQIG1vZGUgc2VsZWN0aW9uICovCj4gICNkZWZpbmUgTVREX09UUF9PRkYJ
CTAKCkEgc2ltaWxhciBwYXRjaCBoYXMgYmVlbiBzZW50IGEgZmV3IHdlZWtzIGFnbyBhbmQgaGFz
IGJlZW4gYXBwbGllZAp5ZXN0ZXJkYXkgbmlnaHQgc28gaXQgc2hvdWxkIGhhdmUgYXBwZWFyZWQg
dGhpcyBtb3JuaW5nIGluIGxpbnV4LW5leHQgOikKCgpUaGFua3MgYW55d2F5IQpNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
