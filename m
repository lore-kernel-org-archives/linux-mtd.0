Return-Path: <SRS0=AumS=GX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B88DC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 14:06:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE42D23357
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 14:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE42D23357
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OsL68qqXaLZ1US8GAKQRb+MoLHf06uJ3L0p6++JfFPY=; b=pYM8NNYsNvLdshdxY1VykeJFY
	ls9+pLC1hGKCxNv8Ubb2rn8UuKEm7lOAFWjocmwPbTDUJdj44+l6pJn0HHQZy+hq2eSAr+3EXJLMU
	0n9G/tN5svUAWJi/FeW24wf2adPkxy4bl3E+jckwnx9uk4kS1LYC3FQ57UbMbfWwTS6F3DPl0mE/E
	pLWTxRFKVLcxF0lGsDtvu/I1gNCTwKCMBNPibRfA52DwSYWJVBuw68cKQ1VoHisgzd3bEl9iZ/zqC
	aNnzGAf24Tl4I4vL+VLr6KG7O+3DYPwlkBuEwQXwaBz0BpDR7agFwk4u0oguPtwFAV3W1S7Gzv/5G
	JGF9/u9bQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2E70-0008FC-MR; Wed, 20 Jan 2021 14:05:30 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2E6t-0008Ed-Vg
 for linux-mtd@lists.infradead.org; Wed, 20 Jan 2021 14:05:28 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 4BC0522727;
 Wed, 20 Jan 2021 15:05:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1611151522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jJzg+aAIebuXZDa7Uv1sg8IU5aWpIXkz9XqNxQ92KH8=;
 b=oP7V6Vupj72Em3tLWu3ImkXDWlbnPRiZyV5Hawk8Qh0CjaXOjG52zeF8GGEPFY1s3vQ53e
 Xv1phw41hSMy0XxgTeikuPio+EUPRXO8y0uvkrMhJweN9vCS45DpCD+sCsCHt0zy373vAt
 3+f19Gl1Wh559tbKhTCrwN8EIiEXJjs=
MIME-Version: 1.0
Date: Wed, 20 Jan 2021 15:05:22 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: sst: Add support for Global Unlock
 on sst26vf
In-Reply-To: <20210120131914.277363-2-tudor.ambarus@microchip.com>
References: <20210120131914.277363-1-tudor.ambarus@microchip.com>
 <20210120131914.277363-2-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <b3a61abec8927c7229c27415d2c769a8@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_090525_078749_38315D87 
X-CRM114-Status: GOOD (  21.93  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Kavyasree.Kotagiri@microchip.com,
 miquel.raynal@bootlin.com, p.yadav@ti.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-01-20 14:19, schrieb Tudor Ambarus:
> Even if sst26vf shares the SPINOR_OP_GBULK opcode with
> Macronix (ex. MX25U12835F) and Winbound (ex. W25Q128FV),
> it has its own Individual Block Protection scheme, which
> is also capable to read-lock individual parameter blocks.
> Thus the sst26vf's Individual Block Protection scheme will
> reside in the sst.c manufacturer driver.
> 
> Add support to unlock the entire flash memory. The device
> is write-protected by default after a power-on reset cycle
> (volatile software protection), in order to avoid inadvertent
> writes during power-up. Could do an erase, write, read back,
> and compare when MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE=y.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---

Damn, who on earth assigned the "block protection" bits to the
8/32/64kb sectors on the flash (SST26VF064B DS, Table 5-6). That is
nuts.

Except one comment below:

Reviewed-by: Michael Walle <michael@walle.cc>

> v2: s/!ofs/ofs == 0/
> 
>  drivers/mtd/spi-nor/sst.c | 38 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
> index 00e48da0744a..d6e1396abb96 100644
> --- a/drivers/mtd/spi-nor/sst.c
> +++ b/drivers/mtd/spi-nor/sst.c
> @@ -8,6 +8,39 @@
> 
>  #include "core.h"
> 
> +static int sst26vf_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static int sst26vf_unlock(struct spi_nor *nor, loff_t ofs, uint64_t 
> len)
> +{
> +	if (ofs == 0 && len == nor->params->size)
> +		return spi_nor_global_block_unlock(nor);


Some blocks might not be unlocked because they are permanently
locked. Does it make sense to read BPNV of the control register
and add a debug message here?

-michael

> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int sst26vf_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t 
> len)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static const struct spi_nor_locking_ops sst26vf_locking_ops = {
> +	.lock = sst26vf_lock,
> +	.unlock = sst26vf_unlock,
> +	.is_locked = sst26vf_is_locked,
> +};
> +
> +static void sst26vf_default_init(struct spi_nor *nor)
> +{
> +	nor->params->locking_ops = &sst26vf_locking_ops;
> +}
> +
> +static const struct spi_nor_fixups sst26vf_fixups = {
> +	.default_init = sst26vf_default_init,
> +};
> +
>  static const struct flash_info sst_parts[] = {
>  	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
>  	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8,
> @@ -39,8 +72,9 @@ static const struct flash_info sst_parts[] = {
>  	{ "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32,
>  			      SECT_4K | SPI_NOR_DUAL_READ) },
>  	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128,
> -			      SECT_4K | SPI_NOR_DUAL_READ |
> -			      SPI_NOR_QUAD_READ) },
> +			      SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +			      SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> +		.fixups = &sst26vf_fixups },
>  };
> 
>  static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
