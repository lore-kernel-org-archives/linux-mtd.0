Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCBBC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 18:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VPo3zvwkeeq0hiraRzr44cPQjT+r7SxOxTo/QZWygPY=; b=r0+QLvEXUv0j85
	vAjKyfqBrK5CsLRZZQXYpPR5R2Awt5SJDaAEyC/j8I02cVn/XZ2ui8gSow/RUBxAD0yOILybA7SBL
	M6/2u0t6PuQZvzr4qfc/eZPi2MfQiucgwLSYY/X3AKiXrLEOLkY4Q5NYeU6PL/GBoDNMcBk4xiCXt
	BwJ/90Kefy78uBQNpzNwPRHN1REw5vbQ77aw7KPHOLLn/5oVMwoDp9oPahY+9edfs5wyVV7vwHwNs
	fnFqbXaqIJ4BmP2HSn5Pun45iFNDqG9SSaGu0FGGBVdryIKLvmaU0JCyePksA3m9JfL8MHU8us7Jy
	Z3LDnFBOXuCmCZxEerbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMwJQ-00Fi0Q-M0; Wed, 23 Feb 2022 18:24:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMwJL-00Fi02-TW
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 18:24:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 99C30B8216A;
 Wed, 23 Feb 2022 18:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C198AC340E7;
 Wed, 23 Feb 2022 18:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1645640661;
 bh=Ok0TjFXJ89KIp9SMK2a9xW2sNM6gB+qMJkswhq8JnIg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qTuTE0XGFGAJp8v05Cqya1ji7cwN6A+kZRXDoM+tDKsq0ziH/y4Y/Bt6tIeHDPl2+
 BVmlbklfFhrtWXnT0AV279eA8SvTkC1e7x/HI4VV0iM1Z6VWjDpppjqXY4hKHPE5NZ
 v1cprPuaRA4NOc1YV9KFqVplvrhBh2cIA/Abc1gI=
Date: Wed, 23 Feb 2022 19:24:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: stable@vger.kernel.org, sashal@kernel.org, david regan <dregan@mail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "open list:NAND FLASH SUBSYSTEM" <linux-mtd@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND stable 4.9] mtd: rawnand: brcmnand: Fixed
 incorrect sub-page ECC status
Message-ID: <YhZ70pTGdGoPEMUb@kroah.com>
References: <20220223174431.1083-1-f.fainelli@gmail.com>
 <20220223174431.1083-3-f.fainelli@gmail.com>
 <YhZ0vZxlp1VTgNG8@kroah.com>
 <325bb69b-691b-3c61-9578-d42ec33277b8@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <325bb69b-691b-3c61-9578-d42ec33277b8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_102424_124792_36B427EE 
X-CRM114-Status: GOOD (  27.01  )
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

On Wed, Feb 23, 2022 at 09:54:59AM -0800, Florian Fainelli wrote:
> 
> 
> On 2/23/2022 9:54 AM, Greg KH wrote:
> > On Wed, Feb 23, 2022 at 09:44:31AM -0800, Florian Fainelli wrote:
> > > From: david regan <dregan@mail.com>
> > > 
> > > commit 36415a7964711822e63695ea67fede63979054d9 upstream
> > > 
> > > The brcmnand driver contains a bug in which if a page (example 2k byte)
> > > is read from the parallel/ONFI NAND and within that page a subpage (512
> > > byte) has correctable errors which is followed by a subpage with
> > > uncorrectable errors, the page read will return the wrong status of
> > > correctable (as opposed to the actual status of uncorrectable.)
> > > 
> > > The bug is in function brcmnand_read_by_pio where there is a check for
> > > uncorrectable bits which will be preempted if a previous status for
> > > correctable bits is detected.
> > > 
> > > The fix is to stop checking for bad bits only if we already have a bad
> > > bits status.
> > > 
> > > Fixes: 27c5b17cd1b1 ("mtd: nand: add NAND driver "library" for Broadcom STB NAND controller")
> > > Signed-off-by: david regan <dregan@mail.com>
> > > Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > Link: https://lore.kernel.org/linux-mtd/trinity-478e0c09-9134-40e8-8f8c-31c371225eda-1643237024774@3c-app-mailcom-lxa02
> > > [florian: make patch apply to 4.14, file was renamed]
> > > Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> > > ---
> > >   drivers/mtd/nand/brcmnand/brcmnand.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > Why is this a RESEND?  What happened with the first set?
> 
> I forgot to copy stable and you and Sasha, wanted to make it clear to the
> MTD folks why this is being resent.

But this commit is already in the 4.14.268 and 4.19.231 release, why do
we need to add it again?

For 4.9 we need the backport, I'll take that one...

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
