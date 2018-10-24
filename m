Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFQpe-0005dj-Iu
 for linux-mtd@lists.infradead.org; Wed, 24 Oct 2018 21:36:53 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>
CC: Fabio Bettoni <fbettoni@gmail.com>, Joakim Tjernlund
 <Joakim.Tjernlund@infinera.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 02/10] mtd: cfi_cmdset_0002: Remove chip_ready() from
 do_write_buffer()
Date: Wed, 24 Oct 2018 21:36:32 +0000
Message-ID: <2f7e885131e740c197cd86ba3e544cbf@svr-chch-ex1.atlnz.lc>
References: <20181019165526.11159-1-ikegami@allied-telesis.co.jp>
 <20181019165526.11159-3-ikegami@allied-telesis.co.jp>
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
=0A=
> It is enough to use chip_good() only so chip_ready() is not necessary.=0A=
> For this change the order to check timeout is also needed to chagne.=0A=
=0A=
s/chagne/change/=0A=
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
> - None.=0A=
> =0A=
>   drivers/mtd/chips/cfi_cmdset_0002.c | 6 +++---=0A=
>   1 file changed, 3 insertions(+), 3 deletions(-)=0A=
> =0A=
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_=
cmdset_0002.c=0A=
> index 251c9e1675bd..c2e51768a02c 100644=0A=
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c=0A=
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c=0A=
> @@ -1882,14 +1882,14 @@ static int __xipram do_write_buffer(struct map_in=
fo *map, struct flchip *chip,=0A=
>   			continue;=0A=
>   		}=0A=
>   =0A=
> -		if (time_after(jiffies, timeo) && !chip_ready(map, adr))=0A=
> -			break;=0A=
> -=0A=
>   		if (chip_good(map, adr, datum)) {=0A=
>   			xip_enable(map, chip, adr);=0A=
>   			goto op_done;=0A=
>   		}=0A=
>   =0A=
> +		if (time_after(jiffies, timeo))=0A=
> +			break;=0A=
> +=0A=
>   		/* Latency issues. Drop the lock, wait a while and retry */=0A=
>   		UDELAY(map, chip, adr, 1);=0A=
>   	}=0A=
> =0A=
=0A=
