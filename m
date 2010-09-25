Received: from devils.ext.ti.com ([198.47.26.153])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OzOD6-0004FH-4S
	for linux-mtd@lists.infradead.org; Sat, 25 Sep 2010 06:26:12 +0000
From: "Ghorai, Sukumar" <s-ghorai@ti.com>
To: =?iso-8859-1?Q?Lo=EFc_Minier?= <loic.minier@linaro.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Date: Sat, 25 Sep 2010 11:56:03 +0530
Subject: RE: [PATCH] nand: omap2: Missing arg to gpmc_prefetch_reset()
Message-ID: <2A3DCF3DA181AD40BDE86A3150B27B6B035609826B@dbde02.ent.ti.com>
References: <1285364702-13922-1-git-send-email-loic.minier@linaro.org>
In-Reply-To: <1285364702-13922-1-git-send-email-loic.minier@linaro.org>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Tony Lindgren <tony@atomide.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: Lo=EFc Minier [mailto:loic.minier@linaro.org]
> Sent: Saturday, September 25, 2010 3:15 AM
> To: linux-mtd@lists.infradead.org; linux-omap@vger.kernel.org
> Cc: Tony Lindgren; Ghorai, Sukumar; Lo=EFc Minier
> Subject: [PATCH] nand: omap2: Missing arg to gpmc_prefetch_reset()
>=20
> Fix missing cs arg to gpmc_prefetch_reset() when
> CONFIG_MTD_NAND_OMAP_PREFETCH_DMA=3Dy which caused a build failure since
> 948d38e799f0ab87cf8ed9113fcdaaee61acf321:
> drivers/mtd/nand/omap2.c: In function 'omap_nand_dma_transfer':
> drivers/mtd/nand/omap2.c:416: error: too few arguments to function
> 'gpmc_prefetch_reset'
>=20
> Signed-off-by: Lo=EFc Minier <loic.minier@linaro.org>
> ---
>  drivers/mtd/nand/omap2.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 133d515..513e0a7 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -413,7 +413,7 @@ static inline int omap_nand_dma_transfer(struct
> mtd_info *mtd, void *addr,
>  		prefetch_status =3D gpmc_read_status(GPMC_PREFETCH_COUNT);
>  	} while (prefetch_status);
>  	/* disable and stop the PFPW engine */
> -	gpmc_prefetch_reset();
> +	gpmc_prefetch_reset(info->gpmc_cs);
>=20
>  	dma_unmap_single(&info->pdev->dev, dma_addr, len, dir);
>  	return 0;
> --
> 1.7.1
[Ghorai] Acked-by: Sukumar Ghorai <s-ghorai@ti.com>
