Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82CD6C83000
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 06:20:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53A02206B8
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 06:20:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IixYB4bx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53A02206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4bPujcgvj3lCS2TIobYnM9ACHEWf6At42icec7tbNho=; b=IixYB4bx37qBSX
	oKAEEX79MVJiL9ka6qkjE+cHoThTo32kCoDGvtFmkzCi7lcb/u/KYX0JIIE0WPo6TAu1MNpwsT/mF
	AlKHCfi0PTeEsYCp3FPxJY0M7WdlbqkVfqpSrz7WsiLeK58FaVkzLowaEX2k9owDJlUT5rHtBlyeB
	i0e/H9kmxA3Fa/okmiI4OE4BXr+54naF+lQz4y4FsM71m2ARvE0Tp6bbVe7u82KqTiybaQChzouGs
	OfKOJUV3+nKQ8SXcJZRjq574XVx6mWEixYfrbVxNgi9uRLO05NA1qjgCjcApANNc4oCLh9kRktDlI
	1Jji+rKRjUGW7rxOKdmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTJbc-0005C3-20; Tue, 28 Apr 2020 06:20:32 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTJbZ-0005BE-1a
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 06:20:30 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9B36A2A0BB2;
 Tue, 28 Apr 2020 07:20:27 +0100 (BST)
Date: Tue, 28 Apr 2020 08:20:24 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 12/17] mtd: rawnand: cafe: Don't split things when
 reading/writing a page
Message-ID: <20200428082024.5e0ce40b@collabora.com>
In-Reply-To: <20200427215353.3ced34d3@xps13>
References: <20200427082028.394719-1-boris.brezillon@collabora.com>
 <20200427082028.394719-13-boris.brezillon@collabora.com>
 <20200427215353.3ced34d3@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_232029_220247_3C9137A7 
X-CRM114-Status: GOOD (  21.40  )
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
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 David Woodhouse <dwmw2@infradead.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 27 Apr 2020 21:53:53 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <boris.brezillon@collabora.com> wrote on Mon, 27 Apr
> 2020 10:20:22 +0200:
> 
> > Calling nand_read_page_op(pagesize)/nand_prog_page_begin_op(pagesize)
> > and expecting to get a pagesize+oobsize read from/written to the
> > read/write buffer is fragile and only works because of hacks done
> > in cmdfunc(). Let's read/write the page in one go, using the page
> > cache buffer as a bounce buffer.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/mtd/nand/raw/cafe_nand.c | 16 +++++++++++-----
> >  1 file changed, 11 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
> > index 31493a201a02..edf65197604b 100644
> > --- a/drivers/mtd/nand/raw/cafe_nand.c
> > +++ b/drivers/mtd/nand/raw/cafe_nand.c
> > @@ -472,6 +472,7 @@ static int cafe_nand_read_page(struct nand_chip *chip, uint8_t *buf,
> >  {
> >  	struct mtd_info *mtd = nand_to_mtd(chip);
> >  	struct cafe_priv *cafe = nand_get_controller_data(chip);
> > +	void *pagebuf = nand_get_data_buf(chip);
> >  	unsigned int max_bitflips = 0;
> >  	u32 ecc_result, status;
> >  
> > @@ -479,8 +480,11 @@ static int cafe_nand_read_page(struct nand_chip *chip, uint8_t *buf,
> >  		cafe_readl(cafe, NAND_ECC_RESULT),
> >  		cafe_readl(cafe, NAND_ECC_SYN_REG(0)));
> >  
> > -	nand_read_page_op(chip, page, 0, buf, mtd->writesize);
> > -	chip->legacy.read_buf(chip, chip->oob_poi, mtd->oobsize);
> > +	nand_read_page_op(chip, page, 0, pagebuf,
> > +			  mtd->writesize + mtd->oobsize);
> > +
> > +	if (buf != pagebuf)
> > +		memcpy(buf, pagebuf, mtd->writesize);
> >  
> >  	ecc_result = cafe_readl(cafe, NAND_ECC_RESULT);
> >  	status = CAFE_FIELD_GET(NAND_ECC_RESULT, STATUS, ecc_result);
> > @@ -642,15 +646,17 @@ static int cafe_nand_write_page(struct nand_chip *chip,
> >  {
> >  	struct mtd_info *mtd = nand_to_mtd(chip);
> >  	struct cafe_priv *cafe = nand_get_controller_data(chip);
> > +	void *pagebuf = nand_get_data_buf(chip);
> >  	int ret;
> >  
> > -	nand_prog_page_begin_op(chip, page, 0, buf, mtd->writesize);
> > -	chip->legacy.write_buf(chip, chip->oob_poi, mtd->oobsize);
> > +	if (pagebuf != buf)
> > +		memcpy(pagebuf, buf, mtd->writesize);
> >  
> >  	/* Set up ECC autogeneration */
> >  	cafe->ctl2 |= CAFE_NAND_CTRL2_AUTO_WRITE_ECC;
> >  
> > -	ret = nand_prog_page_end_op(chip);
> > +	ret = nand_prog_page_op(chip, page, 0, pagebuf,
> > +				mtd->writesize + mtd->oobsize);
> >  
> >  	/*
> >  	 * And clear it before returning so that following write operations  
> 
> 
> You are replacing ->read/write_buf() calls into memcpy() calls,
> shouldn't this be cleaned before? or at least mentioned?

Actually, those read/write_buf are still there, they're just hidden in
the nand_{prog,read}_page_op() call now (to be accurate, the read/write
buf in there now covers the data and oob portions). It's really what
should be done, the reason this worked so far is because cmdfunc()
guesses that the full page will be read/written and issues a read/write
of the data+oob portion. The extra memcpy that's added here is done to
account for the fact that the core might pass 2 different buffers for
OOB and data, but we want things to be done in one step, so we're using
the bounce buffer to do the transfer.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
