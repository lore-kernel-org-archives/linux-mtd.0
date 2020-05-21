Return-Path: <SRS0=CeWw=7D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1233C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 21 May 2020 19:10:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE7B12070A
	for <linux-mtd@archiver.kernel.org>; Thu, 21 May 2020 19:10:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SeaedDA0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE7B12070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FNUbAiuJw0ku2ZUevt6yEXZEYOHMV/UAUF4GqRxgdPE=; b=SeaedDA0roX7zK
	Ao7tPE+cCu0LPO9aaEm6d7oQE9LXmh9w4GClnHxN6+cUG8ui+61gS0ONQ7se01QCxr+DL2w1uYhYb
	vNQeD4Y5KXg1y6R68/DyAblN0H2lHNUVyp16jx9hWzYKuFQqyjSVqU1ncoN7n2UO8CYIej9g1VDOr
	Jfe8tdcw1I3pqrrgXxqnuzsJeHmL4nhfwH3szyspYnTRh/IVJ8tAOJVoDmAf/TaLKc1cfmnNhBa8B
	s6ZUgNFWGoDiw+lfG7FlQgr4BU6ABJLPwqBOAszEs4nugNBKFm/EEwd4LZ9PaFmZSz+C6FETQyHAT
	YIz5SwNdgSgeVkuOI5RA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbqaP-00088z-07; Thu, 21 May 2020 19:10:33 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbqaE-00081B-13; Thu, 21 May 2020 19:10:23 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 561952A111A;
 Thu, 21 May 2020 20:10:20 +0100 (BST)
Date: Thu, 21 May 2020 21:10:16 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 1/3] ARM: pxa: remove Compulab pxa2xx boards
Message-ID: <20200521211016.3ad62148@collabora.com>
In-Reply-To: <20200521190158.GL1118872@kernel.org>
References: <20200520102125.8934-1-robert.jarzmik@free.fr>
 <CAK8P3a2+auSWBROZR-hobM_qSWtKiG1DRYP3Y7uvbCy_ZLy+gg@mail.gmail.com>
 <20200521071213.GI1118872@kernel.org>
 <CAK8P3a2XdG_u6_o2NbQDTb5dbdzByBkUXZNM6nZ3wz0c-LFT5w@mail.gmail.com>
 <20200521190158.GL1118872@kernel.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_121022_206135_781EF1AE 
X-CRM114-Status: GOOD (  20.59  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 21 May 2020 22:01:58 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> On Thu, May 21, 2020 at 09:26:10AM +0200, Arnd Bergmann wrote:
> > On Thu, May 21, 2020 at 9:12 AM Mike Rapoport <rppt@kernel.org> wrote:  
> > >
> > > On Wed, May 20, 2020 at 05:21:51PM +0200, Arnd Bergmann wrote:  
> > > > On Wed, May 20, 2020 at 12:21 PM Robert Jarzmik <robert.jarzmik@free.fr> wrote:  
> > > > >
> > > > > As these boards have no more users nor testers, and patching them has
> > > > > become a burden, be that because of the PCI part or the MTD NAND
> > > > > support, let's remove them.
> > > > >
> > > > > The cm-x300 will for now remain and represent Compulab boards at its
> > > > > best in the PXA department.  
> > >
> > > I think this series missed the cm-x270 NAND driver, so this could be
> > > PATCH 4/3 (not even compile tested).
> > >
> > > From 56a11987f82ef8b32b25dfc17b849f9bbbf03e4d Mon Sep 17 00:00:00 2001
> > > From: Mike Rapoport <rppt@linux.ibm.com>
> > > Date: Thu, 21 May 2020 10:09:47 +0300
> > > Subject: [PATCH] mtd: rawnand: remove CM-X270 NAND driver
> > >
> > > The cm-x270 board have been removed and theres is no point to keep this
> > > driver.
> > >
> > > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>  
> > 
> > Thanks! Removing that driver was actually how the discussion started,
> > so we definitely want to do that. Boris earlier patch "mtd: rawnand: Get
> > rid of the cmx270 driver" did it by changing the board file, now your
> > patch is the right thing to do, and we should remember to do the same
> > for mbxfb.  
> 
> Arnd, will you pick this to the SoC tree or should I resend?

Actually I sent a v2 removing only the MTD driver. You should probably
sync with Miquel to make sure the same patch is not applied twice.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
