Received: from mail-qy0-f108.google.com ([209.85.221.108])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lxu1C-0002jg-Ru
	for linux-mtd@lists.infradead.org; Sun, 26 Apr 2009 02:23:05 +0000
Received: by qyk6 with SMTP id 6so3516895qyk.28
	for <linux-mtd@lists.infradead.org>;
	Sat, 25 Apr 2009 19:22:56 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <3cc7a0df0904250127y3f2dbb65t50f349c3e9dfb969@mail.gmail.com>
References: <3cc7a0df0904250127y3f2dbb65t50f349c3e9dfb969@mail.gmail.com>
Date: Sun, 26 Apr 2009 11:22:56 +0900
Message-ID: <9c9fda240904251922t7b2f6979j5a94115b0079c10a@mail.gmail.com>
Subject: Re: [PATCH] Onenand Reset IOBE bit in SYS_CFG register in
	onenand_release
From: Kyungmin Park <kmpark@infradead.org>
To: Gaurav Singh <gausinghnsit@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Linux mtd group <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Sat, Apr 25, 2009 at 5:27 PM, Gaurav Singh <gausinghnsit@gmail.com> wrot=
e:
> Hi all,
>
> I am a Linux enthusiast and was using ONENAND device of an embedded
> ARM device (Nomadik board - made and distributed by
> STMicroelectronics). =A0The device is Muxed OneNAND 128MB 1.8V 16-bit
> (0x30) OneNAND version =3D 0x0221 according to the probe prints. Looks
> like a 1Gb Mux Onenand flash. The driver for this device is using the
> interrupt mode operation.
> Interestingly the GPIO interrupt pin of ONENAND is shared with a pin
> of the NAND device. I was trying to use both NAND and ONENAND drivers
> as modules and found that after inserting the ONENAND driver and
> removing it I could not work with the NAND driver. This is inspite of
> the fact all pins used by the ONENAND driver have been freed including
> the interrupt pin. The NAND driver is able to acquire the common pin
> but cannot write to this pin. Infact the ONENAND interrupt GPIO pin is
> unusable even after the ONENAND driver is removed from the system.
> I noticed that before the interrupt pin is acquired by the ONENAND
> driver we are setting the IOBE bit in the SYS_CFG register as high. At
> remove time this bit has not been reset. Resetting this bit and
> repeating my test I found that the fix worked and the pin could now be
> used by the NAND driver.

Interesting, share interrupt pin between OneNAND and NAND.
Do you check the performance gain from interrupt use?
Even though there's code to use interrupt wait, in my board, there's
no performance gain.

Anyway follow patch fix your problem, I'm okay to apply.
except one code style issue. please place curly brace '{' after if statemen=
t

Thank you,
Kyungmin Park

>
> Proposed PATCH is as given below:
>
>
> diff --git a/drivers/mtd/onenand/onenand_base.c
> b/drivers/mtd/onenand/onenand_base.c
> index 0e168d8..9b2f9aa 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -2728,6 +2728,13 @@ void onenand_release(struct mtd_info *mtd)
> =A0 =A0 =A0 =A0/* Deregister partitions */
> =A0 =A0 =A0 =A0del_mtd_partitions (mtd);
> =A0#endif
> + =A0 =A0 =A0 /* Reset the IOBE bit in SYS_CFG Register */
> + =A0 =A0 =A0 =A0if ( this->wait =3D=3D onenand_interrupt_wait )
> + =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 int syscfg =3D this->read_word(this->base +=
 ONENAND_REG_SYS_CFG1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 syscfg &=3D ~ONENAND_SYS_CFG1_IOBE;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->write_word(syscfg, this->base + ONENA=
ND_REG_SYS_CFG1);
> + =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0/* Deregister the device */
> =A0 =A0 =A0 =A0del_mtd_device (mtd);
>
> Will this proposed patch also help saving some power lost due to
> output leakage current as IOBE is still enabled and the INT pin is
> connected to the ONENAND instead of in High impedence state ?

Reasonable

>
> Regards
> Gaurav Singh
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
