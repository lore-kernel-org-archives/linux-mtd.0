Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eqQsg-0002iC-Qi
 for linux-mtd@lists.infradead.org; Mon, 26 Feb 2018 22:04:24 +0000
Date: Mon, 26 Feb 2018 23:04:07 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stefan Agner <stefan@agner.ch>
Cc: miquel.raynal@bootlin.com, boris.brezillon@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, richard@nod.at, bpringlemeir@gmail.com,
 marcel.ziswiler@toradex.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v5 1/3] mtd: nand: vf610_nfc: make use of ->exec_op()
Message-ID: <20180226230407.20cd8bfd@xps13>
In-Reply-To: <20180226211855.30015-2-stefan@agner.ch>
References: <20180226211855.30015-1-stefan@agner.ch>
 <20180226211855.30015-2-stefan@agner.ch>
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

Hi Stefan,

On Mon, 26 Feb 2018 22:18:53 +0100, Stefan Agner <stefan@agner.ch>
wrote:

> This reworks the driver to make use of ->exec_op() callback. The
> command sequencer of the VF610 NFC aligns well with the new ops
> interface.
>=20
> The operations are translated to a NFC command code while filling
> the necessary registers. Instead of using the special status and
> read ID command codes (which require to read status/ID from
> special registers instead of the regular data area) the driver
> now now uses the main data buffer for all commands. This
> simplifies the driver as no special casing is needed.
>=20
> For control data (status byte, id bytes and parameter page) the
> driver needs to reverse byte order for little endian CPUs since
> the controller seems to store the bytes in big endian order in
> the data buffer.
>=20
> The current state seems to pass MTD tests on a Colibri VF61.
>=20
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  drivers/mtd/nand/raw/vf610_nfc.c | 411 +++++++++++++++++++++++++++++++++=
++++--
>  1 file changed, 399 insertions(+), 12 deletions(-)

I am fine with this version.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for your work,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
