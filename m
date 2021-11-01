Return-Path: <SRS0=1Z3h=PU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B4F0C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Nov 2021 07:39:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C95660E90
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Nov 2021 07:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C95660E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=25IVivz8DwnFgzt8eKgBfIHiGNv/BtofgaW7r4wvPLo=; b=4oCHjwUYYBoLFw
	lTACixBgywkTZhKPM6tWRzs+mNUB0KVLT12miMy4H1XhewFhaRGnS4wFBK8fETL08D6pABz7reEow
	Q5CC6WDPUmAuv4nAJv46AVwNDI/QwRO4eg39hwQT4VKmaEmk9CQl59MKP+vS72RG7Sr2puryiLgzX
	/iQ01NTVYQR8/QrDGlIWQLXCxeCzDw8JWrqg3T9SSetyV/pXTNAkPc8eT58xEiXlcuIoJ7lm2kYO+
	SSSq8BDa3/dV1b1AK2vS9EVTnhJeNEfZ21KIDKw+Lo5Tp7rHcovfB6Y8SLwKQqKVPtqQV3A3xgM0o
	zPmVc4Nh/khAFAL9HR+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhRtv-00FYkH-LZ; Mon, 01 Nov 2021 07:38:39 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhRts-00FYjn-Jb
 for linux-mtd@lists.infradead.org; Mon, 01 Nov 2021 07:38:38 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 19EDD1F438BB;
 Mon,  1 Nov 2021 07:38:33 +0000 (GMT)
Date: Mon, 1 Nov 2021 08:38:24 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mtd: rawnand: nand_bbt: hide suspend/resume
 hooks while scanning bbt
Message-ID: <20211101083824.236b9983@collabora.com>
In-Reply-To: <20211026055551.3053598-2-sean@geanix.com>
References: <20211026055551.3053598-1-sean@geanix.com>
 <20211026055551.3053598-2-sean@geanix.com>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_003836_838537_61AC1A57 
X-CRM114-Status: GOOD (  27.43  )
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

On Tue, 26 Oct 2021 07:55:48 +0200
Sean Nyekjaer <sean@geanix.com> wrote:

> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> The BBT scan logic use the MTD helpers before the MTD layer had a
> chance to initialize the device, and that leads to issues when
> accessing the uninitialized suspend lock. Let's temporarily set the
> suspend/resume hooks to NULL to skip the lock acquire/release step.
> 
> Fixes: 013e6292aaf5 ("mtd: rawnand: Simplify the locking")

I think I already mentioned this Fixes tag should not be there.

> Tested-by: Sean Nyekjaer <sean@geanix.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>  drivers/mtd/nand/raw/nand_bbt.c | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
> index b7ad030225f8..93d385703469 100644
> --- a/drivers/mtd/nand/raw/nand_bbt.c
> +++ b/drivers/mtd/nand/raw/nand_bbt.c
> @@ -1397,8 +1397,28 @@ static int nand_create_badblock_pattern(struct nand_chip *this)
>   */
>  int nand_create_bbt(struct nand_chip *this)
>  {
> +	struct mtd_info *mtd = nand_to_mtd(this);
> +	int (*suspend) (struct mtd_info *) = mtd->_suspend;
> +	void (*resume) (struct mtd_info *) = mtd->_resume;
>  	int ret;
>  
> +	/*
> +	 * The BBT scan logic use the MTD helpers before the MTD layer had a
> +	 * chance to initialize the device, and that leads to issues when
> +	 * accessing the uninitialized suspend lock. Let's temporarily set the
> +	 * suspend/resume hooks to NULL to skip the lock acquire/release step.
> +	 *
> +	 * FIXME: This is an ugly hack, so please don't copy this pattern to
> +	 * other MTD implementations. The proper fix would be to implement a
> +	 * generic BBT scan logic at the NAND level that's not using any of the
> +	 * MTD helpers to access pages. We also might consider doing a two
> +	 * step initialization at the MTD level (mtd_device_init() +
> +	 * mtd_device_register()) so some of the fields are initialized
> +	 * early.
> +	 */
> +	mtd->_suspend = NULL;
> +	mtd->_resume = NULL;
> +
>  	/* Is a flash based bad block table requested? */
>  	if (this->bbt_options & NAND_BBT_USE_FLASH) {
>  		/* Use the default pattern descriptors */
> @@ -1422,7 +1442,13 @@ int nand_create_bbt(struct nand_chip *this)
>  			return ret;
>  	}
>  
> -	return nand_scan_bbt(this, this->badblock_pattern);
> +	ret = nand_scan_bbt(this, this->badblock_pattern);
> +
> +	/* Restore the suspend/resume hooks. */
> +	mtd->_suspend = suspend;
> +	mtd->_resume = resume;
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL(nand_create_bbt);
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
