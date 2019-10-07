Return-Path: <SRS0=6eB4=YA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40108C47404
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Oct 2019 08:13:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F32420679
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Oct 2019 08:13:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="quNdCEPx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F32420679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kIyjufAZL7Vq4p/aW000vRQhvx2C82aDZLP2SPQdR2s=; b=quNdCEPxCYyIny
	nioQWI1XjvfLRTX/ntBjuYCFXZGs09FbNWRqEj+Yi0x/lCH0zWKfA3Smg8aCjDBFNcefyB67kORQA
	CDvojZpCpmW0tlRasRez42G/B+fnPL1Vgy6WfEIRuuv+vXUgaZ8pfe2quDp1aNatNahJxkdf4Ezpy
	Th4SsVixBQxpCan3pWz8aLQfdp52AX1wBRHnKDFOy9prhSvPAb8lEycOICx52xTVZ7PznznSBd808
	CWOC3cbygvIt91MNXSinKKziMkot/8cH0Val47/OC/7dp53o3n6KxphF66BDwL+57gj0JZl2vM07+
	2AlgsQfw/Hlxud2b2a8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHO9K-0001Bh-QV; Mon, 07 Oct 2019 08:13:46 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHO9H-0001B2-E0
 for linux-mtd@lists.infradead.org; Mon, 07 Oct 2019 08:13:45 +0000
Received: from dhcp-172-31-174-146.wireless.concordia.ca (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6C49628AF35;
 Mon,  7 Oct 2019 09:13:40 +0100 (BST)
Date: Mon, 7 Oct 2019 10:13:37 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
Subject: Re: [EXT] Re: [PATCH 6/8] mtd: spinand: micron: Turn driver
 implementation generic
Message-ID: <20191007101337.647300e2@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <MN2PR08MB5951F13BC1D1D111681CCB4BB8A80@MN2PR08MB5951.namprd08.prod.outlook.com>
References: <20190722055621.23526-1-sshivamurthy@micron.com>
 <20190722055621.23526-7-sshivamurthy@micron.com>
 <20190807120408.031b8d1b@xps13>
 <MN2PR08MB5951F13BC1D1D111681CCB4BB8A80@MN2PR08MB5951.namprd08.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191007_011343_736715_95236930 
X-CRM114-Status: GOOD (  19.27  )
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
Cc: Brian Norris <computersforpeace@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 liaoweixiong <liaoweixiong@allwinnertech.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Jeff Kletsky <git-commits@allycomm.com>, Chuanhong Guo <gch981213@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 19 Aug 2019 09:03:38 +0000
"Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com> wrote:

> >   
> > >  static int micron_spinand_detect(struct spinand_device *spinand)
> > >  {
> > > +	const struct spi_mem_op *op;
> > >  	u8 *id = spinand->id.data;
> > > -	int ret;
> > >
> > >  	/*
> > >  	 * Micron SPI NAND read ID need a dummy byte,
> > > @@ -114,16 +102,55 @@ static int micron_spinand_detect(struct  
> > spinand_device *spinand)  
> > >  	if (id[1] != SPINAND_MFR_MICRON)
> > >  		return 0;
> > >
> > > -	ret = spinand_match_and_init(spinand, micron_spinand_table,
> > > -				     ARRAY_SIZE(micron_spinand_table),  
> > id[2]);
> > 
> > I am not sure this is the right solution. I would keep this call and
> > overwrite what you need to overwrite with the fixup hook.
> >   

I'm definitely not comfortable with this whole "rely on ONFi
param-page" thing. Vendors have proven to get it wrong from time to
time, so before we do that, I'd like to make sure all currently
supported Micron NANDs (looks like we only support MT29F2G01ABAGD, so
that shouldn't be hard) expose the right thing there. For instance, are
we sure the ECC layout is always the same, and if not, do we have a
reliable way to extract that?

> 
> Then, I will have dummy structure like below.
> 
> static const struct spinand_info micron_spinand_table[] = {                      
>         SPINAND_INFO(NULL, 0,                                                                    
>                      NAND_MEMORG(0, 0, 0, 0, 0, 0, 0, 0, 0),           
>                      NAND_ECCREQ(0, 0),                                                                       
>                      SPINAND_INFO_OP_VARIANTS(&read_cache_variants,              
>                                               &write_cache_variants,             
>                                               &update_cache_variants),           
>                      0,                                                                                         
>                      SPINAND_ECCINFO(&micron_ooblayout_ops,                      
>                                      micron_ecc_get_status)),                    
> };   

> 
> Let me know if you are thinking for different approach.

Exposing dummy entries is useless. If you're entirely sure all Micron
SPI NANDs have a valid ONFi param page, then no need to use the
ID-based detection. But as I said above, I feel param-page-based
detection is going to be as messy as SFDP-based detection is for SPI
NORs. Vendors tend to make mistakes which we have to fix to make
things work. ID-based detection is much more reliable in this regard,
as long as we don't have ID collisions :P.
Plus, it looks like only a few manufacturers decided to use ONFi param
pages to expose SPI NAND info (AFAICT, only Micron and Macronix do
that), which is not surprising since the ONFi param page has been
created to describe parallel NANDs not SPI NANDs (if you look closely
enough, you'll notice that some fields are meaningless for SPI NANDs).

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
