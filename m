Return-Path: <SRS0=HEdT=Q4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 744B0C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 08:39:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42F1420842
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 08:39:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="seI3UeJv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42F1420842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kb/T5bZlvyxXysvQiLzHgQv79Z+YGDy6faOlnQ5BcyI=; b=seI3UeJvZDsyIK
	prTyg0z/WiYcacfa15AK/jG6/DrT/s9NNAyqRTiCg/sHEkaL7cU+PByoDRsYbrjsqK0sYMXbXFz9W
	3hL7/QyZsI4ikzJ/kbP4ZT0+zkae5rhcJtnUIkmNOHfduR3vyjdC7cWTmFW7t5Hy6FtJVWazh2Xdh
	fNGy2IQiYT6JcjBkkTGq0Im/TTjys2nHtAnKNn0s8jhV9xAsUumhoTrQaLIhvAXZIMbQsF/6pdlsR
	oz+tR8oWS+zC+PfGVNBsKOFQII28IaoQxVGU8+Btotm8gePr/nyM10lt9ikfUjA0i5AiWzu9zIz1G
	7XOzJj8f1Eb/Uf4hdswA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwjt1-00032Y-PB; Thu, 21 Feb 2019 08:39:19 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwjsy-000327-NP
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2019 08:39:18 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1gwjsw-00089O-S6; Thu, 21 Feb 2019 09:39:14 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1gwjsw-0003P9-2p; Thu, 21 Feb 2019 09:39:14 +0100
Date: Thu, 21 Feb 2019 09:39:14 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: Prevent Nand page writes on Power failure
Message-ID: <20190221083914.dq4kzyx4t4fgoo46@pengutronix.de>
References: <20190220135820.b2ku2unaxxdqflut@pengutronix.de>
 <CAFLxGvxJ=sRRKMVJHCh6S--NtEjJ7eUXD=VK3a5DXkWqi4Y1fQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFLxGvxJ=sRRKMVJHCh6S--NtEjJ7eUXD=VK3a5DXkWqi4Y1fQ@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:25:51 up 9 days, 15:51, 65 users, load average: 0.34, 0.21, 0.20
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_003916_917770_32F6A0B6 
X-CRM114-Status: GOOD (  25.37  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Feb 21, 2019 at 01:05:04AM +0100, Richard Weinberger wrote:
> On Wed, Feb 20, 2019 at 2:58 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:
> >
> >
> > Hi All,
> >
> > I have hardware here for which the normal way to turn off is just to cut
> > the power. When the powercut happens during a NAND page write then we
> > get more or less completely written pages during next boot. Very rarely
> > it seems to happen that such a half written page with only very few
> > flipped bits is erroneously detected as empty and written again which
> > then results in ECC errors when reading the data.
> >
> > The Nand in question is a Micron MT29F4G08ABADAH4 and in TN2917 Micron
> > clearly states:
> >
> > | Power loss during NAND array operations (especially Program/Erase) is a
> > | violation of the NAND voltage specifications, which is not supported and
> > | should be avoided
> >
> > Micron suggests to make the capacitors on the Nand chips supply input
> > big enough that every started operation will be finished before the
> > power goes down. Now we don't have that situation here, what I have
> > though is a power good status GPIO, so my job is to wire that up to the
> > Nand write operations.
> >
> > Now my question is how could that be done? I assume for some people a
> > power good failure means that we should write all important data away,
> > rather than preventing any Nand access. Given it's a policy decision I
> > assume user space should be involved, right?  An option might be to
> > introcude some sysfs entry to switch mtd devices to readonly mode. Would
> > that be fine? Other suggestions?
> 
> Well, we need to make sure that no new write/erase command is issued and
> the running one can complete. So, in nand_base.c you can (ab)use a lock
> to ensure that.

Nice idea.

> Regarding important data, users that care need to use fsync() anyway, so
> there is no need to trigger whatever writeback upon power failure.
> Or what else important data do you have in mind?

What you want to do on a power failure probably depends on the time
you have left. When you have a second left then you get other ideas than
when you have just a few milliseconds. If you have enough time then you
maybe even want to do an ordered shutdown which would include writing to
the nand.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
