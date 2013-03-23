Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UJOf6-0003G0-AR
 for linux-mtd@lists.infradead.org; Sat, 23 Mar 2013 13:39:09 +0000
Received: by mail-wi0-f178.google.com with SMTP id ez12so653002wid.17
 for <linux-mtd@lists.infradead.org>; Sat, 23 Mar 2013 06:39:05 -0700 (PDT)
Sender: Florian Fainelli <f.fainelli@gmail.com>
From: Florian Fainelli <florian@openwrt.org>
To: Jonas Gorski <jogo@openwrt.org>
Subject: Re: [PATCH 2/3] MIPS: BCM63XX: export PSI size from nvram
Date: Sat, 23 Mar 2013 14:39:00 +0100
References: <1364044070-10486-1-git-send-email-jogo@openwrt.org>
 <1364044070-10486-3-git-send-email-jogo@openwrt.org>
In-Reply-To: <1364044070-10486-3-git-send-email-jogo@openwrt.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201303231439.00694.florian@openwrt.org>
Cc: linux-mips@linux-mips.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, linux-mtd@lists.infradead.org,
 Maxime Bizon <mbizon@freebox.fr>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Jonas,

A few minor comments below:

Le samedi 23 mars 2013 14:07:48, Jonas Gorski a =C3=A9crit :
> Signed-off-by: Jonas Gorski <jogo@openwrt.org>
> ---
>  arch/mips/bcm63xx/nvram.c                          |   11 +++++++++++
>  arch/mips/include/asm/mach-bcm63xx/bcm63xx_nvram.h |    2 ++
>  2 files changed, 13 insertions(+)
>=20
> diff --git a/arch/mips/bcm63xx/nvram.c b/arch/mips/bcm63xx/nvram.c
> index 6206116..44af608 100644
> --- a/arch/mips/bcm63xx/nvram.c
> +++ b/arch/mips/bcm63xx/nvram.c
> @@ -35,6 +35,8 @@ struct bcm963xx_nvram {
>  	u32	checksum_high;
>  };
>=20
> +#define BCM63XX_DEFAULT_PSI_SIZE	64
> +
>  static struct bcm963xx_nvram nvram;
>  static int mac_addr_used;
>=20
> @@ -105,3 +107,12 @@ int bcm63xx_nvram_get_mac_address(u8 *mac)
>  	return 0;
>  }
>  EXPORT_SYMBOL(bcm63xx_nvram_get_mac_address);
> +
> +int bcm63xx_nvram_get_psi_size(void)
> +{
> +	if (nvram.psi_size > 0)
> +		return nvram.psi_size;
> +
> +	return BCM63XX_DEFAULT_PSI_SIZE;

I wonder if it would not be better to return a size in KBytes here instead =
of=20
a multiple of KBytes?

> +}
> +EXPORT_SYMBOL(bcm63xx_nvram_get_psi_size);
> diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_nvram.h
> b/arch/mips/include/asm/mach-bcm63xx/bcm63xx_nvram.h index
> 62d6a3b..d76a486 100644
> --- a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_nvram.h
> +++ b/arch/mips/include/asm/mach-bcm63xx/bcm63xx_nvram.h
> @@ -32,4 +32,6 @@ u8 *bcm63xx_nvram_get_name(void);
>   */
>  int bcm63xx_nvram_get_mac_address(u8 *mac);
>=20
> +int bcm63xx_nvram_get_psi_size(void);

You could use an unsigned int here.
=2D-=20
=46lorian
