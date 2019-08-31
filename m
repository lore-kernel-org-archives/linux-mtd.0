Return-Path: <SRS0=VSS2=W3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8058C3A5A6
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Aug 2019 16:30:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97E6022D37
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Aug 2019 16:30:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Iz5pfA/W";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vX6b95Id"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97E6022D37
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+UjEMPc5c5Mp885mDroFyG5othGRuorp2Ucz223/dpU=; b=Iz5pfA/W6/a+t1
	K4RNrnD1rpWUPqNnJiosIjVaqMSGEJQ5fFIxAKGh4irCLUz59/5x30T869kh6Hx+h9l4RwqMgoR4M
	KBi5emean7aKAowZJuQ05kCTt95HOet8gVSfe4CsDnXNBuJatjkbZ9nVG+q1LDFnpRiyA9rkfdY3N
	v9n8ZKxPLfSCw6y7Smrs0XZf8CiLGgW+brmONx2xBEpmED5nv6HTjVJJzrXy1deHce8TAZ9Pg1dgI
	Emc5RPX+KWawW/ALwW6AzILtsnBlm6UnqH+U/Weihb0pcTBTFfeNw+twTYOGOaxOraPs1JbiZ2l5T
	GFKZSEiD58tFO002158Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i46GN-0003fS-Ac; Sat, 31 Aug 2019 16:30:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i46G4-00033V-E8; Sat, 31 Aug 2019 16:29:49 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2253522D37;
 Sat, 31 Aug 2019 16:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567268985;
 bh=oCFqDXfnxrqpiBFRCwyD8nHXvoMvSjbxCsJhrxHTYqM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vX6b95IdsVrDjTXh55KZNhoPNMKUITWlit4Ldb9kHZhxWpNoqZwiOB5EF5DJcLfuZ
 wmt8nfF1pggofVEAUJWY4K2cI3w83kg0ds8vBO0zGI/+b8iJT5NQEI4dH3G3L57NyD
 AwNlHxXQFvARoZXdkRSB9gHwMtmjWPnHQrjl8Gx4=
Date: Sat, 31 Aug 2019 17:29:38 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 19/26] arm64: remove __iounmap
Message-ID: <20190831162937.5ybulvaa4eq7mybs@willie-the-truck>
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-20-hch@lst.de>
 <20190819073601.4yxjvmyjtpi7tk56@willie-the-truck>
 <20190830160515.GC26887@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190830160515.GC26887@lst.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190831_092948_503581_DA516278 
X-CRM114-Status: GOOD (  13.76  )
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

Hi Christoph,

On Fri, Aug 30, 2019 at 06:05:15PM +0200, Christoph Hellwig wrote:
> On Mon, Aug 19, 2019 at 08:36:02AM +0100, Will Deacon wrote:
> > On Sat, Aug 17, 2019 at 09:32:46AM +0200, Christoph Hellwig wrote:
> > > No need to indirect iounmap for arm64.
> > > 
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > ---
> > >  arch/arm64/include/asm/io.h | 3 +--
> > >  arch/arm64/mm/ioremap.c     | 4 ++--
> > >  2 files changed, 3 insertions(+), 4 deletions(-)
> > 
> > Not sure why we did it like this...
> > 
> > Acked-by: Will Deacon <will@kernel.org>
> 
> Can you just pick this one up through the arm64 tree for 5.4?

Unfortunately, it doesn't apply because the tree you've based it on has
removed ioremap_wt(). If you send a version based on mainline, I can
queue it.

Cheers,

Will

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
