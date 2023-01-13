Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A6BC54EBE
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 10:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sch7D69bQhUTaLdwrx8CAt+ysLdsIltVXRCr2gimEkU=; b=S7h5maGl4HKQnL
	0iZLBavP29FGFQ+0FtQEH1EodgzuIUrS91JnN3LHP9olvvV2clgost0QQpgnvWmalJKfTFrSsgqXE
	5N/EPocqv2MO8tU2r5CyyBXZJc8ySTXEJIEmcQeAwPnPHBg2fekdh4tLb1TNJ1R0LvsIH+kpqvQQ7
	1xZ6yKm1qDhNOEy/uzWn/QeP/rwyk/Rl4Eaenkb7jaDy2DqKPtgYpL7gf1U5y7NQuinsir///TQu/
	T8uiP/FVraCD4LKdfA+kqarErdj4deiPrSasoKienWdE9HHKrL59RG4ems5zYDbDNCl1WdpSZVbrG
	e0XieDSUn+wpJW28DJRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGGxn-001g8c-0X; Fri, 13 Jan 2023 10:07:07 +0000
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGGxi-001g4C-5d
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2023 10:07:03 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id 59F1E2B066ED;
	Fri, 13 Jan 2023 05:06:53 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 13 Jan 2023 05:06:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1673604412; x=1673611612; bh=wiGd1poFqy
	c19NDgfhWxoziS+5a2ezYepeVzBSacqw8=; b=jQa0HDmPBmL/FfJL+hgRmPsB40
	Y3mC3xChdI36TABN4RG5b4ucaLsZc6+hC+19/zCIm4A4ie1QOoF7GdEwpLDXWLgg
	YS7KkbMyef4z8Yilol0xjO/jcY2PDSzSOyaObnKUz9YejiKar9NRQ/48gMheN8SP
	L9ydOdhClMFMN+laVtMxeJLlISQdpKBcfrhR3HNQLngArqhNZXfmj7B7QaV3Yjlc
	q1pbz3p93X/orY60g/G7bg2Tiz9gOW8CeW5RhiSUeYXFN/oIPHXLd05ewSyQoczy
	YcvZ76uBqZ6njLqUwdbbXb3on9pD3cxdKgfVZ0av7GSfMv1N46xG/nNSra4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1673604412; x=1673611612; bh=wiGd1poFqyc19NDgfhWxoziS+5a2
	ezYepeVzBSacqw8=; b=T9tKOcHloTqEvCQgyITgoeWHiCG023yZCoHB8GCNjjun
	JWtWHvJqinTMKxNzOHfWFkde1UNzFYeNjWL4OYuUevGP5ZiDtpX0SAgeRoVmsRqT
	4s4imE9aYV/f9Pvbl/xyCzDnDswOyuD8ceeVeSEppPmXeTdO2UYN2NW+SPkjkx6z
	7AGNecW4IwYIR8h6khoClacES7xN1wBX6oY0XpQ9E/MHHJqDRpFMe5RHSjqUpFHQ
	972R/sDnO/VHBlJ/MZtdHhD4RBw3rwTM6MhJr5iT0G2mUNkzC1EVZ0kt797d6W2S
	fBdJ8aBi3uu6VLi/i8mbcHwOUByNIvAxQvGBru7fCg==
X-ME-Sender: <xms:Oy3BY2x8u8jGs5oav_hETNuy2fGaBGNB7nGV00CwtVI39ajIhtTDrA>
    <xme:Oy3BYyQeI43uOCS5CK49RFBPrQXLvgoH7jyxA1EWEhaXS1U_GFSXnUcOsyByJ4HxX
    7ebslCPuxwL7F72QUk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleekgddtkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:Oy3BY4WFmJ1Wzov0EgMi6qcJljjNqlgJoW7YxZYtni3we9ZcuZJC0Q>
    <xmx:Oy3BY8jDZdOmomBzdPQYugeTKvRs2JAmwJR9qFQ78gYn6oU0QQd3og>
    <xmx:Oy3BY4DQ3Zg11gEbb70JkOCpYbMnoYHqWtdB8svYNbX-CHCrZb2sRA>
    <xmx:PC3BYzV0__Pe1Lv9Yq1qvCTC7InwXhC6SGzQNcMq4ULKQsDh2lBDrgxrUdU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B041DB60086; Fri, 13 Jan 2023 05:06:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1185-g841157300a-fm-20221208.002-g84115730
Mime-Version: 1.0
Message-Id: <d9c2f760-283b-483c-8512-fdd2c372f26c@app.fastmail.com>
In-Reply-To:  <CAMuHMdXYt4dNHUDsTnPa-RP+sdK=35nNa9xQzMChwK54qO44mA@mail.gmail.com>
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-12-hch@lst.de>
 <CAMuHMdXYt4dNHUDsTnPa-RP+sdK=35nNa9xQzMChwK54qO44mA@mail.gmail.com>
Date: Fri, 13 Jan 2023 11:06:22 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Christoph Hellwig" <hch@lst.de>
Cc: "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 "Kieran Bingham" <kieran.bingham+renesas@ideasonboard.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org,
 "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Netdev <netdev@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sh@vger.kernel.org
Subject: Re: [PATCH 11/22] mtd/nand: remove sh_flctl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_020702_714553_578B692D 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jan 13, 2023, at 09:30, Geert Uytterhoeven wrote:
> On Fri, Jan 13, 2023 at 7:24 AM Christoph Hellwig <hch@lst.de> wrote:
>> Now that arch/sh is removed this driver is dead code.
>
> FTR, this hardware block is also present on the ARM-based
> SH-Mobile AG5 and R-Mobile A1 SoCs.
> Again, no DT support.

I would generally consider drivers dead when they have no DT support
and no platform in the upstream kernel registering the corresponding
device.

If anyone still uses this driver on SH-Mobile or R-Mobile, they
have clearly given up on upstreaming their patches by now, and
they can carry the burden of maintaining the driver out of tree,
or re-submit a working version.

    Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
