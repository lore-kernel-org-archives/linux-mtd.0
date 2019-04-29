Return-Path: <SRS0=nQMH=S7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79612C43219
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 15:36:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A61320673
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 15:36:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tdg50Jhs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="Q5o3w0VV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A61320673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J3sdNTfbgbMLH2A7GjiB3KLmCaG99alpZKWhzRSPJsQ=; b=Tdg50Jhsw2TLQyE4Zk/deEPCi
	/vwxWwZAMLxX8jlD1To/cNb19XPF+WX8U44QviKYbdZRHBVe8oKLYQ/2qQyT+8Gx+gpZHTzkgU47w
	edsfSvVWVZiuu+CoyS5ZVyLNT8VLw503ZkZbX32S6sth+m5Ii7UCch4vdbjTxXanvq1pKeIILP+o1
	cscUXCRQb0g/XVI6jITMgzbFlV6+EVsJkpn4EVSHdIrs2Jl6H9Ae7Zko6H3vWJnEHfK0TJna3VH56
	ToB/tmU1JcmjdHOdcnfWjzGKxEBfocbr2U+e/SLFwBy9fpq+csdPvrjKz6lKTPEe5eLafoY+hkH/r
	unmqXDgog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL8KC-0002Dc-SJ; Mon, 29 Apr 2019 15:36:12 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL8K4-00025a-1F; Mon, 29 Apr 2019 15:36:05 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44t7z96kGcz9vD31;
 Mon, 29 Apr 2019 17:35:49 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Q5o3w0VV; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id kbO7e4z3Oado; Mon, 29 Apr 2019 17:35:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44t7z95Zr4z9vD30;
 Mon, 29 Apr 2019 17:35:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556552149; bh=XXe83/pZb9AFMZAVXoUoxnryoMR8eaO+qKHpnqnFOB8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Q5o3w0VVtDkuaQJ720CrXVg1D1EEff1tyfslomh/gdc4+yk1/Dkug0ZmjOpliak9E
 SNq24Cb/75QU4Vbo8GkPeMa5ZqrlcCuuxHVxWzptG/UbSIeVfGgHzF9GoK962b/vuv
 2GQOk16RVxWf7DSmpu538h1my8dNOApiD0oga2ow=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EDA2C8B8B4;
 Mon, 29 Apr 2019 17:35:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id P3bLUxeO-Wfq; Mon, 29 Apr 2019 17:35:54 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AEE718B8B3;
 Mon, 29 Apr 2019 17:35:54 +0200 (CEST)
Subject: Re: [RESEND PATCH v3 09/11] powerpc/mm/radix: mark
 __radix__flush_tlb_range_psize() as __always_inline
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arch <linux-arch@vger.kernel.org>
References: <20190423034959.13525-1-yamada.masahiro@socionext.com>
 <20190423034959.13525-10-yamada.masahiro@socionext.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <40b48947-b80e-7971-376d-52b594e26d17@c-s.fr>
