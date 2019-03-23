Return-Path: <SRS0=nXGU=R2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4CD5C43381
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Mar 2019 08:27:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74D52218D4
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Mar 2019 08:27:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VjgGjelB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74D52218D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Subject:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gw05PlTm2AyWaadiKv5bR8vWcAojJ+kiD4Uv8RRI57o=; b=VjgGjelBwDoCUggs+KsLBCQ2k
	4sfhag/3JsRsjgC25kK3dh1m44w//XXWSOH/FOlCbKzPs+sL0GrKOPBdeQ5f4dKV/rkIJ4Tn89u1O
	/DzKnNHY24EphBso7siubPSQQYBEdwDhVnMYu1sXnxgwMWNnQh0uXBGoc4Ychvh0Xp7Xcpy/FrZQ0
	shTwX4v9u+RVrqJGpRSF+Ct0N/FSRnhg0PNojyanbHMLTvw2Gjfl3+LQP8kCkzjXlj53JMnBN3wYV
	sC26fBKIQ/S6XHN1j1Fc6eh59q//IQMpEf2i4PPQwqCiOwzmltht0DENbN3vyIHBQUMjyRwOPv3Dg
	HCL+EdwyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7bzh-0003Co-9m; Sat, 23 Mar 2019 08:27:09 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7bzV-00034X-UI; Sat, 23 Mar 2019 08:26:59 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44RDC462qgz9vCyN;
 Sat, 23 Mar 2019 09:26:40 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id VNlVHoa45lz0; Sat, 23 Mar 2019 09:26:40 +0100 (CET)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44RDC44wjLz9vCyM;
 Sat, 23 Mar 2019 09:26:40 +0100 (CET)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 5157B437; Sat, 23 Mar 2019 09:26:40 +0100 (CET)
Received: from arouen-653-1-146-8.w82-126.abo.wanadoo.fr
 (arouen-653-1-146-8.w82-126.abo.wanadoo.fr [82.126.129.8]) by
 messagerie.si.c-s.fr (Horde Framework) with HTTP; Sat, 23 Mar 2019 09:26:40
 +0100
Date: Sat, 23 Mar 2019 09:26:40 +0100
Message-ID: <20190323092640.Horde.2lm4u26aZox5ialxuIRcYw2@messagerie.si.c-s.fr>
From: LEROY Christophe <christophe.leroy@c-s.fr>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] compiler: allow all arches to enable
 CONFIG_OPTIMIZE_INLINING
References: <1553062828-27798-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK8P3a3BG_mxYxxCx4S_+ZKAer_+5FpmkzLk0VrACZekuD=2GQ@mail.gmail.com>
 <CAK8P3a0GEYTbw5XCwzVeZe_-pGF=7e=1kXhH3U+fidnMZeP0CA@mail.gmail.com>
In-Reply-To: <CAK8P3a0GEYTbw5XCwzVeZe_-pGF=7e=1kXhH3U+fidnMZeP0CA@mail.gmail.com>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190323_012658_128619_7EDCEC11 
X-CRM114-Status: UNSURE (   7.27  )
X-CRM114-Notice: Please train this message.
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
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mips@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Burton <paul.burton@mips.com>, Ingo Molnar <mingo@redhat.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="Yes"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4gYSDDqWNyaXTCoDoKCj4gT24gV2VkLCBNYXIg
MjAsIDIwMTkgYXQgMTA6NDEgQU0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4gd3JvdGU6
Cj4+Cj4+IEkndmUgYWRkZWQgeW91ciBwYXRjaCB0byBteSByYW5kY29uZmlnIHRlc3Qgc2V0dXAg
YW5kIHdpbGwgbGV0IHlvdQo+PiBrbm93IGlmIEkgc2VlIGFueXRoaW5nIG5vdGljZWFibGUuIEkn
bSBjdXJyZW50bHkgdGVzdGluZyBjbGFuZy1hcm0zMiwKPj4gY2xhbmctYXJtNjQgYW5kIGdjYy14
ODYuCj4KPiBUaGlzIGlzIHRoZSBvbmx5IGFkZGl0aW9uYWwgYnVnIHRoYXQgaGFzIGNvbWUgdXAg
c28gZmFyOgo+Cj4gYC5leGl0LnRleHQnIHJlZmVyZW5jZWQgaW4gc2VjdGlvbiBgLmFsdC5zbXAu
aW5pdCcgb2YKPiBkcml2ZXJzL2NoYXIvaXBtaS9pcG1pX21zZ2hhbmRsZXIubzogZGVmaW5lZCBp
biBkaXNjYXJkZWQgc2VjdGlvbgo+IGBleGl0LnRleHQnIG9mIGRyaXZlcnMvY2hhci9pcG1pL2lw
bWlfbXNnaGFuZGxlci5vCgpXb3VsZG4ndCBpdCBiZSB1c2VmdWwgdG8gYWN0aXZhdGUgLVdpbmxp
bmUgZ2NjIHdhcm5pbmcgdG8gZWFzZSBmaW5kaW5nICAKb3V0IHByb2JsZW1hdGljIHVzYWdlIG9m
IGlubGluZSBrZXl3b3JkID8KCkNocmlzdG9waGUKCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0v
a2VybmVsL2F0YWdzLmggYi9hcmNoL2FybS9rZXJuZWwvYXRhZ3MuaAo+IGluZGV4IDIwMTEwMDIy
NjMwMS4uODRiMTJlMzMxMDRkIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2tlcm5lbC9hdGFncy5o
Cj4gKysrIGIvYXJjaC9hcm0va2VybmVsL2F0YWdzLmgKPiBAQCAtNSw3ICs1LDcgQEAgdm9pZCBj
b252ZXJ0X3RvX3RhZ19saXN0KHN0cnVjdCB0YWcgKnRhZ3MpOwo+ICBjb25zdCBzdHJ1Y3QgbWFj
aGluZV9kZXNjICpzZXR1cF9tYWNoaW5lX3RhZ3MocGh5c19hZGRyX3QgX19hdGFnc19wb2ludGVy
LAo+ICAgICAgICAgdW5zaWduZWQgaW50IG1hY2hpbmVfbnIpOwo+ICAjZWxzZQo+IC1zdGF0aWMg
aW5saW5lIGNvbnN0IHN0cnVjdCBtYWNoaW5lX2Rlc2MgKgo+ICtzdGF0aWMgX19hbHdheXNfaW5s
aW5lIGNvbnN0IHN0cnVjdCBtYWNoaW5lX2Rlc2MgKgo+ICBzZXR1cF9tYWNoaW5lX3RhZ3MocGh5
c19hZGRyX3QgX19hdGFnc19wb2ludGVyLCB1bnNpZ25lZCBpbnQgbWFjaGluZV9ucikKPiAgewo+
ICAgICAgICAgZWFybHlfcHJpbnQoIm5vIEFUQUdTIHN1cHBvcnQ6IGNhbid0IGNvbnRpbnVlXG4i
KTsKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
