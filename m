Return-Path: <SRS0=mO4J=UQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5030CC46477
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2019 12:13:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D18A20861
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2019 12:13:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LIe9PHy7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D18A20861
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vbam25OzOFsWWTomz6ca4+9dAOMklZV6xlqPjvnMR/k=; b=LIe9PHy7qOhjrw
	do2uV4JXnnf734VhhjyYheuFx6RgyuT6fp1qVkipIhdXqT5CQ09JkENVFqd3/+voT391RLYWI4suR
	C35nuI3HsfFvYfjEMzUF6TOOKckfKzHuhcEleksI0iFd3Mz5cYumbToaIELbaY5iZkoFRdjyVyk8O
	L+v3ADrICPoCVH/UJuHbMXnZKyvQbe4nmW5+ypGzIf/ny62GGzfLfnygn/aN8t2ObgpqVu2bYb8p0
	Ev6lQAE4qCyS5BMe2ykp4+K0A9CCGdahPPepDLqE78Q1HaZ39X3BUsVG+N4N0TAZNDW7X3WbWHSRd
	dCYYfMZvIbiti434rZTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hcqVc-0008DE-BT; Mon, 17 Jun 2019 12:13:12 +0000
Received: from mail-qt1-f194.google.com ([209.85.160.194])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcqVZ-00085u-KG
 for linux-mtd@lists.infradead.org; Mon, 17 Jun 2019 12:13:10 +0000
Received: by mail-qt1-f194.google.com with SMTP id m29so10369786qtu.1
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2019 05:13:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PjXXRz5jYVZd3qCDenzBwlj9PiRYwfU0XHUt+TN6Glw=;
 b=b/WV40lv6TSXi3ImSpq7yBNFsC57uCZJfX9Zq5Oaiw+54R6dWF/DVu8EPu62JknmZU
 bTO1E1ysOcXPe3+G1+DJMIideAg8urSw0/OovndauBqXPFd049n1stQ5H/8IWCAYxwVh
 IVfkQbtRYRvH4ocAxTdNxBIwhhCKGtyoDoDgqqep8fUykf2Pyq2RIsMrFYElonAw4WWJ
 xf3icWALiO5JnWOxWavHHzZ6sC7TEaMpJLauyRa3Ev1X/aHUdoO/0bSTplGeKRNMf32E
 JHvcPgIwQ57TJY5YobprFgVRanGbQCvZrHpxTxB4PtAtdBTcKk/texLuHeRvueLG/I0L
 mFbg==
X-Gm-Message-State: APjAAAXk26U9SRgTx7B6SiubAP2qd8dFLd5qKTEEUATQWSHq5Bk77vHv
 KVZGHU5ldDAIv/BRDANykRAvedFhbo4zdl/Nu8D+s16gfwM=
X-Google-Smtp-Source: APXvYqxndSVnNHlL+RyfC6xL5ZB+R7JYlnaPpJzde64TsayAdYnpDAGSwR/DHJMRVgWmalLzoXslfJHDmsbKAGqFZsQ=
X-Received: by 2002:ac8:8dd:: with SMTP id y29mr28170568qth.304.1560773586412; 
 Mon, 17 Jun 2019 05:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190617111110.2103786-1-arnd@arndb.de>
 <1560770644.1774.0@crapouillou.net>
In-Reply-To: <1560770644.1774.0@crapouillou.net>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 17 Jun 2019 14:12:48 +0200
Message-ID: <CAK8P3a28NrvLP1nE7TQUCqwYXVwrSnVUJoH0yTSqRpz93f4g2Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: ingenic: fix ingenic_ecc dependency
To: Paul Cercueil <paul@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190617_051309_669590_444C7007 
X-CRM114-Status: GOOD (  13.32  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jun 17, 2019 at 1:24 PM Paul Cercueil <paul@crapouillou.net> wrote:

> I think there's a better way to fix it, only in Kconfig.
>
> * Add a bool symbol MTD_NAND_INGENIC_USE_HW_ECC
> * Have the three ECC/BCH drivers select this symbol instead of
>   MTD_NAND_INGENIC_ECC
> * Add the following to the MTD_NAND_JZ4780 config option:
>   "select MTD_NAND_INGENIC_ECC if MTD_NAND_INGENIC_USE_HW_ECC"

I don't see much difference to my approach here, but if you want
to submit that version with 'Reported-by: Arnd Bergmann <arnd@arndb.de>',
please do so.

Yet another option would be to use Makefile code to link both
files into one module, and remove the EXPORT_SYMBOL statements:

obj-$(CONFIG_MTD_NAND_JZ4780) += jz4780_nand.o
jz4780_nand-y += ingenic_nand.o
jz4780_nand-$(CONFIG_MTD_NAND_INGENIC_ECC) += ingenic_ecc.o

        Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
