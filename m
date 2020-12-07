Return-Path: <SRS0=dr6A=FL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF2EC4361B
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 16:44:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89EE023787
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 16:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89EE023787
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7RUBqr67W84thW3PfFXzaPyBkZctQa7j36QqyVIu3+U=; b=NGL5AeB3sBK3jASVsotM8RfcJ
	OpzP3sAkurGX/BPTikWz+8ZuWYDFgavTSUDlfwdaJa8YgP+v22tcOfDkxwIDyZWVc57ewDqRCE7zK
	SUz966Vf4UtKTEOVg4gfypkuYhcO172mQMQWlKZM8ddUlds1ucm98TWeXok7705btE9hhz0zbuiMx
	o619tSmxFO7M+YbGkwOWlYxvGwjP4HQDqzpJV/AwqW78baCYx0nVgHapdPuswaBbpUkrzsLdCG1CM
	vc4eKkFcW/UzNI+YRnHy7LaXnsfo6DU5Z/9GhVQBYfd6FOzZ2C0YKSp6OTiK4Uq4QG5qOcNkktaeF
	en7nbHc9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmJc8-0003dv-UD; Mon, 07 Dec 2020 16:43:53 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmJc6-0003dX-3h
 for linux-mtd@lists.infradead.org; Mon, 07 Dec 2020 16:43:50 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kmJc3-0006Aw-Ok; Mon, 07 Dec 2020 17:43:47 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kmJc3-00008C-0n; Mon, 07 Dec 2020 17:43:47 +0100
Date: Mon, 7 Dec 2020 17:43:46 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Han Xu <han.xu@nxp.com>
Subject: Re: [EXT] Re: [PATCH 1/2] mtd: rawnand: gpmi: Fix the driver only
 sense CS0 R/B issue
Message-ID: <20201207164346.GO3977@pengutronix.de>
References: <20201205063004.3099-1-han.xu@nxp.com>
 <20201207095006.GK3977@pengutronix.de>
 <AM6PR0402MB37012F0C151E42C690EF935E97CE0@AM6PR0402MB3701.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AM6PR0402MB37012F0C151E42C690EF935E97CE0@AM6PR0402MB3701.eurprd04.prod.outlook.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 17:41:01 up 5 days, 5:07, 69 users, load average: 0.53, 0.25, 0.20
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_114350_195901_7DD624A5 
X-CRM114-Status: GOOD (  19.11  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Dec 07, 2020 at 04:14:00PM +0000, Han Xu wrote:
> 
> 
> > -----Original Message-----
> > From: Sascha Hauer <s.hauer@pengutronix.de>
> > Sent: Monday, December 7, 2020 3:50 AM
> > To: Han Xu <han.xu@nxp.com>
> > Cc: miquel.raynal@bootlin.com; linux-mtd@lists.infradead.org
> > Subject: [EXT] Re: [PATCH 1/2] mtd: rawnand: gpmi: Fix the driver only sense
> > CS0 R/B issue
> > 
> > Caution: EXT Email
> > 
> > On Sat, Dec 05, 2020 at 12:30:03AM -0600, Han Xu wrote:
> > > set the GPMI CTRL1 GANGED_RDYBUSY bit so dirver can sense the R/B
> > > signal from all CS.
> > >
> > > For the NAND chip MT29F64G08AFAAAWP, only the first chip detected
> > > without the patch.
> > >
> > > [    3.764118] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0x68
> > > [    3.770613] nand: Micron MT29F64G08AFAAAWP
> > > [    3.774752] nand: 4096 MiB, SLC, erase size: 1024 KiB, page size: 8192, OOB
> > size: 448
> > > [    3.786421] Bad block table found at page 524160, version 0x01
> > > [    3.792730] Bad block table found at page 524032, version 0x01
> > >
> > > After applying the patch
> > >
> > > [    3.764445] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0x68
> > > [    3.770941] nand: Micron MT29F64G08AFAAAWP
> > > [    3.775080] nand: 4096 MiB, SLC, erase size: 1024 KiB, page size: 8192, OOB
> > size: 448
> > > [    3.784390] nand: 2 chips detected
> > > [    3.790900] Bad block table found at page 524160, version 0x01
> > > [    3.796776] Bad block table found at page 1048448, version 0x01
> > >
> > > Fixes: 3045f8e36963 ("mtd: rawnand: gpmi: move all driver code into
> > > single file")
> > 
> > I don't see how 3045f8e36963 changes his behaviour. Are you sure it worked
> > without this patch?
> 
> After several rounds files merge and code move, it's hard to find when
> this issue first involved, the driver still works for single CS NAND
> but CTRL1 GANGED_RDYBUSY must be set for multi-CS NAND chips.

3045f8e36963 only re-arranges the code without any functional change, so
I strongly doubt that a commit writing a register with a newly
introduced register bit ixes it.

Please drop this "Fixes:" tag.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
