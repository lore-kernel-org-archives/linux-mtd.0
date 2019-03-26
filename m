Return-Path: <SRS0=gzro=R5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F8F7C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2019 06:03:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 182B320856
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2019 06:03:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BxYToLdB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="STYA/823"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 182B320856
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S4J4Oi3ftFA/MX5lqCDjsWMd07MdSZMxqp7KtutoRjk=; b=BxYToLdBhkKFT0AlIO8v8EKMS
	Qesi/yctVHGkoRKJWxDppX4+XqkrzHY7tzZsB32Jrak9f4T2e00jjxnz9FukMLO5lOcKg2+InVw1O
	nwZlk2TWHXnNWzNqrc5cFoe/p0ymsqFVregPQRNcMCn619XLLBS4A5kotDo1e6Q3yV4eUekdcgxoM
	fBU4wiMIV624j9uyNa3BodzOsQnAFljTopN0k2lqPdBc1EIUTKUBaG9SYwPtp/RS7vcLcyg5afzD2
	tAJ+iXN+z3ELJ4uwEdMNLTc3yWnQyUJRJIlsdQJLe9jhtcJ6VtVIDSgI5HOQFYWNtYldGgdQp8hKD
	qYRHai+yQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8fB4-0002iP-G8; Tue, 26 Mar 2019 06:03:14 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8fAr-0002db-Vc; Tue, 26 Mar 2019 06:03:06 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44T0sq3PSJz9v1Lc;
 Tue, 26 Mar 2019 07:02:55 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=STYA/823; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id SgS_Hp3vGlkR; Tue, 26 Mar 2019 07:02:55 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44T0sq2HRtz9v1L3;
 Tue, 26 Mar 2019 07:02:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1553580175; bh=Fy6LPoOdBs73WrsGgbOPU6qskDPR3fq9ggj5GTIfUTI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=STYA/823aLEMykfaZpZWjkFn6b0mXN5WeJmw/gopLjkZ9xPdnJHqW/2fN4QkjK8+H
 aFfQ/gKFPQlQr+r/j3C0W52SxHyDLn2bjka6i6Q8pOL1E/Tgym8ze1f4USXZ31xhQA
 l3QrHTc+eO/hKyaXoRy2t7HJa/xd3SId7zeM4jls=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1330E8B77C;
 Tue, 26 Mar 2019 07:02:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id xor2vUAwR2nm; Tue, 26 Mar 2019 07:02:55 +0100 (CET)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0CE1D8B74C;
 Tue, 26 Mar 2019 07:02:55 +0100 (CET)
Subject: Re: [PATCH] compiler: allow all arches to enable
 CONFIG_OPTIMIZE_INLINING
To: Masahiro Yamada <yamada.masahiro@socionext.com>
References: <1553062828-27798-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK8P3a3BG_mxYxxCx4S_+ZKAer_+5FpmkzLk0VrACZekuD=2GQ@mail.gmail.com>
 <CAK8P3a0GEYTbw5XCwzVeZe_-pGF=7e=1kXhH3U+fidnMZeP0CA@mail.gmail.com>
 <20190323092640.Horde.2lm4u26aZox5ialxuIRcYw2@messagerie.si.c-s.fr>
 <CAK7LNAQGifytZRQXcqma9VuvQPfL2w8NjzLRt7CxzFgvaMhyRw@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <686abdd5-863a-02ce-5ac9-f573208b8315@c-s.fr>
