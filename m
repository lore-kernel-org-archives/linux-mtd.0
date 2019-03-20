Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A99C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 09:39:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0656C2175B
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 09:39:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pXF9TY8z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0656C2175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LpIYcEy8qUb1w7Ft8vT/l/bqBa6KtdaRmJYi9WOMFUg=; b=pXF9TY8zLd/ToN
	epNYTEv7VosV451UnzFnYqBnITTWLBhjMnkPJKKlp+/GfSTh8d1ohJaD8jogYlUtpbshry5SfI9wF
	RfEaqBRpsiClVAD8ukVtZXMnRhHDnhiKQp8CZ3RkLdEsu0d0/AMGsyfRu3W4EpfwY/rd5DuB1DoRW
	tf0ZXLha3wZcHvsTN8qeInJHNsSeUOAB8Nmew+ZUAGOG+/dOf6rVUk31NQkoDg4mWy/cvIkmGIz0j
	yQu1ga6zi6IVpKCOSHzh+d3jpA+HfXoODneD/cEbFIXbFUMxyVcQk8PYu9MTPq+N5JgxJIT4eCFcH
	BUP3mTxMA3njVpCVSGVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6Xgf-0008L2-Pz; Wed, 20 Mar 2019 09:39:05 +0000
Received: from mail-qt1-f196.google.com ([209.85.160.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6Xga-0008KV-Kq; Wed, 20 Mar 2019 09:39:04 +0000
Received: by mail-qt1-f196.google.com with SMTP id v20so1643708qtv.12;
 Wed, 20 Mar 2019 02:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=baqznmx5SEUGlKXy0XWhrYbi7y7TbN73HabOIUzlc9g=;
 b=GWCE1UK3mGmMzwd/7ktrHM8h4AXV1j+3UK3fCTqTgEIX8R+2OSsa7XR3eGPjp8eO9a
 0GBMdupwbfdQitPnVW7/slKB/LSwdRgg+E2nNwkBb4JvfJFzauVmJTX1owMRXZZmFFii
 pbg2/xztYN7lx44930W5erkqR8wEYy5oBmOVEw5ipYcGIL8cWNkAyZLohr5prkzmzBvx
 Q2ht6iegw6dTy/rXdoF8pfOT8eXwDjC07/iGidQZv5egCdQbh8IN1/4nJTlyctUc6y0F
 y+mFTdHrlCG31pcsEud10x/atYGLDW02jAcPWo4Zj1scd4i4ramh0GVV7KkO7GaPa16E
 emAg==
X-Gm-Message-State: APjAAAV5uZm9X0VVeAlnzZvQ63jthu6mdxJDP45fCbBkgkS67fFs9ZPZ
 beVJ0SNfofIAubQpdAi/1ngB9BlJjh4Ld2VD2ks=
X-Google-Smtp-Source: APXvYqy0JoRVFSrNJl/sRu1o+RTIjkEJdtNCtG5nQiriXKN6DBYQFFQrpf5g/fTnXJYyTn69eJne/HE0Vv+ZGAZte2M=
X-Received: by 2002:ac8:276b:: with SMTP id h40mr6073731qth.319.1553074735819; 
 Wed, 20 Mar 2019 02:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <1553062828-27798-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNAQu9hmeSgKO_B1LhXqq9Z923H25HXNS9XYNvFi55WrFYw@mail.gmail.com>
In-Reply-To: <CAK7LNAQu9hmeSgKO_B1LhXqq9Z923H25HXNS9XYNvFi55WrFYw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 20 Mar 2019 10:38:38 +0100
Message-ID: <CAK8P3a0-7LRE4ByO2Uf4tb5mR49SbZzBu0AgHpS=03FAMWFLgQ@mail.gmail.com>
Subject: Re: [PATCH] compiler: allow all arches to enable
 CONFIG_OPTIMIZE_INLINING
To: Masahiro Yamada <yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_023900_686375_F1964F36 
X-CRM114-Status: GOOD (  11.51  )
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
 Michael Ellerman <mpe@ellerman.id.au>, X86 ML <x86@kernel.org>,
 linux-mips@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Burton <paul.burton@mips.com>, Ingo Molnar <mingo@redhat.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Mar 20, 2019 at 7:41 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> It is unclear to me how to fix it.
> That's why I ended up with "depends on !MIPS".
>
>
>   MODPOST vmlinux.o
> arch/mips/mm/sc-mips.o: In function `mips_sc_prefetch_enable.part.2':
> sc-mips.c:(.text+0x98): undefined reference to `mips_gcr_base'
> sc-mips.c:(.text+0x9c): undefined reference to `mips_gcr_base'
> sc-mips.c:(.text+0xbc): undefined reference to `mips_gcr_base'
> sc-mips.c:(.text+0xc8): undefined reference to `mips_gcr_base'
> sc-mips.c:(.text+0xdc): undefined reference to `mips_gcr_base'
> arch/mips/mm/sc-mips.o:sc-mips.c:(.text.unlikely+0x44): more undefined
> references to `mips_gcr_base'
>
>
> Perhaps, MIPS folks may know how to fix it.

I would guess like this:

diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
index 8bc5df49b0e1..a27483fedb7d 100644
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@ -79,7 +79,7 @@ static inline int mips_cm_probe(void)
  *
  * Returns true if a CM is present in the system, else false.
  */
-static inline bool mips_cm_present(void)
+static __always_inline bool mips_cm_present(void)
 {
 #ifdef CONFIG_MIPS_CM
        return mips_gcr_base != NULL;
@@ -93,7 +93,7 @@ static inline bool mips_cm_present(void)
  *
  * Returns true if the system implements an L2-only sync region, else false.
  */
-static inline bool mips_cm_has_l2sync(void)
+static __always_inline bool mips_cm_has_l2sync(void)
 {
 #ifdef CONFIG_MIPS_CM
        return mips_cm_l2sync_base != NULL;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
