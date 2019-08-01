Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA4EC19759
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 06:37:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C85B8206A2
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 06:37:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aHyMz7eH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C85B8206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FIMQpsT7SM+681v75+hiC/epv9gqJIENduxXpp++G7g=; b=aHyMz7eH+OREcG
	xS2HMqCDc6IHa3KbA/Vp1x/OtKHwx8HExuLfEoiLDMMd1yOEDsbPEQ9KhFJuuvObRCStjmb1ZbEzU
	jDwZC+r11W2hYCwYRVB3WkzAr4JxFYslp+qDiy+1GlfFxYK4BdL0bnnSjkImPVCWPVoDu0dwRJeAb
	iEoqewstimi72DP76m63TQsE7kV4IlIvJf0rtQwZn20a0DlBoRgbezE9123aRgPc4jBYq41gl5aOS
	E2URZ43BQxzsfB0NMS/NrsSee+2NW2WpBJMS0v3LuWU1H7yAHDaWmeTfHi4mgkz+char9dNLtMdOb
	3ihX7+a9KOcac+//R9PA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht4i2-0001yb-Cx; Thu, 01 Aug 2019 06:37:06 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht4hu-0001pP-7C
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 06:36:59 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C699C28A446;
 Thu,  1 Aug 2019 07:36:55 +0100 (BST)
Date: Thu, 1 Aug 2019 08:36:52 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH 4/6] mtd: spi_nor: Add nor->setup() method
Message-ID: <20190801083652.52bffef5@collabora.com>
In-Reply-To: <20190731091145.27374-5-tudor.ambarus@microchip.com>
References: <20190731091145.27374-1-tudor.ambarus@microchip.com>
 <20190731091145.27374-5-tudor.ambarus@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_233658_386573_536E1E52 
X-CRM114-Status: GOOD (  11.62  )
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
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 31 Jul 2019 09:12:14 +0000
<Tudor.Ambarus@microchip.com> wrote:


>  static inline bool spi_nor_protocol_is_dtr(enum spi_nor_protocol proto)
>  {
>  	return !!(proto & SNOR_PROTO_IS_DTR);
> @@ -384,6 +522,7 @@ struct flash_info;
>   *                      useful when pagesize is not a power-of-2
>   * @disable_write_protection: [FLASH-SPECIFIC] disable write protection during
>   *                            power-up
> + * @setup:		[FLASH-SPECIFIC] configure the spi-nor memory

Might be worth giving a example of the type of configuration that can
be done here.

The patch looks good otherwise.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

>   *			completely locked

Looks like this 'completely locked' is a leftover from a previous move
(lock functions were move to a separate _ops struct IIRC). Can you fix
that?

>   * @priv:		the private data
>   */
> @@ -427,6 +566,9 @@ struct spi_nor {
>  	int (*set_4byte)(struct spi_nor *nor, bool enable);
>  	u32 (*convert_addr)(struct spi_nor *nor, u32 addr);
>  	int (*disable_write_protection)(struct spi_nor *nor);
> +	int (*setup)(struct spi_nor *nor,
> +		     const struct spi_nor_flash_parameter *params,
> +		     const struct spi_nor_hwcaps *hwcaps);
>  
>  	const struct spi_nor_locking_ops *locking_ops;
>  
> @@ -486,81 +628,6 @@ static inline struct device_node *spi_nor_get_flash_node(struct spi_nor *nor)
>  }
>  

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
