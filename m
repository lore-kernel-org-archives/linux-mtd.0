Received: from mail-vw0-f193.google.com ([209.85.212.193])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MkayR-0004Su-J1
	for linux-mtd@lists.infradead.org; Mon, 07 Sep 2009 09:57:28 +0000
Received: by vws31 with SMTP id 31so1826403vws.28
	for <linux-mtd@lists.infradead.org>;
	Mon, 07 Sep 2009 02:57:21 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <E902C77C74C544A3A554DD9881742C04@sisodomain.com>
References: <EF4202CC14044212993EE17E6010D5E7@sisodomain.com>
	<A32D4C31541C4D8B9BF6CB4D6EF4B5DC@sisodomain.com>
	<9c9fda240908310234h6cef3afev6a3f6e315321631b@mail.gmail.com>
	<C48D93C7DF3C4F9C96E47BE9D6F51F37@sisodomain.com>
	<4A9E0C47.205@gmail.com>
	<8A3568961C4E4E7495A397D2267B6E37@sisodomain.com>
	<1251958245.5060.6.camel@localhost>
	<FC4F021760EA4F649917598723041422@sisodomain.com>
	<1251976743.5060.13.camel@localhost>
	<E902C77C74C544A3A554DD9881742C04@sisodomain.com>
Date: Mon, 7 Sep 2009 18:57:21 +0900
Message-ID: <9c9fda240909070257w30f123b8h8bbea00482a684c5@mail.gmail.com>
Subject: Re: [PATCH] [OneNAND] OTP support re-implementation 1/1
From: Kyungmin Park <kmpark@infradead.org>
To: Amul Kumar Saha <amul.saha@samsung.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Even though the acutal number at otp are used.  others are looks good to me=
.

Artem/Adrian, how do you think?

Thank you,
Kyungmin Park

On Mon, Sep 7, 2009 at 6:45 PM, Amul Kumar Saha<amul.saha@samsung.com> wrot=
e:
> What is OTP in OneNAND?
> The device includes,
> 1. one block-sized OTP (One Time Programmable) area and
> 2. user-controlled 1st block OTP(Block 0)
> that can be used to increase system security or to provide identification=
 capabilities.
>
> What is done?
> In OneNAND, one block of the NAND Array is set aside as an OTP memory are=
a, and 1st Block (Block 0)
> can be used as OTP area.
> This area, available to the user, can be configured and locked with secur=
ed user information.
> The OTP block can be read, programmed and locked using the same operation=
s as any other NAND Flash
> Array
> memory block. After issuing an OTP-Lock, OTP block cannot be erased. OTP =
block is fully-guaranteed
> to be a valid block.
>
> Why it is done? (Impact)
> Locking the 1st Block OTP has the effect of a 'Write-protect' to guard ag=
ainst accidental
> re-programming of data stored in the 1st block and OTP Block.
>
> Which problem it solves?
> OTP support is provided in the existing implementation of OneNAND/Flex-On=
eNAND driver, but it is not
> working with OneNAND devices.
> Have observed the following in current OTP OneNAND Implmentation,
> 1. DataSheet specific sequence to lock the OTP Area is not followed.
> 2. Certain functions are quiet generic to cope with OTP specific activity=
.
> This patch re-implements OTP support for OneNAND device.
>
> How it is done?
> For all blocks, 8th word is available to the user.
> However,in case of OTP Block, 8th word of sector 0, page 0 is reserved as=
 OTP Locking Bit area.
> Therefore, in case of OTP Block, user usage on this area is prohibited.
> Condition specific values are entered in the 8th word, sector0, page 0 of=
 the OTP block during the
