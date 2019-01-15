Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjRtw-0002FT-L0
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2019 16:49:22 +0000
Date: Tue, 15 Jan 2019 17:45:38 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Mark Brown
 <broonie@kernel.org>, linux-spi@vger.kernel.org, Yogesh Narayan Gaur
 <yogeshnarayan.gaur@nxp.com>, Vignesh R <vigneshr@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Piotr Bugalski <bugalski.piotr@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>, Cyrille Pitchen
 <cyrille.pitchen@microchip.com>
Subject: Re: [PATCH v3 6/7] mtd: spinand: Use the spi-mem dirmap API
Message-ID: <20190115174538.0922e193@xps13>
In-Reply-To: <20181106160536.13415-7-boris.brezillon@bootlin.com>
References: <20181106160536.13415-1-boris.brezillon@bootlin.com>
 <20181106160536.13415-7-boris.brezillon@bootlin.com>
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

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Tue,  6 Nov 2018
17:05:35 +0100:

> Make use of the spi-mem direct mapping API to let advanced controllers
> optimize read/write operations when they support direct mapping.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---

Applied to nand/next.

Thanks,
Miqu=C3=A8l
