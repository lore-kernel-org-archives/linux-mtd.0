Subject: Re: [PATCH] mtd: spi-nor: stm32: remove broken MODULE_ALIAS
To: Arnd Bergmann <arnd@arndb.de>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Marek Vasut <marek.vasut@gmail.com>
References: <20170427111001.2587551-1-arnd@arndb.de>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: Ludovic BARRE <ludovic.barre@st.com>
Message-ID: <dc7d8b5e-0f0e-1593-4c6b-0c93a828818c@st.com>
Date: Thu, 27 Apr 2017 14:17:23 +0200
MIME-Version: 1.0
In-Reply-To: <20170427111001.2587551-1-arnd@arndb.de>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

thanks a lot Arnd

Oops, I've not tested in Module :-(.
Just tested in built-in, and used bind/unbind and device tree overlays.

BR
Ludo
On 04/27/2017 01:09 PM, Arnd Bergmann wrote:
> The MODULE_ALIAS statement refers to a macro that has never been defined
> in this driver, causing a build error:
>
> drivers/mtd/spi-nor/stm32-quadspi.c:694:150: error: expected ',' or ';' before 'DRIVER_NAME'
>
> Unless there is a specific alias we need other then the driver name,
> we don't need an alias here and can simply remove the line to fix the
> build.
>
> Fixes: dc5e400611c5 ("mtd: spi-nor: add driver for STM32 quad spi flash controller")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/mtd/spi-nor/stm32-quadspi.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/stm32-quadspi.c b/drivers/mtd/spi-nor/stm32-quadspi.c
> index 90d9152ddf98..1056e7408d2a 100644
> --- a/drivers/mtd/spi-nor/stm32-quadspi.c
> +++ b/drivers/mtd/spi-nor/stm32-quadspi.c
> @@ -691,7 +691,6 @@ static struct platform_driver stm32_qspi_driver = {
>   };
>   module_platform_driver(stm32_qspi_driver);
>   
> -MODULE_ALIAS("platform:" DRIVER_NAME);
>   MODULE_AUTHOR("Ludovic Barre <ludovic.barre@st.com>");
>   MODULE_DESCRIPTION("STMicroelectronics STM32 quad spi driver");
>   MODULE_LICENSE("GPL v2");