Date: Mon, 29 Apr 2019 17:35:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190423034959.13525-10-yamada.masahiro@socionext.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_083604_368539_ADBF7C0C 
X-CRM114-Status: GOOD (  15.70  )
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
Cc: linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Mathieu Malaterre <malat@debian.org>, x86@kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpMZSAyMy8wNC8yMDE5IMOgIDA1OjQ5LCBNYXNhaGlybyBZYW1hZGEgYSDDqWNyaXTCoDoKPiBU
aGlzIHByZXBhcmVzIHRvIG1vdmUgQ09ORklHX09QVElNSVpFX0lOTElOSU5HIGZyb20geDg2IHRv
IGEgY29tbW9uCj4gcGxhY2UuIFdlIG5lZWQgdG8gZWxpbWluYXRlIHBvdGVudGlhbCBpc3N1ZXMg
YmVmb3JlaGFuZC4KCkhvdyBkaWQgeW91IGlkZW50aWZ5IHRoZSBmdW5jdGlvbnMgcmVxdWlyaW5n
IF9fYWx3YXlzX2lubGluZSBhcyB0aGlzIG9uZSAKPyBKdXN0IGJ5ICd0ZXN0IGFuZCBzZWUgaWYg
aXQgZmFpbHMnLCBvciBkaWQgeW91IGhhdmUgc29tZSBzY3JpcHQgb3Igc28gPwoKSGVyZSB0aGUg
cHJvYmxlbSBpcyB0aGF0IG9uZSBvZiB0aGUgcGFyYW1ldGVycyBvZiB0aGUgZnVuY3Rpb24gYXJl
IHVzZWQgCmFzICJpbW1lZGlhdGUiIGNvbnN0cmFpbnQgZm9yIHRoZSBpbmxpbmUgYXNzZW1ibHks
IHRoZXJlZm9yZSByZXF1aXJpbmcgCnRoZSBmdW5jdGlvbiB0byBhbHdheXMgYmUgaW5saW5lLgoK
SSBndWVzcyB0aGlzIHNob3VsZCBiZSBleHBsYWluZWQgaW4gdGhlIGNvbW1pdCBsb2cgYW5kIEkn
bSB3b25kZXJpbmcgaG93IAp5b3UgZW5zdXJlIHRoYXQgeW91IGRpZCBpZGVudGlmeSBhbGwgZnVu
Y3Rpb25zIGxpa2UgdGhpcy4KCkNocmlzdG9waGUKCj4gCj4gSWYgaXQgaXMgZW5hYmxlZCBmb3Ig
cG93ZXJwYywgdGhlIGZvbGxvd2luZyBlcnJvciBpcyByZXBvcnRlZDoKPiAKPiBhcmNoL3Bvd2Vy
cGMvbW0vdGxiLXJhZGl4LmM6IEluIGZ1bmN0aW9uICdfX3JhZGl4X19mbHVzaF90bGJfcmFuZ2Vf
cHNpemUnOgo+IGFyY2gvcG93ZXJwYy9tbS90bGItcmFkaXguYzoxMDQ6MjogZXJyb3I6IGFzbSBv
cGVyYW5kIDMgcHJvYmFibHkgZG9lc24ndCBtYXRjaCBjb25zdHJhaW50cyBbLVdlcnJvcl0KPiAg
ICBhc20gdm9sYXRpbGUoUFBDX1RMQklFTCglMCwgJTQsICUzLCAlMiwgJTEpCj4gICAgXn5+Cj4g
YXJjaC9wb3dlcnBjL21tL3RsYi1yYWRpeC5jOjEwNDoyOiBlcnJvcjogaW1wb3NzaWJsZSBjb25z
dHJhaW50IGluICdhc20nCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFzYWhpcm8gWWFtYWRhIDx5YW1h
ZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4KPiAtLS0KPiAKPiBDaGFuZ2VzIGluIHYzOiBOb25l
Cj4gQ2hhbmdlcyBpbiB2MjoKPiAgICAtIHNwbGl0IGludG8gYSBzZXBhcmF0ZSBwYXRjaAo+IAo+
ICAgYXJjaC9wb3dlcnBjL21tL3RsYi1yYWRpeC5jIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93
ZXJwYy9tbS90bGItcmFkaXguYyBiL2FyY2gvcG93ZXJwYy9tbS90bGItcmFkaXguYwo+IGluZGV4
IDZhMjNiOWViZDJhMS4uYTJiMjg0OGYwYWUzIDEwMDY0NAo+IC0tLSBhL2FyY2gvcG93ZXJwYy9t
bS90bGItcmFkaXguYwo+ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS90bGItcmFkaXguYwo+IEBAIC05
MjgsNyArOTI4LDcgQEAgdm9pZCByYWRpeF9fdGxiX2ZsdXNoKHN0cnVjdCBtbXVfZ2F0aGVyICp0
bGIpCj4gICAJdGxiLT5uZWVkX2ZsdXNoX2FsbCA9IDA7Cj4gICB9Cj4gICAKPiAtc3RhdGljIGlu
bGluZSB2b2lkIF9fcmFkaXhfX2ZsdXNoX3RsYl9yYW5nZV9wc2l6ZShzdHJ1Y3QgbW1fc3RydWN0
ICptbSwKPiArc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIF9fcmFkaXhfX2ZsdXNoX3RsYl9y
YW5nZV9wc2l6ZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwKPiAgIAkJCQl1bnNpZ25lZCBsb25nIHN0
YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCwKPiAgIAkJCQlpbnQgcHNpemUsIGJvb2wgYWxzb19wd2Mp
Cj4gICB7Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
