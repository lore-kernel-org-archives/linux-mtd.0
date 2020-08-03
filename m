Return-Path: <SRS0=IhQK=BN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E51F6C433DF
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 09:07:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD7612068F
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 09:07:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v+jE5CvO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD7612068F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Zom6E4guNgbGwnNovyKwHCGaFf8uEAckBFUlrMzVEP8=; b=v+jE5CvOu4ufgpnXnbliRiAGM
	+Kh7oyh6o9btlXNmWeIqPZ9SA+rSBWQZ3YLa6BJw3/rAAE6VuewHdvS2vxH9O60+/FNZd8aV9PX1I
	N8PiDNJbisxdUa8IKyMDM6GxdsqKwzeKGbVgww9EXgIJaj2YQov+2ZLgTmxeMZSS6tlDT6U/p3tpo
	rSEUvxQ/jJPh/MT454aZ5xAaPZf8Pk7OW6tJVYbjfwZrsbTe8299vGfVVN/5l+Q04II+ab+LAC5zl
	hEQWmGO6DFa/cVDgFmC78ofWpXt8F2ApxJpHy8k6bA7/Stggny9unLtx8BEEqPBV3yPxU1eilvF+D
	x6/uhzUZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2WQW-0005Js-S7; Mon, 03 Aug 2020 09:06:36 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2WQU-0005I1-6v
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2020 09:06:35 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1k2WQN-0000AK-Lx; Mon, 03 Aug 2020 11:06:27 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <mfe@pengutronix.de>)
 id 1k2WQM-0001l2-TA; Mon, 03 Aug 2020 11:06:26 +0200
Date: Mon, 3 Aug 2020 11:06:26 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: Invalid ONFI PARAM PAGE
Message-ID: <20200803090626.xwbxnlynun6nmnh7@pengutronix.de>
References: <20200730121425.rjeo6qh4fxisargl@pengutronix.de>
 <20200803104727.1edf834e@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200803104727.1edf834e@xps13>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:57:35 up 262 days, 16 min, 247 users, load average: 0.19, 0.15, 
 0.09
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_050634_299696_200D1C00 
X-CRM114-Status: GOOD (  25.39  )
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
Cc: bbrezillon@kernel.org, linux-mtd@lists.infradead.org,
 peterpandong@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

thanks for your response :)

On 20-08-03 10:47, Miquel Raynal wrote:
> Hi Marco,
> 
> Marco Felsch <m.felsch@pengutronix.de> wrote on Thu, 30 Jul 2020
> 14:14:25 +0200:
> 
> > Hi,
> > 
> > a customer of us uses micron nand flash devices for their local storage.
> > They are now having some troubles with a few devices. Let me start with
> > the following:
> >   1) We can successfully read the nand id field by:
> >      -> select_chip
> >      -> cmdfunc(mtd, NAND_CMD_RESET)
> >      -> cmdfunc(mtd, NAND_CMD_READID) Addr=0x00
> >      -> 8times: read_byte(mtd)  
> > 
> >      The NAND device response with the following:
> >      nand: id_data[0]: 0x2c
> >      nand: id_data[1]: 0xdc
> >      nand: id_data[2]: 0x90
> >      nand: id_data[3]: 0x95
> >      nand: id_data[4]: 0x56
> >      nand: id_data[5]: 0x0
> >      nand: id_data[6]: 0x0
> >      nand: id_data[7]: 0x0
> > 
> >      Accroding the schematic and the datasheet this is right.
> > 
> >   2) To detect the ONFI compatibility we now issue:
> >      -> cmdfunc(mtd, NAND_CMD_READID) Addr=0x20  
> > 
> >      and getting the expected 'O','N','F','I' signature.
> > 
> >    3) Now we are trying to Read the PARAM Page by:
> >       -> cmdfunc(mtd, NAND_CMD_PARAM)
> >       -> try to read the the param page and if not successful try to  
> >          read the copies.
> > 
> >       Here things getting crazy since we are reading all the time '0xff'.
> > 
> >    4) Since Barebox (Bootloader) can't read the ONFI param page we
> >       calculate the values as expected from the param page. But now we
> >       can't access BBT (not found) nor we are not able to write to the
> >       OOB Area (the chip is not write protected).
> > 
> > The electrical signals are looking good and since we can retrieve the
> > id-data it should be no PCB bug. Did anyone struggled with such problems
> > too?
> > 
> > BTW:
> > I also get '0xff' if I send a READ_UNIQUE_ID command and trying to read
> > the 16 copies of the 32byte unique-id.
> > 
> > Any answers are welcome :)
> 
> Could you share more details about the situation your customer is
> facing? Did this work before? Is this an update? If yes from what
> version to what version? Also, is this a Linux or Barebox issue?

This issue get's triggered right after the first start-up. Some devices
do work and some of them don't after the production. I think it's not a
Linux nor a Barebox issue. Since Barebox can't find the BBT and all
other stuff I skipped propper Linux tests. I will test if Linux can
identify and setup the chip. But I think Linux will setp into the same
NAND-Issues.

I asked on this ML since you guys are the Experts here and maybe you had
see a 'not full prefactored' NAND device too.

Regards,
  Marco

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
