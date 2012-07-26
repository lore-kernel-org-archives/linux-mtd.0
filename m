MIME-Version: 1.0
In-Reply-To: <CAMiH66HCih0=zWqhwAGj+rVTW7-9vNO8y-6tC+p8R7yg=+sojw@mail.gmail.com>
References: <1343215100-24005-1-git-send-email-festevam@gmail.com>
 <1343215100-24005-3-git-send-email-festevam@gmail.com>
 <CAMiH66EA4O0s8hfXkr_SJ56+q7eZ8w0=3C1r_C+m2Os1RxprmA@mail.gmail.com>
 <CAOMZO5BfT+_7x4F96Kvqtq5STXxw2Y9CxbCCAc_UnZ-3wy0qxg@mail.gmail.com>
 <CAMiH66FUxiw0B8iD5rYi=nUX0VYZBzOKifXKfTqd1RmSHhC80g@mail.gmail.com>
 <CAOMZO5DUN5d_aN=j8bfj6n3of=r2A-mu+jqNXCR-4HVTA7kS6Q@mail.gmail.com>
 <CAMiH66HCih0=zWqhwAGj+rVTW7-9vNO8y-6tC+p8R7yg=+sojw@mail.gmail.com>
Date: Thu, 26 Jul 2012 08:08:30 -0300
Message-ID: <CAOMZO5BziYJVUzniUoZmdFejso+6dBOc6QtTuzbbMyVOXuOFDQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: imx_v6_v7_defconfig: Select MXS_DMA
From: Fabio Estevam <festevam@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Artem.Bityutskiy@linux.intel.com, b32955@freescale.com,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, shawn.guo@linaro.org,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 26, 2012 at 7:56 AM, Huang Shijie <shijie8@gmail.com> wrote:
> On Thu, Jul 26, 2012 at 6:53 AM, Fabio Estevam <festevam@gmail.com> wrote:
>> On Wed, Jul 25, 2012 at 11:24 PM, Huang Shijie <shijie8@gmail.com> wrote:
>>
>>> But you have added "depend on MXS_DMA". So If you do not select the
>>> mxs-dma, you can not see the
>>> gpmi-nand.
>>> that's why i think this patch is not needed.
>>
>> So how CONFIG_MXS_DMA would be selected if not via defconfig?
> Use the make menuconfig ARCH=arm:
>
> "device drivers"-->"DMA engine support" -->"mxs dma support"

I prefer to have selected in the defconfig by default instead.

It is not obvious for the end user that they need to manually select
this option.

mxs_defconfig also selects CONFIG_MXS_DMA.

Can't we do the same here and let imx_v6_v7_defconfig be built again?
