Received: from mail-qy0-f108.google.com ([209.85.221.108])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M1UYL-0004MV-6U
	for linux-mtd@lists.infradead.org; Wed, 06 May 2009 00:00:08 +0000
Received: by qyk6 with SMTP id 6so12967937qyk.28
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 May 2009 16:59:59 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <49FFF86F.2070402@nokia.com>
References: <49FFF86F.2070402@nokia.com>
Date: Wed, 6 May 2009 08:59:59 +0900
Message-ID: <9c9fda240905051659k55c169e0y5372f09bad33cb71@mail.gmail.com>
Subject: Re: [PATCH] MTD: OneNAND: Add support for OneNAND manufactured by
	Numonyx
From: Kyungmin Park <kmpark@infradead.org>
To: Adrian Hunter <adrian.hunter@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Good I heard the Numonyx also make a OneNAND chips.

Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

On Tue, May 5, 2009 at 5:27 PM, Adrian Hunter <adrian.hunter@nokia.com> wro=
te:
> From e400da3456896505edbf7c39a14668c2c718ace4 Mon Sep 17 00:00:00 2001
> From: Adrian Hunter <adrian.hunter@nokia.com>
> Date: Tue, 5 May 2009 11:04:19 +0300
> Subject: [PATCH] MTD: OneNAND: Add support for OneNAND manufactured by
> Numonyx
>
> In addition to adding the Numonyx manufacturer code, this patch
> also ensures 'sync. write' is disabled when reading identification
> data - something that the Numonyx chip objects to, but the
> Samsung chip seems to ignore.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@nokia.com>
> ---
> drivers/mtd/onenand/onenand_base.c | =A0 =A03 ++-
> include/linux/mtd/onenand.h =A0 =A0 =A0 =A0| =A0 =A01 +
> 2 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/onenand/onenand_base.c
> b/drivers/mtd/onenand/onenand_base.c
> index 524af9a..f6cfadb 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -2576,6 +2576,7 @@ static void onenand_print_device_info(int device, i=
nt
> version)
>
> static const struct onenand_manufacturers onenand_manuf_ids[] =3D {
> =A0 =A0 =A0 =A0{ONENAND_MFR_SAMSUNG, "Samsung"},
> + =A0 =A0 =A0 {ONENAND_MFR_NUMONYX, "Numonyx"},
> };
>
> /**
> @@ -2621,7 +2622,7 @@ static int onenand_probe(struct mtd_info *mtd)
> =A0 =A0 =A0 =A0/* Save system configuration 1 */
> =A0 =A0 =A0 =A0syscfg =3D this->read_word(this->base + ONENAND_REG_SYS_CF=
G1);
> =A0 =A0 =A0 =A0/* Clear Sync. Burst Read mode to read BootRAM */
> - =A0 =A0 =A0 this->write_word((syscfg & ~ONENAND_SYS_CFG1_SYNC_READ), th=
is->base
> + ONENAND_REG_SYS_CFG1);
> + =A0 =A0 =A0 this->write_word((syscfg & ~ONENAND_SYS_CFG1_SYNC_READ &
> ~ONENAND_SYS_CFG1_SYNC_WRITE), this->base + ONENAND_REG_SYS_CFG1);
>
> =A0 =A0 =A0 =A0/* Send the command for reading device ID from BootRAM */
> =A0 =A0 =A0 =A0this->write_word(ONENAND_CMD_READID, this->base + ONENAND_=
BOOTRAM);
> diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
> index 9aa2a91..0fa3ac4 100644
> --- a/include/linux/mtd/onenand.h
> +++ b/include/linux/mtd/onenand.h
> @@ -176,6 +176,7 @@ struct onenand_chip {
> =A0* OneNAND Flash Manufacturer ID Codes
> =A0*/
> #define ONENAND_MFR_SAMSUNG =A0 =A0 0xec
> +#define ONENAND_MFR_NUMONYX =A0 =A00x20
>
> /**
> =A0* struct onenand_manufacturers - NAND Flash Manufacturer ID Structure
> --
> 1.5.6.3
>
