Return-Path: <SRS0=B4Yk=4F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA67C35254
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 11:17:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 285202070B
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 11:17:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MgjKTt1F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 285202070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F9Ks4SYw+WjS6BbFohbsg8VV+va30MjTiP3QG+e6C60=; b=MgjKTt1Fipd7YY
	KgEdzzqe3Eewr/cIYUDOIpqq970IqiNMyfwgc08+QRmLNq5LrGUyE7h6A0zDGmAizm2kD4xNLANfq
	9zTyq7XQxurLt7ezbsIy1FuHhox3ioul6IfQCq9G+vfZZ33CkMB9CaBHd84sv6D06CzyXC7AkztqB
	sttigrbfVYpXjqcYoDNtecopEOt9xFuHOFh1USzzc5f4dvihNJPwLrzm7Me1tq+nGlelYtK4OH0kk
	s6u8Af39PzffwolyehstUwnzNUhvAu0wFXtKzmVbsD0WL6O40WzqtICspGSBAEr4oQfIr43+OEdc2
	Yg+069zzagF5d5dBzHrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3eP2-0007Ws-F6; Mon, 17 Feb 2020 11:17:28 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3eOz-0007WI-7c
 for linux-mtd@lists.infradead.org; Mon, 17 Feb 2020 11:17:26 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 61D4B293121;
 Mon, 17 Feb 2020 11:17:23 +0000 (GMT)
Date: Mon, 17 Feb 2020 12:17:17 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH 1/3] mtd: spinand: Stop using spinand->oobbuf for
 buffering bad block markers
Message-ID: <20200217121717.2152db2c@collabora.com>
In-Reply-To: <20200211163452.25442-2-frieder.schrempf@kontron.de>
References: <20200211163452.25442-1-frieder.schrempf@kontron.de>
 <20200211163452.25442-2-frieder.schrempf@kontron.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_031725_407855_96E040B7 
X-CRM114-Status: GOOD (  21.73  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 liaoweixiong <liaoweixiong@allwinnertech.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Jeff Kletsky <git-commits@allycomm.com>, Peter Pan <peterpandong@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 11 Feb 2020 16:35:33 +0000
Schrempf Frieder <frieder.schrempf@kontron.de> wrote:

> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> For reading and writing the bad block markers, spinand->oobbuf is
> currently used as a buffer for the marker bytes. During the
> underlying read and write operations to actually get/set the content
> of the OOB area, the content of spinand->oobbuf is reused and changed
> by accessing it through spinand->oobbuf and/or spinand->databuf.
> 
> This is a flaw in the original design of the SPI MEM core and at the
> latest from 13c15e07eedf ("mtd: spinand: Handle the case where
> PROGRAM LOAD does not reset the cache") on, it results in not having
> the bad block marker written at all, as the spinand->oobbuf is
> cleared to 0xff after setting the marker bytes to zero.
> 
> To fix it, we now just store the two bytes for the marker on the
> stack and let the read/write operations copy it from/to the page
> buffer later.
> 
> Fixes: 7529df465248 ("mtd: nand: Add core infrastructure to support SPI NANDs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  drivers/mtd/nand/spi/core.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 89f6beefb01c..5d267a67a5f7 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -568,18 +568,18 @@ static int spinand_mtd_write(struct mtd_info *mtd, loff_t to,
>  static bool spinand_isbad(struct nand_device *nand, const struct nand_pos *pos)
>  {
>  	struct spinand_device *spinand = nand_to_spinand(nand);
> +	u8 marker[] = { 0, 0 };

How about

	u8 marker[2] = { };

?

>  	struct nand_page_io_req req = {
>  		.pos = *pos,
>  		.ooblen = 2,

		.ooblen = sizeof(marker),

>  		.ooboffs = 0,
> -		.oobbuf.in = spinand->oobbuf,
> +		.oobbuf.in = marker,
>  		.mode = MTD_OPS_RAW,
>  	};
>  
> -	memset(spinand->oobbuf, 0, 2);
>  	spinand_select_target(spinand, pos->target);
>  	spinand_read_page(spinand, &req, false);
> -	if (spinand->oobbuf[0] != 0xff || spinand->oobbuf[1] != 0xff)
> +	if (marker[0] != 0xff || marker[1] != 0xff)
>  		return true;
>  
>  	return false;
> @@ -603,11 +603,12 @@ static int spinand_mtd_block_isbad(struct mtd_info *mtd, loff_t offs)
>  static int spinand_markbad(struct nand_device *nand, const struct nand_pos *pos)
>  {
>  	struct spinand_device *spinand = nand_to_spinand(nand);
> +	u8 marker[] = { 0, 0 };
>  	struct nand_page_io_req req = {
>  		.pos = *pos,
>  		.ooboffs = 0,
>  		.ooblen = 2,
> -		.oobbuf.out = spinand->oobbuf,
> +		.oobbuf.out = marker,

Ditto.

>  	};
>  	int ret;
>  
> @@ -622,7 +623,6 @@ static int spinand_markbad(struct nand_device *nand, const struct nand_pos *pos)
>  
>  	spinand_erase_op(spinand, pos);
>  
> -	memset(spinand->oobbuf, 0, 2);
>  	return spinand_write_page(spinand, &req);
>  }
>  

With these minor things addressed

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
