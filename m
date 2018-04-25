Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBT8u-000765-KD
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2018 22:44:07 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Richard Weinberger <richard@nod.at>, "David
 Woodhouse" <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, Nadav Haklai <nadavh@marvell.com>,
 Ofer Heifetz <oferh@marvell.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: rawnand: marvell: fix the chip-select DT parsing
 logic
Date: Wed, 25 Apr 2018 22:43:43 +0000
Message-ID: <cc8aca06646f401d96a3dc7856572733@svr-chch-ex1.atlnz.lc>
References: <20180425141632.9876-1-miquel.raynal@bootlin.com>
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

Hi Miquel,=0A=
=0A=
On 26/04/18 02:16, Miquel Raynal wrote:=0A=
> The block responsible of parsing the DT for the number of chip-select=0A=
> lines uses an 'if/else if/else if' block. The content of the second and=
=0A=
> third 'else if' conditions are:=0A=
>          1/ the actual condition to enter the sub-block and=0A=
>          2/ the operation to do in this sub-block.=0A=
> =0A=
>          [...]=0A=
>          else if (condition1_to_enter && action1() =3D=3D failed)=0A=
>                  raise_error();=0A=
>          else if (condition2_to_enter && action2() =3D=3D failed)=0A=
>                  raise_error();=0A=
>          [...]=0A=
> =0A=
> In case of failure, the sub-block is entered and an error raised.=0A=
> Otherwise, in case of success, the code would continue erroneously in=0A=
> the next 'else if' statement because it did not failed (and did not=0A=
> enter the first 'else if' sub-block).=0A=
> =0A=
> The first 'else if' refers to legacy bindings while the second 'else if'=
=0A=
> refers to new bindings. The second 'else if', which is entered=0A=
> erroneously, checks for the 'reg' property, which, for old bindings,=0A=
> does not mean anything because it would not be the number of CS=0A=
> available, but the regular register map of almost any DT node. This=0A=
> being said, the content of the 'reg' property being the register map=0A=
> offset and length, it has '2' values, so the number of CS in this=0A=
> situation is assumed to be '2'.=0A=
> =0A=
> When running nand_scan_ident() with 2 CS, the core will check for an=0A=
> array of chips. It will first issue a RESET and then a READ_ID. Of=0A=
> course this will trigger two timeouts because there is no chip in front=
=0A=
> of the second CS:=0A=
> =0A=
> [    1.367460] marvell-nfc f2720000.nand: Timeout on CMDD (NDSR: 0x000000=
80)=0A=
> [    1.474292] marvell-nfc f2720000.nand: Timeout on CMDD (NDSR: 0x000002=
80)=0A=
> =0A=
> Indeed, this is harmless and the core will then assume there is only one=
=0A=
> valid CS.=0A=
> =0A=
> Fix the logic in the whole block by entering each sub-block just on the=
=0A=
> 'is legacy' condition, doing the action inside the sub-block. This way,=
=0A=
> when the action succeeds, the whole block is left.=0A=
> =0A=
> Furthermore, for both the old bindings and the new bindings the same=0A=
> logic was applied to retrieve the number of CS lines:=0A=
> using of_get_property() to get a size in bytes, converted in the actual=
=0A=
> number of lines by dividing it per sizeof(u32) (4 bytes).=0A=
> =0A=
> This is fine for the 'reg' property which is a list of the CS IDs but=0A=
> not for the 'num-cs' property which is directly the value of the number=
=0A=
> of CS.=0A=
> =0A=
> Anyway, no existing DT uses another value than 'num-cs =3D <1>' and no=0A=
> other value has ever been supported by the old driver (pxa3xx_nand.c).=0A=
> Remove this condition and apply a number of 1 CS anyway, as already=0A=
> described in the bindings.=0A=
> =0A=
> Finally, the 'reg' property of a 'nand' node (with the new bindings)=0A=
> gives the IDs of each CS line in use. marvell_nand.c driver first look=0A=
> at the number of CS lines that are present in this property.=0A=
> =0A=
> Better use of_property_count_elems_of_size() than dividing by 4 the size=
=0A=
> of the number of bytes returned by of_get_property().=0A=
> =0A=
> Fixes: 02f26ecf8c772 ("mtd: nand: add reworked Marvell NAND controller dr=
iver")=0A=
> Cc: stable@vger.kernel.org=0A=
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>=0A=
=0A=
This stops the timeout warnings on my platform. So for that part=0A=
=0A=
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
=0A=
