Return-Path: <SRS0=lu4o=PI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B38EC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 08:56:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1873261004
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 08:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1873261004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lNbyDde5HzvmXaBu07TAvPi3VHGZXchyFt8DdT/McjA=; b=kq9FjpUMzfzE1D
	Q3rS+sRKHm7MdAZ7a6OMSdkvRfejoV+zgagfhypy0i9gBz5IoWiETLd/4LZahyq2lPbKqzUcY7931
	hgatR0lqOuYPdT1UP4xPI1hWR2HoEgQUSkIGotl6yeSiDm1YShoJAfTcWoVkzFbRxBLm7gQDwPNCR
	FfnZKNlAWtGgQdaGxEC+x809UyEL49siPB1IDVkPkPkxgT6RNFVtuzI/PC+/X9ntg5k8nxsGKG7E1
	Eov0R9q7bi/mc2UhuT/3qCahoku0lYTRRDigxl83ax03skb2RGGVd8m9Zq93NSnZ5QKlOa9zoT1P1
	jx3TXlkGHV0/+Wht4Tpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md7O6-003tqy-Ns; Wed, 20 Oct 2021 08:55:54 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md7O3-003tqN-VL
 for linux-mtd@lists.infradead.org; Wed, 20 Oct 2021 08:55:53 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 88FAC1F43D73;
 Wed, 20 Oct 2021 09:55:50 +0100 (BST)
Date: Wed, 20 Oct 2021 10:55:47 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] mtd: mtdconcat: add suspend lock handling
Message-ID: <20211020105547.23ed9324@collabora.com>
In-Reply-To: <20211020084534.2472305-5-sean@geanix.com>
References: <20211020084534.2472305-1-sean@geanix.com>
 <20211020084534.2472305-5-sean@geanix.com>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_015552_178060_22D927C5 
X-CRM114-Status: GOOD (  21.81  )
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

On Wed, 20 Oct 2021 10:45:34 +0200
Sean Nyekjaer <sean@geanix.com> wrote:

> Use MTD hooks to control suspend/resume of MTD devices.

Please explain in great details why this is needed.

> 
> Fixes: 013e6292aaf5 ("mtd: rawnand: Simplify the locking")
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>

This patch should be moved earlier (before 'mtd: core: protect access to
MTD devices while in suspend') in the series.

> ---
>  drivers/mtd/mtdconcat.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
> index f685a581df48..1ec36890118f 100644
> --- a/drivers/mtd/mtdconcat.c
> +++ b/drivers/mtd/mtdconcat.c
> @@ -566,9 +566,11 @@ static int concat_suspend(struct mtd_info *mtd)
>  
>  	for (i = 0; i < concat->num_subdev; i++) {
>  		struct mtd_info *subdev = concat->subdev[i];
> -		if ((rc = mtd_suspend(subdev)) < 0)
> +		rc = subdev->_suspend ? subdev->_suspend(subdev) : 0;
> +		if (rc < 0)
>  			return rc;

Same here, you need a fat comment explaining why mtd_suspend() is not
used.

>  	}
> +
>  	return rc;
>  }
>  
> @@ -579,7 +581,8 @@ static void concat_resume(struct mtd_info *mtd)
>  
>  	for (i = 0; i < concat->num_subdev; i++) {
>  		struct mtd_info *subdev = concat->subdev[i];
> -		mtd_resume(subdev);
> +		if (subdev->_resume)
> +			subdev->_resume(subdev);

Ditto.

>  	}
>  }
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
