Return-Path: <SRS0=GPAM=77=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38772C433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jun 2020 14:33:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B227207E8
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jun 2020 14:33:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SwNfxfdp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B227207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w5OeWvFrWsXk9Egiqyc3ykqXYfgSAKpmhnPOFnb9WII=; b=SwNfxfdpR4/khO
	004rLJxCHYodN0RptzQFDUJuBtv5sqnjJqJQUX6wB4uPPOS4opPiaCDEm1QiCgyRKQSJ+Jmp/HPov
	f8OXDCov9oJ9dytwRf1ZiYgg+2cMA3gs/aEIyK2NcbR9dBOBlcqaYjJHpmqhgGSlwM7tTusUURQaB
	hvcqvFAoTi0eGV3TiEeWHWIQJyMK0Icm5A7+NrG/5/Xk2AgaLtXtcBuAC7VeneBw9arsF+c62QRS4
	Mlf05dNKwK3+IobWiLkpUBsjurLlBR81yGHx8sHGhGA9p2mLJrO9NEuOjYkXEGQKnhjRnUuxVRme8
	lzj540L5oR8NDYjgQGiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlvc2-0004xc-4g; Thu, 18 Jun 2020 14:33:54 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlvbw-0004wP-Ao
 for linux-mtd@lists.infradead.org; Thu, 18 Jun 2020 14:33:52 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 01C172A4E1D;
 Thu, 18 Jun 2020 15:33:44 +0100 (BST)
Date: Thu, 18 Jun 2020 16:33:41 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: Re: next/master bisection: baseline.login on
 ox820-cloudengines-pogoplug-series-3
Message-ID: <20200618163341.12f7c996@collabora.com>
In-Reply-To: <0c00fe0b-c38b-3d69-8f93-3fe8c3675113@collabora.com>
References: <5eeb5bf7.1c69fb81.4f6e3.8979@mx.google.com>
 <13497644-ae34-d5e3-e76a-742cddf0f0a9@collabora.com>
 <20200618152324.0b0007a9@xps13> <20200618160925.6f77b1d1@xps13>
 <0c00fe0b-c38b-3d69-8f93-3fe8c3675113@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_073349_123102_C1C7BA25 
X-CRM114-Status: GOOD (  16.21  )
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
Cc: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, kernelci-results@groups.io,
 Boris Brezillon <bbrezillon@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 Stefan Agner <stefan@agner.ch>, Richard Weinberger <richard@nod.at>,
 linux-next@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Gleixner <tglx@linutronix.de>, Mason Yang <masonccyang@mxic.com.tw>,
 Enrico Weigelt <info@metux.net>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 18 Jun 2020 15:23:45 +0100
Guillaume Tucker <guillaume.tucker@collabora.com> wrote:

> On 18/06/2020 15:09, Miquel Raynal wrote:
> > Hi Guillaume,
> > 
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote on Thu, 18 Jun 2020
> > 15:23:24 +0200:
> >   
> >> Hi Guillaume,
> >>
> >> Guillaume Tucker <guillaume.tucker@collabora.com> wrote on Thu, 18 Jun
> >> 2020 13:28:05 +0100:
> >>  
> >>> Please see the bisection report below about a kernel panic.
> >>>
> >>> Reports aren't automatically sent to the public while we're
> >>> trialing new bisection features on kernelci.org but this one
> >>> looks valid.
> >>>
> >>> See the kernel Oops due to a NULL pointer followed by a panic:
> >>>
> >>>   https://storage.kernelci.org/next/master/next-20200618/arm/oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-series-3.html#L504  
> >>
> >> Thanks for the report, I will not be able to manage it before Monday,
> >> but I'll try to take care of it early next week.  
> > 
> > Actually Boris saw the issue, I just updated nand/next, it should be
> > part of tomorrow's linux-next. Could you please report if it fixes your
> > boot?  
> 
> Sure, will check tomorrow.  Thanks for the update.
> 
> We may also consider adding the nand/next branch to kernelci.org
> and catch issues earlier.  We can discuss that separately.

If you're testing linux-next that shouldn't help us much (nand/next is
pulled in linux-next already), but maybe it's just about making the
bisection easier for kernelci (less commits to inspect), in which case
that's probably a good idea. You might also want to add mtd/next,
spi-nor/next and cfi/next so the entire MTD subsystem gets tested.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
