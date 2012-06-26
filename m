MIME-Version: 1.0
In-Reply-To: <1340618866-28776-5-git-send-email-josh.wu@atmel.com>
References: <1340618866-28776-1-git-send-email-josh.wu@atmel.com>
 <1340618866-28776-5-git-send-email-josh.wu@atmel.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 26 Jun 2012 16:15:11 +0200
Message-ID: <CACQ1gAhQDbpogep=fTM-odO0XDHXJGn3uWHx7FP7Ywjt+7tzMw@mail.gmail.com>
Subject: Re: [PATCH v11 4/4] MTD: at91: atmel_nand: Update driver to support
 Programmable Multibit ECC controller
To: Josh Wu <josh.wu@atmel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: hongxu.cn@gmail.com, nick.spence@freescale.com, dedekind1@gmail.com,
 dwmw2@infradead.org, plagnioj@jcrosoft.com, nicolas.ferre@atmel.com,
 linux-mtd@lists.infradead.org, scottwood@freescale.com, ivan.djelic@parrot.com,
 computersforpeace@gmail.com, tie-fei.zang@freescale.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/6/25 Josh Wu <josh.wu@atmel.com>:
> +static void pmecc_correct_data(struct mtd_info *mtd, uint8_t *buf,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int extra_bytes, int e=
rr_nbr)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct nand_chip *nand_chip =3D mtd->priv;
> + =C2=A0 =C2=A0 =C2=A0 struct atmel_nand_host *host =3D nand_chip->priv;
> + =C2=A0 =C2=A0 =C2=A0 int i =3D 0;
> + =C2=A0 =C2=A0 =C2=A0 int byte_pos, bit_pos, sector_size, ecc_size;
> + =C2=A0 =C2=A0 =C2=A0 uint32_t tmp;
> +
> + =C2=A0 =C2=A0 =C2=A0 sector_size =3D host->pmecc_sector_size;
> + =C2=A0 =C2=A0 =C2=A0 ecc_size =3D nand_chip->ecc.bytes;
> +
> + =C2=A0 =C2=A0 =C2=A0 while (err_nbr) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp =3D pmerrloc_readl=
_el_relaxed(host->pmerrloc_base, i) - 1;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 byte_pos =3D tmp / 8;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bit_pos =C2=A0=3D tmp =
% 8;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_info(host->dev, "P=
MECC correction, byte_pos: %d bit_pos: %d\n",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 byte_pos, bi=
t_pos);
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (byte_pos < (sector=
_size + extra_bytes)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 tmp =3D sector_size +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pmecc_readl_relaxed(host->ecc, SADDR);
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (byte_pos < tmp)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(buf + byte_pos) ^=3D (1 << bit_pos);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(buf + byte_pos + ecc_size) ^=3D (1 << =
bit_pos);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
I think there's a problem in there.
On my board (sam9g35-ek), I've got 2KB pages and 4 sectors per page + 64B O=
OB.
When I flip a bit on the 63rd OOB byte (the last ECC byte), byte_pos is 515=
.
If I flip a bit on the 51th OOB byte (the 3rd ECC byte), byte_pos is also 5=
15.
So, if I get it correct, byte_pos will always be between 0 and
sector_size + sector_ecc_bytes.
(and I think that sector_ecc_bytes =3D=3D extra_bytes (cf below))
And, pmecc_readl_relaxed(host->ecc, SADDR) gives me the ECC offset in OOB (=
48).
So, (byte_pos < sector_size + extra_bytes) will always be correct as
far as the PMECC controller doesn't give us crap.
But, IHMO the "tmp =3D sector_size + pmecc_readl_relaxed(host->ecc,
SADDR);" line is wrong.

