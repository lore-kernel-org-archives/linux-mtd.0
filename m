Return-Path: <SRS0=66Q2=WN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F04C8C3A59B
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Aug 2019 21:31:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCD522173B
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Aug 2019 21:31:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SMll7S5R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Y/9gCyUy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="J32rrdBR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCD522173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8NZSNit4hMqpz4Fc75pZjA7EpcFfOtsL3CdpTZbXC9o=; b=SMll7S5RAWdlGf
	znD85yigv4g738qRpWzDoU/SP5xOFHgn11+tffkINYx2rU/8RXycQiwK/ZR5cSZeesFKDXhLacxKF
	YjztVJ4RdBDjp8dDUU/fbH/+FaBc7s9ywgcm79Bx8FbeLpIfzJC3yvixDbXaXAMv+MU1VTkVtWid4
	NvS6sE4rF93GpUHZhZ5MtNEYXamUQVyQ6C0P6OvmII+KILH5BE6b9sb3I1qm2HjRNZwhKTjCEyeSd
	BqXed93SdKa9tw5eChR846iNLLXNBDW0w6ujJO3pg9QEdqa50LbnCLS+xh26bQf/5nJItgtBuis9F
	57L7Fq3w/YqqLMkWi1qA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hz6Hm-0003J2-8Z; Sat, 17 Aug 2019 21:30:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hz6Hk-0003II-Qj
 for linux-mtd@bombadil.infradead.org; Sat, 17 Aug 2019 21:30:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
 Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=of7+kXZ7O7iQMaD+uR4bskNv7dazvfYrCLyFqQNS+Ys=; b=Y/9gCyUyMojd3Mgx2wdhYAASs
 oc8QY6wDX5Bux6mmTRAvWC17O4WlNY+eL9iytP2Iolxr0l9nZk6QkEyan7hN9djXMXOoFa4C7i2mk
 9VW6QQ2KIfOnCb8cNzYOE30HnaRYCEH/KmNvhybpAs43Jisd0/jBV7YI+49fQIaNIRP/A7j8QCAJH
 34D00ZvE3oA0b5NmHnJ1XSBNOU3uD6AvW43hq20jEM16OxxPewrmiCAC9RYWomOUL0nfCYj9U8Bs5
 16T58lX7wEOKpmASV4G5Nxa2h3t7KAXkrv/eZlXAEe0/bVufX2cdqthRGS06b273c8qIuzdAMfe5E
 07I4VPX3g==;
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by casper.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hz62s-000179-8S
 for linux-mtd@lists.infradead.org; Sat, 17 Aug 2019 21:15:34 +0000
Received: by mail-io1-xd42.google.com with SMTP id z3so13226890iog.0
 for <linux-mtd@lists.infradead.org>; Sat, 17 Aug 2019 14:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=of7+kXZ7O7iQMaD+uR4bskNv7dazvfYrCLyFqQNS+Ys=;
 b=J32rrdBRvRsfbFjCu9mt8fMYOMslmZza78qiqRkRyerF7Tvcpg2S9u01Ma540XGXA7
 2iMu5p3Hkj4aS5LBrD+33KElVbGx/xBadIYVGPANBM7jO6Se6GA6GrwSMEwF29HvJ6ER
 vZ9LmfwOTrujU/Kp5jYgpxJYxNHczK453ZXPgcwCmkGHcdiVYKwlFvQ6JuUiC1/4nCYl
 uFAhRB0N/reKVlsdq1bNGymQlRL3HWYkOuH8XT80KfGMY/WL2QfRa8xGoQM4QoYPzMnq
 iTWN1h7rhUiSs1zoLq4NqE4o/IAPIBBfkwLsR3a1H+aqVN59SAAPttTAgUB3YgtJ2wpS
 6ilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=of7+kXZ7O7iQMaD+uR4bskNv7dazvfYrCLyFqQNS+Ys=;
 b=kwAM59eaD4jrnY20LokvvbJOve0XGSFdhw4PapH7VClehgXHhZcrwwBZHpk2fCjb2o
 p+7jDZKvhNV1wVDY50C7JzWuRBpDJAUFvrVOa6lSAlmAinGL/+t2tYhj4qRZeSdCjYmK
 wH35uRv0YsECmE/Bqo96EDqyCAoMkvxJphM/YY67LabWpDkopfRy605KHscANDHqsdkj
 RLQRkWHXk51MMgUIxgn/XbS8sMZZPvfq2d2GkySZD3MyTRUmVRaDJ6nZtV/0Enofy3zO
 DvkM3OGdHDFeZt2oy82x1JizS28VJSFSA2sVryfTe3cd8/729kMwD68fqPK3u/vNXp3A
 1+2A==
