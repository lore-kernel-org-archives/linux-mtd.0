Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3D1ECAAD5
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Sep 2022 14:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XNFoMDLa7VkvZShuSGI4x8WFYGJuB4fFi2sMvLyVVUg=; b=Fr4kSD912vngIFOn1xbQVZR4V3
	x3bceijvT470MD8VwPCXcY4wDlowPtaqJ5qpZpj4itRkJvXouvMNrVlUb49DroqVT7rMIWWR2fx1i
	VCNuQ3AkZJBNf2jwJvWm1tzt6PezfPRBSM2UcwAHP+rzWAfUb2s2SMZkzDkuuCBjcHETlI+o8qfwt
	zO+uglhClKILvWZaA7+r+Jz2AAYBECAaKzCr57uKmr9RXEVrvhKmrY+uqjNErvuuru48grpLaCnsW
	TaX0fGlMDCTJKl8gSbvu30PFncOM0Y0d4I8woMIexXHgO/LGrJokuI1eHtRsw75M/G00tWdRf3pUQ
	XhCDNrvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU7Es-005M9r-Hg; Fri, 02 Sep 2022 14:01:42 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU7Eq-005M6b-3g
	for linux-mtd@lists.infradead.org; Fri, 02 Sep 2022 14:01:41 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 426D9216B;
	Fri,  2 Sep 2022 16:01:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1662127296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HAwDC+ZGNEoPxSWgUlrI5jj7H9smOzKu5zWicRxfk50=;
	b=zluc78GHr8brCngTJtcQTa2rPxwNrKKDUQhKENNFnSV5m+0WfG9zhi0Ib39upNLHQw4lnp
	FLOtloAKdpdkLMgbV2EbEN1DrCvP4OgdPwFk69E6S1bZR1DVZo7NDbwXZIAAlSTV8ra7/i
	1U1ugFa0cnnSbyTREqUTPUCVi8P57qMXyWoxK2fSFHRUI4o16BlSG2WGEbmM4iBTnvL+4r
	uC6/c5Xp0NZtfhBPABMwkvA0NX9k+2X1D3w1FfM7EJcOAMqGs2OEHZs0/lc3xwDVP49tC3
	OzbQ7xnabN2KChxSZ4ON7e2cZOnBu1c5JeaLTS5ZL53K7vcGnfGB+9MZ55Kqfg==
MIME-Version: 1.0
Date: Fri, 02 Sep 2022 16:01:36 +0200
From: Michael Walle <michael@walle.cc>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: tudor.ambarus@microchip.com, pratyush@kernel.org,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, stable <stable@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: fix memory leak when using debugfs_lookup()
In-Reply-To: <20220902133724.278133-1-gregkh@linuxfoundation.org>
References: <20220902133724.278133-1-gregkh@linuxfoundation.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <bcd0cc5153457fb52566519a76e7b5b4@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_070140_390418_5946E7A9 
X-CRM114-Status: GOOD (  19.59  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Am 2022-09-02 15:37, schrieb Greg Kroah-Hartman:
> When calling debugfs_lookup() the result must have dput() called on it,
> otherwise the memory will leak over time.  Fix this up to be much
> simpler logic and only create the root debugfs directory once when the
> driver is first accessed.  That resolves the memory leak and makes
> things more obvious as to what the intent is.
> 
> Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
> Cc: Pratyush Yadav <pratyush@kernel.org>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: stable <stable@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/mtd/spi-nor/debugfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/debugfs.c 
> b/drivers/mtd/spi-nor/debugfs.c
> index df76cb5de3f9..3aab595e82d1 100644
> --- a/drivers/mtd/spi-nor/debugfs.c
> +++ b/drivers/mtd/spi-nor/debugfs.c
> @@ -228,11 +228,11 @@ static void spi_nor_debugfs_unregister(void 
> *data)
> 
>  void spi_nor_debugfs_register(struct spi_nor *nor)
>  {
> -	struct dentry *rootdir, *d;
> +	static struct dentry *rootdir;
> +	struct dentry *d;
>  	int ret;
> 
>  	/* Create rootdir once. Will never be deleted again. */
> -	rootdir = debugfs_lookup(SPI_NOR_DEBUGFS_ROOT, NULL);

IIRC I had that one and it didn't work with spi-nor as a module.
Wouldn't it try to create the root dir twice if you remove the module
and load it again?

-michael

>  	if (!rootdir)
>  		rootdir = debugfs_create_dir(SPI_NOR_DEBUGFS_ROOT, NULL);

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
