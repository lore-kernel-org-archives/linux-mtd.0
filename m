Return-Path: <SRS0=wiZC=WP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B052C3A59B
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2019 09:01:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C9E72086C
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2019 09:01:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YDD6AHhJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C9E72086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DYfw458W0CH12Y9vthlOhswkMcKmsLYfbODTmC/6NWc=; b=YDD6AHhJUSeh7B
	CbFlSg+QlDfpYNTh8s54vrEl1Q2PXK1rFl7NJVdGQFYPNmmKvV/TI+nC/6TqMEV435PhwdGuHxIt/
	6eNQpEy9llOMVFLVP70AwTlz4DTBH4fhINnvK2i/VOViF5bM0MHbsEzpaJec5zt30YRpqjHoKyoJq
	ooMEUHZdSMuqbAtxfqyAr+c33NEa1IB9RkmGVuo2yUrDNwuRdin52nZMoXsr89iiaabd705cfWgPd
	6OJhV7cmv98/u+zOae0kzLemoSolXVBORzlYbYtDPsNOO4DBA8g8iF7/z2b8dBPOfkaiTBWjnOb8C
	Dp359gVpeqFSTiaNGIlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzdX4-0004we-KQ; Mon, 19 Aug 2019 09:00:54 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzdWm-0004hw-It; Mon, 19 Aug 2019 09:00:37 +0000
Received: by mail-ot1-f67.google.com with SMTP id g17so994580otl.2;
 Mon, 19 Aug 2019 02:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fmtPnJSRI0zndYON4lQ0lxZkTiNZNjENxpxxDRXsGjM=;
 b=Gl7QC9XfQCKkrSjaDiR6EKqc2CQX7nfNUJ4I2uyc10I3YJ3ix2mPc1yVewHCAEosjW
 /d8IwyranCdAbRRpzcjltK4cu6cxZRIFUDA350f4cTJH5zA/zFs5RxWFN+rFhQYif8Dt
 bhXS4KyDQsHy37fk3icuhXcV0HFllhGPGuZo7BTSVKKtcoe2SqvsODGbZVq4QQQ9trvx
 umE7ydJLpA9rz4bwCgpF2WTR5aMLxm6t0qQ6v7pU17+Xk2Z/kowETiCRjoEEytnUfPEK
 UBTVkblrPVpo/C1+3Nty8UiJp6tqwtf+1xjaAf/2yPc9n/tkad5Jefx7jDRxDRaQlw1d
 dfeg==
X-Gm-Message-State: APjAAAUclAI574/Wc015OnpeNjwEA3GttJKqz6SgadoUUwktnroJw5jl
 hujeYT6tj7YjoyNyLWrXHC5eaYpUsR2w+nxmjME=
X-Google-Smtp-Source: APXvYqwhI3T2oGgeZwLOQSfvRhaXT1jrSgi6r47r+Se5hS7KcKzZEqkkqP7EFf8wTbDzFidtX+J78UJ3IrYCTcoWc4g=
X-Received: by 2002:a9d:68c5:: with SMTP id i5mr17294497oto.250.1566205235743; 
 Mon, 19 Aug 2019 02:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-19-hch@lst.de>
In-Reply-To: <20190817073253.27819-19-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Aug 2019 11:00:24 +0200
Message-ID: <CAMuHMdWjAUMc_G1AUE_dgbrUn3qm4th+jiG3NJwperDVHdcoSw@mail.gmail.com>
Subject: Re: [PATCH 18/26] m68k: rename __iounmap and mark it static
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190819_020036_625738_2C9B8619 
X-CRM114-Status: GOOD (  14.23  )
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>, Guan Xuetao <gxt@pku.edu.cn>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Parisc List <linux-parisc@vger.kernel.org>,
 linux-mips@vger.kernel.org, alpha <linux-alpha@vger.kernel.org>,
 nios2-dev@lists.rocketboards.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Christoph,

On Sat, Aug 17, 2019 at 9:49 AM Christoph Hellwig <hch@lst.de> wrote:
> m68k uses __iounmap as the name for an internal helper that is only
> used for some CPU types.  Mark it static and give it a better name.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks for your patch!

> --- a/arch/m68k/mm/kmap.c
> +++ b/arch/m68k/mm/kmap.c
> @@ -52,6 +52,7 @@ static inline void free_io_area(void *addr)
>
>  #define IO_SIZE                (256*1024)
>
> +static void __free_io_area(void *addr, unsigned long size);
>  static struct vm_struct *iolist;
>
>  static struct vm_struct *get_io_area(unsigned long size)
> @@ -90,7 +91,7 @@ static inline void free_io_area(void *addr)
>                 if (tmp->addr == addr) {
>                         *p = tmp->next;
>                         /* remove gap added in get_io_area() */
> -                       __iounmap(tmp->addr, tmp->size - IO_SIZE);
> +                       __free_io_area(tmp->addr, tmp->size - IO_SIZE);
>                         kfree(tmp);
>                         return;
>                 }
> @@ -249,12 +250,13 @@ void iounmap(void __iomem *addr)
>  }
>  EXPORT_SYMBOL(iounmap);
>
> +#ifndef CPU_M68040_OR_M68060_ONLY

Cant you move this block up, to avoid adding more #ifdef cluttery?
The rest looks good to me.

>  /*
> - * __iounmap unmaps nearly everything, so be careful
> + * __free_io_area unmaps nearly everything, so be careful
>   * Currently it doesn't free pointer/page tables anymore but this
>   * wasn't used anyway and might be added later.
>   */
> -void __iounmap(void *addr, unsigned long size)
> +static void __free_io_area(void *addr, unsigned long size)
>  {
>         unsigned long virtaddr = (unsigned long)addr;
>         pgd_t *pgd_dir;
> @@ -297,6 +299,7 @@ void __iounmap(void *addr, unsigned long size)
>
>         flush_tlb_all();
>  }
> +#endif /* CPU_M68040_OR_M68060_ONLY */
>
>  /*
>   * Set new cache mode for some kernel address space.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