> process of issuing an OTP-Lock.
> The possible conditions are:-
> 1. Only 1st Block Lock
> 2. Only OTP Block Lock
> 3. Lock both the 1st Block and the OTP Block
>
> What Other feature additions have been done in this patch?
> This patch adds feature for:-
> 1. Only 1st Block Lock
> 2. Lock both the 1st Block and the OTP Blocks
>
> Re-implemented OTP support for OneNAND
> Added following features to OneNAND
> =A0 =A0 =A0 =A01. Lock only 1st Block in OneNAND
> =A0 =A0 =A0 =A02. Lock BOTH 1st Block and OTP Block in OneNAND
>
> Signed-off-by: Amul Kumar Saha <amul.saha@samsung.com>
> ---
> =A0drivers/mtd/onenand/onenand_base.c | =A0297 ++++++++++++++++++++++++++=
+++++++----
> =A0include/linux/mtd/onenand.h =A0 =A0 =A0 =A0| =A0 =A02
> =A02 files changed, 267 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/one=
nand_base.c
> index 6e82909..43a0963 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -11,7 +11,9 @@
> =A0*
> =A0* =A0 =A0 Vishak G <vishak.g at samsung.com>, Rohit Hagargundgi <h.roh=
it at samsung.com>
> =A0* =A0 =A0 Flex-OneNAND support
> - * =A0 =A0 Copyright (C) Samsung Electronics, 2008
> + * =A0 =A0 Amul Kumar Saha <amul.saha@samsung.com>
> + * =A0 =A0 OTP support
> + * =A0 =A0 Copyright (C) Samsung Electronics, 2009
> =A0*
> =A0* This program is free software; you can redistribute it and/or modify
> =A0* it under the terms of the GNU General Public License version 2 as
> @@ -43,6 +45,18 @@ MODULE_PARM_DESC(flex_bdry, =A0"SLC Boundary informati=
on for Flex-OneNAND"
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0" =A0 =A0:=
 0->Set boundary in unlocked status"
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0" =A0 =A0:=
 1->Set boundary in locked status");
>
> +/* Default OneNAND/Flex-OneNAND OTP options*/
> +static int otp;
> +
> +module_param(otp, int, 0400);
> +MODULE_PARM_DESC(otp, =A0"Corresponding behaviour of OneNAND in OTP"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Syntax : otp=3DLOCK_TYPE"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "LOCK_TYPE : Keys issued, f=
or specific OTP Lock type"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 " =A0 =A0 =A0 =A0 =A0: 0 ->=
 Default (No Blocks Locked)"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 " =A0 =A0 =A0 =A0 =A0: 1 ->=
 OTP Block lock"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 " =A0 =A0 =A0 =A0 =A0: 2 ->=
 1st Block lock"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 " =A0 =A0 =A0 =A0 =A0: 3 ->=
 BOTH OTP Block and 1st Block lock");
> +
> =A0/**
> =A0* =A0onenand_oob_128 - oob info for Flex-Onenand with 4KB page
> =A0* =A0For now, we expose only 64 out of 80 ecc bytes
> @@ -308,6 +322,81 @@ int flexonenand_region(struct mtd_info *mtd, loff_t =
addr)
> =A0EXPORT_SYMBOL(flexonenand_region);
>
> =A0/**
> + * onenand_otp_command - Send OTP specific command to OneNAND device
> + * @param mtd =A0 MTD device structure
> + * @param cmd =A0 the command to be sent
> + * @param addr =A0offset to read from or write to
> + * @param len =A0 number of bytes to read or write
> + */
> +static int onenand_otp_command(struct mtd_info *mtd, int cmd, loff_t add=
r,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 size_t len)
> +{
> + =A0 =A0 =A0 struct onenand_chip *this =3D mtd->priv;
> + =A0 =A0 =A0 int value, block, page;
> +
> + =A0 =A0 =A0 /* Address translation */
> + =A0 =A0 =A0 switch (cmd) {
> + =A0 =A0 =A0 case ONENAND_CMD_OTP_ACCESS:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 block =3D (int) (addr >> this->erase_shift)=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 page =3D -1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 default:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 block =3D (int) (addr >> this->erase_shift)=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 page =3D (int) (addr >> this->page_shift);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ONENAND_IS_2PLANE(this)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Make the even block numb=
er */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 block &=3D ~1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Is it the odd plane? */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (addr & this->writesize)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 block++;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 page >>=3D 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 page &=3D this->page_mask;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 if (block !=3D -1) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Write 'DFS, FBA' of Flash */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 value =3D onenand_block_address(this, block=
);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->write_word(value, this->base +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ONENAND_REG=
_START_ADDRESS1);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 if (page !=3D -1) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Now we use page size operation */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 int sectors =3D 4, count =3D 4;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 int dataram;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 switch (cmd) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 default:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ONENAND_IS_2PLANE(this)=
 && cmd =3D=3D ONENAND_CMD_PROG)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D ONE=
NAND_CMD_2X_PROG;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dataram =3D ONENAND_CURRENT=
_BUFFERRAM(this);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Write 'FPA, FSA' of Flash */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 value =3D onenand_page_address(page, sector=
s);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->write_word(value, this->base +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ONENAND_REG=
_START_ADDRESS8);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Write 'BSA, BSC' of DataRAM */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 value =3D onenand_buffer_address(dataram, s=
ectors, count);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->write_word(value, this->base + ONENAN=
D_REG_START_BUFFER);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Interrupt clear */
> + =A0 =A0 =A0 this->write_word(ONENAND_INT_CLEAR, this->base + ONENAND_RE=
G_INTERRUPT);
> +
> + =A0 =A0 =A0 /* Write command */
> + =A0 =A0 =A0 this->write_word(cmd, this->base + ONENAND_REG_COMMAND);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +/**
> =A0* onenand_command - [DEFAULT] Send command to OneNAND device
> =A0* @param mtd =A0 =A0 =A0 =A0 =A0MTD device structure
> =A0* @param cmd =A0 =A0 =A0 =A0 =A0the command to be sent
> @@ -1879,7 +1968,8 @@ static int onenand_write_ops_nolock(struct mtd_info=
 *mtd, loff_t to,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0onenand_update_bufferram(m=
td, prev, !ret && !prev_subpage);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0written -=
=3D prevlen;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN=
_ERR "onenand_write_ops_nolock: write filaed %d\n", ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN=
_ERR "onenand_write_ops_nolock: \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 write failed %d\n", ret);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> @@ -1905,14 +1995,16 @@ static int onenand_write_ops_nolock(struct mtd_in=
fo *mtd, loff_t to,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* In partial page write w=
e don't update bufferram */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0onenand_update_bufferram(m=
td, to, !ret && !subpage);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN=
_ERR "onenand_write_ops_nolock: write filaed %d\n", ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN=
_ERR "onenand_write_ops_nolock: \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 write failed %d\n", ret);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Only check verify write=
 turn on */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D onenand_verify(mtd=
, buf, to, thislen);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN=
_ERR "onenand_write_ops_nolock: verify failed %d\n", ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN=
_ERR "onenand_write_ops_nolock: \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 verify failed %d\n", ret);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> @@ -1945,6 +2037,134 @@ static int onenand_write_ops_nolock(struct mtd_in=
fo *mtd, loff_t to,
>
>
> =A0/**
> + * onenand_otp_write_oob_nolock - [Internal] OneNAND write out-of-band, =
specific to OTP
> + * @param mtd =A0 =A0 =A0 =A0 =A0MTD device structure
> + * @param to =A0 =A0 =A0 =A0 =A0 offset to write to
> + * @param len =A0 =A0 =A0 =A0 =A0number of bytes to write
> + * @param retlen =A0 =A0 =A0 pointer to variable to store the number of =
written bytes
> + * @param buf =A0 =A0 =A0 =A0 =A0the data to write
> + *
> + * OneNAND write out-of-band only for OTP
> + */
> +static int onenand_otp_write_oob_nolock(struct mtd_info *mtd, loff_t to,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 str=
uct mtd_oob_ops *ops)
> +{
> + =A0 =A0 =A0 struct onenand_chip *this =3D mtd->priv;
> + =A0 =A0 =A0 int column, ret =3D 0, oobsize;
> + =A0 =A0 =A0 int written =3D 0;
> + =A0 =A0 =A0 u_char *oobbuf;
> + =A0 =A0 =A0 size_t len =3D ops->ooblen;
> + =A0 =A0 =A0 const u_char *buf =3D ops->oobbuf;
> + =A0 =A0 =A0 int block, value, status;
> +
> + =A0 =A0 =A0 to +=3D ops->ooboffs;
> +
> + =A0 =A0 =A0 /* Initialize retlen, in case of early exit */
> + =A0 =A0 =A0 ops->oobretlen =3D 0;
> +
> + =A0 =A0 =A0 oobsize =3D mtd->oobsize;
> +
> + =A0 =A0 =A0 column =3D to & (mtd->oobsize - 1);
> +
> + =A0 =A0 =A0 oobbuf =3D this->oob_buf;
> +
> + =A0 =A0 =A0 /* Loop until all data write */
> + =A0 =A0 =A0 while (written < len) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 int thislen =3D min_t(int, oobsize, len - w=
ritten);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cond_resched();
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 block =3D (int) (to >> this->erase_shift);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Write 'DFS, FBA' of Flash
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Add: F100h DQ=3DDFS, FBA
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 value =3D onenand_block_address(this, block=
);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->write_word(value, this->base +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ONENAND_REG=
_START_ADDRESS1);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Select DataRAM for DDP
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Add: F101h DQ=3DDBS
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 value =3D onenand_bufferram_address(this, b=
lock);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->write_word(value, this->base +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ONENAND_REG=
_START_ADDRESS2);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ONENAND_SET_NEXT_BUFFERRAM(this);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Enter OTP access mode
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->command(mtd, ONENAND_CMD_OTP_ACCESS, =
0, 0);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->wait(mtd, FL_OTPING);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* We send data to spare ram with oobsize
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* to prevent byte access */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 memcpy(oobbuf + column, buf, thislen);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Write Data into DataRAM
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Add: 8th Word
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* in sector0/spare/page0
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* DQ=3DXXFCh
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->write_bufferram(mtd, ONENAND_SPARERAM=
,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 oobbuf, 0, mtd->oobsize);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 onenand_otp_command(mtd, ONENAND_CMD_PROGOO=
B, to, mtd->oobsize);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 onenand_update_bufferram(mtd, to, 0);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ONENAND_IS_2PLANE(this)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ONENAND_SET_BUFFERRAM1(this=
);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 onenand_update_bufferram(mt=
d, to + this->writesize, 0);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D this->wait(mtd, FL_WRITING);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "onenand_wr=
ite_oob_nolock: \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 write failed %d\n", ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Exit OTP access mode */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->command(mtd, ONENAND_CMD_RESET, 0, 0)=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->wait(mtd, FL_RESETING);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 status =3D this->read_word(this->base + ONE=
NAND_REG_CTRL_STATUS);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 status &=3D 0x60;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (status =3D=3D 0x60) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_DEBUG "\nBLOCK\=
tSTATUS\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_DEBUG "1st Bloc=
k\tLOCKED\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_DEBUG "OTP Bloc=
k\tLOCKED\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else if (status =3D=3D 0x20) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_DEBUG "\nBLOCK\=
tSTATUS\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_DEBUG "1st Bloc=
k\tLOCKED\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_DEBUG "OTP Bloc=
k\tUN-LOCKED\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else if (status =3D=3D 0x40) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_DEBUG "\nBLOCK\=
tSTATUS\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_DEBUG "1st Bloc=
k\tUN-LOCKED\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_DEBUG "OTP Bloc=
k\tLOCKED\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_DEBUG "Reboot t=
o check\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 written +=3D thislen;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (written =3D=3D len)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 to +=3D mtd->writesize;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf +=3D thislen;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 column =3D 0;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 ops->oobretlen =3D written;
> +
> + =A0 =A0 =A0 return ret;
> +}
> +
> +/**
> =A0* onenand_write_oob_nolock - [Internal] OneNAND write out-of-band
> =A0* @param mtd =A0 =A0 =A0 =A0 =A0MTD device structure
> =A0* @param to =A0 =A0 =A0 =A0 =A0 offset to write to
> @@ -2659,11 +2879,11 @@ static int do_otp_lock(struct mtd_info *mtd, loff=
_t from, size_t len,
> =A0 =A0 =A0 =A0struct mtd_oob_ops ops;
> =A0 =A0 =A0 =A0int ret;
>
> - =A0 =A0 =A0 /* Enter OTP access mode */
> - =A0 =A0 =A0 this->command(mtd, ONENAND_CMD_OTP_ACCESS, 0, 0);
> - =A0 =A0 =A0 this->wait(mtd, FL_OTPING);
> -
> =A0 =A0 =A0 =A0if (FLEXONENAND(this)) {
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Enter OTP access mode */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->command(mtd, ONENAND_CMD_OTP_ACCESS, =
0, 0);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->wait(mtd, FL_OTPING);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * For Flex-OneNAND, we write lock mark to=
 1st word of sector 4 of
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * main area of page 49.
> @@ -2674,19 +2894,19 @@ static int do_otp_lock(struct mtd_info *mtd, loff=
_t from, size_t len,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.oobbuf =3D NULL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D onenand_write_ops_nolock(mtd, mtd-=
>writesize * 49, &ops);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*retlen =3D ops.retlen;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Exit OTP access mode */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->command(mtd, ONENAND_CMD_RESET, 0, 0)=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->wait(mtd, FL_RESETING);
> =A0 =A0 =A0 =A0} else {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.mode =3D MTD_OOB_PLACE;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.ooblen =3D len;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.oobbuf =3D buf;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ops.ooboffs =3D 0;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D onenand_write_oob_nolock(mtd, from,=
 &ops);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D onenand_otp_write_oob_nolock(mtd, f=
rom, &ops);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*retlen =3D ops.oobretlen;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 /* Exit OTP access mode */
> - =A0 =A0 =A0 this->command(mtd, ONENAND_CMD_RESET, 0, 0);
> - =A0 =A0 =A0 this->wait(mtd, FL_RESETING);
> -
> =A0 =A0 =A0 =A0return ret;
> =A0}
>
> @@ -2717,16 +2937,21 @@ static int onenand_otp_walk(struct mtd_info *mtd,=
 loff_t from, size_t len,
> =A0 =A0 =A0 =A0if (density < ONENAND_DEVICE_DENSITY_512Mb)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0otp_pages =3D 20;
> =A0 =A0 =A0 =A0else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 otp_pages =3D 10;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 otp_pages =3D 50;
>
> =A0 =A0 =A0 =A0if (mode =3D=3D MTD_OTP_FACTORY) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0from +=3D mtd->writesize * otp_pages;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 otp_pages =3D 64 - otp_pages;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 otp_pages =3D ONENAND_PAGES_PER_BLOCK - otp=
_pages;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0/* Check User/Factory boundary */
> - =A0 =A0 =A0 if (((mtd->writesize * otp_pages) - (from + len)) < 0)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 if (mode =3D=3D MTD_OTP_USER) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (((mtd->writesize * otp_pages) - (from +=
 len)) < 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (((mtd->writesize * otp_pages) - len) < =
0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0onenand_get_device(mtd, FL_OTPING);
> =A0 =A0 =A0 =A0while (len > 0 && otp_pages > 0) {
> @@ -2749,13 +2974,12 @@ static int onenand_otp_walk(struct mtd_info *mtd,=
 loff_t from, size_t len,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*retlen +=3D sizeof(struct=
 otp_info);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} else {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0size_t tmp_retlen;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int size =3D len;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D action(mtd, from, =
len, &tmp_retlen, buf);
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf +=3D size;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 len -=3D size;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *retlen +=3D size;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf +=3D tmp_retlen;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 len -=3D tmp_retlen;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *retlen +=3D tmp_retlen;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> @@ -2868,21 +3092,11 @@ static int onenand_lock_user_prot_reg(struct mtd_=
info *mtd, loff_t from,
> =A0 =A0 =A0 =A0u_char *buf =3D FLEXONENAND(this) ? this->page_buf : this-=
>oob_buf;
> =A0 =A0 =A0 =A0size_t retlen;
> =A0 =A0 =A0 =A0int ret;
> + =A0 =A0 =A0 unsigned int otp_lock_offset =3D ONENAND_OTP_LOCK_OFFSET;
>
> =A0 =A0 =A0 =A0memset(buf, 0xff, FLEXONENAND(this) ? this->writesize
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 : mtd->oobsize);
> =A0 =A0 =A0 =A0/*
> - =A0 =A0 =A0 =A0* Note: OTP lock operation
> - =A0 =A0 =A0 =A0* =A0 =A0 =A0 OTP block : 0xXXFC
> - =A0 =A0 =A0 =A0* =A0 =A0 =A0 1st block : 0xXXF3 (If chip support)
> - =A0 =A0 =A0 =A0* =A0 =A0 =A0 Both =A0 =A0 =A0: 0xXXF0 (If chip support)
> - =A0 =A0 =A0 =A0*/
> - =A0 =A0 =A0 if (FLEXONENAND(this))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf[FLEXONENAND_OTP_LOCK_OFFSET] =3D 0xFC;
> - =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf[ONENAND_OTP_LOCK_OFFSET] =3D 0xFC;
> -
> - =A0 =A0 =A0 /*
> =A0 =A0 =A0 =A0 * Write lock mark to 8th word of sector0 of page0 of the =
spare0.
> =A0 =A0 =A0 =A0 * We write 16 bytes spare area instead of 2 bytes.
> =A0 =A0 =A0 =A0 * For Flex-OneNAND, we write lock mark to 1st word of sec=
tor 4 of
> @@ -2892,6 +3106,25 @@ static int onenand_lock_user_prot_reg(struct mtd_i=
nfo *mtd, loff_t from,
> =A0 =A0 =A0 =A0from =3D 0;
> =A0 =A0 =A0 =A0len =3D FLEXONENAND(this) ? mtd->writesize : 16;
>
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Note: OTP lock operation
> + =A0 =A0 =A0 =A0* =A0 =A0 =A0 OTP block : 0xXXFC =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 XX 1111 1100
> + =A0 =A0 =A0 =A0* =A0 =A0 =A0 1st block : 0xXXF3 (If chip support) =A0 X=
X 1111 0011
> + =A0 =A0 =A0 =A0* =A0 =A0 =A0 Both =A0 =A0 =A0: 0xXXF0 (If chip support)=
 =A0 XX 1111 0000
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (FLEXONENAND(this))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 otp_lock_offset =3D FLEXONENAND_OTP_LOCK_OF=
FSET;
> +
> + =A0 =A0 =A0 /* ONENAND_OTP_AREA | ONENAND_OTP_BLOCK0 | ONENAND_OTP_AREA=
_BLOCK0 */
> + =A0 =A0 =A0 if (otp =3D=3D 1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf[otp_lock_offset] =3D 0xFC;
> + =A0 =A0 =A0 else if (otp =3D=3D 2)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf[otp_lock_offset] =3D 0xF3;
> + =A0 =A0 =A0 else if (otp =3D=3D 3)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf[otp_lock_offset] =3D 0xF0;
> + =A0 =A0 =A0 else if (otp !=3D 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_DEBUG "[OneNAND] Invalid option=
 selected for OTP\n");
> +
> =A0 =A0 =A0 =A0ret =3D onenand_otp_walk(mtd, from, len, &retlen, buf, do_=
otp_lock, MTD_OTP_USER);
>
> =A0 =A0 =A0 =A0return ret ? : retlen;
> diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
> index 8ed8733..7bd1512 100644
> --- a/include/linux/mtd/onenand.h
> +++ b/include/linux/mtd/onenand.h
> @@ -152,6 +152,8 @@ struct onenand_chip {
> =A0/*
> =A0* Helper macros
> =A0*/
> +#define ONENAND_PAGES_PER_BLOCK =A0 =A0 =A0 =A0(1<<6)
> +
> =A0#define ONENAND_CURRENT_BUFFERRAM(this) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(this->bufferram_index)
> =A0#define ONENAND_NEXT_BUFFERRAM(this) =A0 =A0 =A0 =A0 =A0 (this->buffer=
ram_index ^ 1)
> =A0#define ONENAND_SET_NEXT_BUFFERRAM(this) =A0 =A0 =A0 (this->bufferram_=
index ^=3D 1)
>
>
>
