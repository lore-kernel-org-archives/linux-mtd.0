Return-Path: <SRS0=zMTj=7Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3CD0C433E1
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 14:01:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F6CE206A2
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 14:01:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="evnKl2FW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F6CE206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QXhde+5Hhfsj9eYWLROMrrK5WEUDf+1RG69C8t0U7B0=; b=evnKl2FWO9t9GW
	3CI6atyu9F1S14+JQKkEf3rTF+ARMUPvlTnxJp1V7swUQwxNdLNG8087xsyUyEXp+QRFDMnlDK3Uo
	cTzDeQw6XyHljomh8NMdTEoFsYDJoY3OZe1B2Z85r0ROpEQwAIRr4W/fWjuwjmIsh5KKSA/GnjVWL
	L7IADwKgMtJJuQ8KwLz04gL5SFh0X+eiZHb8AyrCJD098iCuXSgLZ30IV7BHGUrWwTvlWLcJeobDX
	80eXIXE6VIprBu96JVx+PPBg72K+CyaRfYvGwc+cj3yf07dMC+lI5ZDWMDP9Cv8fptoyXMYt7jnVv
	3iWt6pdnRoJkOeQmm9hA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgTwu-0006lE-6E; Wed, 03 Jun 2020 14:00:56 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgTwr-0006kb-5q
 for linux-mtd@lists.infradead.org; Wed, 03 Jun 2020 14:00:54 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 79F3C2A0682;
 Wed,  3 Jun 2020 15:00:51 +0100 (BST)
Date: Wed, 3 Jun 2020 16:00:47 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 05/10] mtd: rawnand: fsl_upm: Use
 platform_get_resource() + devm_ioremap_resource()
Message-ID: <20200603160047.0262fcfc@collabora.com>
In-Reply-To: <20200603155802.12165328@xps13>
References: <20200603134922.1352340-1-boris.brezillon@collabora.com>
 <20200603134922.1352340-6-boris.brezillon@collabora.com>
 <20200603155802.12165328@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_070053_348866_026A5FEB 
X-CRM114-Status: GOOD (  15.91  )
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
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Anton Vorontsov <anton@enomsg.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 3 Jun 2020 15:58:02 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Boris Brezillon <boris.brezillon@collabora.com> wrote on Wed,  3 Jun
> 2020 15:49:17 +0200:
> 
> > Replace the of_address_to_resource() + devm_ioremap() calls by
> > platform_get_resource() + devm_ioremap_resource() ones which allows us
> > to get rid of one error message since devm_ioremap_resource() already
> > takes care of that.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/mtd/nand/raw/fsl_upm.c | 23 +++++++----------------
> >  1 file changed, 7 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
> > index a3e3a968891d..54851e9ea784 100644
> > --- a/drivers/mtd/nand/raw/fsl_upm.c
> > +++ b/drivers/mtd/nand/raw/fsl_upm.c
> > @@ -14,7 +14,6 @@
> >  #include <linux/mtd/nand_ecc.h>
> >  #include <linux/mtd/partitions.h>
> >  #include <linux/mtd/mtd.h>
> > -#include <linux/of_address.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/of_gpio.h>
> >  #include <linux/io.h>
> > @@ -197,7 +196,7 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
> >  static int fun_probe(struct platform_device *ofdev)
> >  {
> >  	struct fsl_upm_nand *fun;
> > -	struct resource io_res;
> > +	struct resource *io_res;
> >  	const __be32 *prop;
> >  	int rnb_gpio;
> >  	int ret;
> > @@ -208,13 +207,12 @@ static int fun_probe(struct platform_device *ofdev)
> >  	if (!fun)
> >  		return -ENOMEM;
> >  
> > -	ret = of_address_to_resource(ofdev->dev.of_node, 0, &io_res);
> > -	if (ret) {
> > -		dev_err(&ofdev->dev, "can't get IO base\n");
> > -		return ret;
> > -	}
> > +	io_res = platform_get_resource(ofdev, IORESOURCE_MEM, 0);
> > +	fun->io_base = devm_ioremap_resource(&ofdev->dev, io_res);  
> 
> Why not even using devm_platform_ioremap_resource() resource directly?

Because I need to pass the resource to fsl_upm_find().

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
