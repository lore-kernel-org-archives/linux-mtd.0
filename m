Return-Path: <SRS0=sMU9=O7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDDFFC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 13:59:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 972FA61211
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 13:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 972FA61211
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dvz/bCCE/cvDIMUMA/a06jtw7NWwPytMWo/P33BHM3k=; b=3AkvdyivQATJPL
	gKZKsB/EmB3+k6uR775oKfWrPkOSZZqfpEJ1idj/Os+1ay3qxZpPtLsWEeZYYhAYXCPS1gpTlTA0e
	xXS84oZbfBTdvKo0kPGfv7IBauz3jZOP2smr8Vg9knM5pAguCHtzevL3ZetRTnbJ9A55k6M9kAr4Q
	fuPTjLVcifIfqTFDUuKJkM+528BSQ+l68I2apq4p0dJLPldL6/y99qn1CeoKUbItReNyBUcPhMb2b
	1Oj9jqZi/yo3BQd3+287OygKEBMmkCfTKlq6fw/Bospnw8/U0CiNGaWXfsKigWhwTHr3wDmLqxcmm
	NrKkwew3Q+gjZ7UD0vlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZvoi-009gRv-ON; Mon, 11 Oct 2021 13:58:12 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZvog-009gR6-Ga
 for linux-mtd@lists.infradead.org; Mon, 11 Oct 2021 13:58:11 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F04FC1F42D7B;
 Mon, 11 Oct 2021 14:58:08 +0100 (BST)
Date: Mon, 11 Oct 2021 15:58:05 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] mtd: mtdconcat: add suspend lock handling
Message-ID: <20211011155805.7793ad21@collabora.com>
In-Reply-To: <20211011115253.38497-4-sean@geanix.com>
References: <20211011115253.38497-1-sean@geanix.com>
 <20211011115253.38497-4-sean@geanix.com>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_065810_714796_16F37F50 
X-CRM114-Status: GOOD (  22.01  )
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

On Mon, 11 Oct 2021 13:52:53 +0200
Sean Nyekjaer <sean@geanix.com> wrote:

> Use new suspend lock handling for this special case for concatenated
> MTD devices.
> 
> Fixes: 013e6292aaf5 ("mtd: rawnand: Simplify the locking")
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>  drivers/mtd/mtdconcat.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
> index f685a581df48..c497c851481f 100644
> --- a/drivers/mtd/mtdconcat.c
> +++ b/drivers/mtd/mtdconcat.c
> @@ -561,25 +561,32 @@ static void concat_sync(struct mtd_info *mtd)
>  
>  static int concat_suspend(struct mtd_info *mtd)
>  {
> +	struct mtd_info *master = mtd_get_master(mtd);
>  	struct mtd_concat *concat = CONCAT(mtd);
>  	int i, rc = 0;
>  
>  	for (i = 0; i < concat->num_subdev; i++) {
>  		struct mtd_info *subdev = concat->subdev[i];
> -		if ((rc = mtd_suspend(subdev)) < 0)
> +
> +		down_write(&master->master.suspend_lock);

You should definitely not take the concat lock here, the framework does
it for you, so all you'll get is a deadlock.

> +		if ((rc = __mtd_suspend(subdev)) < 0)
>  			return rc;

You're returning with the lock held => DEADLOCK next time you try to
acquire it.

Anyway, as mentioned in my review of patch 1, I'd go for this ad-hoc
solution:


	for (i = 0; i < concat->num_subdev; i++) {
		rc = subdev->_suspend ? subdev->_suspend(subdev) : 0;
		if (rc < 0)
			return rc;
	}

	return 0;

> +		up_write(&master->master.suspend_lock);
>  	}
>  	return rc;
>  }
>  
>  static void concat_resume(struct mtd_info *mtd)
>  {
> +	struct mtd_info *master = mtd_get_master(mtd);
>  	struct mtd_concat *concat = CONCAT(mtd);
>  	int i;
>  
>  	for (i = 0; i < concat->num_subdev; i++) {
>  		struct mtd_info *subdev = concat->subdev[i];
> -		mtd_resume(subdev);
> +		down_write(&master->master.suspend_lock);
> +		__mtd_resume(subdev);
> +		up_write(&master->master.suspend_lock);
>  	}

No down/up_write() needed:

  	for (i = 0; i < concat->num_subdev; i++) {
  		struct mtd_info *subdev = concat->subdev[i];
		if (subdev->_resume)
			subdev->_resume(subdev);

	}
>  }
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
