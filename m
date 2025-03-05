Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4CBC282D9
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Mar 2025 10:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YTwL9OuXZE3a9FXynl46yMYjLqzkN/YNcB7uiVjMmLg=; b=3PH8fdzhcppTE9
	Mn4b6Fd0FNXidbOtxkaA3Ax0MfPgVXdQcdeleFthsskv9RnZv4lxRpX4W9jHvESXWEh9UDD5HFaaB
	KRv8AmrwrKrQj6VPGJd4KYh/LKUMlqWicMvCIWebXOHRrwmifIyM7P3rsAnMiY/gI/6IqOAJcgt1G
	8Q+AwurG2PKc3V0KZ3X0vqR4qpN9ZdnNyQRgZ52bBG6g8P8EWKRbCZ3BPfki+jfiRGfywHOnfS5o/
	6yVciPS5p+5hztFCJL8TA+Q3fBkm8iwt7hADV6HEIQhKe8FS0FZTXB11okwtrVU8xtjVyD2a868lf
	PsgJn9NPkkjzSlNGa8Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmSl-00000007mWc-3BqZ;
	Wed, 05 Mar 2025 10:58:55 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tplvw-00000007fj9-0CiG;
	Wed, 05 Mar 2025 10:25:01 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id CB5C648D;
	Wed,  5 Mar 2025 11:24:47 +0100 (CET)
Mime-Version: 1.0
Date: Wed, 05 Mar 2025 11:24:47 +0100
Message-Id: <D889CRJC6W19.2LDQCDVG7BLNG@kernel.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: sst: register SFDP region into NVMEM
 framework to read MAC Address
Cc: "Varshini Rajendran" <varshini.rajendran@microchip.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Manikandan Muralidharan" <manikandan.m@microchip.com>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <tudor.ambarus@linaro.org>,
 <pratyush@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
X-Mailer: aerc 0.16.0
References: <20250305100134.1171124-1-manikandan.m@microchip.com>
In-Reply-To: <20250305100134.1171124-1-manikandan.m@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_022500_235523_20B2806F 
X-CRM114-Status: GOOD (  28.03  )
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

On Wed Mar 5, 2025 at 11:01 AM CET, Manikandan Muralidharan wrote:
> From: Varshini Rajendran <varshini.rajendran@microchip.com>
>
> EUI identifier and the MAC Address of the Ethernet Interface is stored
> after the SFDP table of contents starting at address 0x260 in the
> QSPI memory.
> Register the entire SFDP region read by the spi-nor (nor->sfdp) into the
> NVMEM framework and read the MAC Address when requested using the nvmem
> properties in the DT by the net drivers.
>
> In kernel the Ethernet MAC address relied on U-Boot env variables or
> generated a random address, which posed challenges for boards without
> on-board EEPROMs or with multiple Ethernet ports.
> This change ensures consistent and reliable MAC address retrieval from QSPI,
> benefiting boards like the sama5d29 curiosity and sam9x75 curiosity.
>
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> [manikandan.m@microchip.com: Integrate the nvmem->read callback framework]
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  drivers/mtd/spi-nor/sst.c | 62 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
> index 175211fe6a5e..a0abf201ad41 100644
> --- a/drivers/mtd/spi-nor/sst.c
> +++ b/drivers/mtd/spi-nor/sst.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <linux/mtd/spi-nor.h>
> +#include <linux/nvmem-provider.h>
>  
>  #include "core.h"
>  
> @@ -13,6 +14,8 @@
>  
>  #define SST26VF_CR_BPNV		BIT(3)
>  
> +#define SST26VF_SFDP_EUI48	0x30
> +
>  static int sst26vf_nor_lock(struct spi_nor *nor, loff_t ofs, u64 len)
>  {
>  	return -EOPNOTSUPP;
> @@ -56,8 +59,67 @@ static int sst26vf_nor_late_init(struct spi_nor *nor)
>  	return 0;
>  }
>  
> +/**
> + * sst26vf_sfdp_mac_addr_read() - check if the EUI-48 MAC Address is programmed
> + * and read the data from the prestored SFDP data
> + *
> + * @priv: User context passed to read callbacks.
> + * @offset: Offset within the NVMEM device.
> + * @val: pointer where to fill the ethernet address
> + * @bytes: Length of the NVMEM cell
> + *
> + * Return: 0 on success, -EINVAL  otherwise.
> + */
> +static int sst26vf_sfdp_mac_addr_read(void *priv, unsigned int off,
> +				      void *val, size_t bytes)
> +{
> +	struct spi_nor *nor = priv;
> +	struct sfdp *sfdp = nor->sfdp;
> +	loff_t offset = off;
> +	size_t sfdp_size;
> +
> +	/*
> +	 * Check if the EUI-48 MAC address is programmed in the next six address
> +	 * locations.
> +	 * @off is programmed in the DT and stores the start of MAC Address
> +	 * byte, (off - 1) stores the bit length of the Extended Unique
> +	 * Identifier
> +	 */
> +	if (SST26VF_SFDP_EUI48 != *((u8 *)sfdp->dwords + (offset - 1)))
> +		return -EINVAL;

What happens if you read at a different offset? You're exposing
the entire SFDP region. What happens if there is a 0x30 at a
different location?

> +
> +	sfdp_size = sfdp->num_dwords * sizeof(*sfdp->dwords);
> +	memory_read_from_buffer(val, bytes, &offset, sfdp->dwords,
> +				sfdp_size);
> +	return 0;
> +}
> +
> +static struct nvmem_config sst26vf_sfdp_nvmem_config = {
> +	.word_size = 1,
> +	.stride = 1,
> +};
> +
> +static int sst26vf_nor_post_sfdp(struct spi_nor *nor)
> +{
> +	struct nvmem_device *nvmem;
> +
> +	sst26vf_sfdp_nvmem_config.dev = nor->dev;
> +	sst26vf_sfdp_nvmem_config.size = nor->sfdp->num_dwords * sizeof(*nor->sfdp->dwords);
> +	sst26vf_sfdp_nvmem_config.priv = nor;
> +	sst26vf_sfdp_nvmem_config.reg_read = sst26vf_sfdp_mac_addr_read;
> +
> +	nvmem = devm_nvmem_register(nor->dev, &sst26vf_sfdp_nvmem_config);
> +	if (IS_ERR(nvmem)) {
> +		dev_err(nor->dev, "failed to register NVMEM device: %ld\n", PTR_ERR(nvmem));
> +		return PTR_ERR(nvmem);

I don't think it makes sense to have this one-off in a particular
driver. If at all, this should be handled in the core. Sorry, but
this really looks like an ugly hack.

-michael

> +	}
> +
> +	return 0;
> +}
> +
>  static const struct spi_nor_fixups sst26vf_nor_fixups = {
>  	.late_init = sst26vf_nor_late_init,
> +	.post_sfdp = sst26vf_nor_post_sfdp,
>  };
>  
>  static const struct flash_info sst_nor_parts[] = {


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
