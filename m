Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QF6w1-0005fB-3U
	for linux-mtd@lists.infradead.org; Wed, 27 Apr 2011 15:45:50 +0000
Received: by vws8 with SMTP id 8so1715820vws.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 Apr 2011 08:45:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1303906161-24175-1-git-send-email-parth.saxena@ti.com>
References: <1303906161-24175-1-git-send-email-parth.saxena@ti.com>
Date: Wed, 27 Apr 2011 18:45:47 +0300
Message-ID: <BANLkTi=sq5am1HKeOfYTmYHUm96O08N-jw@mail.gmail.com>
Subject: Re: [RFC] mtd: nand: Fix bad block identification issue
From: Grazvydas Ignotas <notasas@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "Basheer, Mansoor Ahamed" <mansoor.ahamed@ti.com>,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, "Saxena,
	Parth" <parth.saxena@ti.com>, linux-omap@vger.kernel.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian,

did you really intend to remove badblockbits? Maybe it should go back
to nand_base.c?

On Wed, Apr 27, 2011 at 3:09 PM, Saxena, Parth <parth.saxena@ti.com> wrote:
> Commit e0b58d0 ("mtd: nand: add ->badblockbits for minimum number
> of set bits in bad block byte") by Maxim Levitsky added
> badblockbits to nand_chip to specify minimum number of set bits
> in bad block byte. The patch initialized badblockbits to 8 in
> nand_base.c, but later the initialization line got removed by commit
> c7b28e2("mtd: nand: refactor BB marker detection"). After this all
> NAND drivers with NAND_SKIP_BBTSCAN are forced to initialize it to 8.
> Otherwise bad block identification will fail.
>
> As a result, mounting of empty jffs2 file system on omap3evm
> (having bad blocks) failed giving the following error message -
>
> "mount: mounting /dev/mtdblock4 on /tmp failed: Input/output error"
>
> This patch solves the above issue for omap by initialising
> badblockbits. We are working further on this to find a generic fix
> to the problem in nand_base.c.
>
> Signed-off-by: Saxena, Parth <parth.saxena@ti.com>
> Signed-off-by: Basheer, Mansoor Ahamed <mansoor.ahamed@ti.com>
> ---
> =A0drivers/mtd/nand/omap2.c | =A0 =A02 ++
> =A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 454f90c..350c77f 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1005,6 +1005,8 @@ static int __devinit omap_nand_probe(struct platfor=
m_device *pdev)
> =A0 =A0 =A0 =A0info->nand.options =A0 =A0 =A0=3D pdata->devsize;
> =A0 =A0 =A0 =A0info->nand.options =A0 =A0 =A0|=3D NAND_SKIP_BBTSCAN;
>
> + =A0 =A0 =A0 info->nand.badblockbits =3D 8;
> +
> =A0 =A0 =A0 =A0/* NAND write protect off */
> =A0 =A0 =A0 =A0gpmc_cs_configure(info->gpmc_cs, GPMC_CONFIG_WP, 0);
>
> --
> 1.6.2.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-omap" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
