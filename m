Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QA0n5-0002sn-12
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 14:11:34 +0000
Date: Wed, 13 Apr 2011 16:11:24 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Subject: Re: [PATCH 2/2] mtd: add switch to support NAND flash on big endian
	bus
In-Reply-To: <1302702918-6050-2-git-send-email-hans-christian.egtvedt@atmel.com>
Message-ID: <Pine.LNX.4.64.1104131609410.30071@lnxricardw.se.axis.com>
References: <1302702918-6050-1-git-send-email-hans-christian.egtvedt@atmel.com>
	<1302702918-6050-2-git-send-email-hans-christian.egtvedt@atmel.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 13 Apr 2011, Hans-Christian Egtvedt wrote:

> This patch adds a new kconfig symbol to the MTD NAND system, MTD_NAND_BE_=
BUS.
> This symbol is used by the nand base to properly convert the data read fr=
om the
> bus into the format the CPU expects.
>
> The patch fixes 16-bit NAND flash support on big endian architectures (at=
 least
> AVR32) with NAND flash hooked up to a big endian external bus.
>
> Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
> ---
> drivers/mtd/nand/Kconfig     |    8 ++++++++
> drivers/mtd/nand/nand_base.c |    8 ++++++++
> 2 files changed, 16 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index edec457..bb3a54a 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -22,6 +22,14 @@ menuconfig MTD_NAND
>
> if MTD_NAND
>
> +config MTD_NAND_BE_BUS
> +=09bool "NAND device on big endian bus"
> +=09default n
> +=09help
> +=09  This option will assume data read from the bus is in big endian
> +=09  format. This is vital when reading command values from the bus, as
> +=09  only the lower 8 bit are in use then.
> +
> config MTD_NAND_VERIFY_WRITE
> =09bool "Verify NAND page writes"
> =09help
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index c54a4cb..bbb0c1d 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -180,7 +180,11 @@ static uint8_t nand_read_byte(struct mtd_info *mtd)
> static uint8_t nand_read_byte16(struct mtd_info *mtd)
> {
> =09struct nand_chip *chip =3D mtd->priv;
> +#if CONFIG_MTD_NAND_BE_BUS
> +=09return (uint8_t) be16_to_cpu(readw(chip->IO_ADDR_R));
> +#else
> =09return (uint8_t) cpu_to_le16(readw(chip->IO_ADDR_R));
> +#endif }

Wouldn't one expect a certain symmetry here, i.e. if one function is
cpu_to_le16, the other one would be called cpu_to_be16 ? I guess in most=20
cases cpu_to_le16 would be the same as le16_to_cpu, etc, but it still=20
looks as if someone made a mistake.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
