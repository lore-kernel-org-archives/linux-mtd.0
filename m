Return-Path: <SRS0=Hg3y=43=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4FCCC10DCE
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 19:41:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B87721655
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 19:41:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rLBT0//e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B87721655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dip07YOOD9C9JXsxxexLAwBy8CjjuGHd/yzOIlKoPxM=; b=rLBT0//e8QnfFr
	clQY1SNX+PdEQT1kttVW2fATiu3ezFQor4pDGKemy+QBAMhPWKAWsLmaM/moUTHwEfxTSfmHQKunU
	t8IQabUa9qzszfiellfuKyrxKAnt+0GhUyNDkYUkhO2EQ5FE3kYiOgDzs8eeNq9M/NRPlM5YpOslC
	OTe1vIBMof03EtGyL+ii6umGv+zkMTB9Dgc+kPTgX5DQ+DA/zCKpp67Zf/BZbagP3TqOBLgob0sZp
	HtOzmqvKYiF8F8tEBKAsfQ6zDcA1R9GR/W+1RybXP0hAgmcHloU8NL9h5ZlbM1uohSbJn4ofAsOPD
	63T0ka1V4LcxvdviqpdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBklD-0007ZN-SX; Tue, 10 Mar 2020 19:41:51 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBklA-0007Yv-T0
 for linux-mtd@lists.infradead.org; Tue, 10 Mar 2020 19:41:50 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 686A329196A;
 Tue, 10 Mar 2020 19:41:46 +0000 (GMT)
Date: Tue, 10 Mar 2020 20:41:42 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v3 3/4] mtd: rawnand: Add support manufacturer specific
 suspend/resume operation
Message-ID: <20200310204142.540fc7c4@collabora.com>
In-Reply-To: <20200310203930.2b8c0cfb@collabora.com>
References: <1583220084-10890-1-git-send-email-masonccyang@mxic.com.tw>
 <1583220084-10890-4-git-send-email-masonccyang@mxic.com.tw>
 <20200310203930.2b8c0cfb@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_124149_102900_5D8BA31C 
X-CRM114-Status: GOOD (  14.81  )
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
Cc: vigneshr@ti.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 richard@nod.at, s.hauer@pengutronix.de, yuehaibing@huawei.com,
 linux-kernel@vger.kernel.org, stefan@agner.ch, rfontana@redhat.com,
 linux-mtd@lists.infradead.org, frieder.schrempf@kontron.de,
 miquel.raynal@bootlin.com, tglx@linutronix.de, allison@lohutok.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 10 Mar 2020 20:39:30 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Tue,  3 Mar 2020 15:21:23 +0800
> Mason Yang <masonccyang@mxic.com.tw> wrote:
> 
> > Patch nand_suspend() & nand_resume() for manufacturer specific
> > suspend/resume operation.
> > 
> > Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  drivers/mtd/nand/raw/nand_base.c | 11 ++++++++---
> >  include/linux/mtd/rawnand.h      |  4 ++++
> >  2 files changed, 12 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> > index 769be81..b44e460 100644
> > --- a/drivers/mtd/nand/raw/nand_base.c
> > +++ b/drivers/mtd/nand/raw/nand_base.c
> > @@ -4327,7 +4327,9 @@ static int nand_suspend(struct mtd_info *mtd)
> >  	struct nand_chip *chip = mtd_to_nand(mtd);
> >  
> >  	mutex_lock(&chip->lock);
> > -	chip->suspended = 1;
> > +	if (chip->_suspend)
> > +		if (!chip->_suspend(chip))
> > +			chip->suspended = 1;

Shouldn't you propagate the error to the caller if chip->_suspend()
fails?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
