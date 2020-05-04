Return-Path: <SRS0=hi6L=6S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27CE7C3A5A9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 10:39:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED5B320721
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 10:39:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FGviLWbK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED5B320721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+mxKWMcxOQlNlPf6qZbetn1Ar6ai7iTOysKRV+JTBxE=; b=FGviLWbKOUZ8G2
	ugWchMBFHvhVwj3wr7YQLoNoqflgCAA4JufIevyzlF5t3TW1SCFCXSWlzN0fv1zWv6EQSozWMglQl
	+Qig432vhqAVh4wYvMrmxeT47OzeNrD+2tznXba/6viQkUGUPqPBwhcsJ6du5sVqCAAfNEqS9I6pX
	H2ZLPF16M+v5BPpVSYAMjtv0bZ4D1tj5L6iEXqJsr4z84ppaob0NUHINgTM4StNoqhxlUv8cIAQOV
	49uPT2bUL110nFKNdCu/e+8MSYk/PC/O1i6yDCfRnoGS40n6xfk1VET6q+hy0TXIUO+GZsLNnWASa
	tCL5Xipyglvzp28z2X8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVYVP-0004UP-3T; Mon, 04 May 2020 10:39:23 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVYVK-0004QP-3m
 for linux-mtd@lists.infradead.org; Mon, 04 May 2020 10:39:21 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 050F02A0F1C;
 Mon,  4 May 2020 11:39:15 +0100 (BST)
Date: Mon, 4 May 2020 12:39:12 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 11/13] mtd: rawnand: Expose monolithic
 read/write_page_raw() helpers
Message-ID: <20200504123912.6593afd5@collabora.com>
In-Reply-To: <20200504123740.765c59e7@xps13>
References: <20200504095237.1654-1-miquel.raynal@bootlin.com>
 <20200504095237.1654-12-miquel.raynal@bootlin.com>
 <20200504123501.56ade217@collabora.com>
 <20200504123740.765c59e7@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_033918_337259_8C30C5A5 
X-CRM114-Status: GOOD (  14.40  )
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
Cc: Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 4 May 2020 12:37:40 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Boris Brezillon <boris.brezillon@collabora.com> wrote on Mon, 4 May
> 2020 12:35:01 +0200:
> 
> > On Mon,  4 May 2020 11:52:35 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > >  /**
> > >   * nand_write_page_raw_syndrome - [INTERN] raw page write function
> > >   * @chip: nand chip info structure
> > > diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> > > index 70380c91731c..830e05dd1e1d 100644
> > > --- a/include/linux/mtd/rawnand.h
> > > +++ b/include/linux/mtd/rawnand.h
> > > @@ -1328,13 +1328,17 @@ int nand_read_oob_std(struct nand_chip *chip, int page);
> > >  int nand_get_set_features_notsupp(struct nand_chip *chip, int addr,
> > >  				  u8 *subfeature_param);
> > >  
> > > -/* Default read_page_raw implementation */
> > > +/* Default read_page_raw implementations */    
> > 
> > I thought we agreed on dropping the "Default" here
> >   
> > >  int nand_read_page_raw(struct nand_chip *chip, uint8_t *buf, int oob_required,
> > >  		       int page);
> > > +int nand_monolithic_read_page_raw(struct nand_chip *chip, uint8_t *buf,
> > > +				  int oob_required, int page);
> > >  
> > > -/* Default write_page_raw implementation */
> > > +/* Default write_page_raw implementations */    
> > 
> > and here :).  
> 
> I completely forgot about that.
> 
> If the rest is fine, I'll just resend this one (or the last patches).

Or fix when applying.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
