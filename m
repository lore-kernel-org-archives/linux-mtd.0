Return-Path: <SRS0=/+zL=6W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE60C38A2A
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 17:21:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 481DF21775
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 17:21:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RKBsTooL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 481DF21775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Q/xcOH4nyZGZgBbt5C5hpWE9C1KaNxPzeG3jOVSSfA=; b=RKBsTooLoZWMQb
	ok3m2rLkZ7tkKMrM2wyxUrdrsP6jNBpmOwvPqiR+FAC+MZFPzWEypUFDR4vilgrVpQkewXK8KfVDm
	Y12ceYwptjLU2ulOePEL5+Lc17yGYdbyXIo7gX6lB4r2kXCVpbiJjduG0WPPh/b0aMEmPGPylIT7C
	92z1bHW2CBb15IiqBEGWRB3ZH44TceCGx8ODJq6fDFG7PlNMuZ8+Q3rXHxbYqONI1AWqhAfhWJwSX
	7oZSo0wR/PDPw5DSdJkhWw8fqA2BcNFtOxO8VD5zg1caWzpaIuxovAv5Qxy9z8OzdqqDX+zvavmRC
	7Y7u1hDrCV6f01qhSqOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jX6gA-0005hk-If; Fri, 08 May 2020 17:20:54 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jX6g7-0005hL-3O
 for linux-mtd@lists.infradead.org; Fri, 08 May 2020 17:20:52 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id BA91C240006;
 Fri,  8 May 2020 17:20:47 +0000 (UTC)
Date: Fri, 8 May 2020 19:20:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 4/8] mtd: rawnand: Add nand_extract_bits()
Message-ID: <20200508192046.0719c491@xps13>
In-Reply-To: <20200507161212.40551eb5@xps13>
References: <20200507110034.14736-1-miquel.raynal@bootlin.com>
 <20200507110034.14736-5-miquel.raynal@bootlin.com>
 <20200507134959.38bbcdc4@collabora.com>
 <20200507161212.40551eb5@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200508_102051_278582_7A98AE8A 
X-CRM114-Status: GOOD (  13.43  )
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
 Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Miquel Raynal <miquel.raynal@bootlin.com> wrote on Thu, 7 May 2020
16:12:12 +0200:

> Boris Brezillon <boris.brezillon@collabora.com> wrote on Thu, 7 May
> 2020 13:49:59 +0200:
> 
> > On Thu,  7 May 2020 13:00:30 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > There are cases where ECC bytes are not byte-aligned. Indeed, BCH
> > > implies using a number of ECC bits, which are not always a multiple of
> > > 8. We then need a helper like nand_extract_bits() to extract these
> > > syndromes from a buffer.    
> > 
> > Do you plan to send a patch to make the GPMI driver use this helper?  
> 
> I will have a look at it.

https://lists.infradead.org/pipermail/linux-mtd/2020-May/095836.html

Done :)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
