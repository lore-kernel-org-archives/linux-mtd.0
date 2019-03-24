Return-Path: <SRS0=La3s=R3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40B8C43381
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Mar 2019 18:59:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 863E62133F
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Mar 2019 18:59:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ca+wRYR2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 863E62133F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=iki.fi
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yFFx3xf/HtzFDPSFtQ8Im53UexRsWjL8YPvDLw9SjTo=; b=ca+wRYR2BcCdiA
	ttQrlxp4I/4TNeQZj+YcsXvewlZ/B+XLIUcG+yB2rFiJ7f6vrP0J7+9WLCnd/vZkjuiX8c6m3NwKj
	LObjhTdYZ0myrtlaVI7Ru3qhBYtNuPcx7NPiM52FkEnDuyihMJtkMa9JarNIA0Uhl2y3nKFu41P8x
	CRYbifrITm2I8lmmTWN6ApTk3ZekkYyMdDM78csAvKGZ4k2J5d90AHiS8Ee2s6YlJhNeEVe2Uoewd
	Be6/Fx6HzNFLXy2d1zT645qXQjw99oJKuRldIJZSVKhaesaxzgB1D4ZI55NRNZMtTObUpLx9UOjNO
	sckUN/dImZqr1TL3C79A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h88LW-0000Ll-3v; Sun, 24 Mar 2019 18:59:50 +0000
Received: from emh06.mail.saunalahti.fi ([62.142.5.116])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h88LO-0000HS-1d; Sun, 24 Mar 2019 18:59:44 +0000
Received: from darkstar.musicnaut.iki.fi (85-76-115-194-nat.elisa-mobile.fi
 [85.76.115.194])
 by emh06.mail.saunalahti.fi (Postfix) with ESMTP id AFB6930034;
 Sun, 24 Mar 2019 20:59:32 +0200 (EET)
Date: Sun, 24 Mar 2019 20:59:32 +0200
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: ams-delta: Drop board specific partition
 info
Message-ID: <20190324185932.GA24594@darkstar.musicnaut.iki.fi>
References: <20190319223718.26131-1-jmkrzyszt@gmail.com>
 <20190320011630.GB7872@darkstar.musicnaut.iki.fi>
 <2631901.52Nzq63B5o@z50>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2631901.52Nzq63B5o@z50>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_115942_267102_1A8A1DE4 
X-CRM114-Status: GOOD (  19.89  )
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
Cc: linux-omap@vger.kernel.org, Boris Brezillon <bbrezillon@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On Sun, Mar 24, 2019 at 05:48:22PM +0100, Janusz Krzysztofik wrote:
> Hi Aaro,
> 
> Thanks for your review.
> 
> On Wednesday, March 20, 2019 2:16:30 AM CET Aaro Koskinen wrote:
> > On Tue, Mar 19, 2019 at 11:37:18PM +0100, Janusz Krzysztofik wrote:
> > > After recent modifications, only a hardcoded partition info makes
> > > the driver device specific.  Other than that, the driver uses GPIO
> > > exclusively and can be used on any hardware.
> > > 
> > > Drop the partition info and use MTD partition parser with default
> > > list of partition types instead.
> > > 
> > > Amstrad Delta users should append the followig partition info to their
> >                                         ^^^^^^^^
> > Should be "following".
> > 
> > > kernel command line, possibly by embedding it in CONFIG_CMDLINE:
> > > mtdparts=ams-delta-nand:3584k(Kernel),256k(u-boot),256k(u-boot_params),\
> > > 256k(Amstrad_LDR),27m(File_system),768k(PBL_reserved).  For their
> > > convenience, select CONFIG_MTD_CMDLINE_PARTS  symbol from that board
> > > Kconfig automatically if this NAND driver is also selected.
> > > 
> > > Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> > > Cc: Tony Lindgren <tony@atomide.com>
> > 
> > Could we move the fixed partition setup to the board file
> > instead? Otherwise this kind of change is not really nice for the users,
> > as it will likely break existing setups. The default partition layout
> > should remain the same.
> 
> I'm wondering if it would be acceptable to pass partition info from a .dts 
> file.  I think that would be a better, more modern approach than adding a new 
> header under include/linux/platform_data.

Hmm, I thought there was some generic way to define partitions without
adding any new headers. But if that is not possible, then I guess your
CMDLINE proposal is the preferred one..

A.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
