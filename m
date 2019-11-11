Return-Path: <SRS0=EHtI=ZD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7061EC17445
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 10:30:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9DBC214DB
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 10:30:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X6imzjIb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9DBC214DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=URLJoxQf2I712U+ZyKZnrFldgTSNJVG/Usfoo7HltwQ=; b=X6imzjIbP0zLZC
	tFgPyUichH+baroGXpPVtDeZxvfxr0pFET8c2ZXCeaUz+Z5yz4+Oc+X7ygzoMsOhpoSjvxRYR3jOu
	ELmDavJ9rla2pZEuXOcyIkX7gMKE7YV2mhfEiNIuy/3fSgcfwY5FN3SYGC1VbDLHtMYRvEMBhzten
	HdnvA16AMZWZx2s6m3hvjl6Xw8jDsP5ksSf0gZv92n/GPvUD57fbqkrQhx3IgRSSeCcEyTTufb1AJ
	qtCZFFINNpOTy+yAxR0GZGNk3UXBWmavXJGYvucV1TLWZGr6llwjc5/erbRbXrPTGyJ8yv/Nt+5hZ
	oFFoDjLXKbEVidRxl/og==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU6xm-00043o-9t; Mon, 11 Nov 2019 10:30:26 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU6wo-00035O-Sw; Mon, 11 Nov 2019 10:29:31 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1A21068BE1; Mon, 11 Nov 2019 11:29:24 +0100 (CET)
Date: Mon, 11 Nov 2019 11:29:23 +0100
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 10/21] asm-generic: ioremap_uc should behave the same
 with and without MMU
Message-ID: <20191111102923.GA12974@lst.de>
References: <20191029064834.23438-1-hch@lst.de>
 <20191029064834.23438-11-hch@lst.de>
 <CAK8P3a2o4R+E2hTrHrmNy7K1ki3_98aWE5a-fjkQ_NWW=xd_gQ@mail.gmail.com>
 <20191111101531.GA12294@lst.de>
 <CAK8P3a0rTvfPP2LUMw8EC0xz5gfZP5+NUkoaZBJrtYYfr6YRig@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0rTvfPP2LUMw8EC0xz5gfZP5+NUkoaZBJrtYYfr6YRig@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_022927_672978_A3F73D5C 
X-CRM114-Status: UNSURE (   6.48  )
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
Cc: linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linux-xtensa@linux-xtensa.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Guan Xuetao <gxt@pku.edu.cn>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Parisc List <linux-parisc@vger.kernel.org>,
 linux-mips@vger.kernel.org, alpha <linux-alpha@vger.kernel.org>,
 "moderated list:NIOS2 ARCHITECTURE" <nios2-dev@lists.rocketboards.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Nov 11, 2019 at 11:27:27AM +0100, Arnd Bergmann wrote:
> Ok, fair enough. Let's just go with your version for now, if only to not
> hold your series up more. I'd still suggest we change atyfb to only
> use ioremap_uc() on i386 and maybe ia64. I can send a patch for that.

I don't think we even need it on ia64.  But lets kick off a dicussion
with the atyfb, x86 and ia64 maintainers after this series is in.
Which was kinda my plan anyway.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
