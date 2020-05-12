Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B7FC54E4A
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 09:47:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1508120661
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 09:47:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rchxOGL0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1508120661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TBhgt5wOrBF65qoEWxfweP7jy02rSG0TGoq4vVWRI9A=; b=rchxOGL0q4Dw5P
	sZy/KN0qOVwYm1eGGTFmmxlaRf42Vvbq/HV3HiOTG8foHzE2ujmLfillj3ofnGLiU/Mjn6db4ReaE
	9Cyh6pRXA++BoEPHxU1E7YwNY/EjKvmDMWanrZoPqFIVkf/TD6qKdaBn+C571fZQEdjVbOSyTg8yA
	9jHRgZlip87VOY4PIhSCOxyzdOcE0l2pehk2vKUOu3D5Fgj3uMpUxBG5EhRykadZoK3gBh/noPWUu
	sTlHV/MzCFwBj48R2Kk8P4IClQ8B4Q+gER9pe7mHUOKTxANKECWWYX56OZQcuLDKcyGJpwbYHSdQJ
	hvq+lG/fuNe5e0zv3ZpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYRVQ-0007Ar-Sq; Tue, 12 May 2020 09:47:20 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYRVM-0007A0-Rf
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 09:47:18 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1jYRVK-00008S-QL; Tue, 12 May 2020 11:47:14 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1jYRVJ-0004Bh-Mt; Tue, 12 May 2020 11:47:13 +0200
Date: Tue, 12 May 2020 11:47:13 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3] mtd: spi-nor: Add support for Cypress cy15x104q
Message-ID: <20200512094713.GH5877@pengutronix.de>
References: <20200424065626.8196-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200424065626.8196-1-s.hauer@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:43:36 up 82 days, 17:14, 117 users,  load average: 0.20, 0.33,
 0.25
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_024716_921693_C6140E40 
X-CRM114-Status: GOOD (  22.57  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, kernel@pengutronix.de,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Apr 24, 2020 at 08:56:26AM +0200, Sascha Hauer wrote:
> The Cypress cy15b104q and cy15v104q are 4Mbit serial SPI F-RAM devices.
> Add support for them to the spi-nor driver.
> 
> The actual Device ID of this chip is 7f 7f 7f 7f 7f 7f c2 2c 04. That is
> six times the continuation code 7f followed by c2 for Ramtron.
> Unfortunately the chip sends the Device ID in reversed order, so the
> continuation code is not at the beginning, but instead at the end. Even
> more unfortunate is that when reading further the chip sends more 7f
> codes which means we are not even able to count the continuation codes.
> We can only hope that this reversed Device ID will never match any other
> devices ID.

Any idea how to continue here? The patch is wrong, I know that, but I
have no idea what to do instead. Should we just skip support for this
chip?

Sascha

> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
> 
> Changes since v2:
> - Add explanation of the reversed order of the Device ID to the commit message
> Changes since v1:
> - Instead of specifying 1024 sectors with a sector size of 512 specify
>   512 * 1024 sectos with a sector size of 1. The device has no idea of
>   sectors and is not erasable, so a sector size of 1 seems to better
>   reflect reality.
> 
>  drivers/mtd/spi-nor/spansion.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 6756202ace4b..3e8ac602e36b 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -70,6 +70,7 @@ static const struct flash_info spansion_parts[] = {
>  	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512,
>  			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>  			     SPI_NOR_4B_OPCODES) },
> +	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1, SPI_NOR_NO_ERASE) },
>  };
>  
>  static void spansion_post_sfdp_fixups(struct spi_nor *nor)
> -- 
> 2.26.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
