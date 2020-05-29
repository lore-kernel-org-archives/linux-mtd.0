Return-Path: <SRS0=kjCr=7L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 815CDC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 11:33:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 577F92074D
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 11:33:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OW1fr8RT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 577F92074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yfDfzcMQnfLps3rEKAijg0yRcj8yblmC41jSUxdGSJ8=; b=OW1fr8RTdwE6c6
	LWIVtVVDRfeVseVkj1nHb7MjlUW3fvmpxjY43vMP0wJzT2/DYOCQiZREVHLJp4NJnDFx27sXLcbd3
	CLJpx+q0Nh7BsqR7YymCniFYj9eOjpH07JXGdwgaMSJl8VDDw6xC3ONzNow31LwWXDEncpXXXwZy1
	ZPeyZ0yBf05/e73DXhajESYf6vkV4m+NqJLTXJBmmPjUt1U3uDT+4GGUBrnwjrAq//1+Gy3NdB3XM
	r6+uvbCuwWcb71axl8LTWiAalUQoW92fEpbCyqiZJRd/4FhdWAW8MWTEKz/ChsdqOfz774nhdkwzg
	klHN2nSwRxiIAs7yukow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jedG3-00070z-Cj; Fri, 29 May 2020 11:33:03 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jedG0-00070M-3h
 for linux-mtd@lists.infradead.org; Fri, 29 May 2020 11:33:01 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id D4CB610000A;
 Fri, 29 May 2020 11:32:54 +0000 (UTC)
Date: Fri, 29 May 2020 13:32:53 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v7 22/28] mtd: rawnand: Add the
 ->choose_interface_config() hook
Message-ID: <20200529133253.3039c38f@xps13>
In-Reply-To: <20200529133141.5410ea0a@collabora.com>
References: <20200529111322.7184-1-miquel.raynal@bootlin.com>
 <20200529111322.7184-23-miquel.raynal@bootlin.com>
 <20200529133141.5410ea0a@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_043300_288835_DA16F790 
X-CRM114-Status: GOOD (  13.40  )
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
 Richard Weinberger <richard@nod.at>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Boris Brezillon <boris.brezillon@collabora.com> wrote on Fri, 29 May
2020 13:31:41 +0200:

> On Fri, 29 May 2020 13:13:16 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > This hook can be overloaded by NAND manufacturer drivers to propose
> > alternative timings when not following the main standards. In this
> > case, the manufacturer drivers is responsible for choosing the best
> > interface configuration that fits both the controller and chip
> > capabilities.
> > 
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>  
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> > ---
> >  drivers/mtd/nand/raw/nand_base.c | 18 +++++++++++-------
> >  include/linux/mtd/rawnand.h      |  3 +++
> >  2 files changed, 14 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> > index 956a66fdccb8..2f4eba1a1082 100644
> > --- a/drivers/mtd/nand/raw/nand_base.c
> > +++ b/drivers/mtd/nand/raw/nand_base.c
> > @@ -1049,7 +1049,6 @@ int nand_choose_best_sdr_timings(struct nand_chip *chip,
> >  		}
> >  	}
> >  
> > -  
> 
> Still this unrelated blank line removal :-).

I'm doing too many massive rebases :-p
I'll drop it before applying.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
