Return-Path: <SRS0=CeWw=7D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30D9C433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 May 2020 19:02:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B35020759
	for <linux-mtd@archiver.kernel.org>; Thu, 21 May 2020 19:02:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pdG10MqA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+rqRENo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B35020759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AghY/dobBNQ+5cXYtImPNpUThWe2OHvNqHTp1q/2MBY=; b=pdG10MqALGhpAl
	jfCh/FR15yJdtIix3JG8fEKZAjqV67+/EJ7LnIDT6z96zvEQS+2QesSBsCgsDhEERV7AplpsvgEaB
	sKgZ36zW29JVs0NDW/dX3nWnZ3EGxtK8oqEt8YYuOCAFZM9ByKXu+s+8AKnbAC4IFi2euAuaY/0sh
	i+05VU7nGX3/5j1HfkhJDcLaiFgZVLv/a4Ch/4TP3C3+pI3JA90epBBWfeLmL0zxrG5PctFt8vVP8
	t05z1fFViT7yoUypqNn+E93wkLOQmhGcYWsJVyJF9sNFdwI8uAp/xGfvA8HrZcZX0oEaCuja5ON8Y
	EP+JQso0yCH1+wyUW/pg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbqSX-0001YM-8z; Thu, 21 May 2020 19:02:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbqSH-0001OM-3Z; Thu, 21 May 2020 19:02:10 +0000
Received: from kernel.org (unknown [87.71.47.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C8DBD20759;
 Thu, 21 May 2020 19:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590087728;
 bh=nNXKaXk7NUUEHuMk8/5mkYYFL6NtSC+OylXv+fxspZk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m+rqRENo+YpOG/+8fQJrGpjYWTDcItfdopESIMnNjk5K6tnfDuXqwfcCoMG8Bua+7
 08kcwp5i0jYpJWEdLgD1LzT07zwu8TKhl8+pIP2cpifaivdr5H1fiCyJAk40z1ZPWt
 2BSc8PuEAG39azrQxN1xIn+SRSRfFxKKhLdVdW1Q=
Date: Thu, 21 May 2020 22:01:58 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/3] ARM: pxa: remove Compulab pxa2xx boards
Message-ID: <20200521190158.GL1118872@kernel.org>
References: <20200520102125.8934-1-robert.jarzmik@free.fr>
 <CAK8P3a2+auSWBROZR-hobM_qSWtKiG1DRYP3Y7uvbCy_ZLy+gg@mail.gmail.com>
 <20200521071213.GI1118872@kernel.org>
 <CAK8P3a2XdG_u6_o2NbQDTb5dbdzByBkUXZNM6nZ3wz0c-LFT5w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2XdG_u6_o2NbQDTb5dbdzByBkUXZNM6nZ3wz0c-LFT5w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_120209_173848_07481663 
X-CRM114-Status: GOOD (  17.31  )
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
 Boris Brezillon <boris.brezillon@collabora.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, May 21, 2020 at 09:26:10AM +0200, Arnd Bergmann wrote:
> On Thu, May 21, 2020 at 9:12 AM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > On Wed, May 20, 2020 at 05:21:51PM +0200, Arnd Bergmann wrote:
> > > On Wed, May 20, 2020 at 12:21 PM Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> > > >
> > > > As these boards have no more users nor testers, and patching them has
> > > > become a burden, be that because of the PCI part or the MTD NAND
> > > > support, let's remove them.
> > > >
> > > > The cm-x300 will for now remain and represent Compulab boards at its
> > > > best in the PXA department.
> >
> > I think this series missed the cm-x270 NAND driver, so this could be
> > PATCH 4/3 (not even compile tested).
> >
> > From 56a11987f82ef8b32b25dfc17b849f9bbbf03e4d Mon Sep 17 00:00:00 2001
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > Date: Thu, 21 May 2020 10:09:47 +0300
> > Subject: [PATCH] mtd: rawnand: remove CM-X270 NAND driver
> >
> > The cm-x270 board have been removed and theres is no point to keep this
> > driver.
> >
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> 
> Thanks! Removing that driver was actually how the discussion started,
> so we definitely want to do that. Boris earlier patch "mtd: rawnand: Get
> rid of the cmx270 driver" did it by changing the board file, now your
> patch is the right thing to do, and we should remember to do the same
> for mbxfb.

Arnd, will you pick this to the SoC tree or should I resend?

>       Arnd

-- 
Sincerely yours,
Mike.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
