Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08140C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 21:24:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDCDF20870
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 21:24:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NC8pRrYZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDCDF20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pyhJkmn1AJ8NWuHxYW2PQUJWszx+fkd3Sc9N8h9jGdo=; b=NC8pRrYZ4syoFV
	hF4YhW3uvOJa4NZUWzpsBdIprm8C+wdsQZIjiI0eWlS4xBGAhci5Wwbod99dUuK4F+INePTDx6GZA
	h4a9n42oi/EUdwgZmkDapyBqRVCohIw/nmMrxRp3ie7ULUjkbAEpN4/wbn7k8AOvHvyPa2ZUMFZBS
	PSrXBZoPSHO4Em1Q+xI7tm9tPXj2URrap/U3nRVoV/lMI3jhhvn36AAdbh46kyhk0/cuzHIxQDzNg
	dC5ITYoAgGRqW7AmXTIxAYr+e6owXNNTRQKUjH+mKAE0Fnl+jOb8WGOFRg7T9bhtLXfSB2EXC5oK4
	KGQOogzyi6x1jPoC1/yw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdh34-0004oY-F2; Tue, 26 May 2020 21:23:46 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdh31-0004o9-JA
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 21:23:45 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A36972A01C1;
 Tue, 26 May 2020 22:23:41 +0100 (BST)
Date: Tue, 26 May 2020 23:23:38 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v5 17/28] mtd: rawnand: Define a unique reset data
 interface
Message-ID: <20200526232338.7d061be9@collabora.com>
In-Reply-To: <20200526191725.7591-18-miquel.raynal@bootlin.com>
References: <20200526191725.7591-1-miquel.raynal@bootlin.com>
 <20200526191725.7591-18-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_142343_762856_A5D4E185 
X-CRM114-Status: GOOD (  20.46  )
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
Cc: Rickard Andersson <rickaran@axis.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 26 May 2020 21:17:14 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> All NAND chips will always use the same data interface for reset and
> at startup: SDR mode 0. Instead of copying around the data interface
> timings, let's just have a default reset data interface for that.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c    | 9 +++------
>  drivers/mtd/nand/raw/nand_timings.c | 3 +++
>  include/linux/mtd/rawnand.h         | 3 +++
>  3 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 89f10a8c1d62..1005035c233a 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -927,9 +927,8 @@ static int nand_reset_data_interface(struct nand_chip *chip, int chipnr)
>  	 * timings to timing mode 0.
>  	 */
>  
> -	onfi_fill_data_interface(chip, &chip->data_interface, NAND_SDR_IFACE, 0);
>  	ret = chip->controller->ops->setup_data_interface(chip, chipnr,
> -							&chip->data_interface);
> +							  nand_reset_data_iface);
>  	if (ret)
>  		pr_err("Failed to configure data interface to SDR timing mode 0\n");
>  
> @@ -2484,7 +2483,6 @@ EXPORT_SYMBOL_GPL(nand_subop_get_data_len);
>   */
>  int nand_reset(struct nand_chip *chip, int chipnr)
>  {
> -	struct nand_data_interface saved_data_intf = chip->data_interface;
>  	int ret;
>  
>  	ret = nand_reset_data_interface(chip, chipnr);
> @@ -2509,11 +2507,10 @@ int nand_reset(struct nand_chip *chip, int chipnr)
>  	 * nand_setup_data_interface() uses ->set/get_features() which would
>  	 * fail anyway as the parameter page is not available yet.
>  	 */
> -	if (!memcmp(&chip->data_interface, &saved_data_intf,
> -		    sizeof(saved_data_intf)))
> +	if (!memcmp(&chip->data_interface, nand_reset_data_iface,
> +		    sizeof(*nand_reset_data_iface)))
>  		return 0;
>  
> -	chip->data_interface = saved_data_intf;
>  	ret = nand_setup_data_interface(chip, chipnr);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
> index 52ee83e75646..343284c43e81 100644
> --- a/drivers/mtd/nand/raw/nand_timings.c
> +++ b/drivers/mtd/nand/raw/nand_timings.c
> @@ -285,6 +285,9 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
>  	},
>  };
>  
> +/* All NAND chips share the same reset data interface: SDR mode 0 */
> +const struct nand_data_interface *nand_reset_data_iface = &onfi_sdr_timings[0];

Can we make that one a function?

const struct nand_data_interface *nand_get_reset_data_interface(void)
{
	return &onfi_sdr_timings[0];
}

> +
>  /**
>   * onfi_find_closest_sdr_mode - Derive the closest ONFI SDR timing mode given a
>   *                              set of timings
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index 622da6527a36..6c334cca3977 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -1203,6 +1203,9 @@ static inline struct device_node *nand_get_flash_node(struct nand_chip *chip)
>  	return mtd_get_of_node(nand_to_mtd(chip));
>  }
>  
> +/* Default/reset data interface */
> +extern const struct nand_data_interface *nand_reset_data_iface;
> +
>  /*
>   * A helper for defining older NAND chips where the second ID byte fully
>   * defined the chip, including the geometry (chip size, eraseblock size, page


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
