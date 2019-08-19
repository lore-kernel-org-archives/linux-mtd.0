Return-Path: <SRS0=wiZC=WP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E60C3A59B
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2019 08:51:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27E3C2082C
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2019 08:51:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IFgN5g9t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27E3C2082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TLJq1Hk5BBlfaR4ChoRtyjPYtQWKluYH/ixcA/m3F/M=; b=IFgN5g9tURnPg0
	ASrWssKlk03tWvKhc00hRasEtH370smsFAYfqFz0fYczJeCHZKAMVsLpVPYqP/nzyffAcKVnyhnR8
	vvfgwWapPQtF287NDxUPKdslwN9K5SvLuGmC1fLS3f6eNBo8qhp5VIdAo48RZVcKo2PJYFzkVviJB
	4ugYu9BCcBW9psUgrwYevqKDVj8m1wca67okiiW3GVgpnUvYR6l7t9Gsh/Tj2MFY+PzHnmhg9gvEm
	GT6KKvVnnDluCn/W3gmIrz6laO6QaqvOFH7T3s6IGegTO3efsqrnWh+8pa1llkiI9hiK3YwwOfhJW
	3JiLojPMpdOapWYDdqvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzdNR-00009q-6g; Mon, 19 Aug 2019 08:50:57 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzdNO-000098-F5; Mon, 19 Aug 2019 08:50:55 +0000
Received: by mail-oi1-f194.google.com with SMTP id c15so735301oic.3;
 Mon, 19 Aug 2019 01:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XvpHNQzLHQyAljD3a4MUdfT4ynucGZ6tzJYlGCkwzvk=;
 b=MvgVzfQh96j0E3U0jHDtimDvGDtIdjcJCdCXd6RHpFyTjMveFeeg56TujWQWMdk7A3
 6SUlySAHYX5FAeVknB5y808/bKnD9S+SxSMH1mvACwT7/AgEiTVsAkBtDp12YayjXqa9
 9HrW0pE5Uwfb3eujsUTijvzrJub1GvgppCocLpGE9mzPPN23JZqU4s+VHVbQ2eaVUTjj
 z1ruxppCahnI8IhepPjxcqM4oQafJAKlT9j2WQx8PDHS7g2gEmSayl7juONxIc3jHG90
 1wZ+GE+luZrltnA2ZpAReaAdjiK+cMZxOERvc5Ay4Evq0mWQ4t2jfVsHh19Q1Qt8kX+F
 FSAg==
X-Gm-Message-State: APjAAAWqgsXEUcKxW9amll1FlZWwQPPI228gqworO3GhULfOLTbh4WA7
 pFEZotOYNslTiKC20sJvnU60h4tadGFtuSBVwOQ=
X-Google-Smtp-Source: APXvYqwmqcH0DTBSRr1W5PEboqZl9eNrRnGfwBz/22T1r10yVcw0KO4fHH9AZZHFDFACKa88tOO5vT/zZa40mMCQj8M=
X-Received: by 2002:a54:4618:: with SMTP id p24mr2849469oip.148.1566204653079; 
 Mon, 19 Aug 2019 01:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-4-hch@lst.de>
In-Reply-To: <20190817073253.27819-4-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Aug 2019 10:50:41 +0200
Message-ID: <CAMuHMdVT3VSQ1S=YEoTjYzxwpavy+43XUWA-wzCO56FuHK6R-g@mail.gmail.com>
Subject: Re: [PATCH 03/26] m68k, microblaze: remove ioremap_fullcache
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190819_015054_503715_7AF3F709 
X-CRM114-Status: UNSURE (   8.17  )
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

On Sat, Aug 17, 2019 at 9:41 AM Christoph Hellwig <hch@lst.de> wrote:
> No callers of this function.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

>  arch/m68k/include/asm/kmap.h     | 7 -------

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
