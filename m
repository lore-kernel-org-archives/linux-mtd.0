Return-Path: <SRS0=THda=RB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4532EC43381
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Feb 2019 09:10:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C759213A2
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Feb 2019 09:10:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qqKHoZ82"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C759213A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GxRPJA6VOgr4efapB6eHcMnW4Qvu8X3Czz8MkLVxROg=; b=qqKHoZ82ogbkeL
	CKWiOSCgXDZmIsOXWkwAAmRFPpQ6mXSFkXXKFxR8jJN1InpTdpANrDqBTl9ja2+Iz6TDcYpkZm4qf
	9nP3Ck3wnZEExfYvh3r3+hwhaFtzQgubx8e0aAwqjO8MoOZqBoa5wrP4Jg7KMjYl4pFRg3JEJK50w
	bsbqveQIRs3cfaf+9WKnWX0a9V+xagNmbH0PiqHYgDkg+OngmB/TAkZHwXVGoGq6u+1OIsWbeCeVw
	iKPeKq7TVhDBUXIAQXuK2LbdRpju399PW6TME0mara+1w5UIe+ZpfeUdcEUT9xo0dtEY3xoZj5Jjg
	tbplTeyLNBzaLb+nXNyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyYkm-0002QN-2Q; Tue, 26 Feb 2019 09:10:20 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyYki-0002Px-9y
 for linux-mtd@lists.infradead.org; Tue, 26 Feb 2019 09:10:17 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1gyYkf-0004fX-5U; Tue, 26 Feb 2019 10:10:13 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1gyYke-0006fF-G3; Tue, 26 Feb 2019 10:10:12 +0100
Date: Tue, 26 Feb 2019 10:10:12 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: Prevent Nand page writes on Power failure
Message-ID: <20190226091012.ywzsohf36z4z7zx4@pengutronix.de>
References: <20190220135820.b2ku2unaxxdqflut@pengutronix.de>
 <20190225085631.ddsodh7x3kaofer5@pengutronix.de>
 <CAFLxGvxcck2mhKA1_20Q3p1FD9MHTrcy-yfi8RxkwTgrwa5j-A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFLxGvxcck2mhKA1_20Q3p1FD9MHTrcy-yfi8RxkwTgrwa5j-A@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 07:55:02 up 14 days, 15:20, 56 users,  load average: 0.00, 0.04, 0.07
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190226_011016_507865_373C8ED9 
X-CRM114-Status: GOOD (  14.40  )
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
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Feb 25, 2019 at 12:28:15PM +0100, Richard Weinberger wrote:
> On Mon, Feb 25, 2019 at 9:56 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:
> > +static irqreturn_t gpmi_pwr_good_irq(int irq, void *dev_id)
> > +{
> > +       struct gpmi_nand_data *this = dev_id;
> > +       int level;
> > +
> > +       level = gpiod_get_value_cansleep(this->pwrgood_gpio);
> > +       if (level) {
> > +               mutex_lock(&this->nand.power_lock);
> > +       } else {
> > +               mutex_unlock(&this->nand.power_lock);
> > +               dev_info(this->dev, "Spurious Power Failure detected\n");
> > +       }
> 
> Hmm, not sure if it is wise to unlock after the power-low pin was toggled.
> Do you have a guarantee that the system, and most important the NAND chip,
> is in a well defined state after the power returns?

No, not at all ;)

I could remove the mutex_unlock() in the spurious power failure path,
but I think I'll figure out what to do when I see the message in the
logs.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
