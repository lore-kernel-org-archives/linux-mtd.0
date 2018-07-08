Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcHaq-0003DU-I8
 for linux-mtd@lists.infradead.org; Sun, 08 Jul 2018 21:51:46 +0000
Date: Sun, 8 Jul 2018 23:51:31 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stefan Agner <stefan@agner.ch>
Cc: boris.brezillon@bootlin.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 dan.carpenter@oracle.com, dev@lynxeye.de, richard@nod.at,
 marcel@ziswiler.com, krzk@kernel.org, digetx@gmail.com,
 benjamin.lindqvist@endian.se, mirza.krak@gmail.com, gaireg@gaireg.de,
 linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: tegra: check bounds of die_nr properly
Message-ID: <20180708235131.348f95f9@xps13>
In-Reply-To: <20180704091310.22003-1-stefan@agner.ch>
References: <20180704091310.22003-1-stefan@agner.ch>
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

Stefan Agner <stefan@agner.ch> wrote on Wed,  4 Jul 2018 11:13:10 +0200:

> The Tegra driver currently only support a single chip select, hence
> check boundaries accordingly. This fixes a off by one issue catched
> with Smatch:
>     drivers/mtd/nand/raw/tegra_nand.c:476 tegra_nand_select_chip()
>     warn: array off by one? 'nand->cs[die_nr]'
>=20
> Also warn in case the stack asks for a chip select we currently do
> not support.
>=20
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---

Applied to nand/next.

Thanks,
Miqu=C3=A8l
