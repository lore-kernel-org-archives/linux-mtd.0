Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90150C282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 16:21:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E2A5217F9
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 16:21:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SzFtB6x9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zwirwUqr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E2A5217F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cnpzYhuS5k0o+WfaIP/mzzPhh4JU5ex2sCVw8GMhQrE=; b=SzFtB6x9ZulBkZ
	k48ClWw0snaXQIgfH++uKNRzjgxeuum+BYQsRN5/MBcBUx5CTe3iABK4LfEuiUgxEgezmHOO8ZfTc
	B/a8keYNx/1eKSO1X2i12yc5qwcxyiylFaNxv6ud5XPRpogMzjIbyU7oUmvzoAODAFxTGmNqugYpx
	8edS5hwAQVuPnZdYKAwx11RRpTHdSc2T8TmeQWLpsF5KEH8jji99+j+VV3FBgQI2Y2VnHgGfk2RAF
	H966qw8xn6HrGjQV4PEOboRiwyXMuY8kOgF9HMqIMcg64BIS3RuySI/3R2spZCpuqdJv9rtRZOtfp
	pXHlOpMm9hWlVBwpd+fQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr3Tq-0001iC-Qv; Tue, 05 Feb 2019 16:21:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr3Tm-0001hY-QJ
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 16:21:48 +0000
Received: from localhost (unknown [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BE2D220844;
 Tue,  5 Feb 2019 16:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549383705;
 bh=Av3aH/8ZR4Ux6m6lYUfKR7n3sD1IG70okAvKsiDB3Ew=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=zwirwUqre7/jkP47KEeyqGsWWzcmys0/xFFT7Ks69UXJLEMAdw0CI7f3mzEYyb5YG
 lsDx5yvyVT9hyuacO6GJBPSVov0hfoKnwpAYXiCYr1AlkMZxKj9QLFJYk335F7nnOR
 oJ3w9LwmyiNsg1WjqPHj4baf4YIHwqETDFkfHt0c=
Date: Tue, 5 Feb 2019 17:21:23 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2] mtd: rawnand: jz4780: fix possible object reference
 leak
Message-ID: <20190205172123.13ed9469@kernel.org>
In-Reply-To: <20190205165502.2b8be890@xps13>
References: <HK0PR02MB3634AB4C3584FD37B3335075B26E0@HK0PR02MB3634.apcprd02.prod.outlook.com>
 <20190205165502.2b8be890@xps13>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_082146_894971_E7EFE3A3 
X-CRM114-Status: GOOD (  21.07  )
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
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 Wen Yang <yellowriver2010@hotmail.com>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "harveyhuntnexus@gmail.com" <harveyhuntnexus@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "richard@nod.at" <richard@nod.at>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 5 Feb 2019 16:55:02 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Wen,
> 
> Wen Yang <yellowriver2010@hotmail.com> wrote on Tue, 5 Feb 2019
> 15:07:21 +0000:
> 
> > of_find_device_by_node() takes a reference to the struct device
> > when it finds a match via get_device, there is no need to call
> > get_device() twice.
> > We also should make sure to drop the reference to the device
> > taken by of_find_device_by_node() on driver unbind.
> > 
> > Fixes: ae02ab00aa3c ("mtd: nand: jz4780: driver for NAND devices on
> > JZ4780 SoCs") Signed-off-by: Wen Yang <yellowriver2010@hotmail.com>
> > Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
> > Cc: Boris Brezillon <bbrezillon@kernel.org>
> > Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> > Cc: Richard Weinberger <richard@nod.at>
> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Cc: Brian Norris <computersforpeace@gmail.com>
> > Cc: Marek Vasut <marek.vasut@gmail.com>
> > Cc: linux-mtd@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > ---
> > v2->v1: Since there is the only one user, let's remove the
> > err_put_device label.
> > 
> >  drivers/mtd/nand/raw/jz4780_bch.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/raw/jz4780_bch.c
> > b/drivers/mtd/nand/raw/jz4780_bch.c index 7201827..363465c 100644
> > --- a/drivers/mtd/nand/raw/jz4780_bch.c
> > +++ b/drivers/mtd/nand/raw/jz4780_bch.c
> > @@ -281,10 +281,12 @@ static struct jz4780_bch
> > *jz4780_bch_get(struct device_node *np) struct jz4780_bch *bch;
> >  
> >  	pdev = of_find_device_by_node(np);
> > -	if (!pdev || !platform_get_drvdata(pdev))
> > +	if (!pdev)
> >  		return ERR_PTR(-EPROBE_DEFER);
> > -
> > -	get_device(&pdev->dev);
> > +	if (!platform_get_drvdata(pdev)) {
> > +		put_device(&pdev->dev);
> > +		return ERR_PTR(-EPROBE_DEFER);
> > +	}
> >  
> >  	bch = platform_get_drvdata(pdev);
> >  	clk_prepare_enable(bch->clk);  
> 
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Don't plan to take that one (or any other ref leak fix) in the mtd/fixes
branch, feel free to queue it to nand/next.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
