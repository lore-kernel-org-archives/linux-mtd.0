Return-Path: <SRS0=FSZL=DT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F3A8C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 07:04:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0A4F2076E
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 07:04:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wgGo9cfj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0A4F2076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zEOJfuooMu2PrGhakgRXf8pXODbFfGq30NSSjw2mbCA=; b=wgGo9cfjE5zP6AIlGo2ug3Tgh
	/HALqpXFEkfCnCbjHv1VK3beZ0U85z6QmibntBN32cwb25E/EGUPh1hm+t/jUwJ9MEqSZ6qQwKFIK
	EPrCxRAUoCnLOqbvcSL+FEfsnXP1LqLUyZ+FI8z4jvNJ25VgjSc8vlbLi36PidjPL+sTaHtMjriQV
	FunA1MaUzR/WT+hvKRe1NFPvpYJs0fqeSnzB4aZMlNAPFM2q3m7C0ILn4vdzYmD2YGjsuoiyxbsEz
	vGSkWipQPArVbrLcn/mM/O66ihQ41MBmIOJbKKN9pdLiBZ/JAOEk2RsawBa0K516C4Jkht+XCmAjA
	h0gu284DA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRrsi-0001jF-K7; Mon, 12 Oct 2020 07:04:28 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRrsf-0001iC-Ns
 for linux-mtd@lists.infradead.org; Mon, 12 Oct 2020 07:04:27 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id B13F6E000A;
 Mon, 12 Oct 2020 07:04:21 +0000 (UTC)
Date: Mon, 12 Oct 2020 09:04:20 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] mtd: parsers: bcm63xx: Do not make it modular
Message-ID: <20201012090420.6a07599c@xps13>
In-Reply-To: <20201011141447.GA9215@roeck-us.net>
References: <20200928161617.2a1b2244@xps13>
 <20200929172726.30469-1-f.fainelli@gmail.com>
 <20201011141447.GA9215@roeck-us.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_030426_169120_72726F16 
X-CRM114-Status: GOOD (  16.66  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>,
 linux-mtd@lists.infradead.org, Jonas Gorski <jonas.gorski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Guenter,

Guenter Roeck <linux@roeck-us.net> wrote on Sun, 11 Oct 2020 07:14:47
-0700:

> On Tue, Sep 29, 2020 at 10:27:21AM -0700, Florian Fainelli wrote:
> > With commit 91e81150d388 ("mtd: parsers: bcm63xx: simplify CFE
> > detection"), we generate a reference to fw_arg3 which is the fourth
> > firmware/command line argument on MIPS platforms. That symbol is not
> > exported and would cause a linking failure.
> > 
> > The parser is typically necessary to boot a BCM63xx-based system anyway
> > so having it be part of the kernel image makes sense, therefore make it
> > 'bool' instead of 'tristate'.
> > 
> > Fixes: 91e81150d388 ("mtd: parsers: bcm63xx: simplify CFE detection")
> > Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>  
> 
> What happened with this patch ? The build failure is still seen in mainline
> and in next-20201009.

It has been applied on mtd/next:
https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/log/?h=mtd/next
(I don't remember when though)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
