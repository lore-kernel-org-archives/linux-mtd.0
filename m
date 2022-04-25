Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F41C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Apr 2022 08:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/rZjoqIrZTt7HX6CRVbCibWAaN5pokcZsRplihBnvw=; b=O7P/iH35+un7gc
	6bLhsy4ZOmia54ZiJcli53mDBJiqv1AdRSP02zEas0098B5TDAvCbFtgHQzFbkp1Umcho/9tqqN8Y
	xGNfIMCoWg8vikaxKO/aziSUEyvrmbFwkUJ2Pb8dT4OMal+EJI742L1U0RankPuRpRxNNtjMMW1uI
	Q5qA/suSjbrVh6PcABN1bijKd+Wni73pdX4/PuJiIW3lm0SulHV8AQntCwVvTCdxaVxm9HMh3okI2
	qA6hIl2AnbaMgGOgnv3rI2pPI0nkR5UykL+3yF6AcWxr7qS7tRT2qnRjo/w/ekdTLzr+Ry2YrQHYe
	YUVAOZ2sSwvm5mHLuRWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niu75-008kfx-N7; Mon, 25 Apr 2022 08:30:31 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niu6w-008kei-7F
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2022 08:30:30 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B8845240005;
 Mon, 25 Apr 2022 08:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650875418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P/NOD3HQYXnNSYrB/0k1nvGPoHKrLg3AU9uknY9njKs=;
 b=TA5UE9BnBKepmzRzwXMptNSOitLJEVdWmCcuzNPzXX00mcYTAl0cCq7JBTgXQkFtJbDVUh
 M4K7kW432xV5NI/IjC/BKhRx4+QBuYcq5tS0xhfG1vUwnpJ4cnmy74snLGA6BjSTB01HQR
 yCyitR1KAfKXDfNv+N/zYuDbHfwe8L/NnLOhU3z9+5lQF6T6Fz0RquvCKYu5yWpFwGD9RC
 Tn/tMh7Jvf/uh7dpcMGCFiOMGTfoIvvY7UhTFfc0llKo3EeEcDkOP9H09tvq0SnFpXpAQm
 1crpOPlCPg38IHx5FcUIgUii7oMNqF5fzI38i4NHp1rdOtWdD1jsO2sQzD7Z7g==
Date: Mon, 25 Apr 2022 10:30:15 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc: kernel test robot <lkp@intel.com>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "richard@nod.at" <richard@nod.at>, "joern@lazybastard.org"
 <joern@lazybastard.org>, "kbuild-all@lists.01.org"
 <kbuild-all@lists.01.org>, kernel <kernel@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "frowand.list@gmail.com" <frowand.list@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] mtd: phram: Allow cached mappings
Message-ID: <20220425103015.1cc05f77@xps13>
In-Reply-To: <20220425102816.54619c66@xps13>
References: <20220412135302.1682890-5-vincent.whitchurch@axis.com>
 <202204131446.omJ5mC54-lkp@intel.com>
 <20220414090402.GA11067@axis.com> <20220425102816.54619c66@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_013023_893930_6E3F4E7C 
X-CRM114-Status: GOOD (  20.31  )
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


miquel.raynal@bootlin.com wrote on Mon, 25 Apr 2022 10:28:16 +0200:

> Hi Vincent,
> 
> vincent.whitchurch@axis.com wrote on Thu, 14 Apr 2022 11:04:02 +0200:
> 
> > On Wed, Apr 13, 2022 at 08:45:59AM +0200, kernel test robot wrote:  
> > > All errors (new ones prefixed by >>):
> > > 
> > >    In file included from include/linux/io.h:13,
> > >                     from drivers/mtd/devices/phram.c:21:
> > >    drivers/mtd/devices/phram.c: In function 'register_device':    
> > > >> arch/sh/include/asm/io.h:274:33: error: expected expression before 'do'    
> > >      274 | #define iounmap(addr)           do { } while (0)
> > >          |                                 ^~
> > >    drivers/mtd/devices/phram.c:150:44: note: in expansion of macro 'iounmap'
> > >      150 |         cached ? memunmap(new->mtd.priv) : iounmap(new->mtd.priv);
> > >          |                                            ^~~~~~~
> > >    drivers/mtd/devices/phram.c: In function 'phram_remove':    
> > > >> arch/sh/include/asm/io.h:274:33: error: expected expression before 'do'    
> > >      274 | #define iounmap(addr)           do { } while (0)
> > >          |                                 ^~
> > >    drivers/mtd/devices/phram.c:372:53: note: in expansion of macro 'iounmap'
> > >      372 |         phram->cached ? memunmap(phram->mtd.priv) : iounmap(phram->mtd.priv);
> > >          |                                                     ^~~~~~~
> > > 
> > > 
> > > vim +/do +274 arch/sh/include/asm/io.h
> > > 
> > > d57d64080ddc0f Paul Mundt        2010-01-19  272  
> > > 13f1fc870dd747 Christoph Hellwig 2020-07-14  273  #else /* CONFIG_MMU */
> > > 13f1fc870dd747 Christoph Hellwig 2020-07-14 @274  #define iounmap(addr)		do { } while (0)
> > > 13f1fc870dd747 Christoph Hellwig 2020-07-14  275  #define ioremap(offset, size)	((void __iomem *)(unsigned long)(offset))
> > > 13f1fc870dd747 Christoph Hellwig 2020-07-14  276  #endif /* CONFIG_MMU */
> > > d627a2ebd1a303 Paul Mundt        2010-01-28  277      
> > 
> > Thank you for the report.  This patch could certainly be changed to work
> > around this, but ISTM that the right fix is in the SH header file, since
> > the problem could hit in other cases too.  I've posted a fix here now:
> > 
> >  https://lore.kernel.org/lkml/20220414081257.1487499-1-vincent.whitchurch@axis.com/  
> 
> Looks good to me but I don't want to be the one "carrying" new compile
> errors so I'll drop the series for now, until you get this patch
> applied. Please then just resend the series with this thread mentioned
> and I'll take it back.

BTW, I'm only talking about this improvement, patches 1-3 will remain.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
