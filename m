Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFQdp-0000CI-85
 for linux-mtd@lists.infradead.org; Wed, 24 Oct 2018 21:24:40 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>
CC: Hauke Mehrtens <hauke@hauke-m.de>, Koen Vandeputte
 <koen.vandeputte@ncentric.com>, Fabio Bettoni <fbettoni@gmail.com>, "Joakim
 Tjernlund" <Joakim.Tjernlund@infinera.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: Re: [PATCH v2 01/10] mtd: cfi_cmdset_0002: Change do_write_oneword()
 to use chip_good()
Date: Wed, 24 Oct 2018 21:24:22 +0000
Message-ID: <a35141a64cd24b90854770c66ed1aba3@svr-chch-ex1.atlnz.lc>
References: <20181019165526.11159-1-ikegami@allied-telesis.co.jp>
 <20181019165526.11159-2-ikegami@allied-telesis.co.jp>
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
> This is required for OpenWrt Project to result the flash write issue as=
=0A=
> below patche.=0A=
> <https://git.openwrt.org/?p=3Dopenwrt/openwrt.git;a=3Dcommitdiff;h=3Dddc1=
1c3932c7b7b7df7d5fbd48f207e77619eaa7>=0A=
> =0A=
> Also the original patch in OpenWRT is below.=0A=
> <https://github.com/openwrt/openwrt/blob/v18.06.0/target/linux/ar71xx/pat=
ches-4.9/403-mtd_fix_cfi_cmdset_0002_status_check.patch>=0A=
> =0A=
> So change to use chip_good() instead of chip_ready().=0A=
> =0A=
> The reason to use chip_good() is that just actually fix the issue.=0A=
> And also in the past I had fixed the erase function also as same way by t=
he=0A=
> patch below.=0A=
>    <https://patchwork.ozlabs.org/patch/922656/>=0A=
>      Note: The reason for the patch for erase is same.=0A=
> =0A=
> In my understanding the chip_ready() is just checked the value twice from=
=0A=
> flash.=0A=
> So I think that sometimes incorrect value is read twice and it is depende=
d=0A=
> on the flash device behavior but not sure..=0A=
> =0A=
> So change to use chip_good() instead of chip_ready().=0A=
=0A=
I think much of this is commentary for readers of the mailing list not =0A=
something that should be in the final commit (i.e. it should be after =0A=
the '---'). The commit message should really reflect what the problem =0A=
was and how this change fixes it.=0A=
=0A=
I think you've got a better handle on what chip_good() does than I do so =
=0A=
I won't attempt to provide a commit message here.=0A=
=0A=
> Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>=0A=
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>=0A=
> Signed-off-by: Koen Vandeputte <koen.vandeputte@ncentric.com>=0A=
> Signed-off-by: Fabio Bettoni <fbettoni@gmail.com>=0A=
> Co-Developed-by: Hauke Mehrtens <hauke@hauke-m.de>=0A=
> Co-Developed-by: Koen Vandeputte <koen.vandeputte@ncentric.com>=0A=
> Co-Developed-by: Fabio Bettoni <fbettoni@gmail.com>=0A=
> Reported-by: Fabio Bettoni <fbettoni@gmail.com>=0A=
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
> Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>=0A=
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>=0A=
> Cc: linux-mtd@lists.infradead.org=0A=
> Cc: stable@vger.kernel.org=0A=
> ---=0A=
> Changes since v1:=0A=
> - Just update the commit message.=0A=
> =0A=
>   drivers/mtd/chips/cfi_cmdset_0002.c | 18 ++++++++++++------=0A=
>   1 file changed, 12 insertions(+), 6 deletions(-)=0A=
> =0A=
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_=
cmdset_0002.c=0A=
> index 72428b6bfc47..251c9e1675bd 100644=0A=
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c=0A=
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c=0A=
> @@ -1627,31 +1627,37 @@ static int __xipram do_write_oneword(struct map_i=
nfo *map, struct flchip *chip,=0A=
>   			continue;=0A=
>   		}=0A=
>   =0A=
> -		if (time_after(jiffies, timeo) && !chip_ready(map, adr)){=0A=
> +		if (chip_good(map, adr, datum))=0A=
> +			break;=0A=
> +=0A=
> +		if (time_after(jiffies, timeo)){=0A=
>   			xip_enable(map, chip, adr);=0A=
>   			printk(KERN_WARNING "MTD %s(): software timeout\n", __func__);=0A=
>   			xip_disable(map, chip, adr);=0A=
> +			ret =3D -EIO;=0A=
>   			break;=0A=
>   		}=0A=
>   =0A=
> -		if (chip_ready(map, adr))=0A=
> -			break;=0A=
> -=0A=
>   		/* Latency issues. Drop the lock, wait a while and retry */=0A=
>   		UDELAY(map, chip, adr, 1);=0A=
>   	}=0A=
> +=0A=
>   	/* Did we succeed? */=0A=
> -	if (!chip_good(map, adr, datum)) {=0A=
> +	if (ret) {=0A=
>   		/* reset on all failures. */=0A=
>   		map_write(map, CMD(0xF0), chip->start);=0A=
>   		/* FIXME - should have reset delay before continuing */=0A=
>   =0A=
> -		if (++retry_cnt <=3D MAX_RETRIES)=0A=
> +		if (++retry_cnt <=3D MAX_RETRIES) {=0A=
> +			ret =3D 0;=0A=
>   			goto retry;=0A=
> +		}=0A=
>   =0A=
>   		ret =3D -EIO;=0A=
>   	}=0A=
> +=0A=
>   	xip_enable(map, chip, adr);=0A=
> +=0A=
>    op_done:=0A=
>   	if (mode =3D=3D FL_OTP_WRITE)=0A=
>   		otp_exit(map, chip, adr, map_bankwidth(map));=0A=
> =0A=
=0A=
