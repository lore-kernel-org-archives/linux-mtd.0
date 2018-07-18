Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffh9y-0003qS-Dc
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 07:46:07 +0000
Date: Wed, 18 Jul 2018 09:45:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 boris.brezillon@bootlin.com, dev@lynxeye.de, mirza.krak@gmail.com,
 benjamin.lindqvist@endian.se, krzk@kernel.org, marek.vasut@gmail.com,
 richard@nod.at, digetx@gmail.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, dan.carpenter@oracle.com, Marcel Ziswiler
 <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2] mtd: rawnand: tegra: check bounds of die_nr properly
Message-ID: <20180718094544.76607c0f@xps13>
In-Reply-To: <20180717084618.25249-1-marcel@ziswiler.com>
References: <20180717084618.25249-1-marcel@ziswiler.com>
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

Hi Marcel,

Marcel Ziswiler <marcel@ziswiler.com> wrote on Tue, 17 Jul 2018
10:46:18 +0200:

> From: Stefan Agner <stefan@agner.ch>
>=20
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
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Applied on nand/next in place of the previous one (with my SoB after
yours).

Thanks,
Miqu=C3=A8l
