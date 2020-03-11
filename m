Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72293C10F27
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 08:01:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41EA9205C9
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 08:01:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sDBTo6oA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41EA9205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K53xXOwMu6tFPH3KSZHs+gWjtPFsCI+ZrCeshItUL7I=; b=sDBTo6oAbziAks
	9RXFr0lZ3OVru3Frudb0hT100fii4bGSip7WaFR6W38s2/5H7j2axg8y7rbMZ9RxdH8o/DAD/Jeos
	+uynbc1nKr+GMEv5dEhp/MvSuaJpU6GbyLWdWBTvcYHXjTnV5R19dxlvLnOXlMAgaTwwPRB3Z0uQG
	zy1pY7jj+6lAa+z71/3dTtC0EdtdFKw6jwXmfuDsRCCql3vBBtPtOyCPtAtV2hCHDq7nP3GFfYh34
	rWsYGxh8clhRf16LqIEUrm85cvm6YMZG+CApF1zDEHWD+4zFwqm12wGjl5sy74KuSW9StcnuFK1tU
	oodtawv1lEBIGjw1nmuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBwIe-0006UX-SP; Wed, 11 Mar 2020 08:01:08 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBwIc-0006U0-Gz
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 08:01:07 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4C6DA28FD50;
 Wed, 11 Mar 2020 08:01:04 +0000 (GMT)
Date: Wed, 11 Mar 2020 09:01:01 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH v3 3/4] mtd: rawnand: Add support manufacturer specific
 suspend/resume operation
Message-ID: <20200311090101.5ac66997@collabora.com>
In-Reply-To: <OF4AD2D1A1.2B35FBFA-ON48258528.0021AD65-48258528.00223C9B@mxic.com.tw>
References: <1583220084-10890-1-git-send-email-masonccyang@mxic.com.tw>
 <1583220084-10890-4-git-send-email-masonccyang@mxic.com.tw>
 <20200310203930.2b8c0cfb@collabora.com>
 <20200310204142.540fc7c4@collabora.com>
 <OF4AD2D1A1.2B35FBFA-ON48258528.0021AD65-48258528.00223C9B@mxic.com.tw>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_010106_696284_30C0C685 
X-CRM114-Status: GOOD (  15.31  )
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
 linux-kernel@vger.kernel.org, frieder.schrempf@kontron.de, rfontana@redhat.com,
 linux-mtd@lists.infradead.org, stefan@agner.ch, miquel.raynal@bootlin.com,
 tglx@linutronix.de, allison@lohutok.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 11 Mar 2020 14:13:57 +0800
masonccyang@mxic.com.tw wrote:

> Hi Boris,
> 
> > > > ---
> > > >  drivers/mtd/nand/raw/nand_base.c | 11 ++++++++---
> > > >  include/linux/mtd/rawnand.h      |  4 ++++
> > > >  2 files changed, 12 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/mtd/nand/raw/nand_base.c   
> b/drivers/mtd/nand/raw/nand_base.c
> > > > index 769be81..b44e460 100644
> > > > --- a/drivers/mtd/nand/raw/nand_base.c
> > > > +++ b/drivers/mtd/nand/raw/nand_base.c
> > > > @@ -4327,7 +4327,9 @@ static int nand_suspend(struct mtd_info *mtd)
> > > >     struct nand_chip *chip = mtd_to_nand(mtd);
> > > > 
> > > >     mutex_lock(&chip->lock);
> > > > -   chip->suspended = 1;
> > > > +   if (chip->_suspend)
> > > > +      if (!chip->_suspend(chip))
> > > > +         chip->suspended = 1;  
> > 
> > Shouldn't you propagate the error to the caller if chip->_suspend()
> > fails?  
> 
> Currently, chip->suspend() just do sending command to nand chip and
> I think caller could check chip->suspend = 1 or 0 to know the status
> of nand chip.

No, it can't. The caller (AKA the MTD layer) has no idea about this
chip->suspend field, actually it doesn't even know about the nand_chip
struct. The mtd->_suspend() hook is here to abstract HW details, so
it's the raw NAND framework responsibility to propagate the error code
returned by chip->suspend().

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
