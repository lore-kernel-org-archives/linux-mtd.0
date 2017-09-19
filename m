Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1duMP0-0007WP-FP
 for linux-mtd@lists.infradead.org; Tue, 19 Sep 2017 17:33:44 +0000
Subject: Re: [PATCH] mtd: spi-nor: Check for spi_nor_hwcaps_read2cmd() return
 value
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, computersforpeace@gmail.com, dwmw2@infradead.org
References: <20170917095750.14059-1-richard@nod.at>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <b11b9813-00ef-2595-d6e0-7f713bc727d5@wedev4u.fr>
Date: Tue, 19 Sep 2017 19:33:15 +0200
MIME-Version: 1.0
In-Reply-To: <20170917095750.14059-1-richard@nod.at>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

Le 17/09/2017 à 11:57, Richard Weinberger a écrit :
> The function can return a negativ value in case of errors,
> don't use it blindly as array index.
> 
> Detected by CoverityScan CID#1418067 ("Memory - illegal accesses")
> Fixes: f384b352cbf0 ("mtd: spi-nor: parse Serial Flash Discoverable
> Parameters (SFDP) tables")
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index cf1d4a15e10a..d71765739a93 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2145,6 +2145,9 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  
>  		params->hwcaps.mask |= rd->hwcaps;
>  		cmd = spi_nor_hwcaps_read2cmd(rd->hwcaps);
> +		if (cmd < 0)
> +			return -EINVAL;
> +
>  		read = &params->reads[cmd];
>  		half = bfpt.dwords[rd->settings_dword] >> rd->settings_shift;
>  		spi_nor_set_read_settings_from_bfpt(read, half, rd->proto);
> 

This one is a false positive:

static const struct sfdp_bfpt_read sfdp_bfpt_reads[] = {
	/* Fast Read 1-1-2 */
	{
		SNOR_HWCAPS_READ_1_1_2,
		BFPT_DWORD(1), BIT(16),	/* Supported bit */
		BFPT_DWORD(4), 0,	/* Settings */
		SNOR_PROTO_1_1_2,
	},
	[...]
};

static int spi_nor_parse_bfpt(...)
{
	[...]
	for (i = 0; i < ARRAY_SIZE(sfdp_bfpt_reads); i++) {
		const struct sfdp_bfpt_read *rd = &sfdp_bfpt_reads[i];
		[...]
		cmd = spi_nor_hwcaps_read2cmd(rd->hwcaps);
		read = &params->reads[cmd];
		[...]
	}
	[...]
}

sfdp_bfpt_reads[] is a static const array where each element has a valid
.hwcaps value so spi_nor_hwcaps_read2cmd() can actually never return an
out of range 'cmd' result here.


However in spi_nor_select_read(), spi_nor_hwcaps_read2cmd() is called
too but this time its input argument now comes from the spi_nor_scan()
caller so in this later case the code already checks the output of
spi_nor_hwcaps_read2cmd() as it could be -EINVAL.


Do you want us to take this patch anyway to please the code checker ?
I don't think it is mandatory as a fix for 4.14-rc2.

Best regards,

Cyrille
