Return-Path: <SRS0=BNsP=OR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4978EC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 20:32:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB2C760EFD
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 20:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB2C760EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A2m6gJLXEfa6Wk8korsGPFoRl6Az/HVwcvRPq5AQ98w=; b=HbPnio7rI/os2X
	lJVfRzsmIVm2Un8IdtuiVXWFgMSpochxgfPKeNhqOlwg2TXrZlc2vOlOtGD0Dj9poUaNIINCQ/OEL
	HMbTd0NN3CJ2JMKc1Dzm/iyKvZykYl9zJsvqK9+UBp3TNtEaR6+B59LphkbptsnG6FddcHcA590lc
	EpI2aLok0xWJgsw9/jajPw3vFAjHbkdvHE8nOm9EkAZ3buUYGbdSyjtW8ULrYQm4cbKPSb2qnJegJ
	RlcgAAmf6S9cmE8ZC5LrDEmARCDcRPLoOg+0pWKD0uKmIJWg3izvteesUk2/UIQLoFnDFdIiyexHB
	HyYykjl91tGm0I+in1NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUxHS-004BlR-Tn; Mon, 27 Sep 2021 20:31:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUxHQ-004BkY-8s
 for linux-mtd@lists.infradead.org; Mon, 27 Sep 2021 20:31:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC4D6611F2
 for <linux-mtd@lists.infradead.org>; Mon, 27 Sep 2021 20:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632774676;
 bh=L1CRUWVlmuXisCoG0P/PRUVv8Zv/AQDpFetJ+yUiP+M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GdgGpB8McsrR6PTJGr3iJhqVS0vMyody9yYkHKmjyOCsavnE/gX8HHRD1lM9BPyuo
 frcWtitLGTQLQKe/er6BjKDdWawqHBjxT3yDDzavvfpkSduH7MVFCG1+fRWWXlEmDD
 KZAyQYqajnRK1lxYeDDvt8FCMA8+CyUtC5qnfoqiS4JOJihjXLRg8J0cBOY0CBP1iD
 PUpCfcXjdNHQoin4eLQBcXM16O2hdXG6jTl9Ujz4iC5Ac1I03P8HOWPQpEgLYrclwf
 1jzND5A2wmJkXcKYss+TYPGQD7xKFfCyAuID4eMT04/Bp67bkc6B9mTxZHf6O4Er1t
 J6nskrcMXcHYA==
Received: by mail-wr1-f42.google.com with SMTP id t18so54129944wrb.0
 for <linux-mtd@lists.infradead.org>; Mon, 27 Sep 2021 13:31:15 -0700 (PDT)
X-Gm-Message-State: AOAM531Y0bFgrJQm7gQ8Wf/t+8mBgWJbFGZwRCm+1/cb9jEn/RcYnDEq
 192JTtwFXhHoX9jKgqP8//8AQe9K45Z0o62PROE=
X-Google-Smtp-Source: ABdhPJwnVTd7oCfk8RB3I87RyL/yPZtwURjxHiKZ57qC0Pl8TeHZ0JDkOYJEO2cMud9+QfVlpEoLFcTyL2ty41RPnJE=
X-Received: by 2002:a5d:4b50:: with SMTP id w16mr2143934wrs.71.1632774674466; 
 Mon, 27 Sep 2021 13:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210927141045.1597593-1-arnd@kernel.org>
 <20210927183328.2f200fc2@xps13>
In-Reply-To: <20210927183328.2f200fc2@xps13>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 27 Sep 2021 22:30:58 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0WnM7_6o0FE3=iY+0J1-qU5gCGH6qWCfLygGTkH0TA+w@mail.gmail.com>
Message-ID: <CAK8P3a0WnM7_6o0FE3=iY+0J1-qU5gCGH6qWCfLygGTkH0TA+w@mail.gmail.com>
Subject: Re: [PATCH] [RFC] mtd: fixup CFI on ixp4xx
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Arnd Bergmann <arnd@arndb.de>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_133116_350955_7FBB05FF 
X-CRM114-Status: GOOD (  17.79  )
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

On Mon, Sep 27, 2021 at 6:33 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Arnd,
>
> arnd@kernel.org wrote on Mon, 27 Sep 2021 16:10:37 +0200:
>
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > drivers/mtd/maps/ixp4xx.c requires MTD_CFI_BE_BYTE_SWAP to be set
> > in order to compile.
> >
> > drivers/mtd/maps/ixp4xx.c:57:4: error: #error CONFIG_MTD_CFI_BE_BYTE_SWAP required
> >
> > This patch avoids the #error output by enforcing the policy in
> > Kconfig. Not sure if this is the right approach, but it helps doing
> > randconfig builds.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> > Any other ideas for how to address it?
>
> I am fine with the approach. Should I wait for someone else's Ack?

Maybe wait a few days to see if there are objections or any better
ideas then. I'd certainly be happy to never run into this problem again.

         Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
