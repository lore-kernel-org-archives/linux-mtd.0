Received: from mailout3.samsung.com ([203.254.224.33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZrJW-0001u1-Pa
 for linux-mtd@lists.infradead.org; Tue, 15 Apr 2014 00:33:27 +0000
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4100D4IQV4G960@mailout3.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 15 Apr 2014 09:33:04 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Christian Engelmayer' <cengelma@gmx.at>,
 'Brian Norris' <computersforpeace@gmail.com>
References: <20140415003205.0bb2cf44@spike>
In-reply-to: <20140415003205.0bb2cf44@spike>
Subject: =?utf-8?Q?Re:_=5BPATCH=5D_mtd:_nand:_omap:_fix?=
 =?utf-8?Q?_compile_warning_on_=E2=80=98erased=5Fsect?=
 =?utf-8?Q?or=5Fbitflips=E2=80=99?=
Date: Tue, 15 Apr 2014 09:33:03 +0900
Message-id: <007d01cf5842$435dcba0$ca1962e0$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-transfer-encoding: quoted-printable
Content-language: ko
Cc: 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>,
 'Jingoo Han' <jg1.han@samsung.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, 'Pekon Gupta' <pekon@ti.com>,
 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, April 15, 2014 7:32 AM, Christian Engelmayer wrote:
>=20
> Commit 2c9f2365 (mtd: nand: omap: ecc.calculate: merge =
omap3_calculate_ecc_bch4
> in omap_calculate_ecc_bch) introduced minor compile warning
> "=E2=80=98erased_sector_bitflips=E2=80=99 defined but not used =
[-Wunused-function]" when
> compiling without CONFIG_MTD_NAND_OMAP_BCH. Move function
> erased_sector_bitflips() into the same ifdef section as the only =
caller.
>=20
> Signed-off-by: Christian Engelmayer <cengelma@gmx.at>

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  drivers/mtd/nand/omap2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 1ff49b8..1b800bc 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1237,6 +1237,7 @@ static int __maybe_unused =
omap_calculate_ecc_bch(struct mtd_info *mtd,
>  	return 0;
>  }
>=20
> +#ifdef CONFIG_MTD_NAND_OMAP_BCH
>  /**
>   * erased_sector_bitflips - count bit flips
>   * @data:	data sector buffer
> @@ -1276,7 +1277,6 @@ static int erased_sector_bitflips(u_char *data, =
u_char *oob,
>  	return flip_bits;
>  }
>=20
> -#ifdef CONFIG_MTD_NAND_OMAP_BCH
>  /**
>   * omap_elm_correct_data - corrects page data area in case error =
reported
>   * @mtd:	MTD device structure
> --
> 1.8.3.2
