Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHarR-0004k7-V5
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 16:57:46 +0000
Received: by pdjr16 with SMTP id r16so125760638pdj.3
 for <linux-mtd@lists.infradead.org>; Tue, 21 Jul 2015 09:57:25 -0700 (PDT)
Date: Tue, 21 Jul 2015 09:57:21 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Pawel Moll <Pawel.Moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stephen Warren <swarren@wwwdotorg.org>, Marek Vasut <marex@denx.de>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-spi <linux-spi@vger.kernel.org>
Subject: Re: [PATCH] Documentation: dt: mtd: replace "nor-jedec" binding with
 "jedec,spi-nor"
Message-ID: <20150721165721.GJ24125@google.com>
References: <1431624773-4165-1-git-send-email-computersforpeace@gmail.com>
 <20150515195541.GL11598@ld-irv-0074>
 <20150518104501.GD3551@leverpostej>
 <20150518183442.GR11598@ld-irv-0074>
 <CAMuHMdUCj2AXk_0mAgRfAStrveHPi=Rp2g-b177zO_ode8NaCw@mail.gmail.com>
 <20150519013415.GV11598@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150519013415.GV11598@ld-irv-0074>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 18, 2015 at 06:34:15PM -0700, Brian Norris wrote:
> So how about the following patch? It seems like we'll need to be able to
> ignore useless 'modalias' values in cases like this:
> 
> 	// modalias = "shinynewdevice"
> 	compatible = "myvendor,shinynewdevice", "jedec,spi-nor";
> 
> and also if somebody leaves off the entire shinynewdevice string:
> 
> 	// modalias = "spi-nor"
> 	compatible = "jedec,spi-nor";
> 
> So we rework the spi-nor library to not reject "bad" names, and just
> fall back to autodetection, and we add the .of_match_table to properly
> catch all "jedec,spi-nor".
> 
> Signed-off-by: Brian Norris <computerfsorpeace@gmail.com>

I realized this conversation ended in essentially an ack from Rafal,
with no other comments. So I've pushed this (with some extra commentary)
to l2-mtd.git. Holler if there are objections.

Thanks,
Brian

> ---
>  drivers/mtd/devices/m25p80.c  | 18 +++++++++++-------
>  drivers/mtd/spi-nor/spi-nor.c |  8 ++++----
>  2 files changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 3af137f49ac9..30d608775f5a 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -223,8 +223,6 @@ static int m25p_probe(struct spi_device *spi)
>  	 */
>  	if (data && data->type)
>  		flash_name = data->type;
> -	else if (!strcmp(spi->modalias, "spi-nor"))
> -		flash_name = NULL; /* auto-detect */
>  	else
>  		flash_name = spi->modalias;
>  
> @@ -301,19 +299,25 @@ static const struct spi_device_id m25p_ids[] = {
>  	{"w25q128"},	{"w25q256"},	{"cat25c11"},
>  	{"cat25c03"},	{"cat25c09"},	{"cat25c17"},	{"cat25128"},
>  
> -	/*
> -	 * Generic support for SPI NOR that can be identified by the JEDEC READ
> -	 * ID opcode (0x9F). Use this, if possible.
> -	 */
> -	{"spi-nor"},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(spi, m25p_ids);
>  
> +static const struct of_device_id m25p_of_table[] = {
> +	/*
> +	 * Generic compatibility for SPI NOR that can be identified by the
> +	 * JEDEC READ ID opcode (0x9F). Use this, if possible.
> +	 */
> +	{ .compatible = "jedec,spi-nor" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, m25p_of_table);
> +
>  static struct spi_driver m25p80_driver = {
>  	.driver = {
>  		.name	= "m25p80",
>  		.owner	= THIS_MODULE,
> +		.of_match_table = m25p_of_table,
>  	},
>  	.id_table	= m25p_ids,
>  	.probe	= m25p_probe,
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 14a5d2325dac..390d6fa0a53f 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1003,11 +1003,11 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>  	if (ret)
>  		return ret;
>  
> -	/* Try to auto-detect if chip name wasn't specified */
> -	if (!name)
> -		id = spi_nor_read_id(nor);
> -	else
> +	if (name)
>  		id = spi_nor_match_id(name);
> +	/* Try to auto-detect if chip name wasn't specified or not found */
> +	if (!id)
> +		id = spi_nor_read_id(nor);
>  	if (IS_ERR_OR_NULL(id))
>  		return -ENOENT;
>  
> -- 
> 1.9.1
> 
