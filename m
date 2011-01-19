Received: from www.wytron.com.tw ([211.75.82.101])
	by casper.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PfPRi-0006zK-3Q
	for linux-mtd@lists.infradead.org; Wed, 19 Jan 2011 04:14:58 +0000
Message-ID: <4D3665C3.5080604@wytron.com.tw>
Date: Wed, 19 Jan 2011 12:17:07 +0800
From: Thomas Chou <thomas@wytron.com.tw>
MIME-Version: 1.0
To: Thomas Chou <thomas@wytron.com.tw>
Subject: Re: [PATCH] mtd/of: allow MTD_OF_PARTS and MTD_PHYSMAP_OF config
	to others
References: <1295408639-14742-1-git-send-email-thomas@wytron.com.tw>
In-Reply-To: <1295408639-14742-1-git-send-email-thomas@wytron.com.tw>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Grant Likely <grant.likely@secretlab.ca>,
	devicetree-discuss@lists.ozlabs.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/19/2011 11:43 AM, Thomas Chou wrote:
> As devicetree support is added to more arch, these config should
> be allowed to other arch.

Please ignore this patch, as it is already fixed by Rob Herring.

- Thomas


>
> Signed-off-by: Thomas Chou<thomas@wytron.com.tw>
> ---
>   drivers/mtd/Kconfig      |    2 +-
>   drivers/mtd/maps/Kconfig |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> index 1e2cbf5..b1f7689 100644
> --- a/drivers/mtd/Kconfig
> +++ b/drivers/mtd/Kconfig
> @@ -159,7 +159,7 @@ config MTD_AFS_PARTS
>
>   config MTD_OF_PARTS
>   	tristate "Flash partition map based on OF description"
> -	depends on (MICROBLAZE || PPC_OF)&&  MTD_PARTITIONS
> +	depends on OF&&  MTD_PARTITIONS
>   	help
>   	  This provides a partition parsing function which derives
>   	  the partition map from the children of the flash node,
> diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
> index a0dd7bb..5d37d31 100644
> --- a/drivers/mtd/maps/Kconfig
> +++ b/drivers/mtd/maps/Kconfig
> @@ -72,7 +72,7 @@ config MTD_PHYSMAP_BANKWIDTH
>
>   config MTD_PHYSMAP_OF
>   	tristate "Flash device in physical memory map based on OF description"
> -	depends on (MICROBLAZE || PPC_OF)&&  (MTD_CFI || MTD_JEDECPROBE || MTD_ROM)
> +	depends on OF&&  (MTD_CFI || MTD_JEDECPROBE || MTD_ROM)
>   	help
>   	  This provides a 'mapping' driver which allows the NOR Flash and
>   	  ROM driver code to communicate with chips which are mapped
