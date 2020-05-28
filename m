Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C67C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 15:04:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 270602075F
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 15:04:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dz2biHaA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 270602075F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=88V1uW1vaqFIizDR0xQL1JQIN5LA8Oqi289ERSGyFmQ=; b=dz2biHaAGLn4zf
	KRHr8e60AnTfav62K7wK07LP6mJdObVlUI1KVmBfN8/hs83wwDJvU5NlvfWN6xYS8/DP05dW4ah6a
	7Jb4NtUlAEsx/9kYYwl4Ysag2HO/XXdAq/Pd0qbkcbm4fvA3IHiyzYXMohub3muAOUXeNvgr1V/d8
	ysLdeuCyo2F2aQOJwQ9owxwoE/KfKMzLuJqlI+3nL18oHcu4cUc/hCZ3OG58Wcx6+oKHhsNOsN0HZ
	+I2FQirbP3S7DojJZxva/jI4SwaQfqK1ukaXWMtmfF3ntCnrbaTYraNYShRN9oMLaZ3GFe+Txy4QD
	HUeqHBOFBfTDkTgqvyMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeK4T-0000PQ-Ph; Thu, 28 May 2020 15:03:49 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeK3N-00087p-Uk; Thu, 28 May 2020 15:02:43 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 22B84240017;
 Thu, 28 May 2020 15:02:34 +0000 (UTC)
Date: Thu, 28 May 2020 17:02:33 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v6 14/18] mtd: nand: Add more parameters to the
 nand_ecc_props structure
Message-ID: <20200528170233.0b91986b@xps13>
In-Reply-To: <20200528170022.5cd5b46c@collabora.com>
References: <20200528113113.9166-1-miquel.raynal@bootlin.com>
 <20200528113113.9166-15-miquel.raynal@bootlin.com>
 <20200528163424.6677597c@collabora.com>
 <20200528165754.35985b62@xps13>
 <20200528170022.5cd5b46c@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_080242_291452_9280E557 
X-CRM114-Status: GOOD (  21.83  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, Paul Cercueil <paul@crapouillou.net>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, Chuanhong Guo <gch981213@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Boris Brezillon <boris.brezillon@collabora.com> wrote on Thu, 28 May
2020 17:00:22 +0200:

> On Thu, 28 May 2020 16:57:54 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > Boris Brezillon <boris.brezillon@collabora.com> wrote on Thu, 28 May
> > 2020 16:34:24 +0200:
> >   
> > > On Thu, 28 May 2020 13:31:09 +0200
> > > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > >     
> > > > Prepare the migration to the generic ECC framework by adding more
> > > > fields to the nand_ecc_props structure which will be used widely to
> > > > describe different kind of ECC properties.
> > > > 
> > > > Doing this imposes to move the engine type, ECC placement and
> > > > algorithm enumerations in a shared place: nand.h.
> > > > 
> > > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > > ---
> > > >  include/linux/mtd/nand.h    | 52 +++++++++++++++++++++++++++++++++++++
> > > >  include/linux/mtd/rawnand.h | 44 -------------------------------
> > > >  2 files changed, 52 insertions(+), 44 deletions(-)
> > > > 
> > > > diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> > > > index 6add464fd18b..2e9af24936cd 100644
> > > > --- a/include/linux/mtd/nand.h
> > > > +++ b/include/linux/mtd/nand.h
> > > > @@ -127,14 +127,66 @@ struct nand_page_io_req {
> > > >  	int mode;
> > > >  };
> > > >  
> > > > +/**
> > > > + * enum nand_ecc_engine_type - NAND ECC engine type
> > > > + * @NAND_ECC_ENGINE_TYPE_INVALID: Invalid value
> > > > + * @NAND_ECC_ENGINE_TYPE_NONE: No ECC correction
> > > > + * @NAND_ECC_ENGINE_TYPE_SOFT: Software ECC correction
> > > > + * @NAND_ECC_ENGINE_TYPE_ON_HOST: On host hardware ECC correction
> > > > + * @NAND_ECC_ENGINE_TYPE_ON_DIE: On chip hardware ECC correction
> > > > + */
> > > > +enum nand_ecc_engine_type {
> > > > +	NAND_ECC_ENGINE_TYPE_INVALID,
> > > > +	NAND_ECC_ENGINE_TYPE_NONE,
> > > > +	NAND_ECC_ENGINE_TYPE_SOFT,
> > > > +	NAND_ECC_ENGINE_TYPE_ON_HOST,
> > > > +	NAND_ECC_ENGINE_TYPE_ON_DIE,
> > > > +};
> > > > +
> > > > +/**
> > > > + * enum nand_ecc_placement - NAND ECC bytes placement
> > > > + * @NAND_ECC_PLACEMENT_UNKNOWN: The actual position of the ECC bytes is unknown
> > > > + * @NAND_ECC_PLACEMENT_OOB: The ECC bytes are located in the OOB area
> > > > + * @NAND_ECC_PLACEMENT_INTERLEAVED: Syndrome layout, there are ECC bytes
> > > > + *                                  interleaved with regular data in the main
> > > > + *                                  area
> > > > + */
> > > > +enum nand_ecc_placement {
> > > > +	NAND_ECC_PLACEMENT_UNKNOWN,
> > > > +	NAND_ECC_PLACEMENT_OOB,
> > > > +	NAND_ECC_PLACEMENT_INTERLEAVED,
> > > > +};
> > > > +
> > > > +/**
> > > > + * enum nand_ecc_algo - NAND ECC algorithm
> > > > + * @NAND_ECC_ALGO_UNKNOWN: Unknown algorithm
> > > > + * @NAND_ECC_ALGO_HAMMING: Hamming algorithm
> > > > + * @NAND_ECC_ALGO_BCH: Bose-Chaudhuri-Hocquenghem algorithm
> > > > + * @NAND_ECC_ALGO_RS: Reed-Solomon algorithm
> > > > + */
> > > > +enum nand_ecc_algo {
> > > > +	NAND_ECC_ALGO_UNKNOWN,
> > > > +	NAND_ECC_ALGO_HAMMING,
> > > > +	NAND_ECC_ALGO_BCH,
> > > > +	NAND_ECC_ALGO_RS,
> > > > +};
> > > > +
> > > >  /**
> > > >   * struct nand_ecc_props - NAND ECC properties
> > > > + * @engine_type: ECC engine type
> > > > + * @placement: OOB placement (if relevant)
> > > > + * @algo: ECC algorithm (if relevant)
> > > >   * @strength: ECC strength
> > > >   * @step_size: Number of bytes per step
> > > > + * @flags: Misc properties      
> > > 
> > > I'd like to hear more about that one. What is this about? I'd rather
> > > not add a field if it's not needed.
> > >     
> > 
> > It is used in patch 18/18 to store the NAND_ECC_MAXIMIZE flag. And I
> > expect others to come later...  
> 
> Then I think it should be introduced in this patch, not here.

I'm fine with that.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
