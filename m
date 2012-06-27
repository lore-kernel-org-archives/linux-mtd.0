Received: from va3ehsobe001.messaging.microsoft.com ([216.32.180.11]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sjhka-0005fC-Gk
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 02:13:01 +0000
Message-ID: <4FEA6D7B.8010804@freescale.com>
Date: Wed, 27 Jun 2012 10:18:35 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] mtd gpmi-nand: Fix read page when reading to vmalloced
 area
References: <1340724377-22279-1-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1340724377-22279-1-git-send-email-s.hauer@pengutronix.de>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: Subodh Nijsure <snijsure@grid-net.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, stable@vger.kernel.org,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2012=C4=EA06=D4=C226=C8=D5 23:26, Sascha Hauer =D0=B4=B5=C0:
> The gpmi-nand driver uses virt_addr_valid() to check whether a buffer
> is suitable for dma. If it's not, a driver allocated buffer is used
> instead. Then after a page read the driver allocated buffer must be
> copied to the user supplied buffer. This does not happen since:
>
> commit 7725cc85932bd02dd12c23108e0ef748c551ccba
> Author: Brian Norris <computersforpeace@gmail.com>
> Date:   Wed May 2 10:15:02 2012 -0700
>
>     mtd: gpmi-nand: utilize oob_requested parameter
>
>     Don't read OOB if the caller didn't request it.
>
>     Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>     Acked-by: Huang Shijie <b32955@freescale.com>
>     Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>     Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
>
> This patch fixes this. The bug is encountered with UBI which uses a vma=
lloced
> buffer for the volume table.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: stable@vger.kernel.org
> Cc: Huang Shijie <b32955@freescale.com>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Subodh Nijsure <snijsure@grid-net.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/=
gpmi-nand/gpmi-nand.c
> index 6bb6f48..0179685 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -920,12 +920,12 @@ static int gpmi_ecc_read_page(struct mtd_info *mt=
d, struct nand_chip *chip,
>  		 */
>  		memset(chip->oob_poi, ~0, mtd->oobsize);
>  		chip->oob_poi[0] =3D ((uint8_t *) auxiliary_virt)[0];
> -
> -		read_page_swap_end(this, buf, mtd->writesize,
> -				this->payload_virt, this->payload_phys,
> -				nfc_geo->payload_size,
> -				payload_virt, payload_phys);
>  	}
> +
> +	read_page_swap_end(this, buf, mtd->writesize,
> +			this->payload_virt, this->payload_phys,
> +			nfc_geo->payload_size,
> +			payload_virt, payload_phys);
>  exit_nfc:
>  	return ret;
>  }
Thanks a lot for debugging this bug. I am really busy recently, and have
no time to debug it.



Acked-by: Huang Shijie <b32955@freescale.com>
