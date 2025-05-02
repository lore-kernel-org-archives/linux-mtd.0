Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B306C3ABAC
	for <linux-mtd@archiver.kernel.org>; Fri,  2 May 2025 16:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YJ47D3c13uwx2udWOa6BjBwg8DazDinZ8cUXkryYWFI=; b=2KmxOrBO1fh32a
	qj1FHB2scBFJ59iurOBK1II8S8aSOuyGoSPgF2S357KSo24ts0YHMSLeI2wbEcmV55p8YQzkJW6yX
	NkYuEbgyVtULE+6a+jA3VNm63PhB6//oFu6djDkMUGBsQK3+duxcQPEEYfVu4kGNCTjbJFHe3xbmN
	PSAURREXyOoP8Q7MtM8F/4+kUB8iJutCuTCYxXUSqI748Ip0PsmFHiYLUh93xRH/vKoGOceyj56N3
	D/vYzDcj8JwDifLBXJZavVCU7Ljhtol25I0uFR0UW6l7ZcyXbqID39bPvn0n7GIQO2WxeiAW16x3I
	NE0ArnhuboYyprEZtGrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAsvF-00000002RZQ-0nYI;
	Fri, 02 May 2025 16:07:33 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAss6-00000002R4u-3pZw
	for linux-mtd@lists.infradead.org;
	Fri, 02 May 2025 16:04:20 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B348AF;
	Fri,  2 May 2025 18:04:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746201849;
	bh=gwXN3uKkZvpWrE6+FvlOwjYwomgnhHuJFP/82khwbdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IP5oh0e/+b5cd/A+M+O7BEm452PpzvvWGaOoOugaHEXe7aFfXRrvmKWZart6lZxYU
	 bSdrhAfFu3vMbOFaLsYxkXhuDiy42BLBXLtTJqEl2jraJduviw005hEHkCEPW3mZyc
	 Pn2DmelSm2H7aDV7m55cSF3iEfxlSNLEifjGBWIA=
Date: Fri, 2 May 2025 19:04:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [bug report] mtd: rawnand: Add Loongson-1 NAND Controller Driver
Message-ID: <20250502160408.GC15945@pendragon.ideasonboard.com>
References: <aBR535RZZT-sa6QZ@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aBR535RZZT-sa6QZ@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_090419_091763_DCC5A2BC 
X-CRM114-Status: GOOD (  15.14  )
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

On Fri, May 02, 2025 at 10:53:03AM +0300, Dan Carpenter wrote:
> Hello Keguang Zhang,
> 
> Commit d2d10ede04b1 ("mtd: rawnand: Add Loongson-1 NAND Controller
> Driver") from Mar 20, 2025 (linux-next), leads to the following
> Smatch static checker warning:
> 
> 	drivers/mtd/nand/raw/loongson1-nand-controller.c:730 ls1x_nand_chip_init()
> 	warn: inconsistent refcounting 'chip_np->kobj.kref.refcount.refs.counter':
> 
> drivers/mtd/nand/raw/loongson1-nand-controller.c
>     690 static int ls1x_nand_chip_init(struct ls1x_nand_host *host)
>     691 {
>     692         struct device *dev = host->dev;
>     693         int nchips = of_get_child_count(dev->of_node);
>     694         struct device_node *chip_np;
>     695         struct nand_chip *chip = &host->chip;
>     696         struct mtd_info *mtd = nand_to_mtd(chip);
>     697         int ret;
>     698 
>     699         if (nchips != 1)
>     700                 return dev_err_probe(dev, -EINVAL, "Currently one NAND chip supported\n");
>     701 
>     702         chip_np = of_get_next_child(dev->of_node, NULL);
> 
> 
> The of_get_next_child() function drops the reference on the current
> child.  That's probably not what we want to happen.  This is similar to
> a discussion we were having earlier about of_find_node_by_name().

The current child here is NULL, so I don't think there's an issue.

> Then it takes a reference to the new child.

*That* causes issues that you outlined below.

> 
>     703         if (!chip_np)
>     704                 return dev_err_probe(dev, -ENODEV, "failed to get child node for NAND chip\n");
>     705 
>     706         chip->controller = &host->controller;
>     707         chip->options = NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA | NAND_BROKEN_XD;
>     708         chip->buf_align = 16;
>     709         nand_set_controller_data(chip, host);
>     710         nand_set_flash_node(chip, chip_np);
>     711         if (!mtd->name)
>     712                 return dev_err_probe(dev, -EINVAL, "Missing MTD label\n");
> 
> of_node_put(chip_np) before returning.
> 
>     713 
>     714         mtd->dev.parent = dev;
>     715         mtd->owner = THIS_MODULE;
>     716 
>     717         ret = nand_scan(chip, 1);
>     718         if (ret) {
>     719                 of_node_put(chip_np);
>     720                 return dev_err_probe(dev, ret, "failed to scan NAND chip\n");
>     721         }
>     722 
>     723         ret = mtd_device_register(mtd, NULL, 0);
>     724         if (ret) {
>     725                 nand_cleanup(chip);
>     726                 of_node_put(chip_np);
>     727                 return dev_err_probe(dev, ret, "failed to register MTD device\n");
>     728         }
>     729 
> 
> I think we want to call of_node_put(chip_np) before returning on the
> success path as well?

I would instead declare the chip_np variable as

	struct device_node *chip_np __free(of_node_put) = NULL;

and drop all the of_node_put(chip_np) calls.

> --> 730         return 0;
>     731 }

-- 
Regards,

Laurent Pinchart

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
