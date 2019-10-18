Return-Path: <SRS0=wFkH=YL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70604CA9EA5
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Oct 2019 07:31:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FCDB21925
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Oct 2019 07:31:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DuXtKI/w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FCDB21925
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JtE5l18zEoBzHuC6MAftirWaqAs/5jGAODzvx1RMNRc=; b=DuXtKI/w3gkeHR
	RonQqoxLtX4aS+2f2WgTrWeM6pI1FKg7xGt+gEV6EgS0LsvTl49aYmYnrvvdYXQwlflp926BgQB4m
	NDl4KXjEVzFGB1jSoqBLjPfI9KUuWYI3Zu5Uv1G7EsC4J/Geki7mnbocHrRsnFa+brW3SuGdHkMz3
	b3hlnuq3pHtxC8tORsuO8SQvQ4FikzQ4MNRqjBgyCb+66NmS8MKvdz5mmQdIe5X7ZfA7MlKL99M6r
	SBT/Lzvc0VBEJUM7eYiB8suDakWdQ4F65UI7esnodee/9vRiBFZVlP7QvvA2/N2JhgOXRm+SoPMKV
	Y59DrnNQhSgLzKaePuBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLMj9-0002l1-D8; Fri, 18 Oct 2019 07:31:11 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLMj5-0002kG-BR; Fri, 18 Oct 2019 07:31:08 +0000
Received: by mail-ot1-f65.google.com with SMTP id e11so4167187otl.5;
 Fri, 18 Oct 2019 00:31:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1vcvhB5CLF/+MeUyHDDl7fZL+tAXhkabxwY8RzqlUc4=;
 b=ayEUbJ2MoEqAlFXxalbn7dZzJl2TLzODSsOWvI+Wo2ADnk0q8rM3wtqLvASqMi1KaI
 nFQVXuuPD9eSRYKrB9OoOiUaaWYQhHG5XkVp2KOveruOgWw4N2PuLpIxIva9zuU2DdEr
 yiPT9/GNscV45iHrIsoQrucHJHQtnwz7eWsCsCkT0bBkI/4Ph67DyOyhxWULzdEu9C0I
 4K9Iaq9XUofh0T6ZMPD7ad+6oRiBRCjKssrNnX04arv54pBz91T3iI67bmU5NWLzO89n
 ZAop13ajo5dmgWga7x5oG+Z40ct4ACY7QdqhrLOh3iDRHYyM6y/NX3QANhhZ7We8hLik
 FJiw==
X-Gm-Message-State: APjAAAXpFeMpL78piSe3KY5piVBbWKJkwOYiifArLT8CdOatyGSXWUuF
 SU+JXW5GKgxOu1tyqha4WXk4sG+unA6qWRu3eLo=
X-Google-Smtp-Source: APXvYqz5ZTzm2szPG0oqRjP0bYm68wI5cC2zWPx8OuV5blCVSPhZgU0siPaT+bnCFclqt0wG9CC25EAYDHrDP1i11C0=
X-Received: by 2002:a9d:70d0:: with SMTP id w16mr6117171otj.107.1571383865678; 
 Fri, 18 Oct 2019 00:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20191017174554.29840-1-hch@lst.de>
 <20191017174554.29840-14-hch@lst.de>
In-Reply-To: <20191017174554.29840-14-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Oct 2019 09:30:54 +0200
Message-ID: <CAMuHMdWaQ15j7fQ9-8XKgrSwgf96nT=yY+FCPWPxoPC9LGqvbQ@mail.gmail.com>
Subject: Re: [PATCH 13/21] m68k: rename __iounmap and mark it static
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_003107_396181_C9539A0F 
X-CRM114-Status: GOOD (  14.32  )
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

On Thu, Oct 17, 2019 at 7:53 PM Christoph Hellwig <hch@lst.de> wrote:
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

Can you please move this block up, instead of adding more #ifdef cluttery?
That would also remove the need for a forward declaration.

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
