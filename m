Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqgCK-0005IB-9l
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 13:21:14 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "richard@nod.at"
 <richard@nod.at>, Brezillon <boris.brezillon@free-electrons.com>
CC: "marek.vasut@gmail.com" <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Campbell
 <ijc+devicetree@hellion.org.uk>, "pawel.moll@arm.com" <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, "galak@codeaurora.org"
 <galak@codeaurora.org>, Campbell <ijc+devicetree@hellion.org.uk>
Subject: RE: [PATCH 4/5] mtd: nand: add support for Micron on-die ECC
Date: Wed, 22 Mar 2017 13:20:04 +0000
Message-ID: <8a171dacd20c45bd8285ecc5dbe8854a@SIWEX5A.sing.micron.com>
References: <538805ebf8e64015a8b833de755652b3@SIWEX5A.sing.micron.com>
In-Reply-To: <538805ebf8e64015a8b833de755652b3@SIWEX5A.sing.micron.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
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

>+micron_nand_read_page_on_die_ecc(struct mtd_info *mtd, struct nand_chip
>*chip,
>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 uint8_t *buf, int oob_required,
>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 int page)
>+{
>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int status;
>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int max_bitflips =3D 0;
>+
>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 micron_nand_on_die_ecc_setup(chip, t=
rue);
>+
>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 chip->cmdfunc(mtd, NAND_CMD_READ0, 0=
x00, page);
>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 chip->cmdfunc(mtd, NAND_CMD_STATUS, =
-1, -1);
>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 status =3D chip->read_byte(mtd);
>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (status & NAND_STATUS_FAIL)
>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 mtd->ecc_stats.failed++;
>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /*
>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * The internal ECC doesn't tell us t=
he number of bitflips
>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * that have been corrected, but tell=
s us if it recommends to
>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * rewrite the block. If it's the cas=
e, then we pretend we had
>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * a number of bitflips equal to the =
ECC strength, which will
>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * hint the NAND core to rewrite the =
block.
>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 */
>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 else if (status & NAND_STATUS_WRITE_=
RECOMMENDED)
>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 max_bitflips =3D chip->ecc.strength;
>+
>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 chip->cmdfunc(mtd, NAND_CMD_READ0, -=
1, -1);
>+
>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nand_read_page_raw(mtd, chip, buf, o=
ob_required, page);
>+
>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 micron_nand_on_die_ecc_setup(chip, f=
alse);
>+
>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return max_bitflips;
>+}


Hi,=20
Let me give you some information, hopefully you can do some modification ba=
sed on above codes.

I noticed that this patches are based on MT29F1G08ABADAWP SLC NAND, it is o=
ur 60s 34nm SLC NAND.
So far, we have 2 series SLC NAND with implementations of on die ECC.
1. M79A for all 25nm (70series) SLC NAND with on-die ECC (M78A, M79A, and f=
uture design M70A)
2. M60A for all 34nm (60series) SLC NAND with on-die ECC

NAND_STATUS_FAIL:
For the both of series SLC NAND with on-die ECC, SR bit 0 (NAND_STATUS_FAIL=
) indicates an uncorrectable read fail,
data is lost, no recovery possible, unless we have software additional prot=
ection, the block is not necessarily
bad but the data is lost.

NAND_STATUS_WRITE_RECOMMENDED:

For the NAND_STATUS_WRITE_RECOMMENDED, it only works on 60s NAND, it is 4 b=
it ECC, the status register only
indicates if there is 0 or 1-4 correctable error bits. We don't want to tri=
gger refresh if only 1 or 2 bits fail.
the base refresh is that if there 3 or 4 bitflips. But unfortunately we can=
't get failed bit count trough read status register.=20
SW workaround proposal:
1. If SR bit 3 is set to 1 it means 1~4 bitflips and correctable.
2. Read out the page with ECC ON
3. Read out the page with ECC OFF
4. Compare the data
5. Count the number of bitflips for the sectors (there are 4 ECC sectors)
6. if 3 or more fail bits, trigger fresh.=20
I know this is not good solution, but if as long as NAND_STATUS_WRITE_RECOM=
MENDED is set, and trigger refresh,
this will definitely increase NAND PE cycle.

For the 70s, it is 8 bits on-die ECC, the status register can report 7-8 bi=
tflips (refresh recommended), 4-6 bitflips and 1-3 bitflips.
So we can trigger refresh according to its bitflips status.

Thanks.
//beanhuo
