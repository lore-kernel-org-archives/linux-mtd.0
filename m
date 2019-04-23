Return-Path: <SRS0=5gbO=SZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D8AC282DD
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 03:27:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EF9A20811
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 03:27:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h3+Mt1G2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="rpBNEm11"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EF9A20811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ST+V3AAD5IdFOfpi5CN5wjGHrvkuFJkkUlRRY/3Wb0=; b=h3+Mt1G2MvrY7C
	8o6nAXgTIcNkzfqpelsyERTJ2/TyidKLUqcCtNoHOQCN2joEBYmA2ijy3bLOoHn2CpZOawBbzkx69
	iSSoQ9JqmqIAjGDOIBi7HT2MFkpunpAxBkeeCY4hURA3HFp/Tf4K/MIIa9PchiooDveYT0FxEu3t6
	cpUUV0Ye6be6R/aImgrJRKTbFrUPmS5TUZ/XmasxTJZdcopW8qeMR96Q7xaflANgZfohAV+o7a/2G
	kLVjVEnFldNs6/fN2k7/ZQB8lcR95aDJpEV4Kqjuh91CHFEEzmUY7WuAiGfDbV5lO7wPTIMVwkhCP
	vv4pxEXo7iA0ahJKVqOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIm5O-0005Lc-Hz; Tue, 23 Apr 2019 03:27:10 +0000
Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIm5F-0005EF-T2; Tue, 23 Apr 2019 03:27:03 +0000
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id x3N3QebU005654;
 Tue, 23 Apr 2019 12:26:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x3N3QebU005654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1555990001;
 bh=+sM4okn7en/aXLTxk39Iv8cVSFLO5kMp2OmxveFMPqA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rpBNEm11sedr4ZTTqn4DWKErS1jmsxU0wCFi0W4J5QIhcrg6UGyXJ0GPxeGxBm2Jk
 N7PzxyYAsMY4p5A9/yTYYmkUiTB/C40RxrMyYLm0K/gSEp1+Sdckyco7gus660Fi4g
 hgd9pqYd3Vm0IzUma7z1q8AyPdVLgj2QT6VDXVlH+pMpEzVZlRC+ecL0v37PFOYYVs
 IJ8mDqVFUteeWnZ5OpEcPkL3bDFH5tIMVernuNZGtxY9FSVumMNFqIUs5StTOolLap
 eGnxFSaCr2Z9sKcTYd4qXq1WFFQTcMV4kS7yRB9DDQWVOyaQo01I/QkYsKcqnkLrTK
 rPxED8Ccb4PXQ==
X-Nifty-SrcIP: [209.85.217.42]
Received: by mail-vs1-f42.google.com with SMTP id j184so7412294vsd.11;
 Mon, 22 Apr 2019 20:26:40 -0700 (PDT)
X-Gm-Message-State: APjAAAWeMIr1CutcYjfzyCsgMfzFxDpFpFSsO4L0HE1ya7FuoetKfPFm
 3zfO0i5wWexSGSpTjpi7Rrfwh7sSJkfFR52wl7g=
X-Google-Smtp-Source: APXvYqx2ley7uSFnGGyGDabU1ZUfPiuLyEbp0qC3i0OaiObNnBFjDDjfzPzXXacVJD6LAmdWjocvMILtntWiqRva/Zw=
X-Received: by 2002:a67:ea89:: with SMTP id f9mr1367458vso.179.1555989999934; 
 Mon, 22 Apr 2019 20:26:39 -0700 (PDT)
MIME-Version: 1.0
References: <1553062828-27798-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK8P3a3BG_mxYxxCx4S_+ZKAer_+5FpmkzLk0VrACZekuD=2GQ@mail.gmail.com>
 <CAK8P3a0GEYTbw5XCwzVeZe_-pGF=7e=1kXhH3U+fidnMZeP0CA@mail.gmail.com>
 <20190323092640.Horde.2lm4u26aZox5ialxuIRcYw2@messagerie.si.c-s.fr>
 <CAK7LNAQGifytZRQXcqma9VuvQPfL2w8NjzLRt7CxzFgvaMhyRw@mail.gmail.com>
 <686abdd5-863a-02ce-5ac9-f573208b8315@c-s.fr>
