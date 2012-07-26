MIME-Version: 1.0
In-Reply-To: <CAOMZO5BfT+_7x4F96Kvqtq5STXxw2Y9CxbCCAc_UnZ-3wy0qxg@mail.gmail.com>
References: <1343215100-24005-1-git-send-email-festevam@gmail.com>
 <1343215100-24005-3-git-send-email-festevam@gmail.com>
 <CAMiH66EA4O0s8hfXkr_SJ56+q7eZ8w0=3C1r_C+m2Os1RxprmA@mail.gmail.com>
 <CAOMZO5BfT+_7x4F96Kvqtq5STXxw2Y9CxbCCAc_UnZ-3wy0qxg@mail.gmail.com>
Date: Thu, 26 Jul 2012 10:24:41 +0800
Message-ID: <CAMiH66FUxiw0B8iD5rYi=nUX0VYZBzOKifXKfTqd1RmSHhC80g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: imx_v6_v7_defconfig: Select MXS_DMA
From: Huang Shijie <shijie8@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
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

On Wed, Jul 25, 2012 at 11:23 PM, Fabio Estevam <festevam@gmail.com> wrote:
> On Wed, Jul 25, 2012 at 12:05 PM, Huang Shijie <shijie8@gmail.com> wrote:
>
>> Is this patch needed? The mxs-dma only has one user, the gpmi-nand in mx6q.
>> this patch makes the kernel built-in the mxs-dma, even the gpmi-nand
>> is not enabled.
>
> Well, as the driver currently stands: yes, it is needed.
>
> Without CONFIG_MXS_DMA, the GPMI driver cannot even be built.
But you have added "depend on MXS_DMA". So If you do not select the
mxs-dma, you can not see the
gpmi-nand.
that's why i think this patch is not needed.

Huang Shijie

>
> This is why I thought that 'select MXS_DMA' was the way to go, but
> according to the thread you pointed me at, it was Nacked by Shawn.
>
> Regards,
>
> Fabio Estevam
