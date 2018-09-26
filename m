Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5JJp-0006sJ-L5
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2018 23:34:12 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Daniel Mack <daniel@zonque.org>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>, "boris.brezillon@bootlin.com"
 <boris.brezillon@bootlin.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] mtd: rawnand: marvell: check for RDY bits after enabling
 the IRQ
Date: Wed, 26 Sep 2018 23:33:20 +0000
Message-ID: <55f805fcf236481b869ba097a7db0194@svr-chch-ex1.atlnz.lc>
References: <20180926212353.13399-1-daniel@zonque.org>
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

Hi Daniel,=0A=
=0A=
On 27/09/18 09:24, Daniel Mack wrote:=0A=
> At least on PXA3xx platforms, enabling RDY interrupts in the NDCR registe=
r=0A=
> will only cause the IRQ to latch when the RDY lanes are changing, and not=
=0A=
> in case they are already asserted.=0A=
> =0A=
> This means that if the controller finished the command in flight before=
=0A=
> marvell_nfc_wait_op() is called, that function will wait for a change in=
=0A=
> the bit that can't ever happen as it is already set.=0A=
> =0A=
> To mitigate this race, check for the RDY bits after the IRQ was enabled,=
=0A=
> and only sleep on the condition if the controller isn't ready yet.=0A=
> =0A=
> This fixes a bug that was observed with a NAND chip that holds a UBIFS=0A=
> parition on which file system stress tests were executed. When=0A=
> marvell_nfc_wait_op() reports an error, UBI/UBIFS will eventually mount=
=0A=
> the filesystem read-only, reporting lots of warnings along the way.=0A=
> =0A=
> Fixes: 02f26ecf8c77 mtd: nand: add reworked Marvell NAND controller drive=
r=0A=
> Cc: stable@vger.kernel.org=0A=
> Signed-off-by: Daniel Mack <daniel@zonque.org>=0A=
> ---=0A=
>   drivers/mtd/nand/raw/marvell_nand.c | 14 +++++++++++---=0A=
>   1 file changed, 11 insertions(+), 3 deletions(-)=0A=
> =0A=
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/m=
arvell_nand.c=0A=
> index 666f34b58dec..e96ec7b9a152 100644=0A=
> --- a/drivers/mtd/nand/raw/marvell_nand.c=0A=
> +++ b/drivers/mtd/nand/raw/marvell_nand.c=0A=
> @@ -613,7 +613,8 @@ static int marvell_nfc_wait_cmdd(struct nand_chip *ch=
ip)=0A=
>   static int marvell_nfc_wait_op(struct nand_chip *chip, unsigned int tim=
eout_ms)=0A=
>   {=0A=
>   	struct marvell_nfc *nfc =3D to_marvell_nfc(chip->controller);=0A=
> -	int ret;=0A=
> +	int ret =3D -EALREADY;=0A=
=0A=
Won't this cause us to hit the if (!ret) below if we don't end up =0A=
calling wait_for_completion_timeout()? In fact I did just hit something =0A=
like this on my Armada-385 based board=0A=
=0A=
marvell-nfc f10d0000.nand-controller: Timeout waiting for RB signal=0A=
ubi0 warning: do_sync_erase: error -5 while erasing PEB 755, retry=0A=
=0A=
> +	u32 st;=0A=
>   =0A=
>   	/* Timeout is expressed in ms */=0A=
>   	if (!timeout_ms)=0A=
> @@ -622,8 +623,15 @@ static int marvell_nfc_wait_op(struct nand_chip *chi=
p, unsigned int timeout_ms)=0A=
>   	init_completion(&nfc->complete);=0A=
>   =0A=
>   	marvell_nfc_enable_int(nfc, NDCR_RDYM);=0A=
> -	ret =3D wait_for_completion_timeout(&nfc->complete,=0A=
> -					  msecs_to_jiffies(timeout_ms));=0A=
> +=0A=
> +	/*=0A=
> +	 * Check if the NDSR_RDY bits have already been set before the=0A=
> +	 * interrupt was enabled.=0A=
> +	 */=0A=
> +	st =3D readl_relaxed(nfc->regs + NDSR);=0A=
> +	if (!(st & (NDSR_RDY(0) | NDSR_RDY(1))))=0A=
> +		ret =3D wait_for_completion_timeout(&nfc->complete,=0A=
> +						  msecs_to_jiffies(timeout_ms));=0A=
>   	marvell_nfc_disable_int(nfc, NDCR_RDYM);=0A=
>   	marvell_nfc_clear_int(nfc, NDSR_RDY(0) | NDSR_RDY(1));=0A=
>   	if (!ret) {=0A=
> =0A=
=0A=