I think that it should be something like this:
static void pmecc_correct_data(struct mtd_info *mtd, uint8_t *buf, uint8_t =
*ecc,
		int extra_bytes, int err_nbr, int sector_number)
{
[...]
		tmp =3D pmerrloc_readl_el_relaxed(host->pmerrloc_base, i) - 1;
		byte_pos =3D tmp / 8;
		bit_pos =C2=A0=3D tmp % 8;
		if (byte_pos < (sector_size + extra_bytes)) {
			if (byte_pos < sector_size) {
				*(buf + byte_pos) ^=3D (1 << bit_pos);
				/* It may be easier to read this info if the byte_pos
				 * is relative to the page start, not just the sector */
				dev_info(host->dev, "PMECC correction, byte_pos: %d bit_pos: %d\n",
					 sector_number * sector_sz + byte_pos, bit_pos);
			} else {
				/* number of ecc bytes per sector */
				tmp =3D pmecc_get_ecc_bytes(nand_chip->ecc.strength, sector_size);
				/* offset in the ecc of the ecc bytes for current sector */
				tmp *=3D sector_number;
				/* now, tmp is the offset of the byte error in the ecc */
				tmp +=3D byte_pos - sector_size;
				ecc[tmp] ^=3D (1 << bit_pos);
				dev_info(host->dev, "Bit flip in ECC, ecc_byte_pos: %d bit_pos: %d\n",
					 tmp, bit_pos);
				/* or */
				dev_info(host->dev, "Bit flip in OOB, oob_byte_pos: %d bit_pos: %d\n",
					 tmp + nand_chip->ecc_layout.eccpos[0], bit_pos);
			}
		}
[...]

> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i++;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err_nbr--;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 return;
> +}
> +
> +static int pmecc_correction(struct mtd_info *mtd, u32 pmecc_stat, uint8_=
t *buf,
> + =C2=A0 =C2=A0 =C2=A0 u8 *ecc)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct nand_chip *nand_chip =3D mtd->priv;
> + =C2=A0 =C2=A0 =C2=A0 struct atmel_nand_host *host =3D nand_chip->priv;
> + =C2=A0 =C2=A0 =C2=A0 int i, err_nbr, eccbytes;
> + =C2=A0 =C2=A0 =C2=A0 uint8_t *buf_pos;
> +
> + =C2=A0 =C2=A0 =C2=A0 eccbytes =3D nand_chip->ecc.bytes;
> + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < eccbytes; i++)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ecc[i] !=3D 0xff)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 goto normal_check;
> + =C2=A0 =C2=A0 =C2=A0 /* Erased page, return OK */
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +
> +normal_check:
> + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < host->pmecc_sector_number; i++) =
{
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err_nbr =3D 0;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pmecc_stat & 0x1) =
{
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 buf_pos =3D buf + i * host->pmecc_sector_size;
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 pmecc_gen_syndrome(mtd, i);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 pmecc_substitute(mtd);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 pmecc_get_sigma(mtd);
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 err_nbr =3D pmecc_err_location(mtd);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (err_nbr =3D=3D -1) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(host->dev, "PMECC: Too many erro=
rs\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mtd->ecc_stats.failed++;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 } else {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pmecc_correct_data(mtd, buf_pos, 0, err_=
nbr);

IHMO, extra_bytes should be (eccbytes / host->pmecc_sector_number)
pmecc_correct_data(mtd, buf_pos, ecc, eccbytes /
host->pmecc_sector_number, err_nbr, i);

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mtd->ecc_stats.corrected +=3D err_nbr;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pmecc_stat >>=3D 1;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}

I tested the patchset against 3.5-rc4, on a at91sam9g35-ek board.
the DTS config I used is:
reg =3D <0x40000000 0x10000000 0xffffe000 0x600 0xffffe600 0x200
0x00100000 0x00100000 >;
nand-bus-width =3D <8>;
nand-ecc-mode =3D "hw";
nand-on-flash-bbt;
atmel,nand-addr-offset =3D <21>;
atmel,nand-cmd-offset =3D <22>;
gpios =3D <&pioD 5 0 &pioD 4 0 0 >;
atmel,has-pmecc;
atmel,pmecc-cap =3D <2>;
atmel,pmecc-sector-size =3D <512>;
atmel,pmecc-lookup-table-offset =3D <0x8000 0x10000>;

(nand on the -ek is 2KiB page size, 128KiB eraseblock)

I tested
- 1 bit flip on a page
- 4 bit flips on a page (1 per sector)
- 5 bit flips on a page (2 on sector 1, and then 1 per sector)
- 1 bit flip on ECC
- 2 bit flips on ECC (on the same byte)
- 3 bit flips =3D> I/O error (ok, since pmecc-cap =3D 2 )
- 3 bit flips on ECC =3D> I/O error (ok, since pmecc-cap =3D 2 )
only problem : ECC is not corrected (should be better with the fixes above)

When you have corrected the ECC correction issue, you can add my:
Tested-by: Richard Genoud <richard.genoud@gmail.com>

Regards.
--=20
for me, ck means con kolivas and not calvin klein... does it mean I'm a gee=
k ?
