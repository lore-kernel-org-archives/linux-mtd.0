Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g8RGS-0004TG-3w
 for linux-mtd@lists.infradead.org; Fri, 05 Oct 2018 14:39:37 +0000
Date: Fri, 5 Oct 2018 16:39:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon
 <boris.brezillon@bootlin.com>, Dinh Nguyen <dinguyen@kernel.org>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Brian
 Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2] mtd: rawnand: denali: set SPARE_AREA_SKIP_BYTES
 register to 8 if unset
Message-ID: <20181005163914.5262e46d@xps13>
In-Reply-To: <1538108161-6174-1-git-send-email-yamada.masahiro@socionext.com>
References: <1538108161-6174-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Masahiro,

Masahiro Yamada <yamada.masahiro@socionext.com> wrote on Fri, 28 Sep
2018 13:16:01 +0900:

> NAND devices need additional data area (OOB) for error correction,
> but it is also used for Bad Block Marker (BBM).  In many cases, the
> first byte in OOB is used for BBM, but the location actually depends
> on chip vendors.  The NAND controller should preserve the precious
> BBM to keep track of bad blocks.
>=20
> In Denali IP, the SPARE_AREA_SKIP_BYTES register is used to specify
> the number of bytes to skip from the start of OOB.  The ECC engine
> will automatically skip the specified number of bytes when it gets
> access to OOB area.
>=20
> The same value for SPARE_AREA_SKIP_BYTES should be used between
> firmware and the operating system if you intend to use the NAND
> device across the control hand-off.
>=20
> In fact, the current denali.c code expects firmware to have already
> set the SPARE_AREA_SKIP_BYTES register, then reads the value out.
>=20
> If no firmware (or bootloader) has initialized the controller, the
> register value is zero, which is the default after power-on-reset.
> In other words, the Linux driver cannot initialize the controller
> by itself.
>=20
> Some possible solutions are:
>=20
>  [1] Add a DT property to specify the skipped bytes in OOB
>  [2] Associate the preferred value with compatible
>  [3] Hard-code the default value in the driver
>=20
> My first attempt was [1], but in the review process, [3] was suggested
> as a counter-implementation.
> (https://lore.kernel.org/patchwork/patch/983055/)
>=20
> The default value 8 was chosen to match to the boot ROM of the UniPhier
> platform.  The preferred value may vary by platform.  If so, please
> trade up to a different solution.
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>=20

Applied to nand/next.


Thanks,
Miqu=C3=A8l
