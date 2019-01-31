Return-Path: <SRS0=cI5g=QH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD886C169C4
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jan 2019 17:45:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B27D20B1F
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jan 2019 17:45:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RpZa57h+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XIayv4sr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B27D20B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5X+YmuJMlpR8UUjGE6fkaabUkYDaHcJ5QdZTwx99Olw=; b=RpZa57h+854GKt
	4ETTZ2JbG5edl01vqwfWCBk3UgYCI0iDmepiVtvai1olrHFMVSgus9A23yCtcgDyBMSiE5d7dPvfK
	WnVUM4NL7TUgLEpr5oxK4PBD6INCM2MOmv0bOpGsynJuwG0cbUX33o7MeU/p6YL76nEa2dUP0IKVy
	Pizm/g2YpTmDzUaZ04B5G17LYJJHtwIMnysx6gmnDcxMXH8mRXbtSGZ8WgSJPhppkXlco+Va5njj7
	AwoySj1SBAx/ed+JqZQKBjI3n/hmguLalt1iIrFw3cPq6yFQwmP1RwSZG61PLUEGxX27fPYroylbD
	HyQfMK7gdD0HV6YwPp3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpGOs-0002or-3I; Thu, 31 Jan 2019 17:45:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpGOo-0002oT-SB
 for linux-mtd@lists.infradead.org; Thu, 31 Jan 2019 17:45:16 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5F78120B1F;
 Thu, 31 Jan 2019 17:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548956714;
 bh=+4mKJDyLMniVxAexz7ePaFcXK5VXNOBmqQq2ZGrzPcs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XIayv4srdb0dsjc9EqfN7Rq9QgfZDbIxjSVJ2FpiE1d0M6gDSOP2DR3EbdR3X2tIN
 ZQnOAo7Ee3xdIOsLpaffIfLmSbxofPs9lnccCUjsr4ZSx4xQKCYy7IwfKbNajfVPRZ
 4xziW9LC+UVXSaGrXncOYpzqKaj776hDv7cLwvP8=
Date: Thu, 31 Jan 2019 18:45:03 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [PATCH 1/6] mtd: afs: simplify partition parsing
Message-ID: <20190131184449.6d2ff0af@bbrezillon>
In-Reply-To: <20190131171327.GM25147@e110455-lin.cambridge.arm.com>
References: <20190128135449.15555-1-linus.walleij@linaro.org>
 <20190128135449.15555-2-linus.walleij@linaro.org>
 <20190131171327.GM25147@e110455-lin.cambridge.arm.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190131_094514_931038_80D20EC4 
X-CRM114-Status: GOOD (  18.69  )
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
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Linus Walleij <linus.walleij@linaro.org>,
 Marek Vasut <marek.vasut@gmail.com>, Ryan Harkin <ryan.harkin@linaro.org>,
 linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Liviu,

On Thu, 31 Jan 2019 17:13:27 +0000
Liviu Dudau <liviu.dudau@arm.com> wrote:

> Hi Linus,
> 
> On Mon, Jan 28, 2019 at 02:54:44PM +0100, Linus Walleij wrote:
> > This simplifies the AFS partition parsing to make the code
> > more straight-forward and readable.
> > 
> > Before this patch the code tried to calculate the memory required
> > to hold the partition info by adding up the sizes of the strings
> > of the names and adding that to a single memory allocation,
> > indexing the name pointers in front of the struct mtd_partition
> > allocations so all allocated data was in one chunk.
> > 
> > This is overzealous. Instead use kstrdup and bail out,
> > kfree():ing the memory used for MTD partitions and names alike
> > on the errorpath.
> > 
> > In the process rename the index variable from idx to i.
> > 
> > Cc: Ryan Harkin <ryan.harkin@linaro.org>
> > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> >  drivers/mtd/parsers/afs.c | 67 +++++++++++++++++++--------------------  
> 
> What kernel is this series based on? Current Torvalds' tree has the
> afs.c file in drivers/mtd and not in drivers/mtd/parsers/. Is there a
> patch that I'm missing moving things around?

It depends on this series [1] (mentioned in the cover letter).

Regards,

Boris

[1]http://patchwork.ozlabs.org/project/linux-mtd/list/?series=87760

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
