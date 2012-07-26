Date: Thu, 26 Jul 2012 10:29:30 +0800
From: Dong Aisheng <b29396@freescale.com>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: imx_v6_v7_defconfig: Select MXS_DMA
Message-ID: <20120726022930.GB3396@shlinux2.ap.freescale.net>
References: <1343215100-24005-1-git-send-email-festevam@gmail.com>
 <1343215100-24005-3-git-send-email-festevam@gmail.com>
 <CAMiH66EA4O0s8hfXkr_SJ56+q7eZ8w0=3C1r_C+m2Os1RxprmA@mail.gmail.com>
 <CAOMZO5BfT+_7x4F96Kvqtq5STXxw2Y9CxbCCAc_UnZ-3wy0qxg@mail.gmail.com>
 <CAMiH66FUxiw0B8iD5rYi=nUX0VYZBzOKifXKfTqd1RmSHhC80g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMiH66FUxiw0B8iD5rYi=nUX0VYZBzOKifXKfTqd1RmSHhC80g@mail.gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Artem.Bityutskiy@linux.intel.com, b32955@freescale.com,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, shawn.guo@linaro.org,
 Fabio Estevam <festevam@gmail.com>, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 26, 2012 at 10:24:41AM +0800, Huang Shijie wrote:
> On Wed, Jul 25, 2012 at 11:23 PM, Fabio Estevam <festevam@gmail.com> wrote:
> > On Wed, Jul 25, 2012 at 12:05 PM, Huang Shijie <shijie8@gmail.com> wrote:
> >
> >> Is this patch needed? The mxs-dma only has one user, the gpmi-nand in mx6q.
> >> this patch makes the kernel built-in the mxs-dma, even the gpmi-nand
> >> is not enabled.
> >
> > Well, as the driver currently stands: yes, it is needed.
> >
> > Without CONFIG_MXS_DMA, the GPMI driver cannot even be built.
> But you have added "depend on MXS_DMA". So If you do not select the
> mxs-dma, you can not see the
> gpmi-nand.
> that's why i think this patch is not needed.
> 
How about using 'select MXS_DMA'?
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 31bb7e5..e7c3dcf 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -481,6 +481,7 @@ config MTD_NAND_NANDSIM
 config MTD_NAND_GPMI_NAND
         bool "GPMI NAND Flash Controller driver"
         depends on MTD_NAND && (SOC_IMX23 || SOC_IMX28 || SOC_IMX6Q)
+       select MXS_DMA
         help

Then we do not need this patch and does not have the issue that MXS_DMA is
still compiled even GPMI_NAND is not selected.

Regards
Dong Aisheng
