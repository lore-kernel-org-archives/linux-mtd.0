Received: from 10.mo5.mail-out.ovh.net ([46.105.52.148]
 helo=mo5.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TNkgl-0003Ex-5b
 for linux-mtd@lists.infradead.org; Mon, 15 Oct 2012 13:26:36 +0000
Received: from mail419.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with SMTP id 5C286FFA803
 for <linux-mtd@lists.infradead.org>; Mon, 15 Oct 2012 15:33:12 +0200 (CEST)
Date: Mon, 15 Oct 2012 15:24:15 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH 1/1] MTD: atmel_nand: use devm_xxx gpio kzalloc, gpio
 and ioremap
Message-ID: <20121015132415.GV12801@game.jcrosoft.org>
References: <1350129982-12106-1-git-send-email-plagnioj@jcrosoft.com>
 <507BE8C8.8040901@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <507BE8C8.8040901@atmel.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> >  		goto err_nand_ioremap;
> >  	}
> >+	host->io_phys = (dma_addr_t)mem->start;
> >  	mtd = &host->mtd;
> >  	nand_chip = &host->nand_chip;
> >@@ -1401,7 +1380,7 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
> >  	if (pdev->dev.of_node) {
> >  		res = atmel_of_init_port(host, pdev->dev.of_node);
> >  		if (res)
> >-			goto err_ecc_ioremap;
> >+			goto err_nand_ioremap;
> >  	} else {
> >  		memcpy(&host->board, pdev->dev.platform_data,
> >  		       sizeof(struct atmel_nand_data));
> >@@ -1420,44 +1399,42 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
> >  	if (IS_ERR(pinctrl)) {
> >  		dev_err(host->dev, "Failed to request pinctrl\n");
> >  		res = PTR_ERR(pinctrl);
> 
> I cannot apply the patch in latest l2-mtd git tree since above line
> of code doesn't committed.
> Seems that code is pinctrl related. Am I missing some patches?

this is base on linux next

and yes with pinctrl

Best Regards,
J.
