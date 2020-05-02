Return-Path: <SRS0=DU2W=6Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B86AC3A5A9
	for <linux-mtd@archiver.kernel.org>; Sat,  2 May 2020 13:18:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2114721974
	for <linux-mtd@archiver.kernel.org>; Sat,  2 May 2020 13:18:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ggjut5+p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2114721974
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WzZyo4TyS5zKwrAkQKeaCZNf44J31odSmaq2sN4R3Lg=; b=ggjut5+pJjTIfM
	PyPKQSUsgEP9C9x7oqTMPeD5d7cho+QucIW1uBZLbfkoS/KUSZnsiA3c0yiBT271kLdE/a/JDoh0N
	KlMmDs39hyG5QG4KOLYKlf0y+WVqmd3K+iazdSPW5GZJgEGkVXMG6KNIUSm3Szof6kCYeGjx+4uXT
	4P7UI4r5Lws+YecNimgcfU0AyijUWB+BUDbrgiFJ1UFbTmNQUYazEL+iYc7UMUwXWfyVgc6fCmcHQ
	X22ZKGA+xphGs/DWAEgMGZhlhIZr6sfh3w78zWRP0xQm6c568Zoxce+sFNxklnF3U+KeUXs16nLp0
	hC+yQbNSccqXuOvN385g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUs27-0001np-HS; Sat, 02 May 2020 13:18:19 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUs24-0001n9-9t
 for linux-mtd@lists.infradead.org; Sat, 02 May 2020 13:18:18 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A607C27F310;
 Sat,  2 May 2020 14:18:14 +0100 (BST)
Date: Sat, 2 May 2020 15:18:11 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH 13/17] mtd: rawnand: cafe: Add exec_op() support
Message-ID: <20200502151811.328eebb0@collabora.com>
In-Reply-To: <20200502111410.330584-1-lkundrak@v3.sk>
References: <20200427082028.394719-14-boris.brezillon@collabora.com>
 <20200502111410.330584-1-lkundrak@v3.sk>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200502_061816_480283_9579147E 
X-CRM114-Status: GOOD (  22.93  )
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat,  2 May 2020 13:14:10 +0200
Lubomir Rintel <lkundrak@v3.sk> wrote:

> Boris Brezillon wrote:
> > Implementing exec_op() will help us get rid of the legacy interface and
> > should make drivers much cleaner too.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/mtd/nand/raw/cafe_nand.c | 137 ++++++++++++++++++++++++++++++-
> >  1 file changed, 136 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
> > index edf65197604b..ada9c8b06a41 100644
> > --- a/drivers/mtd/nand/raw/cafe_nand.c
> > +++ b/drivers/mtd/nand/raw/cafe_nand.c  
> ...
> 
> > +	ret = readl_poll_timeout(cafe->mmio + CAFE_NAND_IRQ, status,
> > +				 (status & wait) == wait, 1, USEC_PER_SEC);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (ctrl1 & CAFE_NAND_DMA_CTRL_DATA_IN)  
>                     ^^^^^^^^^^^^^^^^^^^^^^^^^^
> s/CAFE_NAND_DMA_CTRL_DATA_IN/CAFE_NAND_CTRL1_HAS_DATA_IN/ here please.
> 
> 
> > +		cafe_read_buf(chip, data_instr->ctx.data.buf.in,
> > +			      data_instr->ctx.data.len);
> > +
> > +	return 0;
> > +}  
> ...
> 
> Other than that, when DMA is in use, only CAFE_NAND_IRQ_DMA_DONE seem to pop
> up in CAFE_NAND_IRQ when the command completes, not CAFE_NAND_IRQ_CMD_DONE.
> I suppose you ought to do this or something equivalent:

I suspect it has to do with the fact that you might have operations with
DATA_IN() instructions only. I pushed an alternate fix [1] to my branch.
Would you mind testing it?

> 
> diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
> index 307c9a68afa9..356a07e61c88 100644
> --- a/drivers/mtd/nand/raw/cafe_nand.c
> +++ b/drivers/mtd/nand/raw/cafe_nand.c
> @@ -778,7 +778,7 @@ static int cafe_nand_exec_subop(struct nand_chip *chip,
>  {
>         struct cafe_priv *cafe = nand_get_controller_data(chip);
>         u32 ctrl1 = 0, ctrl2 = cafe->ctl2, addr1 = 0, addr2 = 0;
> -       u32 status, wait = CAFE_NAND_IRQ_CMD_DONE;
> +       u32 status, wait = 0;
>         int ret, data_instr = -1;
>         bool waitrdy = false;
>         unsigned int i, j;
> @@ -856,6 +856,8 @@ static int cafe_nand_exec_subop(struct nand_chip *chip,
>                         dmactrl |= CAFE_NAND_DMA_CTRL_DATA_IN;
>  
>                 cafe_writel(cafe, dmactrl, NAND_DMA_CTRL);
> +       } else {
> +               wait |= CAFE_NAND_IRQ_CMD_DONE;
>         }
>  
>         /* Clear the pending interrupts before starting the operation. */
> 
> cafe_nand_cmdfunc() seems to do the same thing (note the "=" instead of
> "|=") though the use of word "just" in the comment is somewhat misleading:
> 
>  244 static void cafe_nand_cmdfunc(struct nand_chip *chip, unsigned command,
>  245                               int column, int page_addr)
>  246 {
>  ...
>  359                 /* If WR or RD bits set, set up DMA */
>  360                 if (ctl1 & CAFE_NAND_CTRL1_HAS_DATA_IN) {
>  361                         /* It's a read */
>  362                         dmactl |= CAFE_NAND_DMA_CTRL_DATA_IN;
>  363                         /* ... so it's done when the DMA is done, not just
>  364                            the command. */
>  365                         doneint = CAFE_NAND_IRQ_DMA_DONE;
>  366                 }
> 
> With the changes I suggested above, you can add:
> 
> Reviewed-by: Lubomir Rintel <lkundrak@v3.sk>
> 
> Thank you!
> Lubo

[1]https://github.com/bbrezillon/linux/commit/ecf93c3c2e94ab0710babe856f272ff2e8b2a35b

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
