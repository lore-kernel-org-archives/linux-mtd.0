Return-Path: <SRS0=FC8N=XZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A2FC388F3
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2019 16:25:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E97662075D
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2019 16:25:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ewqfpiTQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E97662075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0/h6jLea3lEj8JqBrKOi1LNL8fYl58ntIdc9yPlNk4k=; b=ewqfpiTQGqkyx6
	eOECXSCFyZW2WrK0dbsQ4Z9TiFGtyYvYl/Z44FiiONpFvCsjvCyUSns17yqmFtpi24T+UkOAlvam6
	ZMud+J0cPHXYAK/keROgw8Y/uvk5JMSyTFkt93Z8WIP3p0Yt+PKbfeZqUzUl6WGMxFmz3uTl0XS/J
	fw1spOCiWw4GpATCdCiesrG2S1m0tmwItZDs0o+f8AA7STINSsWTXeh8rlrpSaUL94MdcCroBZ8/4
	dtHHd9WHTef37aR8zn6juNjPQcfKSv0c0v6ph6unzaxomXDZY2uf5PdWq4mE1Gnp+uE6ppWITv6Zp
	oGvByIM7xBPkWCA/QQdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iEyUA-0002oh-Vk; Mon, 30 Sep 2019 16:25:18 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iEyU6-0002nj-MI
 for linux-mtd@lists.infradead.org; Mon, 30 Sep 2019 16:25:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbrezillon) with ESMTPSA id E4C0128DF82
Date: Mon, 30 Sep 2019 18:24:58 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: use bounce buffer when vmalloced data
 buf detected
Message-ID: <20190930182458.761e8077@collabora.com>
In-Reply-To: <CAC=U0a1qvKO+t_62df_JcQBETAuNq0pwRkAb-Ofi3ski2rfdEQ@mail.gmail.com>
References: <20190906194719.15761-1-kdasu.kdev@gmail.com>
 <20190906194719.15761-2-kdasu.kdev@gmail.com>
 <CAC=U0a1qvKO+t_62df_JcQBETAuNq0pwRkAb-Ofi3ski2rfdEQ@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190930_092514_995136_570A02B0 
X-CRM114-Status: GOOD (  18.08  )
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
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Marek Vasut <marek.vasut@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 30 Sep 2019 12:01:28 -0400
Kamal Dasu <kdasu.kdev@gmail.com> wrote:

> Does anyone have any comments on this patch ?.
> 
> Kamal
> 
> On Fri, Sep 6, 2019 at 3:49 PM Kamal Dasu <kdasu.kdev@gmail.com> wrote:
> >
> > For controller drivers that use DMA and set NAND_USE_BOUNCE_BUFFER
> > option use data buffers that are not vmalloced, aligned and have
> > valid virtual address to be able to do DMA transfers. This change
> > adds additional check and makes use of data buffer allocated
> > in nand_base driver when it is passed a vmalloced data buffer for
> > DMA transfers.
> >
> > Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> > ---
> >  drivers/mtd/nand/raw/nand_base.c | 14 ++++++++------
> >  1 file changed, 8 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> > index 91f046d4d452..46f6965a896a 100644
> > --- a/drivers/mtd/nand/raw/nand_base.c
> > +++ b/drivers/mtd/nand/raw/nand_base.c
> > @@ -45,6 +45,12 @@
> >
> >  #include "internals.h"
> >
> > +static int nand_need_bounce_buf(const void *buf, struct nand_chip *chip)
> > +{
> > +       return !virt_addr_valid(buf) || is_vmalloc_addr(buf) ||

I thought virt_addr_valid() was implying !is_vmalloc_addr(), are you
sure you need that test, and can you tell me on which arch(es) this is
needed.

> > +               !IS_ALIGNED((unsigned long)buf, chip->buf_align);
> > +}
> > +
> >  /* Define default oob placement schemes for large and small page devices */
> >  static int nand_ooblayout_ecc_sp(struct mtd_info *mtd, int section,
> >                                  struct mtd_oob_region *oobregion)
> > @@ -3183,9 +3189,7 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
> >                 if (!aligned)
> >                         use_bufpoi = 1;
> >                 else if (chip->options & NAND_USE_BOUNCE_BUFFER)
> > -                       use_bufpoi = !virt_addr_valid(buf) ||
> > -                                    !IS_ALIGNED((unsigned long)buf,
> > -                                                chip->buf_align);
> > +                       use_bufpoi = nand_need_bounce_buf(buf, chip);
> >                 else
> >                         use_bufpoi = 0;
> >
> > @@ -4009,9 +4013,7 @@ static int nand_do_write_ops(struct nand_chip *chip, loff_t to,
> >                 if (part_pagewr)
> >                         use_bufpoi = 1;
> >                 else if (chip->options & NAND_USE_BOUNCE_BUFFER)
> > -                       use_bufpoi = !virt_addr_valid(buf) ||
> > -                                    !IS_ALIGNED((unsigned long)buf,
> > -                                                chip->buf_align);
> > +                       use_bufpoi = nand_need_bounce_buf(buf, chip);
> >                 else
> >                         use_bufpoi = 0;
> >
> > --
> > 2.17.1
> >  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
