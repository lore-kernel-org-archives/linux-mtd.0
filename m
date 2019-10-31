Return-Path: <SRS0=gIgt=YY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F2A6CA9EC3
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Oct 2019 11:12:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 015752087F
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Oct 2019 11:12:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hHRw9AXO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 015752087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d92e/4eyQWurdDFjGA/F0qMFE/181XkFsM1iW64gEgs=; b=hHRw9AXOV4BlX4
	Fiev+n66EWSmzv+GEA+JV1xnX4gmA1Lfats77fCXDvL6xoeXfhxjri0tXpdgrFxGC5Pcfqr2chyxC
	oPvKiNd5/RBwtYsZjhU/nwUziRWrFlAJNm42nKLPdn5tcXwf1O73hOY0Jinx/BIvEvikzEEHwOLc2
	KHwPnR8qAVYFgpfgfFp9BjdIoa72mBJkhrmsAv3SQMbT64CMdO67nU7BYKs+0rWN3dfCeyFzy0ZVJ
	tq/RZmoV3AfJadoLT9pZkaYb7CJWyjZOAQ02fVtcPO2mwJGhh+EouvdhGaUNKnrILL3Kduu9X544R
	gcNH+GbJM16F9sTFw51Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQ8NY-0003Lz-JH; Thu, 31 Oct 2019 11:12:36 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQ8NW-0003LY-01
 for linux-mtd@lists.infradead.org; Thu, 31 Oct 2019 11:12:35 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9420D28E1AE;
 Thu, 31 Oct 2019 11:12:32 +0000 (GMT)
Date: Thu, 31 Oct 2019 12:12:28 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 14/32] mtd: spi-nor: Fix retlen handling in sst_write()
Message-ID: <20191031121228.09ad85c8@collabora.com>
In-Reply-To: <20191029111615.3706-15-tudor.ambarus@microchip.com>
References: <20191029111615.3706-1-tudor.ambarus@microchip.com>
 <20191029111615.3706-15-tudor.ambarus@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191031_041234_168512_32ED4AD8 
X-CRM114-Status: GOOD (  16.68  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 29 Oct 2019 11:17:10 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> In case the write of the first byte failed, retlen was incorrectly
> incremented to *retlen += actual; on the exit path. retlen should be
> incremented when actual data was written to the flash.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index bc46b946ac77..889fd77dbe96 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2667,7 +2667,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
>  		size_t *retlen, const u_char *buf)
>  {
>  	struct spi_nor *nor = mtd_to_spi_nor(mtd);
> -	size_t actual;
> +	size_t actual = 0;
>  	int ret;
>  
>  	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
> @@ -2680,9 +2680,8 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
>  
>  	nor->sst_write_second = false;
>  
> -	actual = to % 2;
>  	/* Start write from odd address. */
> -	if (actual) {
> +	if (to % 2) {
>  		nor->program_opcode = SPINOR_OP_BP;
>  
>  		/* write one byte. */
> @@ -2693,8 +2692,10 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
>  		ret = spi_nor_wait_till_ready(nor);
>  		if (ret)
>  			goto sst_write_err;
> +
> +		to++;
> +		actual++;
>  	}
> -	to += actual;
>  
>  	/* Write out most of the data here. */
>  	for (; actual < len - 1; actual += 2) {


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
