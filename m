Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK16D-0001yh-AE
 for linux-mtd@lists.infradead.org; Tue, 06 Nov 2018 13:08:54 +0000
Date: Tue, 6 Nov 2018 14:08:42 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Han Xu
 <han.xu@nxp.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Harvey Hunt
 <harveyhuntnexus@gmail.com>, Xiaolei Li <xiaolei.li@mediatek.com>, Maxim
 Levitsky <maximlevitsky@gmail.com>, Marc Gonzalez
 <marc.w.gonzalez@free.fr>, Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH 00/15] mtd: rawnand: 3rd batch of cleanup
Message-ID: <20181106140842.59cf24bc@xps13>
In-Reply-To: <20181023185011.3356-1-boris.brezillon@bootlin.com>
References: <20181023185011.3356-1-boris.brezillon@bootlin.com>
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

Hi Boris,

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Tue, 23 Oct 2018
20:49:56 +0200:

> Hello,
>=20
> After the sanitization of the raw NAND API, here is a smaller
> patchset continuing in this direction.
>=20
> Patch 1 is just a follow-up on the "stop passing mtd_info objects
> around" patches, except this times it takes care of internal functions.
> There's still a lot of sanitization to do in drivers in order to get
> rid of those mtd params, but I'll leave that to driver maintainers.
>=20
> Patch 2 is trying to get rid of 3 forward declarations that are not
> really needed.
>=20
> Patch 3 is getting rid of useless test in nand_legacy_set_defaults().
>=20
> Patch 4 is making nand_exec_op() private, so that NAND controller
> drivers are not tempted to use it.
>=20
> Patch 5 is getting rid of an unused flag that has been around for quite
> some time.
>=20
> Patches 6 to 13 are deprecating the ->select_chip() hook, which should
> now be replaced by internal target/die selection logic directly called
> from the ->exec_op() and ecc.read/write_xxx() implementations. The
> rational behind this change is that modern controller now take care of
> asserting/deasserting the CS pin on a per-operation basis, and if we
> ever want to implement advanced queuing logic (instead of the basic
> serialization we currently have) we'll have to attach a CS line to the
> operation we want to execute.

Would you mind rebasing this series on nand/next (small conflict
because of the recent introduction of gpio helpers in the NAND core)
and also add a patch to do the same thing as above on the ams-delta
driver (just converted to ->exec_op()).

For the ST, Meson, Arasan and PLxxx drivers, I'll ask the authors to
rebase and do the necessary changes on top of your work.

Thanks,
Miqu=C3=A8l
