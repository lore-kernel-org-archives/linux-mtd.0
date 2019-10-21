Return-Path: <SRS0=layW=YO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553BDCA9EB7
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2019 07:58:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25C7720830
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2019 07:58:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="El2SFl+N";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="luHraHoz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25C7720830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1EOfa5Qd+yfuiPAN3/ZWQKEBqfT8BemOy0HyRr5GGTs=; b=El2SFl+Ni/EMFv
	8vtJe82AGU8wtaC8lEwEKFCCeU2aMg++7Iy47x/t71oRos68jgFsSPHLobAlEkOId6wp3k1OrtmYi
	Gmds/eZMXcBxlH3KwhytfGgAhtU2tadgjPNCKHhY0FimuLnjiFY4Gqn2F4WI+z4y08mZz4YVDyiWH
	hMrKMGxXoki1v3wOmImJssEb7KKEWAc3h8S0Ktl7Nms/0zLRPLW3U9RnM615JeFWMpWD8GvlGZwGm
	YgSBI4YChZQezRckpKAUbNnCj3XtTvYCgNPqj+9rxlIFeg+4CQu4wyRWyjpJ2XdC5WuVMGGucx1CN
	+gg2ftfcyfUrYglYSGRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMSac-0007Qa-5l; Mon, 21 Oct 2019 07:58:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMSaQ-0007Fd-Kp; Mon, 21 Oct 2019 07:58:44 +0000
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5908A21744;
 Mon, 21 Oct 2019 07:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571644721;
 bh=HaNxatOx3Yl+LjuXNZSg9j6rwSnjKUPc8eLVmd61SU0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=luHraHozlqKNUHwEUrw+p/CKnNkzg4GhLnRI3IQVw1ZUnmvt4Cwl7ABV+5EzHS34g
 CqVlZgKrjSy7nsjEnaLPBzt8i8/jWykyodKl+iP31wL1BC0A++0dn8emaiIgMxVUqa
 6AeBtKgvcbANkPSenLQVsuD5VltHn5JOl0JQoRvI=
Received: by mail-wr1-f42.google.com with SMTP id l10so12273172wrb.2;
 Mon, 21 Oct 2019 00:58:41 -0700 (PDT)
X-Gm-Message-State: APjAAAUb6cNKIacwZ/EyEY7uTOpoiEsrEO4tytQNQYCl7Dm13h9ZRjjR
 Mo+49T8b2L+lagkY/k8grnGd++md2PxfUZq1NZY=
X-Google-Smtp-Source: APXvYqzvF6HJCASpTMUMf7HweDv3Hno9oEAxiqhI3GBGEOPTWQrWQiETxVnKLeVHbQ3ma/xucSMvECIDZp2EBxJkKe8=
X-Received: by 2002:adf:ebcb:: with SMTP id v11mr17344477wrn.24.1571644719802; 
 Mon, 21 Oct 2019 00:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20191017174554.29840-1-hch@lst.de>
 <20191017174554.29840-21-hch@lst.de>
In-Reply-To: <20191017174554.29840-21-hch@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 21 Oct 2019 15:58:28 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ_VeBfi1uaafgtp+uA2skq-w2px12ig=5QD1O9J+PgbA@mail.gmail.com>
Message-ID: <CAJF2gTQ_VeBfi1uaafgtp+uA2skq-w2px12ig=5QD1O9J+PgbA@mail.gmail.com>
Subject: Re: [PATCH 20/21] csky: remove ioremap_cache
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_005842_729441_D20DD3DB 
X-CRM114-Status: GOOD (  14.39  )
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 linux-arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org,
 linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org,
 nios2-dev@lists.rocketboards.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Acked-by: Guo Ren <guoren@kernel.org>

On Fri, Oct 18, 2019 at 1:47 AM Christoph Hellwig <hch@lst.de> wrote:
>
> No driver that can be used on csky uses ioremap_cache, and this
> interface has been deprecated in favor of memremap.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/csky/include/asm/io.h | 2 --
>  arch/csky/mm/ioremap.c     | 7 -------
>  2 files changed, 9 deletions(-)
>
> diff --git a/arch/csky/include/asm/io.h b/arch/csky/include/asm/io.h
> index a4b9fb616faa..f572605d5ad5 100644
> --- a/arch/csky/include/asm/io.h
> +++ b/arch/csky/include/asm/io.h
> @@ -36,13 +36,11 @@
>  /*
>   * I/O memory mapping functions.
>   */
> -extern void __iomem *ioremap_cache(phys_addr_t addr, size_t size);
>  extern void __iomem *__ioremap(phys_addr_t addr, size_t size, pgprot_t prot);
>  extern void iounmap(void *addr);
>
>  #define ioremap(addr, size)            __ioremap((addr), (size), pgprot_noncached(PAGE_KERNEL))
>  #define ioremap_wc(addr, size)         __ioremap((addr), (size), pgprot_writecombine(PAGE_KERNEL))
> -#define ioremap_cache                  ioremap_cache
>
>  #include <asm-generic/io.h>
>
> diff --git a/arch/csky/mm/ioremap.c b/arch/csky/mm/ioremap.c
> index e13cd3497628..ae78256a56fd 100644
> --- a/arch/csky/mm/ioremap.c
> +++ b/arch/csky/mm/ioremap.c
> @@ -44,13 +44,6 @@ void __iomem *__ioremap(phys_addr_t phys_addr, size_t size, pgprot_t prot)
>  }
>  EXPORT_SYMBOL(__ioremap);
>
> -void __iomem *ioremap_cache(phys_addr_t phys_addr, size_t size)
> -{
> -       return __ioremap_caller(phys_addr, size, PAGE_KERNEL,
> -                               __builtin_return_address(0));
> -}
> -EXPORT_SYMBOL(ioremap_cache);
> -
>  void iounmap(void __iomem *addr)
>  {
>         vunmap((void *)((unsigned long)addr & PAGE_MASK));
> --
> 2.20.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
