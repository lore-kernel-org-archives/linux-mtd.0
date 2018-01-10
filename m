Subject: Re: [PATCH 2/2] MAINTAINERS: mtd/nand: update Microchip nand entry
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>, Boris BREZILLON
 <boris.brezillon@free-electrons.com>
CC: <linux-media@vger.kernel.org>, Alexandre Belloni
 <alexandre.belloni@free-electrons.com>, <linux-mtd@lists.infradead.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Josh Wu
 <rainyfeeling@outlook.com>
References: <eb6b3cbe8e48faee7e88eca0649e42cbde91ffa6.1515503733.git.nicolas.ferre@microchip.com>
 <d8a6b8a3fe05c57972de1c374fcdeb933717396b.1515503733.git.nicolas.ferre@microchip.com>
From: "Yang, Wenyou" <Wenyou.Yang@Microchip.com>
Message-ID: <cf8d2448-f4ba-c6d3-2fe6-ded5d32151fc@Microchip.com>
Date: Wed, 10 Jan 2018 09:53:54 +0800
MIME-Version: 1.0
In-Reply-To: <d8a6b8a3fe05c57972de1c374fcdeb933717396b.1515503733.git.nicolas.ferre@microchip.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 2018/1/9 21:46, Nicolas Ferre wrote:
> Update Wenyou Yang email address.
> Take advantage of this update to move this entry to the MICROCHIP / ATMEL
> location and add the DT binding documentation link.
>
> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Acked-by: Wenyou Yang <wenyou.yang@microchip.com>
> ---
> Hi,
>
> Patch against next-20180109.
> This patch is somehow dependent on the previous one in the series
> ("MAINTAINERS: linux-media: update Microchip ISI and ISC entries") but can be
> rebased easily.
>
> I don't know if it's better to have them added at the end of the development
> cycle or just after rc1: let me know if you plan to take them or if I need to
> rebase them for next cycle.
>
> Best regards,
>    Nicolas
>
>
>   MAINTAINERS | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 65c4b59b582f..b48e217d41fb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2373,13 +2373,6 @@ F:	Documentation/devicetree/bindings/input/atmel,maxtouch.txt
>   F:	drivers/input/touchscreen/atmel_mxt_ts.c
>   F:	include/linux/platform_data/atmel_mxt_ts.h
>   
> -ATMEL NAND DRIVER
> -M:	Wenyou Yang <wenyou.yang@atmel.com>
> -M:	Josh Wu <rainyfeeling@outlook.com>
> -L:	linux-mtd@lists.infradead.org
> -S:	Supported
> -F:	drivers/mtd/nand/atmel/*
> -
>   ATMEL SAMA5D2 ADC DRIVER
>   M:	Ludovic Desroches <ludovic.desroches@microchip.com>
>   L:	linux-iio@vger.kernel.org
> @@ -9110,6 +9103,14 @@ F:	drivers/media/platform/atmel/atmel-isi.c
>   F:	include/media/atmel-isi.h
>   F:	Documentation/devicetree/bindings/media/atmel-isi.txt
>   
> +MICROCHIP / ATMEL NAND DRIVER
> +M:	Wenyou Yang <wenyou.yang@microchip.com>
> +M:	Josh Wu <rainyfeeling@outlook.com>
> +L:	linux-mtd@lists.infradead.org
> +S:	Supported
> +F:	drivers/mtd/nand/atmel/*
> +F:	Documentation/devicetree/bindings/mtd/atmel-nand.txt
> +
>   MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER
>   M:	Woojung Huh <Woojung.Huh@microchip.com>
>   M:	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>

Best Regards,
Wenyou Yang
