Date: Fri, 7 Oct 2016 18:48:40 +0300
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sergio Prado <sergio.prado@e-labworks.com>
Cc: linux@armlinux.org.uk, linux@simtec.co.uk, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org, kgene@kernel.org,
 krzk@kernel.org, javier@osg.samsung.com,
 boris.brezillon@free-electrons.com, richard@nod.at,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mtd: s3c2410: make ecc mode configurable via
 platform data
Message-ID: <20161007154840.GA4222@kozik-lap>
References: <1475711217-974-1-git-send-email-sergio.prado@e-labworks.com>
 <1475711217-974-2-git-send-email-sergio.prado@e-labworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1475711217-974-2-git-send-email-sergio.prado@e-labworks.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 05, 2016 at 08:46:55PM -0300, Sergio Prado wrote:
> Removing CONFIG_MTD_NAND_S3C2410_HWECC option and adding a ecc_mode
> field in the drivers's platform data structure so it can be selectable
> via platform data.
> 
> Also setting this field to NAND_ECC_SOFT in all boards using this
> driver since none of them had CONFIG_MTD_NAND_S3C2410_HWECC enabled.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  arch/arm/mach-s3c24xx/common-smdk.c            |   1 +
>  arch/arm/mach-s3c24xx/mach-anubis.c            |   1 +
>  arch/arm/mach-s3c24xx/mach-at2440evb.c         |   1 +
>  arch/arm/mach-s3c24xx/mach-bast.c              |   1 +
>  arch/arm/mach-s3c24xx/mach-gta02.c             |   1 +
>  arch/arm/mach-s3c24xx/mach-jive.c              |   1 +
>  arch/arm/mach-s3c24xx/mach-mini2440.c          |   1 +
>  arch/arm/mach-s3c24xx/mach-osiris.c            |   1 +
>  arch/arm/mach-s3c24xx/mach-qt2410.c            |   1 +
>  arch/arm/mach-s3c24xx/mach-rx1950.c            |   1 +
>  arch/arm/mach-s3c24xx/mach-rx3715.c            |   1 +
>  arch/arm/mach-s3c24xx/mach-vstms.c             |   1 +
>  arch/arm/mach-s3c64xx/mach-hmt.c               |   1 +
>  arch/arm/mach-s3c64xx/mach-mini6410.c          |   1 +
>  arch/arm/mach-s3c64xx/mach-real6410.c          |   1 +
>  drivers/mtd/nand/Kconfig                       |   9 --
>  drivers/mtd/nand/s3c2410.c                     | 119 +++++++++++++------------
>  include/linux/platform_data/mtd-nand-s3c2410.h |   6 +-
>  18 files changed, 79 insertions(+), 70 deletions(-)
>


Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
