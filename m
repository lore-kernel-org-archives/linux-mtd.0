Return-Path: <SRS0=PkFq=XO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C007FC49ED7
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 11:29:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 932902196E
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 11:29:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="is3Fyj/t";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qBpLSsbr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 932902196E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e7X+NmlK5pQx+j6dz/GxSe9+8n37IalXbFPVLak3yGU=; b=is3Fyj/tZZVkHY
	VIVhlCvK+azE37oJUSEoOMBQmnZS1iI9OT8vZdE1xeWhPKqzfZl80uJfLVgBGUfHeyj3m5Y9Qg4AQ
	lbnJdt43FQ7H3tEji29YL4JQzagU+TBm4Zwh3tfxr/N05sbspjIwdr19BMJx2M29ZWXBN3mr15/yx
	XRr5LbKeF9nAHPHpNv6oETW0tHnADtulRP5U2EKJ2EtWZ07cFnG36pMjbYqYEpsATROsnzwaCIMhX
	oiw8FvZFOXcV6IvUc9T2mou+c5S6c92/SXy+f5P3FVMxchSwPEkmtGfRFcT03lBff7kiegD0dq+M0
	KM8iDBC49upK96zqWpJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAud4-0002bp-Dn; Thu, 19 Sep 2019 11:29:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAud1-0002bQ-Ss
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2019 11:29:41 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E35AE21929;
 Thu, 19 Sep 2019 11:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568892579;
 bh=Pvq/7D6S/KPNrlEap1DoFVldgRv5WRFeFozeTaFRDHg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qBpLSsbreLZ8P7ObI0vUafC3Zi7RQxY9OwwkzxVCH6pRiEhOqYM0Bw7QuQ4DlIleH
 HCmekc88h+oZPkodYg6IGelzTBbrrwYjQ9WL7VJeENOO5X+CCLu0bE7z6+pXroPBUb
 9VQgNh+QcHatnpADmavENZ/htUjNf/TCH8cDzj04=
Date: Thu, 19 Sep 2019 13:29:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: st_spi_fsm: Use devm_platform_ioremap_resource() in
 stfsm_probe()
Message-ID: <20190919112937.GA3072241@kroah.com>
References: <e1d32aa4-7c82-64e0-b7c4-33c94d9a2769@web.de>
 <20190919111014.6c569cf3@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190919111014.6c569cf3@xps13>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_042939_953793_53974884 
X-CRM114-Status: GOOD (  20.12  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Lee Jones <lee.jones@linaro.org>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Armijn Hemel <armijn@tjaldur.nl>, linux-mtd@lists.infradead.org,
 Himanshu Jha <himanshujha199640@gmail.com>,
 Richard Weinberger <richard@nod.at>, Markus Elfring <Markus.Elfring@web.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Sep 19, 2019 at 11:10:14AM +0200, Miquel Raynal wrote:
> Hi Markus,
> 
> Markus Elfring <Markus.Elfring@web.de> wrote on Wed, 18 Sep 2019
> 14:50:27 +0200:
> 
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Wed, 18 Sep 2019 14:37:34 +0200
> > 
> > Simplify this function implementation by using a known wrapper function.
> > 
> > This issue was detected by using the Coccinelle software.
> > 
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >  drivers/mtd/devices/st_spi_fsm.c | 8 +-------
> >  1 file changed, 1 insertion(+), 7 deletions(-)
> > 
> > diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
> > index f4d1667daaf9..5bd1c44ae529 100644
> > --- a/drivers/mtd/devices/st_spi_fsm.c
> > +++ b/drivers/mtd/devices/st_spi_fsm.c
> > @@ -2034,13 +2034,7 @@ static int stfsm_probe(struct platform_device *pdev)
> > 
> >  	platform_set_drvdata(pdev, fsm);
> > 
> > -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > -	if (!res) {
> > -		dev_err(&pdev->dev, "Resource not found\n");
> > -		return -ENODEV;
> > -	}
> > -
> > -	fsm->base = devm_ioremap_resource(&pdev->dev, res);
> > +	fsm->base = devm_platform_ioremap_resource(pdev, 0);
> >  	if (IS_ERR(fsm->base)) {
> >  		dev_err(&pdev->dev,
> >  			"Failed to reserve memory region %pR\n", res);
> > --
> > 2.23.0
> > 
> 
> 
> Is this even compiled tested? 'res' is not initialized anymore so you
> can't use it in the error trace. I suppose you should even drop it from
> the stack parameters.

You are responding to a email address/bot that is on a number of kernel
developers "black list" as something to just totally ignore.  I
recommend you do the same if possible...

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
