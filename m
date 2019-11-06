Return-Path: <SRS0=BbO6=Y6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97428C5DF63
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2019 18:17:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62D9820663
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2019 18:17:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qW3fqse4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62D9820663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KFvxM1I+jfFgsiGIjGHWdO6E/2GtsbpVc3+aYSxGynQ=; b=qW3fqse4udi1/0
	BQywMmuf5PcC3+YUqNNgxStN/kiJYSu10mOsK7ek1v6ORQvHyojOuw6Nj2fUyRGSnFxkkboZ5iWTo
	7OWMcPTHLemXe55QjMEH8SNpSeKwswc2/sCFLVbABvACxmUnQTWZnBI5j/mbM0DIdTdZCS9HFPtGv
	4l+Ak0WV8/sK2aMaJLKaj2vhQw8jwuqhWZFfcY3cBO3UMDpXcOo7ifB8wxmkHF4h7SuJ+zz3zI8q1
	/VcZqCb52EI71R665JDpRVioEYwK1PL6r4pRRrDACILC2wdG51pU5zXYTG+pAk9I3nGWMsRMY4i3R
	CcxJaS8tWLPyhxgTSpOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSPrU-0006NM-7z; Wed, 06 Nov 2019 18:16:56 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSPrP-0006KW-Lb; Wed, 06 Nov 2019 18:16:53 +0000
Received: by mail-ot1-f68.google.com with SMTP id n23so11408562otr.13;
 Wed, 06 Nov 2019 10:16:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=15BA2o2ULwBaZdW2cSXzi/G8aVSlqB+lkO94w9/s3/8=;
 b=rrVFfgdoZNWmWT838w7yPJ5AFE+s5DM8ooHHDU0SlY1idafWXcpIdcXZnUHI3RoIz3
 JqmetHbKKqgTmvh/dJgINW7dFHWLIvu1xlApEQQmpZNtEsfozFBkjiZIWub2wN33AYZr
 Vr36RCI1QLnjb9NKaM7ovIDEAnhuefu8TqmtmnLMsAe2Edjznuv5Vp8DmgTun+kk7q0K
 wU37u31qI7fmGzeJaStqFNc7s9w8N1UzQ425qOle1/3inO8thNadglufwtS0cmVLyNn1
 Fc0txj3zSH7hBdsZH2ZN3cmnyfT4wC6DxSDT/hz9yeKodDX5CtgO63QxyEkzBIMQtqw7
 V1wA==
X-Gm-Message-State: APjAAAVZnVOj5f523aEASjHCKkQ1u3G2984KUeMGyQOOg8hsiZVrsPTw
 BzS5v+7gBjeJMsWARPXarjqAeny6i2kh+m8WXoc=
X-Google-Smtp-Source: APXvYqyJzH2QJnGyQxa9UcvqsSRwLOqnLR39MniE098RrjM8S3f0LW/gsjuzU8BhMp3pbPwutON3uAZxVc/hg56lCG0=
X-Received: by 2002:a9d:191e:: with SMTP id j30mr2894554ota.297.1573064209066; 
 Wed, 06 Nov 2019 10:16:49 -0800 (PST)
MIME-Version: 1.0
References: <20191029064834.23438-12-hch@lst.de>
 <mhng-33ea9141-2440-4a2d-8133-62094486fc48@palmer-si-x1c4>
In-Reply-To: <mhng-33ea9141-2440-4a2d-8133-62094486fc48@palmer-si-x1c4>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Nov 2019 19:16:38 +0100
Message-ID: <CAMuHMdVuDp_8UDeWv8tdPAH5JS84=-yfwZjOk-YQcoYKM9za+w@mail.gmail.com>
Subject: Re: [PATCH 11/21] asm-generic: don't provide ioremap for CONFIG_MMU
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_101651_706899_BA404978 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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
 Linux-sh list <linux-sh@vger.kernel.org>, linux-mips@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 nios2-dev@lists.rocketboards.org, Guan Xuetao <gxt@pku.edu.cn>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Parisc List <linux-parisc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Palmer,

On Wed, Nov 6, 2019 at 7:11 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> It looks like the difference in prototype between the architectures is between
>
>     void __iomem *ioremap(resource_size_t, size_t)
>     void __iomem *ioremap(phys_addr_t, size_t)
>     void __iomem *ioremap(phys_addr_t, unsigned long)
>     void __iomem *ioremap(unsigned long, unsigned long)
>
> shouldn't they all just be that first one?  In other words, wouldn't it be
> better to always provide the generic ioremap prototype and unify the ports
> instead?

Agreed. But I'd go for the second one.

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
