Return-Path: <SRS0=FqwB=PN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2458C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 15:00:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81C8A60C4A
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 15:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81C8A60C4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KnCVNB32/gxKehd2INxCTYAiqbEflrs2MsXU4GOO1UU=; b=SAFI5DfmH3dRFT
	etAdTqzvDua8BzcNYs5YRtbuT9IhO2Qxq3XV20IcAhR3Gu48enTxXaJ5NxlukWLJPloLRIvsU2W3v
	EjDyg24ozL3mS2SUKx2XA6DMUNXtJ32nhHU1PyjQtF4TVaYLqHixl4SlLFq4mwbbEyhOjC0hGhAKf
	i9t25n7qX6QqIw97Q/B+N5XP81wsCz8NU6qFCLscFX4UFN0yf1Ud3CYNnl6DIRcDIp1GzXUppp+MU
	z0+uQhzEkZOXW9WJjqQX03wamGNixbVMCb+0CjOnVO4aebPIZM7yl396SYot2O7zSrmdyWvkKnK+c
	WKbbNkrWwUAUksErUNSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf1SQ-00GpHJ-7z; Mon, 25 Oct 2021 15:00:14 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf1SI-00Gp8f-Ch
 for linux-mtd@lists.infradead.org; Mon, 25 Oct 2021 15:00:08 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7B2BE1F41E71;
 Mon, 25 Oct 2021 16:00:02 +0100 (BST)
Date: Mon, 25 Oct 2021 16:59:57 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] mtd: mtdconcat: add suspend lock handling
Message-ID: <20211025165957.349a6580@collabora.com>
In-Reply-To: <20211025092752.2824678-3-sean@geanix.com>
References: <20211025092752.2824678-1-sean@geanix.com>
 <20211025092752.2824678-3-sean@geanix.com>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_080006_726646_B0D67EF6 
X-CRM114-Status: GOOD (  25.47  )
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

Hello Sean,

On Mon, 25 Oct 2021 11:27:50 +0200
Sean Nyekjaer <sean@geanix.com> wrote:

The subject is misleading, how about 'mtd: mtdconcat: Don't use
mtd_{suspend,resume}()'

> Use MTD hooks to control suspend/resume of MTD devices.
> concat_{suspend,resume} will be called from mtd_{suspend,resume},
> which already have taken the suspend/resume lock.
> It's safe to proceed with calling MTD device hooks directly from here.

"
The MTD suspend logic will soon be adjusted to automatically wait for
device wake-up before issuing IOs. In order to do that a new read-write
lock will be added and taken in write-mode in the
mtd_{suspend,resume}() path. Since mtdconcat.c itself is an MTD device,
calling mtd_suspend/resume() on subdevices from the mtdconcat
->_{suspend,resume}() hook will lead to a nested lock, which lockdep
will complain about if we don't add a proper annotation. Let's keep
things simple and replace those mtd_{suspend,resume}(subdev) calls by
subdev->_{suspend,resume}() ones to avoid this situation.
"

> 
> Fixes: 013e6292aaf5 ("mtd: rawnand: Simplify the locking")

Again, this commit doesn't fix anything.

> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>  drivers/mtd/mtdconcat.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
> index f685a581df48..37532f529820 100644
> --- a/drivers/mtd/mtdconcat.c
> +++ b/drivers/mtd/mtdconcat.c
> @@ -566,9 +566,15 @@ static int concat_suspend(struct mtd_info *mtd)
>  
>  	for (i = 0; i < concat->num_subdev; i++) {
>  		struct mtd_info *subdev = concat->subdev[i];
> -		if ((rc = mtd_suspend(subdev)) < 0)
> +		/*
> +		 * Call MTD hook directly from here,
> +		 * mtd_suspend() have the suspend/resume lock.

		/*
		 * Call the MTD hook directly to avoid a nested lock
		 * on ->suspend_lock.
		 */

> +		 */
> +		rc = subdev->_suspend ? subdev->_suspend(subdev) : 0;
> +		if (rc < 0)
>  			return rc;
>  	}
> +
>  	return rc;
>  }
>  
> @@ -579,7 +585,12 @@ static void concat_resume(struct mtd_info *mtd)
>  
>  	for (i = 0; i < concat->num_subdev; i++) {
>  		struct mtd_info *subdev = concat->subdev[i];
> -		mtd_resume(subdev);
> +		/*
> +		 * Call MTD hook directly from here,
> +		 * mtd_resume() have the suspend/resume lock.
> +		 */

Ditto.

> +		if (subdev->_resume)
> +			subdev->_resume(subdev);
>  	}
>  }
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
