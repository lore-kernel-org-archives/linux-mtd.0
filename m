MIME-Version: 1.0
References: <20181216084854.GJ13243@dragon>
 <CAK8P3a34R+Gv+H8_jjGP452i2kSqq+u0PsE-4pDnRRtY14SG0w@mail.gmail.com>
 <a73f86ff-15ce-9512-bbf0-be852cf39a35@kontron.de>
In-Reply-To: <a73f86ff-15ce-9512-bbf0-be852cf39a35@kontron.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Dec 2018 17:11:36 +0100
Message-ID: <CAK8P3a1PMoR-WWcb_G8sTVW9HKUKvKfUZmcinkOEy9mJ5c=Lxw@mail.gmail.com>
Subject: Re: [GIT PULL] FSL QSPI device tree cleanup for 4.21
To: frieder.schrempf@kontron.de
Cc: Shawn Guo <shawnguo@kernel.org>, arm-soc <arm@kernel.org>,
 Fabio Estevam <fabio.estevam@nxp.com>, Sascha Hauer <kernel@pengutronix.de>,
 linux-imx@nxp.com, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 20, 2018 at 5:03 PM Schrempf Frieder
<frieder.schrempf@kontron.de> wrote:
>
> Hi Arnd,
>
> On 20.12.18 16:50, Arnd Bergmann wrote:
> > On Sun, Dec 16, 2018 at 9:50 AM Shawn Guo <shawnguo@kernel.org> wrote:
> >>
> >> Hi,
> >>
> >> As the series cleans up both i.MX/Freescale arm32 and arm64 device
> >> trees, the pull request is based on a merge of tag imx-dt-4.21 and
> >> imx-dt64-4.21 that have already been pulled into arm-soc next/dt branch.
> >> This comes a bit late, and we appreciate it if you can pull it for 4.21,
> >> as it paves the way for new QSPI driver under SPI framework to land in
> >> the next release cycle.  Thanks.
> >
> > Pulled into next/dt. For my understanding, what is going to happen
> > with the fsl-quadspi mtd driver? Will it remain as part of the kernel
> > to support old DTB files, or will that transitions mean those stop
> > working with new kernels and have to be updated the same way?
>
> Thanks for pulling these late changes. The old SPI NOR driver
> (fsl-quadspi.c) will be replaced by the new SPI driver. Old dtb files
> will work with the new driver if they already have the reg properties
> set up correctly (which should be the case, but who knows what setups
> exist out-of-tree).

Ok, good.

> There will be a performance penalty though if you do not set
> spi-[tx/rx]-bus-width to 4.

I guess that's acceptable, but what is the reason for requiring
this? Would it be possible to have the qspi driver add those
properties and print a warning whenever the dtb doesn't
already contain them?

     Arnd
