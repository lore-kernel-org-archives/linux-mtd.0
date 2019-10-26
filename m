Return-Path: <SRS0=ZLLf=YT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D67CA9EB9
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Oct 2019 07:36:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BE3E21655
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Oct 2019 07:36:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s5KzIdLX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BE3E21655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=arWNY+My7lQjUnEHVEPC2XimacXbc3CE/Oo18TkmSDM=; b=s5KzIdLXHXwT1D
	y+HpFFaN1btzhibiRZdaBj542yPq9LCxsao7pdoUAV2pOUqvd2izGGBjZZP1CmcE01pn0edhBB6FI
	fFMStr3lMnI+49H79lY+LfjCr+HwOQ/2ad8v4QcnIhHL3ZhnAwjwNMmV6X0ext/HrwucO6CRVC7r2
	QB+tdbepwn1k+oVqIAoaurGnF398TOec65Ldu3ueS1t7UiUu5KQ6YKdGETj3PABQUuP4x0uoH67o+
	AshKSvrHV9db8978JPFfsWk5QznN0nCYyxZ6qT4VwhhVnT1pNPxS7MrBnqZEINcmOYptLc9m03z7V
	CEy8lUpsQhx0xaOZVWvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iOGcN-0008Ew-4L; Sat, 26 Oct 2019 07:36:11 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iOGcK-0008EL-R3
 for linux-mtd@lists.infradead.org; Sat, 26 Oct 2019 07:36:10 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 99F47283D39;
 Sat, 26 Oct 2019 08:36:05 +0100 (BST)
Date: Sat, 26 Oct 2019 09:36:02 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] mtd: spi-nor: use spi-mem dirmap API
Message-ID: <20191026093602.09a8f0ab@collabora.com>
In-Reply-To: <97330369-c42e-0ce3-ab1e-0f4433e6acad@cogentembedded.com>
References: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
 <97330369-c42e-0ce3-ab1e-0f4433e6acad@cogentembedded.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191026_003609_008426_65B85E9E 
X-CRM114-Status: GOOD (  18.23  )
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
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 25 Oct 2019 23:26:42 +0300
Sergei Shtylyov <sergei.shtylyov@cogentembedded.com> wrote:

> Make use of the spi-mem direct mapping API to let advanced controllers
> optimize read/write operations when they support direct mapping.
> 
> Based on the original patch by Boris Brezillon <boris.brezillon@bootlin.com>.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is against the 'spi-nor/next' branch of the MTD 'linux.git' repo.
> 
>  drivers/mtd/spi-nor/spi-nor.c |   79 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/spi-nor.h   |    5 ++
>  2 files changed, 84 insertions(+)
> 
> Index: linux/drivers/mtd/spi-nor/spi-nor.c
> ===================================================================
> --- linux.orig/drivers/mtd/spi-nor/spi-nor.c
> +++ linux/drivers/mtd/spi-nor/spi-nor.c
> @@ -2562,6 +2562,14 @@ static int spi_nor_read(struct mtd_info
>  	if (ret)
>  		return ret;
>  
> +	if (nor->dirmap.rdesc) {
> +		ret = spi_mem_dirmap_read(nor->dirmap.rdesc, from, len, buf);

This spi_mem_dirmap_read() call should be moved to
spi_nor_spimem_read_data().

> +		if (ret < 0)
> +			goto read_err;
> +		*retlen += ret;
> +		goto done;
> +	}
> +
>  	while (len) {
>  		loff_t addr = from;
>  
> @@ -2582,6 +2590,7 @@ static int spi_nor_read(struct mtd_info
>  		from += ret;
>  		len -= ret;
>  	}
> +done:
>  	ret = 0;
>  
>  read_err:
> @@ -2686,6 +2695,14 @@ static int spi_nor_write(struct mtd_info
>  	if (ret)
>  		return ret;
>  
> +	if (nor->dirmap.wdesc) {
> +		ret = spi_mem_dirmap_write(nor->dirmap.wdesc, to, len, buf);

Same here, this should be moved to spi_nor_spimem_write_data(). BTW, I
wonder how this can work since write_enable() is called in the below for
loop (which you skip). Is your SPI controller sending the WE cmd
automatically?

> +		if (ret < 0)
> +			goto write_err;
> +		*retlen += ret;
> +		goto done;
> +	}
> +
>  	for (i = 0; i < len; ) {
>  		ssize_t written;
>  		loff_t addr = to + i;
> @@ -2723,6 +2740,8 @@ static int spi_nor_write(struct mtd_info
>  		*retlen += written;
>  		i += written;
>  	}
> +done:
> +	ret = 0;
>  
>  write_err:
>  	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_WRITE);
> @@ -4991,6 +5010,58 @@ int spi_nor_scan(struct spi_nor *nor, co
>  }
>  EXPORT_SYMBOL_GPL(spi_nor_scan);
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
