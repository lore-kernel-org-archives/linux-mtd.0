Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fezNa-0001Dz-Ok
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2018 09:01:17 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: Marek Vasut <marek.vasut@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, "Bean
 Huo" <beanhuo@micron.com>
Subject: Re: [2/3] mtd: rawnand: micron: Disable ECC earlier in the read path
Date: Mon, 16 Jul 2018 09:00:59 +0000
Message-ID: <a01b89d899504e8596da9e416d22b1f7@svr-chch-ex1.atlnz.lc>
References: <20180703122009.29914-3-boris.brezillon@bootlin.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,=0A=
=0A=
On 04/07/18 00:20, Boris Brezillon wrote:=0A=
> We are about to support extracting the real number of bitflips for=0A=
> 4-bits ECC when WRITE_RECOMMEND is returned. This requires re-reading=0A=
> the page in raw mode to compare it to the corrected version, and this=0A=
> logic will be placed in micron_nand_on_die_ecc_status_4().=0A=
> =0A=
> Moving the micron_nand_on_die_ecc_setup() will allow us to disable=0A=
> ECC only once.=0A=
> =0A=
> As a result, we have to rework the exit path and add an error path=0A=
> where the ECC is disabled.=0A=
> =0A=
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>=0A=
=0A=
As I said on the other thread this appears to cause a problem for me on =0A=
the MT29F1G08ABAFAWP-ITE setup I have. I notice we're not able to find =0A=
the BBT, not sure if that is symptom or cause. If I revert this I can =0A=
successfully mount and access data on the chip.=0A=
=0A=
Here's some output from dmesg:=0A=
=0A=
nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xd1=0A=
nand: Micron MT29F1G08ABAGAWP=0A=
nand: 128 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 128=0A=
nand: timing mode 5 not acknowledged by the NAND chip=0A=
Bad block table not found for chip 0=0A=
Bad block table not found for chip 0=0A=
Scanning device for bad blocks=0A=
random: fast init done=0A=
Bad block table written to 0x000007fe0000, version 0x01=0A=
Bad block table written to 0x000007fc0000, version 0x01=0A=
3 fixed-partitions partitions found on MTD device pxa3xx_nand-0=0A=
Creating 3 MTD partitions on "pxa3xx_nand-0":=0A=
0x000000000000-0x000007000000 : "user"=0A=
0x000007000000-0x000007800000 : "errlog"=0A=
mtdoops: Attached to MTD device 1=0A=
mtdoops: ready 0, 1=0A=
0x000007800000-0x000008000000 : "nand-bbt"=0A=
=0A=
And from my attempt to mount:=0A=
=0A=
[root@linuxbox ~]# umount /flash && ubiattach -p /dev/mtd0 && mount -t =0A=
ubifs ubi=0A=
0:user -o sync /flash=0A=
ubi0: attaching mtd0=0A=
ubi0: scanning is finished=0A=
ubi0 error: ubi_read_volume_table: the layout volume was not found=0A=
ubi0 error: ubi_attach_mtd_dev: failed to attach mtd0, error -22=0A=
ubiattach: error!: cannot attach "/dev/mtd0"=0A=
            error 22 (Invalid argument)=0A=
[root@linuxbox ~]#=0A=
=0A=
=0A=
> ---=0A=
>   drivers/mtd/nand/raw/nand_micron.c | 25 ++++++++++++++++---------=0A=
>   1 file changed, 16 insertions(+), 9 deletions(-)=0A=
> =0A=
> diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/na=
nd_micron.c=0A=
> index 63ac98a36ed7..b9cbaf125a98 100644=0A=
> --- a/drivers/mtd/nand/raw/nand_micron.c=0A=
> +++ b/drivers/mtd/nand/raw/nand_micron.c=0A=
> @@ -197,30 +197,37 @@ micron_nand_read_page_on_die_ecc(struct mtd_info *m=
td, struct nand_chip *chip,=0A=
>   =0A=
>   	ret =3D nand_read_page_op(chip, page, 0, NULL, 0);=0A=
>   	if (ret)=0A=
> -		goto out;=0A=
> +		goto err_disable_ecc;=0A=
>   =0A=
>   	ret =3D nand_status_op(chip, &status);=0A=
>   	if (ret)=0A=
> -		goto out;=0A=
> +		goto err_disable_ecc;=0A=
>   =0A=
>   	ret =3D nand_exit_status_op(chip);=0A=
>   	if (ret)=0A=
> -		goto out;=0A=
> +		goto err_disable_ecc;=0A=
>   =0A=
> -	if (chip->ecc.strength =3D=3D 4)=0A=
> -		max_bitflips =3D micron_nand_on_die_ecc_status_4(chip, status);=0A=
> -	else=0A=
> -		max_bitflips =3D micron_nand_on_die_ecc_status_8(chip, status);=0A=
> +	micron_nand_on_die_ecc_setup(chip, false);=0A=
>   =0A=
>   	ret =3D nand_read_data_op(chip, buf, mtd->writesize, false);=0A=
>   	if (!ret && oob_required)=0A=
>   		ret =3D nand_read_data_op(chip, chip->oob_poi, mtd->oobsize,=0A=
>   					false);=0A=
>   =0A=
> -out:=0A=
> +	if (ret)=0A=
> +		return ret;=0A=
> +=0A=
> +	if (chip->ecc.strength =3D=3D 4)=0A=
> +		max_bitflips =3D micron_nand_on_die_ecc_status_4(chip, status);=0A=
> +	else=0A=
> +		max_bitflips =3D micron_nand_on_die_ecc_status_8(chip, status);=0A=
> +=0A=
> +	return max_bitflips;=0A=
> +=0A=
> +err_disable_ecc:=0A=
>   	micron_nand_on_die_ecc_setup(chip, false);=0A=
>   =0A=
> -	return ret ? ret : max_bitflips;=0A=
> +	return ret;=0A=
>   }=0A=
>   =0A=
>   static int=0A=
> =0A=
=0A=
