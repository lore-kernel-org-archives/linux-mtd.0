Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED27C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 01:16:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DD7A20828
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 01:16:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r36iN3ak"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DD7A20828
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=iki.fi
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AHWNcZOUXES+MQCqMIHMmkDeSj6lcwIzA0WX1xmK6Bs=; b=r36iN3akztvKx7
	x3FU0tAUfL13X3i+1F8AbSUgSTHubU4zAxw5DaO8UyLxesuDzUwx39gl5Cr1vnKRvd6Hw9PskEbOz
	NnQKNYBtyXNF5+SMoau+Vgsp3msmq+rhSPnKD1KGlhXAKg9Cg4wzNCZ0ZfER1EmudrsycQl7yeCNs
	vuu2tENcsWJTFAoU+GGpjVQg2MUXFdZvmZVZ8MLO2AQkDOfNXBPiNqDBYDy71TxouGESlNnEt6cxN
	YejbqWSsdPMeoL8f8OJnZ+Bm+lcn22w4PDA175Wea1k8YfMGmbAfR9whLHZ8lG5z1uriLF2/1ZaUG
	S//4b2ZvI4I7LEXW1hVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6Pqc-0002BM-Un; Wed, 20 Mar 2019 01:16:50 +0000
Received: from emh02.mail.saunalahti.fi ([62.142.5.108])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6PqM-0001p6-1L; Wed, 20 Mar 2019 01:16:37 +0000
Received: from darkstar.musicnaut.iki.fi (85-76-21-58-nat.elisa-mobile.fi
 [85.76.21.58])
 by emh02.mail.saunalahti.fi (Postfix) with ESMTP id 976642001D;
 Wed, 20 Mar 2019 03:16:30 +0200 (EET)
Date: Wed, 20 Mar 2019 03:16:30 +0200
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: ams-delta: Drop board specific partition
 info
Message-ID: <20190320011630.GB7872@darkstar.musicnaut.iki.fi>
References: <20190319223718.26131-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190319223718.26131-1-jmkrzyszt@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_181634_892201_AB7FD9AB 
X-CRM114-Status: GOOD (  12.00  )
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

On Tue, Mar 19, 2019 at 11:37:18PM +0100, Janusz Krzysztofik wrote:
> After recent modifications, only a hardcoded partition info makes
> the driver device specific.  Other than that, the driver uses GPIO
> exclusively and can be used on any hardware.
> 
> Drop the partition info and use MTD partition parser with default
> list of partition types instead.
> 
> Amstrad Delta users should append the followig partition info to their
                                        ^^^^^^^^
Should be "following".

> kernel command line, possibly by embedding it in CONFIG_CMDLINE:
> mtdparts=ams-delta-nand:3584k(Kernel),256k(u-boot),256k(u-boot_params),\
> 256k(Amstrad_LDR),27m(File_system),768k(PBL_reserved).  For their
> convenience, select CONFIG_MTD_CMDLINE_PARTS  symbol from that board
> Kconfig automatically if this NAND driver is also selected.
> 
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> Cc: Tony Lindgren <tony@atomide.com>

Could we move the fixed partition setup to the board file
instead? Otherwise this kind of change is not really nice for the users,
as it will likely break existing setups. The default partition layout
should remain the same.

A.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
