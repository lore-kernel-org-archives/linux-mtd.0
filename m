Received: from mail-lb0-f179.google.com ([209.85.217.179])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmnJ3-0004Ch-Us
 for linux-mtd@lists.infradead.org; Thu, 15 Oct 2015 18:31:15 +0000
Received: by lbwr8 with SMTP id r8so79956292lbw.2
 for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2015 11:30:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1444893451-16610-1-git-send-email-antoine.tenart@free-electrons.com>
References: <1444893451-16610-1-git-send-email-antoine.tenart@free-electrons.com>
Date: Thu, 15 Oct 2015 15:30:50 -0300
Message-ID: <CAAEAJfBdfc-=AH0z_A8-b70LH_=GJp0qPRp0zCohqDBf8pnokQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] mtd: pxa3xx_nand: rework the timing setup
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, zmxu@marvell.com,
 jszhang@marvell.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ccing Robert as he can provide valuable test on PXA boards.

On 15 October 2015 at 04:17, Antoine Tenart
<antoine.tenart@free-electrons.com> wrote:
> Hi all,
>
> Let's try one more time to get this merged.
>
> Another series, introducing the Berlin nand support, depends on this.
>
> This series was part of a bigger one[1], which was split into smaller
> ones as asked by Ezequiel[2]. When we take this into account, this is
> v8.
>
> The aim here is to use the nand framework to setup the timings,
> while keeping the old in-driver way of configuration timings for
> compatibility reasons.
>
> You can find the series at:
> https://github.com/atenart/linux.git berlin/4.3/nand-timings
>
> Antoine
>
> Since v2:
>         - Added back the support for keep-config 16 bits devices
>         - Fixed wrong unit in a calculation
>         - Reworked the pxa3xx_nand_init_timings() logic
>         - Allowed compile test the pxa3xx driver
>
> Since v1:
>         - Rebased on top of v4.2-rc1
>
> Since the series was split up:
>         - Reworked the ndcr setup
>         - Removed the read_id_bytes update after device detection
>
> Antoine Tenart (4):
>   mtd: nand: allow compile test of MTD_NAND_PXA3xx
>   mtd: pxa3xx_nand: add helpers to setup the timings
>   mtd: pxa3xx_nand: rework flash detection and timing setup
>   mtd: pxa3xx_nand: clean up the pxa3xx timings
>
>  drivers/mtd/nand/Kconfig                      |   2 +-
>  drivers/mtd/nand/pxa3xx_nand.c                | 273 ++++++++++++++++----=
------
>  include/linux/platform_data/mtd-nand-pxa3xx.h |  11 +-
>  3 files changed, 172 insertions(+), 114 deletions(-)
>
> --
> 2.6.1
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
