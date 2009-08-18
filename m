Received: from wf-out-1314.google.com ([209.85.200.172])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MdKGd-0001gq-H5
	for linux-mtd@lists.infradead.org; Tue, 18 Aug 2009 08:42:13 +0000
Received: by wf-out-1314.google.com with SMTP id 23so1024976wfg.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Aug 2009 01:42:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20080923122601.GB15504@edgar.se.axis.com>
References: <20080923122601.GB15504@edgar.se.axis.com>
Date: Tue, 18 Aug 2009 16:42:05 +0800
Message-ID: <af3ea28a0908180142t408010b7y3180433d18c10bbd@mail.gmail.com>
Subject: Re: [PATCH] [MTD] NAND: Add panic_write for NAND flashes
From: ye janboe <janboe.ye@gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

why this patch is not accepted?

Thanks

Janboe Ye

2008/9/23 Edgar E. Iglesias <edgar.iglesias@axis.com>:
> Hello,
>
> This is a quick and dirty patch to add panic_write for NAND flashes.
> The patch seems to work OK on my CRIS board running a 2.6.26 kernel
> with a ID: 0x20, Chip ID: 0xf1 (ST Micro NAND 128MiB 3,3V 8-bit).
> Also compile tested on a fresh x86 MTD git clone.
>
> If you find it useful feel free to apply it, otherwise >/dev/null.
>
> Thanks,
>
> Signed-off-by: Edgar E. Iglesias <edgar@axis.com>
>
> =A0drivers/mtd/nand/nand_base.c | =A0129 ++++++++++++++++++++++++++++++++=
+++++++---
> =A01 files changed, 121 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 0a9c9cd..442a7de 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -414,6 +414,28 @@ static int nand_block_checkbad(struct mtd_info *mtd,=
 loff_t ofs, int getchip,
> =A0 =A0 =A0 =A0return nand_isbad_bbt(mtd, ofs, allowbbt);
> =A0}
>
> +/**
> + * panic_nand_wait_ready - [GENERIC] Wait for the ready pin after comman=
ds.
> + * @mtd: =A0 =A0 =A0 MTD device structure
> + * @timeo: =A0 =A0 Timeout
> + *
> + * Helper function for nand_wait_ready used when needing to wait in inte=
rrupt
> + * context.
> + */
> +static void panic_nand_wait_ready(struct mtd_info *mtd, unsigned long ti=
meo)
> +{
> + =A0 =A0 =A0 struct nand_chip *chip =3D mtd->priv;
> + =A0 =A0 =A0 int i;
> +
> + =A0 =A0 =A0 /* Give the device 400 ms to get ready? =A0*/
> + =A0 =A0 =A0 for (i =3D 0; i < timeo; i++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (chip->dev_ready(mtd))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 touch_softlockup_watchdog();
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mdelay(1);
> + =A0 =A0 =A0 }
> +}
> +
> =A0/*
> =A0* Wait for the ready pin, after a command
> =A0* The timeout is catched later.
> @@ -423,6 +445,10 @@ void nand_wait_ready(struct mtd_info *mtd)
> =A0 =A0 =A0 =A0struct nand_chip *chip =3D mtd->priv;
> =A0 =A0 =A0 =A0unsigned long timeo =3D jiffies + 2;
>
> + =A0 =A0 =A0 /* 400ms timeout? =A0*/
> + =A0 =A0 =A0 if (in_interrupt())
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return panic_nand_wait_ready(mtd, 400);
> +
> =A0 =A0 =A0 =A0led_trigger_event(nand_led_trigger, LED_FULL);
> =A0 =A0 =A0 =A0/* wait until command is processed or timeout occures */
> =A0 =A0 =A0 =A0do {
> @@ -658,6 +684,23 @@ static void nand_command_lp(struct mtd_info *mtd, un=
signed int command,
> =A0}
>
> =A0/**
> + * panic_nand_get_device - [GENERIC] Get chip for selected access
> + * @chip: =A0 =A0 =A0the nand chip descriptor
> + * @mtd: =A0 =A0 =A0 MTD device structure
> + * @new_state: the state which is requested
> + *
> + * Used when in panic, no locks are taken.
> + */
> +static void
> +panic_nand_get_device(struct nand_chip *chip,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct mtd_info *mtd, int new_s=
tate)
> +{
> + =A0 =A0 =A0 /* Hardware controller shared among independend devices */
> + =A0 =A0 =A0 chip->controller->active =3D chip;
> + =A0 =A0 =A0 chip->state =3D new_state;
> +}
> +
> +/**
> =A0* nand_get_device - [GENERIC] Get chip for selected access
> =A0* @chip: =A0 =A0 =A0the nand chip descriptor
> =A0* @mtd: =A0 =A0 =A0 MTD device structure
> @@ -697,6 +740,32 @@ nand_get_device(struct nand_chip *chip, struct mtd_i=
nfo *mtd, int new_state)
> =A0}
>
> =A0/**
> + * panic_nand_wait - [GENERIC] =A0wait until the command is done
> + * @mtd: =A0 =A0 =A0 MTD device structure
> + * @chip: =A0 =A0 =A0NAND chip structure
> + * @timeo: =A0 =A0 Timeout
> + *
> + * Wait for command done. This is a helper function for nand_wait used w=
hen
> + * we are in interrupt context. May happen when in panic and trying to w=
rite
> + * an oops trough mtdoops.
> + */
> +static void panic_nand_wait(struct mtd_info *mtd, struct nand_chip *chip=
,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long timeo=
)
> +{
> + =A0 =A0 =A0 int i;
> + =A0 =A0 =A0 for (i =3D 0; i < timeo; i++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (chip->dev_ready) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (chip->dev_ready(mtd))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (chip->read_byte(mtd) & =
NAND_STATUS_READY)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mdelay(1);
> + =A0 =A0 =A0 =A0}
> +}
> +
> +/**
> =A0* nand_wait - [DEFAULT] =A0wait until the command is done
> =A0* @mtd: =A0 =A0 =A0 MTD device structure
> =A0* @chip: =A0 =A0 =A0NAND chip structure
> @@ -727,15 +796,19 @@ static int nand_wait(struct mtd_info *mtd, struct n=
and_chip *chip)
> =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1=
);
>
> - =A0 =A0 =A0 while (time_before(jiffies, timeo)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (chip->dev_ready) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (chip->dev_ready(mtd))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (chip->read_byte(mtd) & =
NAND_STATUS_READY)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 if (in_interrupt())
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 panic_nand_wait(mtd, chip, timeo);
> + =A0 =A0 =A0 else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (time_before(jiffies, timeo)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (chip->dev_ready) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (chip->d=
ev_ready(mtd))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (chip->r=
ead_byte(mtd) & NAND_STATUS_READY)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cond_resched();
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cond_resched();
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0led_trigger_event(nand_led_trigger, LED_OFF);
>
> @@ -1797,6 +1870,45 @@ static int nand_do_write_ops(struct mtd_info *mtd,=
 loff_t to,
> =A0}
>
> =A0/**
> + * panic_nand_write - [MTD Interface] NAND write with ECC
> + * @mtd: =A0 =A0 =A0 MTD device structure
> + * @to: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0offset to write to
> + * @len: =A0 =A0 =A0 number of bytes to write
> + * @retlen: =A0 =A0pointer to variable to store the number of written by=
tes
> + * @buf: =A0 =A0 =A0 the data to write
> + *
> + * NAND write with ECC. Used when performing writes in interrupt context=
, this
> + * may for example be called by mtdoops when writing an oops while in pa=
nic.
> + */
> +static int panic_nand_write(struct mtd_info *mtd, loff_t to, size_t len,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 size_t *retlen, con=
st uint8_t *buf)
> +{
> + =A0 =A0 =A0 struct nand_chip *chip =3D mtd->priv;
> + =A0 =A0 =A0 int ret;
> +
> + =A0 =A0 =A0 /* Do not allow reads past end of device */
> + =A0 =A0 =A0 if ((to + len) > mtd->size)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 if (!len)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> +
> + =A0 =A0 =A0 /* Wait for the device to get ready. =A0*/
> + =A0 =A0 =A0 panic_nand_wait(mtd, chip, 400);
> +
> + =A0 =A0 =A0 /* Grab the device. =A0*/
> + =A0 =A0 =A0 panic_nand_get_device(chip, mtd, FL_WRITING);
> +
> + =A0 =A0 =A0 chip->ops.len =3D len;
> + =A0 =A0 =A0 chip->ops.datbuf =3D (uint8_t *)buf;
> + =A0 =A0 =A0 chip->ops.oobbuf =3D NULL;
> +
> + =A0 =A0 =A0 ret =3D nand_do_write_ops(mtd, to, &chip->ops);
> +
> + =A0 =A0 =A0 *retlen =3D chip->ops.retlen;
> + =A0 =A0 =A0 return ret;
> +}
> +
> +/**
> =A0* nand_write - [MTD Interface] NAND write with ECC
> =A0* @mtd: =A0 =A0 =A0 MTD device structure
> =A0* @to: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0offset to write to
> @@ -2694,6 +2806,7 @@ int nand_scan_tail(struct mtd_info *mtd)
> =A0 =A0 =A0 =A0mtd->unpoint =3D NULL;
> =A0 =A0 =A0 =A0mtd->read =3D nand_read;
> =A0 =A0 =A0 =A0mtd->write =3D nand_write;
> + =A0 =A0 =A0 mtd->panic_write =3D panic_nand_write;
> =A0 =A0 =A0 =A0mtd->read_oob =3D nand_read_oob;
> =A0 =A0 =A0 =A0mtd->write_oob =3D nand_write_oob;
> =A0 =A0 =A0 =A0mtd->sync =3D nand_sync;
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
