Return-Path: <SRS0=La3s=R3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC73C43381
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Mar 2019 20:30:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 897952147A
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Mar 2019 20:30:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UJF92vyQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HaU42Vql"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 897952147A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iKpt+2NYJ5OYvBLWE0QHLKX22qJ5uU63gaJzizjJGvU=; b=UJF92vyQIj/xsk
	pc9b3j1PmO2gCS9rXujQWU+LN4FbnHwYTGEI81qNgE+37MgQU0fM3nuApz7I2KhA+t6spk1BcqJLU
	FKSJV2JaXwFFvZs941h8pKaxLcFunOcOZ5Krs9UM3uurX0eRIOj9oiGgUozHOOqLAPhnwx/uYXvVI
	T/kNI0qMhJBXnMqHpznt2prPSMgVGRg3+s79VGsdp7QO2RbBWHQ8glh7x+DEMNaTb8CsP8yIHaMie
	7yCDtLgS2ws184fi6ii/EZbCQWzU2IsXdRxYUHtKHpSnHsFfu/1R/KNWOgACi5nXwuJyBqepMwiDR
	N6ptKYOnHu4GwePZV8AQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h89lN-0002Is-S1; Sun, 24 Mar 2019 20:30:37 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h89lK-0002Er-8q; Sun, 24 Mar 2019 20:30:35 +0000
Received: by mail-lj1-x241.google.com with SMTP id k8so5996341lja.8;
 Sun, 24 Mar 2019 13:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yuxIPFWyE6vKHz01aXS2PGrmp+xsZqZ4aZTXdnRi6Uk=;
 b=HaU42VqlUOlSwuhvlTXdTLIxnvh0CsNtUP5Nw77sA+Pz9ZDLABbFbi24wlJ1KrjFvz
 uexq6mmWcacHpYyMbP65IBBnc0EBgIK4z1JKVdWFor8y4/zAmF6JGxuE/Z4pZW9luffA
 eouVQftzT0U39iPCiBNyBlgGSIisPfxO1BFyZyRtWSX6VRDdIqs/k+7NAcqGpkbpqbKs
 BK6I8KiMx4/VUS8vAKr8I5q3DiX1EYcD2zNtzpJR/zKBK4XxZZersIaI5CyNRTwUELE6
 u3kZy7f3X/EMYffy51uqOmfvSwCblkRqrtrc0BAK9a7H+SYanSXlL9sdHmM9qSpGUsE0
 SpDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yuxIPFWyE6vKHz01aXS2PGrmp+xsZqZ4aZTXdnRi6Uk=;
 b=jpBPNWiFPspy6D3R+c7siy0PfdLlH4m/6I58W72ViT9JAu6RfQR80A25cYXjvMGgyt
 DqxMvtkP1h9tJTP3AAmuuIjBy3QYHMhUAcP1M4L4jeZSYzZ/Peihjf7uckgjmA3OUlLb
 ow3ttaq2h1LvqYcO68/sK0OWW6im7xYGJ0dipHb/A6ROh0q8Ho9/uQF433aB4gcwh8sR
 a8tq3HkQqY/XC9vma2a/lAhPrbbTOqoRGfUvc99xktZBMnuQm8dnosAhLK2FK2GjpkW7
 kslqciSDAD2/obAkgn1dRnNDdpiFi0n/OyTqouRSxlSO3qsg3ENKMycKkDzCJLg3taJj
 ie4A==
X-Gm-Message-State: APjAAAWH5NHBenUt7x5JpK1GuMKwhYrtRVDnTIAFTgEwh1S2bK1EsrCv
 4Hjm5nVFNPKKUXzI4b7iHMTE2Vi/
X-Google-Smtp-Source: APXvYqyTsSGl12g7kVwQ79IOlx4bJuNI03+SseUOE8CDJ8voRbffyOzLpqQbLklLey2sfN1e3uYgDg==
X-Received: by 2002:a2e:934a:: with SMTP id m10mr10985041ljh.164.1553459431459; 
 Sun, 24 Mar 2019 13:30:31 -0700 (PDT)
Received: from z50.localnet (109241207190.gdansk.vectranet.pl.
 [109.241.207.190])
 by smtp.gmail.com with ESMTPSA id h14sm3029220ljg.10.2019.03.24.13.30.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 Mar 2019 13:30:30 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH] mtd: rawnand: ams-delta: Drop board specific partition
 info
Date: Sun, 24 Mar 2019 21:30:28 +0100
Message-ID: <3239616.xjhv0hSXo4@z50>
In-Reply-To: <20190324185932.GA24594@darkstar.musicnaut.iki.fi>
References: <20190319223718.26131-1-jmkrzyszt@gmail.com>
 <2631901.52Nzq63B5o@z50> <20190324185932.GA24594@darkstar.musicnaut.iki.fi>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_133034_361321_E8FE4EA8 
X-CRM114-Status: GOOD (  25.44  )
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

On Sunday, March 24, 2019 7:59:32 PM CET Aaro Koskinen wrote:
> Hi,
> 
> On Sun, Mar 24, 2019 at 05:48:22PM +0100, Janusz Krzysztofik wrote:
> > Hi Aaro,
> > 
> > Thanks for your review.
> > 
> > On Wednesday, March 20, 2019 2:16:30 AM CET Aaro Koskinen wrote:
> > > On Tue, Mar 19, 2019 at 11:37:18PM +0100, Janusz Krzysztofik wrote:
> > > > After recent modifications, only a hardcoded partition info makes
> > > > the driver device specific.  Other than that, the driver uses GPIO
> > > > exclusively and can be used on any hardware.
> > > > 
> > > > Drop the partition info and use MTD partition parser with default
> > > > list of partition types instead.
> > > > 
> > > > Amstrad Delta users should append the followig partition info to their
> > >                                         ^^^^^^^^
> > > Should be "following".
> > > 
> > > > kernel command line, possibly by embedding it in CONFIG_CMDLINE:
> > > > mtdparts=ams-delta-nand:3584k(Kernel),256k(u-boot),256k(u-
boot_params),\
> > > > 256k(Amstrad_LDR),27m(File_system),768k(PBL_reserved).  For their
> > > > convenience, select CONFIG_MTD_CMDLINE_PARTS  symbol from that board
> > > > Kconfig automatically if this NAND driver is also selected.
> > > > 
> > > > Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> > > > Cc: Tony Lindgren <tony@atomide.com>
> > > 
> > > Could we move the fixed partition setup to the board file
> > > instead? Otherwise this kind of change is not really nice for the users,
> > > as it will likely break existing setups. The default partition layout
> > > should remain the same.
> > 
> > I'm wondering if it would be acceptable to pass partition info from a .dts 
> > file.  I think that would be a better, more modern approach than adding a 
new 
> > header under include/linux/platform_data.
> 
> Hmm, I thought there was some generic way to define partitions without
> adding any new headers. But if that is not possible, then I guess your
> CMDLINE proposal is the preferred one..

I could for example reuse (or abuse) struct gpio_nand_platdata defined in 
include/linux/mtd/nand-gpio.h for use with drivers/mtd/nand/raw/gpio.c, but 
I'm not sure if hi-jacking a header that belongs to another driver would be an 
elegant solution.

Thanks,
Janusz


> 
> A.
> 





______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