X-Gm-Message-State: APjAAAWX3UaPZMHPtZFpEZpIxSv6SLtNDSnUd4E03l2GzfG3ca2U4Eum
 2J3zuOPxAnqDxCZyXHRRuHasTw==
X-Google-Smtp-Source: APXvYqxhPFwhoGwEv9EiCGR2YXAs4N7HYnW3IuL/COnl5kQqZm2U/FQDN7BsZ9+pbm1TtqxdMhb2eg==
X-Received: by 2002:a02:654d:: with SMTP id u74mr19023736jab.115.1566076507872; 
 Sat, 17 Aug 2019 14:15:07 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 z19sm8681923ioh.12.2019.08.17.14.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Aug 2019 14:15:07 -0700 (PDT)
Date: Sat, 17 Aug 2019 14:15:06 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 16/26] asm-generic: don't provide ioremap for
 CONFIG_MMU
In-Reply-To: <20190817073253.27819-17-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1908171414260.4130@viisi.sifive.com>
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-17-hch@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190817_221530_399578_AD89019A 
X-CRM114-Status: GOOD (  23.45  )
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 linux-mtd@lists.infradead.org, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, nios2-dev@lists.rocketboards.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, 17 Aug 2019, Christoph Hellwig wrote:

> All MMU-enabled ports have a non-trivial ioremap and should thus provide
> the prototype for their implementation instead of providing a generic
> one unless a different symbol is not defined.  Note that this only
> affects sparc32 nds32 as all others do provide their own version.
> 
> Also update the kerneldoc comments in asm-generic/io.h to explain the
> situation around the default ioremap* implementations correctly.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/nds32/include/asm/io.h    |  2 ++
>  arch/sparc/include/asm/io_32.h |  1 +
>  include/asm-generic/io.h       | 29 ++++++++---------------------
>  3 files changed, 11 insertions(+), 21 deletions(-)
> 

[ ... ]

> diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
> index a98ed6325727..6a5edc23afe2 100644
> --- a/include/asm-generic/io.h
> +++ b/include/asm-generic/io.h
> @@ -922,28 +922,16 @@ static inline void *phys_to_virt(unsigned long address)
>  /**
>   * DOC: ioremap() and ioremap_*() variants
>   *
> - * If you have an IOMMU your architecture is expected to have both ioremap()
> - * and iounmap() implemented otherwise the asm-generic helpers will provide a
> - * direct mapping.
> + * Architectures with an MMU are expected to provide ioremap() and iounmap()
> + * themselves.  For NOMMU architectures we provide a default nop-op
> + * implementation that expect that the physical address used for MMIO are
> + * already marked as uncached, and can be used as kernel virtual addresses.
>   *
> - * There are ioremap_*() call variants, if you have no IOMMU we naturally will
> - * default to direct mapping for all of them, you can override these defaults.
> - * If you have an IOMMU you are highly encouraged to provide your own
> - * ioremap variant implementation as there currently is no safe architecture
> - * agnostic default. To avoid possible improper behaviour default asm-generic
> - * ioremap_*() variants all return NULL when an IOMMU is available. If you've
> - * defined your own ioremap_*() variant you must then declare your own
> - * ioremap_*() variant as defined to itself to avoid the default NULL return.
> + * ioremap_wc() and ioremap_wt() can provide more relaxed caching attributes
> + * for specific drivers if the architecture choses to implement them.  If they
                                               ^^^ chooses



- Paul

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
