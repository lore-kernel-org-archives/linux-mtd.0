Return-Path: <SRS0=bui3=O2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5571FC433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Oct 2021 00:04:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD87D61175
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Oct 2021 00:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD87D61175
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZvH/WVtcJvw5XWetAGq4dpELPhAAzdedRoX5zEUk468=; b=3+4ABAZsLkQcLR
	NarO0KvxP/x4CiKotQFsMgJ8AD337NUV5mkCni+CIkRpZW8F7JBG94RRjH7SWydK0QWK6N32tvSJ6
	Pdoap21iSSz0S+etBnTxPlC48nra6ZzALbHveTiabT+IurLXzqgtHqdW1UXkTN73qMqNRhTqFTehK
	Mn9DOxD8iBh+cyAZV8TOJtcq8jz+ZpwVEv5l9g+kpNI4uJdY+f/BfThOkJrMGk9CYtXvhJOVbURG7
	EW2U/DiO9PinjMQnc6eDv6x7yhYerzkBRhdyZb80dtxFJWLDjrdaVYXITxm59IF7vSvr7n83EHUVO
	yzqjM656eaTZzX7AZgtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXuPm-00CL1T-Gr; Wed, 06 Oct 2021 00:04:06 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXuPZ-00CL0N-Tt; Wed, 06 Oct 2021 00:03:55 +0000
Received: by linux.microsoft.com (Postfix, from userid 1046)
 id D8A1C20B861E; Tue,  5 Oct 2021 17:03:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D8A1C20B861E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1633478627;
 bh=Lba9wJEZ48njfaVv79S/RD8k06p4EsANJ/0HCRU1yKM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z1tmXIJ1YElDF76BCq50LrBsRxfIyeMYNGIXdZvUB1ikVsM92HjWmTlGOc3YsEXoL
 7Tj043DIAAMst2f3czz/PcRI8/AwSiIU5oIOSd2+ZW8vHm2Igf5ILftBNUKFUGKF/M
 iJ70OmGEujqxsd0Pi/QyxnQF06Ro/tIuJVGAyeuU=
From: Dhananjay Phadke <dphadke@linux.microsoft.com>
To: zev@bewilderbeest.net
Cc: andrew@aj.id.au, clg@kaod.org, gregkh@linuxfoundation.org,
 jk@codeconstruct.com.au, joel@jms.id.au,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 michael@walle.cc, miquel.raynal@bootlin.com, openbmc@lists.ozlabs.org,
 p.yadav@ti.com, richard@nod.at, tudor.ambarus@microchip.com,
 vigneshr@ti.com, Dhananjay Phadke <dphadke@linux.microsoft.com>
Subject: Re: [PATCH 3/6] mtd: spi-nor: aspeed: Refactor
 registration/unregistration
Date: Tue,  5 Oct 2021 17:03:14 -0700
Message-Id: <1633478594-16793-1-git-send-email-dphadke@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20210929115409.21254-4-zev@bewilderbeest.net>
References: <20210929115409.21254-4-zev@bewilderbeest.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_170354_053716_DFB92C8F 
X-CRM114-Status: GOOD (  25.56  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On Wed, 29 Sep 2021, Zev Weiss wrote:

> We now have separate functions for registering and unregistering
> individual flash chips, instead of the entire controller.  This is a
> preparatory step for allowing userspace to request that a specific
> chip be attached or detached at runtime.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
> drivers/mtd/spi-nor/controllers/aspeed-smc.c | 73 ++++++++++++--------
> 1 file changed, 45 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/controllers/aspeed-smc.c b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> index 7225870e8b18..3c153104a905 100644
> --- a/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> @@ -107,9 +107,10 @@ struct aspeed_smc_controller {
> 	const struct aspeed_smc_info *info;	/* type info of controller */
> 	void __iomem *regs;			/* controller registers */
> 	void __iomem *ahb_base;			/* per-chip windows resource */
> +	struct resource *ahb_res;		/* resource for AHB address space */
> 	u32 ahb_window_size;			/* full mapping window size */
>
> -	struct aspeed_smc_chip *chips[];	/* pointers to attached chips */
> +	struct aspeed_smc_chip *chips[];	/* pointers to connected chips */
> };
>
> /*
> @@ -399,15 +400,24 @@ static ssize_t aspeed_smc_write_user(struct spi_nor *nor, loff_t to,
> 	return len;
> }
>
> +static int aspeed_smc_unregister_chip(struct aspeed_smc_chip *chip)
> +{
> +	return mtd_device_unregister(&chip->nor.mtd);
> +}
> +
> static int aspeed_smc_unregister(struct aspeed_smc_controller *controller)
> {
> 	struct aspeed_smc_chip *chip;
> -	int n;
> +	int n, ret;
>
> 	for (n = 0; n < controller->info->nce; n++) {
> 		chip = controller->chips[n];
> -		if (chip)
> -			mtd_device_unregister(&chip->nor.mtd);
> +		if (chip) {
> +			ret = aspeed_smc_unregister_chip(chip);
> +			if (ret)
> +				dev_warn(controller->dev, "failed to unregister CS%d: %d\n",
> +				         n, ret);
> +		}
> 	}
>
> 	return 0;
> @@ -756,14 +766,39 @@ static const struct spi_nor_controller_ops aspeed_smc_controller_ops = {
> 	.write = aspeed_smc_write_user,
> };
>
> -static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
> -				  struct device_node *np, struct resource *r)
> +static int aspeed_smc_register_chip(struct aspeed_smc_chip *chip)
> {
> -	const struct spi_nor_hwcaps hwcaps = {
> +	static const struct spi_nor_hwcaps hwcaps = {
> 		.mask = SNOR_HWCAPS_READ |
> 			SNOR_HWCAPS_READ_FAST |
> 			SNOR_HWCAPS_PP,
> 	};
> +	int ret;
> +
> +	ret = aspeed_smc_chip_setup_init(chip, chip->controller->ahb_res);
> +	if (ret)
> +		goto out;
> +
> +	/*
> +	 * TODO: Add support for Dual and Quad SPI protocols attach when board
> +	 * support is present as determined by of property.
> +	 */
> +	ret = spi_nor_scan(&chip->nor, NULL, &hwcaps);
> +	if (ret)
> +		goto out;
> +
> +	ret = aspeed_smc_chip_setup_finish(chip);
> +	if (ret)
> +		goto out;
> +
> +	ret = mtd_device_register(&chip->nor.mtd, NULL, 0);
> +out:
> +	return ret;
> +}

I was looking into this driver probe walking sub-nodes.

It looks like all controller drivers are doing / have to do similar work -

(1) Parse common dt bindings documented in Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
(2) Run spi_nor_scan() with tweaked/reduced capabilities.
(3) mtd_register_device().

It would be good to absorb this workflow in mtd/spi-nor core and add 'reserved' as common
dt property to avoid (2) and (3) from probe.


Regards,
Dhananjay


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
