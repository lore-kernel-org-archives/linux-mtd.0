Return-Path: <SRS0=pM9p=R4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03789C43381
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 06:45:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5FC4206C0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 06:45:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HqhnlPjV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="s9SfYvAe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5FC4206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZJ6zPW5eUzq898E+TBdYWxqxLHlKTGXR9Kch/xRttU=; b=HqhnlPjVWKiskh
	kg49G1qrSmNUgZL9clxsve9lDnqud3TnblYP4oS/oQ+cUeZthbWjA3TDFmnZJ4cRxXOP6AuKCHObc
	lmo4+9SBgRbqH2qZXFka/Wverk7hbWLXA4dokgPHkAy9PtJO+mrHTF49Gb8qFQKEiAmpZbOsMZA4M
	6jxihqoQ6tkNTKkjug8+qOtjX7jqeQ0TEK+IvPFb3HGTrdP8Q6GIyCCk9nt4yBSZMaZ63SMLNNMSk
	OI88z7iznCNMHxCUEWqXwfQt8Kpcr5Hqmi+ymT50wRY8vmAEboBzeDwUJ3CLoTRAgZdKxpkIUVK7/
	nvwzsFN32GcR0f8oAT0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8JMW-0000Tb-VE; Mon, 25 Mar 2019 06:45:36 +0000
Received: from conssluserg-04.nifty.com ([210.131.2.83])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8JMH-0000KU-5Q; Mon, 25 Mar 2019 06:45:29 +0000
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
 [209.85.221.181]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id x2P6igBL003738;
 Mon, 25 Mar 2019 15:44:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x2P6igBL003738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1553496283;
 bh=TBTAAoxc845YLThKvAPkYbBCM6ldvYbj/UGkzwkcQAM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=s9SfYvAeSqIUtAvXRpZnL3fs+fGErLsknf/UM8QsJCd+E31WXSg8W4awFda3+J8Sd
 WnYCHXk2JEsfZepAmv+CysBKLnqmhQEKM0rPUd5KD2d8F16pId5qvhma7zkNPZsmKB
 S85mimjzYlvb94oGamww08hck4dFGnybJirdkvWdc4lzI4qS7j4Vq2VJw92okBS1SW
 4cp7uBLkaV2TA2XvEuSRJhfPIJ/F5W5QoEqhUG7VNrD+ePJdQFf/BshskYshCberRv
 9eFNYSojHTFFxRkki3KpOgnTmA8R4DaBIlnuwpI8MkV4aZ7FSvwlhIrrBChClK4u8A
 jxwnRXEu//UIw==
X-Nifty-SrcIP: [209.85.221.181]
Received: by mail-vk1-f181.google.com with SMTP id l17so1712204vke.7;
 Sun, 24 Mar 2019 23:44:43 -0700 (PDT)
X-Gm-Message-State: APjAAAVJUerq4t/q6IwKCJKw69NrcFWeQmYQX+QgsmEmQUOqfzozJ/b9
 WUu7L3LHLAP1Bth9PYLx6BxqfmT5jbCON5jTvwQ=
X-Google-Smtp-Source: APXvYqwTSFTBYn1wiYBRqHfKdoCVAdr+1/wgpdan2TCSHZXnhVT5/9jZ4MbEQSjIRz89Tdd3klpPpTJYpCQPkyUEguo=
X-Received: by 2002:a1f:b297:: with SMTP id b145mr13805982vkf.74.1553496282456; 
 Sun, 24 Mar 2019 23:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <1553062828-27798-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK8P3a3BG_mxYxxCx4S_+ZKAer_+5FpmkzLk0VrACZekuD=2GQ@mail.gmail.com>
 <CAK8P3a0GEYTbw5XCwzVeZe_-pGF=7e=1kXhH3U+fidnMZeP0CA@mail.gmail.com>
 <20190323092640.Horde.2lm4u26aZox5ialxuIRcYw2@messagerie.si.c-s.fr>
In-Reply-To: <20190323092640.Horde.2lm4u26aZox5ialxuIRcYw2@messagerie.si.c-s.fr>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 25 Mar 2019 15:44:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQGifytZRQXcqma9VuvQPfL2w8NjzLRt7CxzFgvaMhyRw@mail.gmail.com>
Message-ID: <CAK7LNAQGifytZRQXcqma9VuvQPfL2w8NjzLRt7CxzFgvaMhyRw@mail.gmail.com>
Subject: Re: [PATCH] compiler: allow all arches to enable
 CONFIG_OPTIMIZE_INLINING
To: LEROY Christophe <christophe.leroy@c-s.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_234521_414722_43EDFC43 
X-CRM114-Status: GOOD (  11.96  )
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

SGkgQ2hyaXN0b3BoZSwKCgpPbiBTYXQsIE1hciAyMywgMjAxOSBhdCA1OjI3IFBNIExFUk9ZIENo
cmlzdG9waGUKPGNocmlzdG9waGUubGVyb3lAYy1zLmZyPiB3cm90ZToKPgo+IEFybmQgQmVyZ21h
bm4gPGFybmRAYXJuZGIuZGU+IGEgw6ljcml0IDoKPgo+ID4gT24gV2VkLCBNYXIgMjAsIDIwMTkg
YXQgMTA6NDEgQU0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4gd3JvdGU6Cj4gPj4KPiA+
PiBJJ3ZlIGFkZGVkIHlvdXIgcGF0Y2ggdG8gbXkgcmFuZGNvbmZpZyB0ZXN0IHNldHVwIGFuZCB3
aWxsIGxldCB5b3UKPiA+PiBrbm93IGlmIEkgc2VlIGFueXRoaW5nIG5vdGljZWFibGUuIEknbSBj
dXJyZW50bHkgdGVzdGluZyBjbGFuZy1hcm0zMiwKPiA+PiBjbGFuZy1hcm02NCBhbmQgZ2NjLXg4
Ni4KPiA+Cj4gPiBUaGlzIGlzIHRoZSBvbmx5IGFkZGl0aW9uYWwgYnVnIHRoYXQgaGFzIGNvbWUg
dXAgc28gZmFyOgo+ID4KPiA+IGAuZXhpdC50ZXh0JyByZWZlcmVuY2VkIGluIHNlY3Rpb24gYC5h
bHQuc21wLmluaXQnIG9mCj4gPiBkcml2ZXJzL2NoYXIvaXBtaS9pcG1pX21zZ2hhbmRsZXIubzog
ZGVmaW5lZCBpbiBkaXNjYXJkZWQgc2VjdGlvbgo+ID4gYGV4aXQudGV4dCcgb2YgZHJpdmVycy9j
aGFyL2lwbWkvaXBtaV9tc2doYW5kbGVyLm8KPgo+IFdvdWxkbid0IGl0IGJlIHVzZWZ1bCB0byBh
Y3RpdmF0ZSAtV2lubGluZSBnY2Mgd2FybmluZyB0byBlYXNlIGZpbmRpbmcKPiBvdXQgcHJvYmxl
bWF0aWMgdXNhZ2Ugb2YgaW5saW5lIGtleXdvcmQgPwoKClllcywgaXQgaXMgdXNlZnVsIHRvIGZp
bmQgb3V0CndoaWNoIGZ1bmN0aW9uIGlzIGNhdXNpbmcgdGhlIGVycm9yLgpUaGFua3MgZm9yIHRo
ZSB0aXAuCgoKCgotLSAKQmVzdCBSZWdhcmRzCk1hc2FoaXJvIFlhbWFkYQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
