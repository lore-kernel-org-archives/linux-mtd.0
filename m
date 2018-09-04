Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxJFF-00007z-Bl
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2018 21:52:22 +0000
Date: Tue, 4 Sep 2018 23:51:59 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org, Marek Vasut
 <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Ofer Heifetz <oferh@marvell.com>
Subject: Re: [PATCH v2] mtd: nand: use regmap_update_bits() in marvell_nand
 for syscon access
Message-ID: <20180904235159.6b1361df@xps13>
In-Reply-To: <20180802085625.29635-1-thomas.petazzoni@bootlin.com>
References: <20180802085625.29635-1-thomas.petazzoni@bootlin.com>
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

Hi Thomas,

Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote on Thu,  2 Aug
2018 10:56:25 +0200:

> The marvell_nfc_init() function fiddles with some bits of a system
> controller on Armada 7K/8K. However, it does a read/modify/write
> sequence on GENCONF_CLK_GATING_CTRL and GENCONF_ND_CLK_CTRL, which
> isn't safe from a concurrency point of view, as the regmap lock isn't
> taken accross the read/modify/write sequence. To solve this issue, use
> regmap_update_bits().
>=20
> While at it, since the "reg" variable is no longer needed for the
> read/modify/write sequences, get rid of it for the regmap_write() to
> GENCONF_SOC_DEVICE_MUX, and directly pass the value to be written as
> argument.
>=20
> Fixes: 02f26ecf8c772 ("mtd: nand: add reworked Marvell NAND controller dr=
iver")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---

Applied to nand/next with the subject prefix changed to
"mtd: rawnand: marvell:"

Thanks,
Miqu=C3=A8l
