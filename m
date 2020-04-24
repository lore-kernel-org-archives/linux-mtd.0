Return-Path: <SRS0=YgIB=6I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DAADC54FD0
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Apr 2020 13:30:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9DAE206D7
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Apr 2020 13:30:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nBACY9NT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9DAE206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yadavpratyush.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DrOsJguU5dAWBNoiNxvp5PCd3tM3OdQUSProV9+uadE=; b=nBACY9NTuFegVX
	c5IGIKQL/PbR3SVDDqmUh766wL2GGK5ixMgpxnOKYl+Iv2bdXM29s46DLGceVbF5KbhHYUr/fzVhE
	SGroOiTUptqUiGG3F6K7tsUTwF/kVyy/Gi3yPCB3f6DwyCkAZauIvfpx/Nf2ytwOAqLEssKhVjr7A
	y+uSRYMt+swEwiAKHD9ZmI34CvQVJKdnAqy1GwXR1BEhN7qbZTDuMRz7eM3BUERYA4ygCA/9KFzuu
	sCygUKPzXxHI57WXdFwnxAZVl0Bzq9sIrGBe7cGpDSYHSlZUJOL+MZ46BCqe/+BVScHNUBufEgmkh
	eoeyYG7KEUjT2IaxkIbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRyPO-0003vu-DN; Fri, 24 Apr 2020 13:30:22 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRyPL-0003uT-N5
 for linux-mtd@lists.infradead.org; Fri, 24 Apr 2020 13:30:21 +0000
X-Originating-IP: 42.109.208.177
Received: from localhost (unknown [42.109.208.177])
 (Authenticated sender: me@yadavpratyush.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 9C78420007;
 Fri, 24 Apr 2020 13:30:09 +0000 (UTC)
Date: Fri, 24 Apr 2020 19:00:04 +0530
From: Pratyush Yadav <me@yadavpratyush.com>
To: Yicong Yang <yangyicong@hisilicon.com>
Subject: Re: [RFC PATCH 1/2] mtd: spi-nor: Add capability to disable flash
 quad mode
Message-ID: <20200424133004.r2oryuyocz7zmrgz@yadavpratyush.com>
References: <1587720044-49172-1-git-send-email-yangyicong@hisilicon.com>
 <1587720044-49172-2-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1587720044-49172-2-git-send-email-yangyicong@hisilicon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_063019_887531_6FB89C2F 
X-CRM114-Status: GOOD (  17.66  )
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
Cc: vigneshr@ti.com, sergei.shtylyov@cogentembedded.com,
 tudor.ambarus@microchip.com, richard@nod.at, john.garry@huawei.com,
 linuxarm@huawei.com, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 alexander.sverdlin@nokia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Yicong,

On 24/04/20 05:20PM, Yicong Yang wrote:
> Previous we didn't provide a way to disable the flash's quad mode.
> Which means we cannot do some cleanup works when to remove or
> poweroff the flash, like what set 4-byte address mode does in
> spi_nor_restore().
> 
> Add the capability to disable the flash quad mode, by introducing
> an enable flag in the flash parameters quad_enable() hooks and
> related functions.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  drivers/mtd/spi-nor/core.c | 38 ++++++++++++++++++++++++++++----------
>  drivers/mtd/spi-nor/core.h |  8 ++++----
>  2 files changed, 32 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index cc68ea8..d0516e8 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1910,12 +1910,13 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>   * spi_nor_sr1_bit6_quad_enable() - Set the Quad Enable BIT(6) in the Status

Nitpick: This should probably be changed to "Set/unset the Quad 
Enable...". Same in other places.

>   * Register 1.
>   * @nor:	pointer to a 'struct spi_nor'
> + * @enable:	true to enter quad mode. false to leave quad mode.
>   *
>   * Bit 6 of the Status Register 1 is the QE bit for Macronix like QSPI memories.
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor)
> +int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor, bool enable)
>  {
>  	int ret;
> 
> @@ -1923,10 +1924,14 @@ int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor)
>  	if (ret)
>  		return ret;
> 
> -	if (nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)
> +	if ((enable && (nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)) ||
> +	    ~(enable || (nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)))

This condition will always evaluate to true.

Since (enable || (nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)) is always a 
boolean, it will evaluate to 0 or 1. And ~0 is 0xFFFFFFFF and ~1 is 
0xFFFFFFFE, both of which evaluate to true.

IIUC, this condition is supposed to mean "If we want to enable and it is 
already enabled, do nothing. Or, if we want to disable and it is already 
disabled, do nothing." This might be what you were going for:

	if ((enable && (nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)) ||
	    (!enable && !(nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)))

Same for other places this pattern appears.

>  		return 0;
> 
> -	nor->bouncebuf[0] |= SR1_QUAD_EN_BIT6;
> +	if (enable)
> +		nor->bouncebuf[0] |= SR1_QUAD_EN_BIT6;
> +	else
> +		nor->bouncebuf[0] &= ~SR1_QUAD_EN_BIT6;
> 
>  	return spi_nor_write_sr1_and_check(nor, nor->bouncebuf[0]);
>  }

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
