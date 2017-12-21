MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <b55511ad-6d23-0356-f2d3-8e2b7c6d1ffb@ti.com>
References: <b55511ad-6d23-0356-f2d3-8e2b7c6d1ffb@ti.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Dec 2017 16:24:18 +0100
Message-ID: <CAK8P3a1-rtV3HyiCbog20FR24oz__f4X=k=0=ND3Mk88CVd_8w@mail.gmail.com>
Subject: Re: [GIT PULL] omap-gpmc changes for v4.16 merge (immutable for mtd)
To: Roger Quadros <rogerq@ti.com>
Cc: arm-soc <arm@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Ladislav Michl <ladis@linux-mips.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 11, 2017 at 3:16 PM, Roger Quadros <rogerq@ti.com> wrote:
> Hi Arnd/Olof,
>
> The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:
>
>   Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)
>
> are available in the git repository at:
>
>   https://github.com/rogerq/linux.git tags/gpmc-omap-for-v4.16-immutable
>
> for you to fetch changes up to c18a7ac3398d0cef29749f9568666db8321aa4c9:
>
>   memory: omap-gpmc: Make 'bank-width' property optional (2017-12-01 15:37:49 +0200)
>
> ----------------------------------------------------------------
> OMAP-GPMC: driver updates for v4.16
> * Error out only if both 'bank-width' and 'gpmc,device-width' DT properties are missing.

Pulled into next/drivers, thanks!

        Arnd
