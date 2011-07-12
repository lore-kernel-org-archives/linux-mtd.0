MIME-Version: 1.0
In-Reply-To: <1310466535-15287-5-git-send-email-leiwen@marvell.com>
References: <1310096084-14646-1-git-send-email-leiwen@marvell.com>
	<1310466535-15287-5-git-send-email-leiwen@marvell.com>
Date: Tue, 12 Jul 2011 13:39:59 +0200
Message-ID: <CACTFLANDZN6gAorV1MYEFD3FnAnomPqLgx44pPUeUaxKjApG_Q@mail.gmail.com>
Subject: Re: [PATCH V6 4/4] MTD: pxa3xx_nand: enhance suspend and resume
	routine
From: Daniel Mack <zonque@gmail.com>
To: Lei Wen <leiwen@marvell.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Artem Bityutskiy <dedekind1@gmail.com>, Yu Tang <ytang5@marvell.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>, linux-mtd@lists.infradead.org,
	Igor Grinberg <grinberg@compulab.co.il>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 12, 2011 at 12:28 PM, Lei Wen <leiwen@marvell.com> wrote:
> This patch add protection on the suspend&resume path to prevent
> some unexpected behavior, like interrupt occur at the very second
> of resume back and it don't follow normal command path, which lead
> to bug.
>
> Signed-off-by: Lei Wen <leiwen@marvell.com>
> ---
> =A0drivers/mtd/nand/pxa3xx_nand.c | =A0 28 ++++++++++++++++++++++++++++
> =A01 files changed, 28 insertions(+), 0 deletions(-)
>

[...]

> @@ -1267,6 +1283,18 @@ static int pxa3xx_nand_resume(struct platform_devi=
ce *pdev)
> =A0 =A0 =A0 =A0info->cs =3D 0xff;
> =A0 =A0 =A0 =A0clk_enable(info->clk);
>
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* As the spec, the NDSR would be updated to 0x1800 when
> + =A0 =A0 =A0 =A0* do the nand_clk disable/enable.
> + =A0 =A0 =A0 =A0* To prevent it damage state machine of the driver, clea=
r
> + =A0 =A0 =A0 =A0* all status before resume
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 nand_writel(nand, NDSR, NDSR_MASK);

This doesn't build:

  CC      drivers/mtd/nand/pxa3xx_nand.o
drivers/mtd/nand/pxa3xx_nand.c: In function 'pxa3xx_nand_resume':
drivers/mtd/nand/pxa3xx_nand.c:1292: error: 'nand' undeclared (first
use in this function)
drivers/mtd/nand/pxa3xx_nand.c:1292: error: (Each undeclared
identifier is reported only once
drivers/mtd/nand/pxa3xx_nand.c:1292: error: for each function it appears in=
.)
drivers/mtd/nand/pxa3xx_nand.c:1294: error: 'mtd' undeclared (first
use in this function)
make[3]: *** [drivers/mtd/nand/pxa3xx_nand.o] Error 1

I guess this was not even compile tested? Anyway, I did a trivial
fix-up and will test.


Daniel
