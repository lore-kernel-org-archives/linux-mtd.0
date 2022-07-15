Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8C4C43334
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 15:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0CBwBrF6XF+nKKi0n47qwhk2dvrZWcVxTYpowbRmaWI=; b=zgBkAMYYFoI1Dr
	6P9GAQkYCPHjjanzycu50OblafOnXFKPhnr8HZkREnDS1/GQQQlbxFVN/H1LvSz1tOIijxC3Cvfwk
	T6cWzOjCuInnrdZi6OOE8niCpS9b3K+60miv+5EvUapEC3VmOdLI+J4x4wXDu0fV6y7h9W8r118nq
	FxCA5LJRmPC5qnmSC+xE1qgq2++2EC9v/osLokhIAClas/uHz4pxJi1jrC4s43FqXfxBKwXoJC0HD
	oV36EOasU2HRI9VTLfBysTuv+osc4BSwFwJtI25e4cO8FTyRTU5Gh5/uFE3uqYqYUeN+ZUtALVIOC
	SaSLLjgEr4jdKgslGXhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCMsG-007zQO-TP; Fri, 15 Jul 2022 15:05:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCMsE-007zOa-AN
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2022 15:04:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DAC6C6202E;
	Fri, 15 Jul 2022 15:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8BEC34115;
	Fri, 15 Jul 2022 15:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657897497;
	bh=EdeUh0P60IsCGnV7exKNsrtWwGeoSTBn5VI20keVTwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EeI8LCuuUWb8H626KKDvo8ApeTyVnUbJMLT2oR6Mj3IO2rDBxLqb+Gq74agaQvewI
	 sXH1M1yje0/fQNJbvWljIjYe62icqYROczaUIDdLwoxunWwmqkY+TtzMqVNgeSgfRZ
	 VByBmwVwT+my55umvevJVSE4UlBUaZQdcQSWKpnE=
Date: Fri, 15 Jul 2022 17:04:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
	Han Xu <han.xu@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
	kernel@pengutronix.de, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: gpmi: Fix setting busy timeout setting
Message-ID: <YtGCFmN+0/SYdvOz@kroah.com>
References: <20220614083138.3455683-1-s.hauer@pengutronix.de>
 <20220715142209.GA1688021@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220715142209.GA1688021@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_080458_419469_FA87AD9A 
X-CRM114-Status: GOOD (  25.67  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jul 15, 2022 at 07:22:09AM -0700, Guenter Roeck wrote:
> On Tue, Jun 14, 2022 at 10:31:38AM +0200, Sascha Hauer wrote:
> > The DEVICE_BUSY_TIMEOUT value is described in the Reference Manual as:
> > 
> > | Timeout waiting for NAND Ready/Busy or ATA IRQ. Used in WAIT_FOR_READY
> > | mode. This value is the number of GPMI_CLK cycles multiplied by 4096.
> > 
> > So instead of multiplying the value in cycles with 4096, we have to
> > divide it by that value. Use DIV_ROUND_UP to make sure we are on the
> > safe side, especially when the calculated value in cycles is smaller
> > than 4096 as typically the case.
> > 
> > This bug likely never triggered because any timeout != 0 usually will
> > do. In my case the busy timeout in cycles was originally calculated as
> > 2408, which multiplied with 4096 is 0x968000. The lower 16 bits were
> > taken for the 16 bit wide register field, so the register value was
> > 0x8000. With 2970bf5a32f0 ("mtd: rawnand: gpmi: fix controller timings
> > setting") however the value in cycles became 2384, which multiplied
> > with 4096 is 0x950000. The lower 16 bit are 0x0 now resulting in an
> > intermediate timeout when reading from NAND.
> > 
> > Fixes: b1206122069aa ("mtd: rawnand: gpmi: use core timings instead of an empirical derivation")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> 
> I see this patch was reverted in a set of rush stable releases,
> but I still see it in the mainline kernel. Is it going to be reverted
> there as well ?

A fix has been sent, it was said to be picked up hopefully next week:
	https://lore.kernel.org/all/20220701110341.3094023-1-s.hauer@pengutronix.de/

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
