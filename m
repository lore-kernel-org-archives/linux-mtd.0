Return-Path: <SRS0=zMTj=7Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 552E4C433DF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 13:05:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F087120679
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 13:05:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kyAvrJh5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F087120679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gj/1rKyIYQ8Fo/JYqZaWeyiHLuBESWOhxAL49o4f1wc=; b=kyAvrJh5yEyYC4
	Bo4okR9Jop6qz8mVlCuchRGkhFFzUV24TnYZqMGxU/VQHZE4LXx6IH4HXes4yFqFhtfnOIIFDPwOM
	hKcJAXteLpqNe4nUituXT08nT+DYqbNSyniqSva15oF2Kjw3P5vRUkAajk3WfEKWe42etANN33Z9l
	gF8/omeLeIu39c+GzI/7QfjDCYs7NnVo7Mn2D1hGgeaG7uj/qmCDm2uefas392biW5wTgD3H5BDUQ
	85b5wIoVMFBg2VPfHb4JW0dbljZSBJgsWBnZ9xw6cfJmIVYStD6n6hnVqlJamnQFuN5xhXCmeol89
	OZjb9MNkLEil6G4eLhRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgT5C-0006uD-B3; Wed, 03 Jun 2020 13:05:26 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgT51-0005uI-Av; Wed, 03 Jun 2020 13:05:17 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BC0842A06D5;
 Wed,  3 Jun 2020 14:05:08 +0100 (BST)
Date: Wed, 3 Jun 2020 15:05:05 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v9 9/9] mtd: rawnand: Move the user input parsing bits
 to the ECC framework
Message-ID: <20200603150505.2ca4604c@collabora.com>
In-Reply-To: <20200603145833.3f80ef6d@xps13>
References: <20200602143124.29553-1-miquel.raynal@bootlin.com>
 <20200602143124.29553-10-miquel.raynal@bootlin.com>
 <20200602182157.26716f89@collabora.com>
 <20200603145833.3f80ef6d@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_060515_529458_87D38885 
X-CRM114-Status: GOOD (  11.52  )
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
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 3 Jun 2020 14:58:33 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Boris Brezillon <boris.brezillon@collabora.com> wrote on Tue, 2 Jun
> 2020 18:21:57 +0200:
> 
> > On Tue,  2 Jun 2020 16:31:24 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > +void nand_ecc_read_user_conf(struct nand_device *nand)    
> > 
> > This function is not introduced in this patch, but I'm commenting here.
> > Looks like it only operates on an OF node, so how about naming it
> > of_get_nand_ecc_config().  
> 
> of_get_nand_ecc_user_config()? I'd like to mention "user" because
> "config" is way too vague given the number of possible configuration
> sources.

Works for me.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