In-Reply-To: <686abdd5-863a-02ce-5ac9-f573208b8315@c-s.fr>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 23 Apr 2019 12:26:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQyjhDaLk_9W65=s4jfPN_AAELuGSZRAs4Xup4Xj79CGQ@mail.gmail.com>
Message-ID: <CAK7LNAQyjhDaLk_9W65=s4jfPN_AAELuGSZRAs4Xup4Xj79CGQ@mail.gmail.com>
Subject: Re: [PATCH] compiler: allow all arches to enable
 CONFIG_OPTIMIZE_INLINING
To: Christophe Leroy <christophe.leroy@c-s.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190422_202702_149063_A2833415 
X-CRM114-Status: GOOD (  13.99  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Dave Hansen <dave@sr71.net>,
 Arnd Bergmann <arnd@arndb.de>, the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mips@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
 Ingo Molnar <mingo@redhat.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQ2hyaXN0b3BoZSwKCk9uIFR1ZSwgTWFyIDI2LCAyMDE5IGF0IDM6MDMgUE0gQ2hyaXN0b3Bo
ZSBMZXJveQo8Y2hyaXN0b3BoZS5sZXJveUBjLXMuZnI+IHdyb3RlOgo+Cj4gSGkgTWFzYWhpcm8s
Cj4KPiBMZSAyNS8wMy8yMDE5IMOgIDA3OjQ0LCBNYXNhaGlybyBZYW1hZGEgYSDDqWNyaXQgOgo+
ID4gSGkgQ2hyaXN0b3BoZSwKPiA+Cj4gPgo+ID4gT24gU2F0LCBNYXIgMjMsIDIwMTkgYXQgNToy
NyBQTSBMRVJPWSBDaHJpc3RvcGhlCj4gPiA8Y2hyaXN0b3BoZS5sZXJveUBjLXMuZnI+IHdyb3Rl
Ogo+ID4+Cj4gPj4gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4gYSDDqWNyaXQgOgo+ID4+
Cj4gPj4+IE9uIFdlZCwgTWFyIDIwLCAyMDE5IGF0IDEwOjQxIEFNIEFybmQgQmVyZ21hbm4gPGFy
bmRAYXJuZGIuZGU+IHdyb3RlOgo+ID4+Pj4KPiA+Pj4+IEkndmUgYWRkZWQgeW91ciBwYXRjaCB0
byBteSByYW5kY29uZmlnIHRlc3Qgc2V0dXAgYW5kIHdpbGwgbGV0IHlvdQo+ID4+Pj4ga25vdyBp
ZiBJIHNlZSBhbnl0aGluZyBub3RpY2VhYmxlLiBJJ20gY3VycmVudGx5IHRlc3RpbmcgY2xhbmct
YXJtMzIsCj4gPj4+PiBjbGFuZy1hcm02NCBhbmQgZ2NjLXg4Ni4KPiA+Pj4KPiA+Pj4gVGhpcyBp
cyB0aGUgb25seSBhZGRpdGlvbmFsIGJ1ZyB0aGF0IGhhcyBjb21lIHVwIHNvIGZhcjoKPiA+Pj4K
PiA+Pj4gYC5leGl0LnRleHQnIHJlZmVyZW5jZWQgaW4gc2VjdGlvbiBgLmFsdC5zbXAuaW5pdCcg
b2YKPiA+Pj4gZHJpdmVycy9jaGFyL2lwbWkvaXBtaV9tc2doYW5kbGVyLm86IGRlZmluZWQgaW4g
ZGlzY2FyZGVkIHNlY3Rpb24KPiA+Pj4gYGV4aXQudGV4dCcgb2YgZHJpdmVycy9jaGFyL2lwbWkv
aXBtaV9tc2doYW5kbGVyLm8KPiA+Pgo+ID4+IFdvdWxkbid0IGl0IGJlIHVzZWZ1bCB0byBhY3Rp
dmF0ZSAtV2lubGluZSBnY2Mgd2FybmluZyB0byBlYXNlIGZpbmRpbmcKPiA+PiBvdXQgcHJvYmxl
bWF0aWMgdXNhZ2Ugb2YgaW5saW5lIGtleXdvcmQgPwo+ID4KPiA+Cj4gPiBZZXMsIGl0IGlzIHVz
ZWZ1bCB0byBmaW5kIG91dAo+ID4gd2hpY2ggZnVuY3Rpb24gaXMgY2F1c2luZyB0aGUgZXJyb3Iu
Cj4gPiBUaGFua3MgZm9yIHRoZSB0aXAuCj4gPgo+Cj4gSSBkaWQgYSBtYXNzIGJ1aWxkIG9uIGtp
c3NrYi4gQWxtb3N0IG9rLCBzZWUgcmVzdWx0cyBhdAo+IGh0dHA6Ly9raXNza2IuZWxsZXJtYW4u
aWQuYXUva2lzc2tiL2hlYWQvMjAzZDkxMmVkZjhkZGUyOTE5NzdjNzFhYTY0MDI0MDY1ZTE5N2Y3
OS8KPgo+IHBzM19kZWZjb25maWcgd2l0aCBHQ0MgNSBmYWlscwo+IChodHRwOi8va2lzc2tiLmVs
bGVybWFuLmlkLmF1L2tpc3NrYi9idWlsZHJlc3VsdC8xMzc0MjcxMS8pIHdpdGg6Cj4KPiBhcmNo
L3Bvd2VycGMvbW0vdGxiLXJhZGl4LmM6MTQ4OjI6IGVycm9yOiBhc20gb3BlcmFuZCAzIHByb2Jh
Ymx5IGRvZXNuJ3QKPiBtYXRjaCBjb25zdHJhaW50cyBbLVdlcnJvcl0KPiBhcmNoL3Bvd2VycGMv
bW0vdGxiLXJhZGl4LmM6MTQ4OjI6IGVycm9yOiBpbXBvc3NpYmxlIGNvbnN0cmFpbnQgaW4gJ2Fz
bScKPiBhcmNoL3Bvd2VycGMvbW0vdGxiLXJhZGl4LmM6MTE4OjI6IGVycm9yOiBhc20gb3BlcmFu
ZCAzIHByb2JhYmx5IGRvZXNuJ3QKPiBtYXRjaCBjb25zdHJhaW50cyBbLVdlcnJvcl0KPiBhcmNo
L3Bvd2VycGMvbW0vdGxiLXJhZGl4LmM6MTA0OjI6IGVycm9yOiBhc20gb3BlcmFuZCAzIHByb2Jh
Ymx5IGRvZXNuJ3QKPiBtYXRjaCBjb25zdHJhaW50cyBbLVdlcnJvcl0KPgo+IHBzM19kZWZjb25m
aWcgd2l0aCBHQ0MgNC42IGZhaWxzCj4gKGh0dHA6Ly9raXNza2IuZWxsZXJtYW4uaWQuYXUva2lz
c2tiL2J1aWxkcmVzdWx0LzEzNzQyNTkxLykgd2l0aDoKPgo+IGFyY2gvcG93ZXJwYy9tbS90bGIt
cmFkaXguYzoxNDg6MjogZXJyb3I6IGFzbSBvcGVyYW5kIDMgcHJvYmFibHkgZG9lc24ndAo+IG1h
dGNoIGNvbnN0cmFpbnRzIFstV2Vycm9yXQo+IGFyY2gvcG93ZXJwYy9tbS90bGItcmFkaXguYzox
MTg6MjogZXJyb3I6IGFzbSBvcGVyYW5kIDMgcHJvYmFibHkgZG9lc24ndAo+IG1hdGNoIGNvbnN0
cmFpbnRzIFstV2Vycm9yXQo+IGFyY2gvcG93ZXJwYy9tbS90bGItcmFkaXguYzoxMDQ6MjogZXJy
b3I6IGFzbSBvcGVyYW5kIDMgcHJvYmFibHkgZG9lc24ndAo+IG1hdGNoIGNvbnN0cmFpbnRzIFst
V2Vycm9yXQo+Cj4gcmFuZGNvbmZpZyB3aXRoIEdDQyA0LjYgZmFpbHMKPiAoaHR0cDovL2tpc3Nr
Yi5lbGxlcm1hbi5pZC5hdS9raXNza2IvYnVpbGRyZXN1bHQvMTM3NDI2OTgvKSB3aXRoOgo+Cj4g
YXJjaC9wb3dlcnBjL21tL3RsYi1yYWRpeC5jOjEwNDoyOiBlcnJvcjogaW1wb3NzaWJsZSBjb25z
dHJhaW50IGluICdhc20nCgoKVGhhbmtzLgoKSSBmaXhlZCB0aGVzZSBwcGMgZXJyb3JzLAphbmQg
c2VwYXJhdGUgb3V0IGFyY2gtZml4ZXMuCgpOb3csIHRoZSBsYXRlc3QgdmVyc2lvbiBpcyB2My4K
CgotLSAKQmVzdCBSZWdhcmRzCk1hc2FoaXJvIFlhbWFkYQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