Date: Tue, 26 Mar 2019 07:02:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQGifytZRQXcqma9VuvQPfL2w8NjzLRt7CxzFgvaMhyRw@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_230302_356607_3880914A 
X-CRM114-Status: GOOD (  12.82  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpMZSAyNS8wMy8yMDE5IMOgIDA3OjQ0LCBNYXNhaGlybyBZYW1hZGEgYSDD
qWNyaXTCoDoKPiBIaSBDaHJpc3RvcGhlLAo+IAo+IAo+IE9uIFNhdCwgTWFyIDIzLCAyMDE5IGF0
IDU6MjcgUE0gTEVST1kgQ2hyaXN0b3BoZQo+IDxjaHJpc3RvcGhlLmxlcm95QGMtcy5mcj4gd3Jv
dGU6Cj4+Cj4+IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+IGEgw6ljcml0IDoKPj4KPj4+
IE9uIFdlZCwgTWFyIDIwLCAyMDE5IGF0IDEwOjQxIEFNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+IHdyb3RlOgo+Pj4+Cj4+Pj4gSSd2ZSBhZGRlZCB5b3VyIHBhdGNoIHRvIG15IHJhbmRj
b25maWcgdGVzdCBzZXR1cCBhbmQgd2lsbCBsZXQgeW91Cj4+Pj4ga25vdyBpZiBJIHNlZSBhbnl0
aGluZyBub3RpY2VhYmxlLiBJJ20gY3VycmVudGx5IHRlc3RpbmcgY2xhbmctYXJtMzIsCj4+Pj4g
Y2xhbmctYXJtNjQgYW5kIGdjYy14ODYuCj4+Pgo+Pj4gVGhpcyBpcyB0aGUgb25seSBhZGRpdGlv
bmFsIGJ1ZyB0aGF0IGhhcyBjb21lIHVwIHNvIGZhcjoKPj4+Cj4+PiBgLmV4aXQudGV4dCcgcmVm
ZXJlbmNlZCBpbiBzZWN0aW9uIGAuYWx0LnNtcC5pbml0JyBvZgo+Pj4gZHJpdmVycy9jaGFyL2lw
bWkvaXBtaV9tc2doYW5kbGVyLm86IGRlZmluZWQgaW4gZGlzY2FyZGVkIHNlY3Rpb24KPj4+IGBl
eGl0LnRleHQnIG9mIGRyaXZlcnMvY2hhci9pcG1pL2lwbWlfbXNnaGFuZGxlci5vCj4+Cj4+IFdv
dWxkbid0IGl0IGJlIHVzZWZ1bCB0byBhY3RpdmF0ZSAtV2lubGluZSBnY2Mgd2FybmluZyB0byBl
YXNlIGZpbmRpbmcKPj4gb3V0IHByb2JsZW1hdGljIHVzYWdlIG9mIGlubGluZSBrZXl3b3JkID8K
PiAKPiAKPiBZZXMsIGl0IGlzIHVzZWZ1bCB0byBmaW5kIG91dAo+IHdoaWNoIGZ1bmN0aW9uIGlz
IGNhdXNpbmcgdGhlIGVycm9yLgo+IFRoYW5rcyBmb3IgdGhlIHRpcC4KPiAKCkkgZGlkIGEgbWFz
cyBidWlsZCBvbiBraXNza2IuIEFsbW9zdCBvaywgc2VlIHJlc3VsdHMgYXQgCmh0dHA6Ly9raXNz
a2IuZWxsZXJtYW4uaWQuYXUva2lzc2tiL2hlYWQvMjAzZDkxMmVkZjhkZGUyOTE5NzdjNzFhYTY0
MDI0MDY1ZTE5N2Y3OS8KCnBzM19kZWZjb25maWcgd2l0aCBHQ0MgNSBmYWlscyAKKGh0dHA6Ly9r
aXNza2IuZWxsZXJtYW4uaWQuYXUva2lzc2tiL2J1aWxkcmVzdWx0LzEzNzQyNzExLykgd2l0aDoK
CmFyY2gvcG93ZXJwYy9tbS90bGItcmFkaXguYzoxNDg6MjogZXJyb3I6IGFzbSBvcGVyYW5kIDMg
cHJvYmFibHkgZG9lc24ndCAKbWF0Y2ggY29uc3RyYWludHMgWy1XZXJyb3JdCmFyY2gvcG93ZXJw
Yy9tbS90bGItcmFkaXguYzoxNDg6MjogZXJyb3I6IGltcG9zc2libGUgY29uc3RyYWludCBpbiAn
YXNtJwphcmNoL3Bvd2VycGMvbW0vdGxiLXJhZGl4LmM6MTE4OjI6IGVycm9yOiBhc20gb3BlcmFu
ZCAzIHByb2JhYmx5IGRvZXNuJ3QgCm1hdGNoIGNvbnN0cmFpbnRzIFstV2Vycm9yXQphcmNoL3Bv
d2VycGMvbW0vdGxiLXJhZGl4LmM6MTA0OjI6IGVycm9yOiBhc20gb3BlcmFuZCAzIHByb2JhYmx5
IGRvZXNuJ3QgCm1hdGNoIGNvbnN0cmFpbnRzIFstV2Vycm9yXQoKcHMzX2RlZmNvbmZpZyB3aXRo
IEdDQyA0LjYgZmFpbHMgCihodHRwOi8va2lzc2tiLmVsbGVybWFuLmlkLmF1L2tpc3NrYi9idWls
ZHJlc3VsdC8xMzc0MjU5MS8pIHdpdGg6CgphcmNoL3Bvd2VycGMvbW0vdGxiLXJhZGl4LmM6MTQ4
OjI6IGVycm9yOiBhc20gb3BlcmFuZCAzIHByb2JhYmx5IGRvZXNuJ3QgCm1hdGNoIGNvbnN0cmFp
bnRzIFstV2Vycm9yXQphcmNoL3Bvd2VycGMvbW0vdGxiLXJhZGl4LmM6MTE4OjI6IGVycm9yOiBh
c20gb3BlcmFuZCAzIHByb2JhYmx5IGRvZXNuJ3QgCm1hdGNoIGNvbnN0cmFpbnRzIFstV2Vycm9y
XQphcmNoL3Bvd2VycGMvbW0vdGxiLXJhZGl4LmM6MTA0OjI6IGVycm9yOiBhc20gb3BlcmFuZCAz
IHByb2JhYmx5IGRvZXNuJ3QgCm1hdGNoIGNvbnN0cmFpbnRzIFstV2Vycm9yXQoKcmFuZGNvbmZp
ZyB3aXRoIEdDQyA0LjYgZmFpbHMgCihodHRwOi8va2lzc2tiLmVsbGVybWFuLmlkLmF1L2tpc3Nr
Yi9idWlsZHJlc3VsdC8xMzc0MjY5OC8pIHdpdGg6CgphcmNoL3Bvd2VycGMvbW0vdGxiLXJhZGl4
LmM6MTA0OjI6IGVycm9yOiBpbXBvc3NpYmxlIGNvbnN0cmFpbnQgaW4gJ2FzbScKCkNocmlzdG9w
aGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
