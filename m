Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tt8PM-0002kf-2y
 for linux-mtd@lists.infradead.org; Thu, 10 Jan 2013 03:02:21 +0000
Message-ID: <50EE2F17.7050303@freescale.com>
Date: Thu, 10 Jan 2013 11:01:43 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Zach Sadecki <zsadecki@itwatchdogs.com>
Subject: Re: [PATCH] mtd: gpmi: Always report ECC stats and return max_bitflips
References: <50BD01F8.3040003@itwatchdogs.com>
 <1355147097.2657.33.camel@sauron.fi.intel.com>
 <50C5FD4A.6090405@itwatchdogs.com>
 <1355398036.3400.45.camel@sauron.fi.intel.com>
 <50CA90BB.5030801@itwatchdogs.com>
In-Reply-To: <50CA90BB.5030801@itwatchdogs.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B412=E6=9C=8814=E6=97=A5 10:36, Zach Sadecki =E5=86=99=
=E9=81=93:
> Always report corrected and failed ECC stats back up to the MTD layer.=20
> Also
> return max_bitflips from read_page() as is expected from NAND drivers=20
> now.
>
> Signed-off-by: Zach Sadecki <zsadecki@itwatchdogs.com>
> Acked-by: Huang Shijie <b32955@freescale.com>
> ---
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 27 ++++++++-------------------
> 1 file changed, 8 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c=20
> b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index 5cd141f..1535bd5 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -921,8 +921,7 @@ static int gpmi_ecc_read_page(struct mtd_info=20
> *mtd, struct nand_chip *chip,
> dma_addr_t auxiliary_phys;
> unsigned int i;
> unsigned char *status;
> - unsigned int failed;
> - unsigned int corrected;
> + unsigned int max_bitflips =3D 0;
> int ret;
>
> pr_debug("page number is : %d\n", page);
> @@ -946,35 +945,25 @@ static int gpmi_ecc_read_page(struct mtd_info=20
> *mtd, struct nand_chip *chip,
> payload_virt, payload_phys);
> if (ret) {
> pr_err("Error in ECC-based read: %d\n", ret);
> - goto exit_nfc;
> + return ret;
> }
>
> /* handle the block mark swapping */
> block_mark_swapping(this, payload_virt, auxiliary_virt);
>
> /* Loop over status bytes, accumulating ECC status. */
> - failed =3D 0;
> - corrected =3D 0;
> - status =3D auxiliary_virt + nfc_geo->auxiliary_status_offset;
> + status =3D auxiliary_virt + nfc_geo->auxiliary_status_offset;
>
> for (i =3D 0; i < nfc_geo->ecc_chunk_count; i++, status++) {
> if ((*status =3D=3D STATUS_GOOD) || (*status =3D=3D STATUS_ERASED))
> continue;
>
> if (*status =3D=3D STATUS_UNCORRECTABLE) {
> - failed++;
> + mtd->ecc_stats.failed++;
> continue;
> }
> - corrected +=3D *status;
> - }
> -
> - /*
> - * Propagate ECC status to the owning MTD only when failed or
> - * corrected times nearly reaches our ECC correction threshold.
> - */
> - if (failed || corrected >=3D (nfc_geo->ecc_strength - 1)) {
> - mtd->ecc_stats.failed +=3D failed;
> - mtd->ecc_stats.corrected +=3D corrected;
> + mtd->ecc_stats.corrected +=3D *status;
> + max_bitflips =3D max_t(unsigned int, max_bitflips, *status);
> }
>
> if (oob_required) {
> @@ -996,8 +985,8 @@ static int gpmi_ecc_read_page(struct mtd_info=20
> *mtd, struct nand_chip *chip,
> this->payload_virt, this->payload_phys,
> nfc_geo->payload_size,
> payload_virt, payload_phys);
> -exit_nfc:
> - return ret;
> +
> + return max_bitflips;
> }
>
> static int gpmi_ecc_write_page(struct mtd_info *mtd, struct nand_chip=20
> *chip,
just a ping.
