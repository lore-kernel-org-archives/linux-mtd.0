Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFQRG-0004d2-9l
 for linux-mtd@lists.infradead.org; Wed, 24 Oct 2018 21:11:57 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>
CC: Fabio Bettoni <fbettoni@gmail.com>, Joakim Tjernlund
 <Joakim.Tjernlund@infinera.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 05/10] mtd: cfi_cmdset_0002: Split do_write_oneword()
 to reduce function size
Date: Wed, 24 Oct 2018 21:11:02 +0000
Message-ID: <5d77ea55e2504e5ca7e22e21fc8b7358@svr-chch-ex1.atlnz.lc>
References: <20181019165526.11159-1-ikegami@allied-telesis.co.jp>
 <20181019165526.11159-6-ikegami@allied-telesis.co.jp>
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

Hi Ikegami-san,=0A=
=0A=
On 20/10/18 5:55 AM, Tokunori Ikegami wrote:=0A=
> The function is longer so add do_write_oneword_once() to split.=0A=
> This is also for to reduce goto statement by additional patch.=0A=
=0A=
I think the following would be easier to understand.=0A=
=0A=
"Reduce the size of do_write_oneword() by extracting a helper function =0A=
for the hardware access."=0A=
=0A=
With that change=0A=
=0A=
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
=0A=
> =0A=
> Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>=0A=
> Cc: Fabio Bettoni <fbettoni@gmail.com>=0A=
> Co: Hauke Mehrtens <hauke@hauke-m.de>=0A=
> Co: Koen Vandeputte <koen.vandeputte@ncentric.com>=0A=
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
> Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>=0A=
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>=0A=
> Cc: linux-mtd@lists.infradead.org=0A=
> ---=0A=
> Changes since v1:=0A=
> - Add the patch.=0A=
> =0A=
>   drivers/mtd/chips/cfi_cmdset_0002.c | 89 ++++++++++++++++-------------=
=0A=
>   1 file changed, 50 insertions(+), 39 deletions(-)=0A=
> =0A=
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_=
cmdset_0002.c=0A=
> index a3fa2d7b1ba0..ae2d8bd7154e 100644=0A=
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c=0A=
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c=0A=
> @@ -1547,11 +1547,10 @@ static int cfi_amdstd_lock_user_prot_reg(struct m=
td_info *mtd, loff_t from,=0A=
>   				   do_otp_lock, 1);=0A=
>   }=0A=
>   =0A=
> -static int __xipram do_write_oneword(struct map_info *map, struct flchip=
 *chip,=0A=
> -				     unsigned long adr, map_word datum,=0A=
> -				     int mode)=0A=
> +static int __xipram do_write_oneword_once(struct map_info *map, struct f=
lchip *chip,=0A=
> +					  unsigned long adr, map_word datum,=0A=
> +					  int mode, struct cfi_private *cfi)=0A=
=0A=
No particular objections to the name (i.e. don't change it unless the =0A=
maintainer insists) but often these kinds of helpers are just prefixed =0A=
with '_' (e.g. _do_write_oneword).=0A=
=0A=
>   {=0A=
> -	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
>   	unsigned long timeo =3D jiffies + HZ;=0A=
>   	/*=0A=
>   	 * We use a 1ms + 1 jiffies generic timeout for writes (most devices=
=0A=
> @@ -1564,42 +1563,7 @@ static int __xipram do_write_oneword(struct map_in=
fo *map, struct flchip *chip,=0A=
>   	 */=0A=
>   	unsigned long uWriteTimeout =3D (HZ / 1000) + 1;=0A=
>   	int ret =3D 0;=0A=
> -	map_word oldd;=0A=
> -	int retry_cnt =3D 0;=0A=
> -=0A=
> -	adr +=3D chip->start;=0A=
> -=0A=
> -	mutex_lock(&chip->mutex);=0A=
> -	ret =3D get_chip(map, chip, adr, mode);=0A=
> -	if (ret) {=0A=
> -		mutex_unlock(&chip->mutex);=0A=
> -		return ret;=0A=
> -	}=0A=
>   =0A=
> -	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",=0A=
> -		 __func__, adr, datum.x[0]);=0A=
> -=0A=
> -	if (mode =3D=3D FL_OTP_WRITE)=0A=
> -		otp_enter(map, chip, adr, map_bankwidth(map));=0A=
> -=0A=
> -	/*=0A=
> -	 * Check for a NOP for the case when the datum to write is already=0A=
> -	 * present - it saves time and works around buggy chips that corrupt=0A=
> -	 * data at other locations when 0xff is written to a location that=0A=
> -	 * already contains 0xff.=0A=
> -	 */=0A=
> -	oldd =3D map_read(map, adr);=0A=
> -	if (map_word_equal(map, oldd, datum)) {=0A=
> -		pr_debug("MTD %s(): NOP\n",=0A=
> -		       __func__);=0A=
> -		goto op_done;=0A=
> -	}=0A=
> -=0A=
> -	XIP_INVAL_CACHED_RANGE(map, adr, map_bankwidth(map));=0A=
> -	ENABLE_VPP(map);=0A=
> -	xip_disable(map, chip, adr);=0A=
> -=0A=
> - retry:=0A=
>   	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->=
device_type, NULL);=0A=
>   	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->=
device_type, NULL);=0A=
>   	cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, cfi->=
device_type, NULL);=0A=
> @@ -1642,6 +1606,53 @@ static int __xipram do_write_oneword(struct map_in=
fo *map, struct flchip *chip,=0A=
>   		UDELAY(map, chip, adr, 1);=0A=
>   	}=0A=
>   =0A=
> +	return ret;=0A=
> +}=0A=
> +=0A=
> +static int __xipram do_write_oneword(struct map_info *map, struct flchip=
 *chip,=0A=
> +				     unsigned long adr, map_word datum,=0A=
> +				     int mode)=0A=
> +{=0A=
> +	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
> +	int ret =3D 0;=0A=
> +	map_word oldd;=0A=
> +	int retry_cnt =3D 0;=0A=
> +=0A=
> +	adr +=3D chip->start;=0A=
> +=0A=
> +	mutex_lock(&chip->mutex);=0A=
> +	ret =3D get_chip(map, chip, adr, mode);=0A=
> +	if (ret) {=0A=
> +		mutex_unlock(&chip->mutex);=0A=
> +		return ret;=0A=
> +	}=0A=
> +=0A=
> +	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",=0A=
> +		 __func__, adr, datum.x[0]);=0A=
> +=0A=
> +	if (mode =3D=3D FL_OTP_WRITE)=0A=
> +		otp_enter(map, chip, adr, map_bankwidth(map));=0A=
> +=0A=
> +	/*=0A=
> +	 * Check for a NOP for the case when the datum to write is already=0A=
> +	 * present - it saves time and works around buggy chips that corrupt=0A=
> +	 * data at other locations when 0xff is written to a location that=0A=
> +	 * already contains 0xff.=0A=
> +	 */=0A=
> +	oldd =3D map_read(map, adr);=0A=
> +	if (map_word_equal(map, oldd, datum)) {=0A=
> +		pr_debug("MTD %s(): NOP\n",=0A=
> +		       __func__);=0A=
> +		goto op_done;=0A=
> +	}=0A=
> +=0A=
> +	XIP_INVAL_CACHED_RANGE(map, adr, map_bankwidth(map));=0A=
> +	ENABLE_VPP(map);=0A=
> +	xip_disable(map, chip, adr);=0A=
> +=0A=
> + retry:=0A=
> +	ret =3D do_write_oneword_once(map, chip, adr, datum, mode, cfi);=0A=
> +=0A=
>   	/* Did we succeed? */=0A=
>   	if (ret) {=0A=
>   		/* reset on all failures. */=0A=
> =0A=
=0A=
