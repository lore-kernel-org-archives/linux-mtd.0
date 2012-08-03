Message-ID: <501B92FB.8040203@freescale.com>
Date: Fri, 3 Aug 2012 16:59:39 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Dirk Behme <dirk.behme@de.bosch.com>
Subject: Re: [PATCH v2 3/3] ARM: imx_v6_v7_defconfig: Select MXS_DMA
References: <1343215100-24005-1-git-send-email-festevam@gmail.com>
 <1343215100-24005-3-git-send-email-festevam@gmail.com>
 <501B8E74.4030803@de.bosch.com>
In-Reply-To: <501B8E74.4030803@de.bosch.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Huang Shijie <shijie8@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "Artem.Bityutskiy@linux.intel.com" <Artem.Bityutskiy@linux.intel.com>,
 "shawn.guo@linaro.org" <shawn.guo@linaro.org>,
 Fabio Estevam <festevam@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B408=E6=9C=8803=E6=97=A5 16:40, Dirk Behme =E5=86=99=
=E9=81=93:
> On 25.07.2012 13:18, Fabio Estevam wrote:
>> From: Fabio Estevam <fabio.estevam@freescale.com>
>>
>> Let MXS_DMA be selected by default.
>>
>> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
>> ---
>> Changes since v1:
>> - No changes. Newly introduced in this series
>> arch/arm/configs/imx_v6_v7_defconfig | 1 +
>> 1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/configs/imx_v6_v7_defconfig=20
>> b/arch/arm/configs/imx_v6_v7_defconfig
>> index f725b96..3c9f32f 100644
>> --- a/arch/arm/configs/imx_v6_v7_defconfig
>> +++ b/arch/arm/configs/imx_v6_v7_defconfig
>> @@ -192,6 +192,7 @@ CONFIG_RTC_DRV_MC13XXX=3Dy
>> CONFIG_RTC_DRV_MXC=3Dy
>> CONFIG_DMADEVICES=3Dy
>> CONFIG_IMX_SDMA=3Dy
>> +CONFIG_MXS_DMA=3Dy
>> CONFIG_COMMON_CLK_DEBUG=3Dy
>> # CONFIG_IOMMU_SUPPORT is not set
>> CONFIG_EXT2_FS=3Dy
>
> Building mainline 3.6-rc1 with imx_v6_v7_defconfig this is still=20
> broken due to
>
> drivers/built-in.o: In function `gpmi_dma_filter':
> clk-fixed-factor.c:(.text+0xab170): undefined reference to=20
> `mxs_dma_is_apbh'
>
> Is any fix for this on its way to mainline? Either the above or any=20
> other one?
>
> Best regards
>
> Dirk
>
Since the gpmi has been enabled in the config file, I think it's better=20
to select the mxs-dma in the config file too.

Acked-by: Huang Shijie <b32955@freescale.com>

Huang Shijie
