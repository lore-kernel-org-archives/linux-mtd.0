Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBDCC43334
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jun 2022 08:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lE8q59qOg9OI3Um43Bh7Blp2JXAVvwdqrOZ4u9RA1aM=; b=uKbK3UzI4h6Kfa
	gRY2heOJOb3PqueAae467RxnnPQBZJizwU9Um/1gqBRF4547pxMKx/rnnz/medLWZoBYS98+2CgTA
	dM+ZKbS0iMlP2HVg49+k59isIGGq0HcfTg0ifC/y/3qRb+hsznT4tlTzqOnSH5M9iNcswhX800Cc2
	pdE3e56zClQv75EJWCw8at0pqBPetyQrnaMAO7s9BtvXFqehqMMgAH1F9gGoR+t//lvwHwfpS8sOH
	ZqcKwbrSDDn1C7gEp77qyx9fKNzwhUuiDHdLMCocxXll4Ned3iicwmcl4GThxBSny/GxtFV1RSj+z
	+w51/cY5UBswtBeXy8ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o120Y-008HTs-RW; Tue, 14 Jun 2022 08:34:42 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o120V-008HSf-Ip
	for linux-mtd@lists.infradead.org; Tue, 14 Jun 2022 08:34:41 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1o120U-0005c4-1u; Tue, 14 Jun 2022 10:34:38 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1o120T-0004Oa-Iw; Tue, 14 Jun 2022 10:34:37 +0200
Date: Tue, 14 Jun 2022 10:34:37 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>,
	kernel@pengutronix.de
Subject: Re: [PATCH] mtd: rawnand: gpmi: Fix setting busy timeout setting
Message-ID: <20220614083437.GR1615@pengutronix.de>
References: <20220613113030.1622723-1-s.hauer@pengutronix.de>
 <20220613160738.1b833bac@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220613160738.1b833bac@xps-13>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_013439_662143_2DE0FCB7 
X-CRM114-Status: GOOD (  27.66  )
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

On Mon, Jun 13, 2022 at 04:07:38PM +0200, Miquel Raynal wrote:
> Hi Sascha,
> 
> s.hauer@pengutronix.de wrote on Mon, 13 Jun 2022 13:30:30 +0200:
> 
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
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> 
> Shouldn't we add a Cc: stable here?

I became a bit ignorant about Cc: stable because everything with the
keyword "Fix" in the subject seems to end up in stable anyway no matter
if I want it or not.

But right, this one should go into stable, I just resent.

Sascha


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
