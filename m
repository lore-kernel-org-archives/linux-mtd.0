Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFQn2-00043m-BC
 for linux-mtd@lists.infradead.org; Wed, 24 Oct 2018 21:34:10 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>
CC: Fabio Bettoni <fbettoni@gmail.com>, Joakim Tjernlund
 <Joakim.Tjernlund@infinera.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 06/10] mtd: cfi_cmdset_0002: Split do_write_oneword()
 op_done goto statement
Date: Wed, 24 Oct 2018 21:33:53 +0000
Message-ID: <4dafd74641184172bc51e80668a393a5@svr-chch-ex1.atlnz.lc>
References: <20181019165526.11159-1-ikegami@allied-telesis.co.jp>
 <20181019165526.11159-7-ikegami@allied-telesis.co.jp>
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

On 20/10/18 5:55 AM, Tokunori Ikegami wrote:=0A=
> To reduce function size and remove the goto statement split the op_done g=
oto=0A=
> statement part into do_write_oneword_done() created a function.=0A=
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
>   drivers/mtd/chips/cfi_cmdset_0002.c | 21 +++++++++++++++------=0A=
>   1 file changed, 15 insertions(+), 6 deletions(-)=0A=
> =0A=
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_=
cmdset_0002.c=0A=
> index ae2d8bd7154e..2340a5a7cc39 100644=0A=
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c=0A=
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c=0A=
> @@ -1609,6 +1609,20 @@ static int __xipram do_write_oneword_once(struct m=
ap_info *map, struct flchip *c=0A=
>   	return ret;=0A=
>   }=0A=
>   =0A=
> +static void __xipram do_write_oneword_done(struct map_info *map,=0A=
> +					   struct flchip *chip,=0A=
> +					   unsigned long adr, int mode)=0A=
> +{=0A=
> +	if (mode =3D=3D FL_OTP_WRITE)=0A=
> +		otp_exit(map, chip, adr, map_bankwidth(map));=0A=
> +=0A=
> +	chip->state =3D FL_READY;=0A=
> +	DISABLE_VPP(map);=0A=
> +	put_chip(map, chip, adr);=0A=
> +=0A=
> +	mutex_unlock(&chip->mutex);=0A=
=0A=
Personally I find it easier if the mutex_lock()/mutex_unlock() are in =0A=
the same function. That way it's easier to audit the exit paths from a =0A=
single function rather than needing to know that some functions =0A=
implicitly release the lock. The same probably applies to =0A=
get_chip/put_chip pairs.=0A=
=0A=
> +}=0A=
> +=0A=
>   static int __xipram do_write_oneword(struct map_info *map, struct flchi=
p *chip,=0A=
>   				     unsigned long adr, map_word datum,=0A=
>   				     int mode)=0A=
> @@ -1670,12 +1684,7 @@ static int __xipram do_write_oneword(struct map_in=
fo *map, struct flchip *chip,=0A=
>   	xip_enable(map, chip, adr);=0A=
>   =0A=
>    op_done:=0A=
> -	if (mode =3D=3D FL_OTP_WRITE)=0A=
> -		otp_exit(map, chip, adr, map_bankwidth(map));=0A=
> -	chip->state =3D FL_READY;=0A=
> -	DISABLE_VPP(map);=0A=
> -	put_chip(map, chip, adr);=0A=
> -	mutex_unlock(&chip->mutex);=0A=
> +	do_write_oneword_done(map, chip, adr, mode);=0A=
>   =0A=
>   	return ret;=0A=
>   }=0A=
> =0A=
=0A=
