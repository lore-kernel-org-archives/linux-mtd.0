Received: from co9ehsobe003.messaging.microsoft.com ([207.46.163.26]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0R5i-0007MR-Fk
 for linux-mtd@lists.infradead.org; Tue, 07 Jan 2014 07:28:46 +0000
Date: Tue, 7 Jan 2014 14:54:32 +0800
From: Huang Shijie <b32955@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 4/5] mtd: nand: support Micron READ RETRY
Message-ID: <20140107065431.GE8109@shlinux2.ap.freescale.net>
References: <1388795828-24808-1-git-send-email-computersforpeace@gmail.com>
 <1388795828-24808-4-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1388795828-24808-4-git-send-email-computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 03, 2014 at 04:37:07PM -0800, Brian Norris wrote:
> +static int nand_set_read_retry_micron(struct mtd_info *mtd, int retry_mode)
> +{
> +	struct nand_chip *chip = mtd->priv;
> +	uint8_t feature[ONFI_SUBFEATURE_PARAM_LEN] = {retry_mode};
> +
> +	return chip->onfi_set_features(mtd, chip, ONFI_FEATURE_ADDR_READ_RETRY,
> +			feature);
> +}
> +
> +/*
> + * Configure chip properties from Micron vendor-specific ONFI table
> + */
> +static void nand_onfi_detect_micron(struct nand_chip *chip,
> +		struct nand_onfi_params *p)
> +{
> +	struct nand_onfi_vendor_micron *micron = (void *)p->vendor;
> +
> +	if (le16_to_cpu(p->vendor_revision) < 1)
> +		return;
> +
> +	chip->read_retries = micron->read_retry_options;
> +	chip->set_read_retry = nand_set_read_retry_micron;
Besides the name, i am okay with this patch.

thanks
Huang Shijie
