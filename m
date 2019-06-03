Return-Path: <SRS0=ioUS=UC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C943C04AB5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 11:57:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BFA723B2A
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 11:57:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xf1G6UEe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BFA723B2A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nwZjeA1nMlclUmPT2M4xKWZMidVP0LVZW/D45a5nQQk=; b=Xf1G6UEeWzABs5
	5yUhddRCsaVcRN/UFEaod7lth4v9xj02dCmVh3jVJNkfGdMclIXc/jbBBX57VXuic7DLUXL6At+qF
	0D6bXEeb6MILCOPL1oJ4rsIvQ+5SNTMmkF2AXe7wH8ElZajlv4Ge3QMn78upr+PLfC9S4lkUeqPF2
	nfLZvTQ0k1IwqtZFObjlwq51splLueEM5TSKjdj6fSO78eEiMyQjINLASsfF+lsr/+rxODESgAwV+
	/PD2jhK7arGJ/M9MiORPmRENaL2Q3VwChjoySW7FyHwhd0J2+8BEHOYAG+IjiIndT3xBV1zIHYpSQ
	G9p2q6iSLlYlW30b8ijQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXlas-0003iU-UP; Mon, 03 Jun 2019 11:57:38 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXlao-0003eL-PT
 for linux-mtd@lists.infradead.org; Mon, 03 Jun 2019 11:57:36 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 40D92260E09;
 Mon,  3 Jun 2019 12:57:33 +0100 (BST)
Date: Mon, 3 Jun 2019 13:57:29 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Zhuohao Lee <zhuohao@chromium.org>
Subject: Re: [PATCH v6 2/2] mtd: spi-nor: enable the debugfs for the
 partname and partid
Message-ID: <20190603135729.41b66ef6@collabora.com>
In-Reply-To: <20190603115053.219438-2-zhuohao@chromium.org>
References: <20190603115053.219438-1-zhuohao@chromium.org>
 <20190603115053.219438-2-zhuohao@chromium.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_045734_952605_AD85EE83 
X-CRM114-Status: GOOD (  16.71  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: drinkcat@chromium.org, bbrezillon@kernel.org, richard@nod.at,
 briannorris@chromium.org, marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon,  3 Jun 2019 19:50:53 +0800
Zhuohao Lee <zhuohao@chromium.org> wrote:

> This patch adds spi_nor_debugfs_init() for the debugfs initialization.
> With this patch, we can read the partname and partid through the
> debugfs.
> 
> The output of new debugfs nodes on my device are:
> cat /sys/kernel/debug/mtd/mtd0/partid
> spi-nor:ef6017
> cat /sys/kernel/debug/mtd/mtd0/partname
> w25q64dw
> 
> Signed-off-by: Zhuohao Lee <zhuohao@chromium.org>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 6e13bbd1aaa5..52b1a2da9ac0 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -3935,6 +3935,17 @@ static void spi_nor_resume(struct mtd_info *mtd)
>  		dev_err(dev, "resume() failed\n");
>  }
>  
> +static void spi_nor_debugfs_init(struct spi_nor *nor,
> +		const struct flash_info *info)
> +{
> +	struct mtd_info *mtd = &nor->mtd;
> +
> +	mtd->dbg.partname = info->name;
> +	mtd->dbg.partid = devm_kasprintf(nor->dev, GFP_KERNEL,
> +					"spi-nor:%*phN",
> +					 info->id_len, info->id);
> +}
> +
>  void spi_nor_restore(struct spi_nor *nor)
>  {
>  	/* restore the addressing mode */
> @@ -4036,6 +4047,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	mtd->_read = spi_nor_read;
>  	mtd->_resume = spi_nor_resume;
>  
> +	spi_nor_debugfs_init(nor, info);
> +
>  	/* NOR protection support for STmicro/Micron chips and similar */
>  	if (JEDEC_MFR(info) == SNOR_MFR_ST ||
>  	    JEDEC_MFR(info) == SNOR_MFR_MICRON ||


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
