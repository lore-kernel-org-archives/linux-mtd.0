Return-Path: <SRS0=q46N=OY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912BCC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 08:42:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EB9F6113D
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 08:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EB9F6113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xk9bYm0q1I+JwIgSLekuN690CFiOFxOab+xYqlVkckQ=; b=Y9eMh+0g/LArr1
	dt5pKLNCWBZe645OCGdfh6ssfM/jGuNQPh5GztMnFaqgGHXAFDsIWJHQm5xE97EIGTCoIqB+Ss082
	Ky29ebDtrr60xKwty09OaPyumgqvHeIU7IQ/7HGUy9wOh4MaYI8Y8+rVm4l+c7G2UOkz91ZTuOnfB
	8MFBoW1cmxBiEhHd6v4CGqsfwZwmoi5sBXmSgVFVtUEwWk626JA1x2tjswYtf5Xdbs7pCgROvYRiZ
	8iCjTJqRZCDMLRM6Nwq1q69QGZg7ySStnI84YLjbdM5ExSa2XjsrMiUXUPCeK6vnsEoC+2ZeXpgY1
	zzIT3woPba+vfu04NA9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXJXr-005eAn-4o; Mon, 04 Oct 2021 08:41:59 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXJXo-005eA6-5H
 for linux-mtd@lists.infradead.org; Mon, 04 Oct 2021 08:41:57 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2C20F1F422CA;
 Mon,  4 Oct 2021 09:41:52 +0100 (BST)
Date: Mon, 4 Oct 2021 10:41:47 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mtd: rawnand: use mutex to protect access while in
 suspend
Message-ID: <20211004104147.579f3b01@collabora.com>
In-Reply-To: <20211004065608.3190348-1-sean@geanix.com>
References: <20211004065608.3190348-1-sean@geanix.com>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_014156_391985_E43BC5C4 
X-CRM114-Status: GOOD (  28.79  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon,  4 Oct 2021 08:56:09 +0200
Sean Nyekjaer <sean@geanix.com> wrote:

> This will prevent nand_get_device() from returning -EBUSY.
> It will force mtd_write()/mtd_read() to wait for the nand_resume() to unlock
> access to the mtd device.
> 
> Then we avoid -EBUSY is returned to ubifsi via mtd_write()/mtd_read(),
> that will in turn hard error on every error returened.
> We have seen during ubifs tries to call mtd_write before the mtd device
> is resumed.

I think the problem is here. Why would UBIFS/UBI try to write something
to a device that's not resumed yet (or has been suspended already, if
you hit this in the suspend path).

> 
> Exec_op[0] speed things up, so we see this race when the device is
> resuming. But it's actually "mtd: rawnand: Simplify the locking" that
> allows it to return -EBUSY, before that commit it would have waited for
> the mtd device to resume.

Uh, wait. If nand_resume() was called before any writes/reads this
wouldn't happen. IMHO, the problem is not that we return -EBUSY without
blocking, the problem is that someone issues a write/read before calling
mtd_resume().

> 
> Tested on a iMX6ULL.
> 
> [0]:
> ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op")
> 
> Fixes: 013e6292aaf5 ("mtd: rawnand: Simplify the locking")
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
> 
> I did this a RFC as we probably will need to remove the suspended
> variable as it's kinda made obsolute by this change.
> Should we introduce a new mutex? Or maybe a spin_lock?
> 
>  drivers/mtd/nand/raw/nand_base.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 3d6c6e880520..0ea343404cac 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -4567,7 +4567,6 @@ static int nand_suspend(struct mtd_info *mtd)
>  		ret = chip->ops.suspend(chip);
>  	if (!ret)
>  		chip->suspended = 1;
> -	mutex_unlock(&chip->lock);

Hm, I'm not sure keeping the lock when you're in a suspended state
is a good idea. It just papers over another bug IMO (see above).

>  
>  	return ret;
>  }
> @@ -4580,7 +4579,6 @@ static void nand_resume(struct mtd_info *mtd)
>  {
>  	struct nand_chip *chip = mtd_to_nand(mtd);
>  
> -	mutex_lock(&chip->lock);
>  	if (chip->suspended) {
>  		if (chip->ops.resume)
>  			chip->ops.resume(chip);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
