Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZgs0-0004ZZ-Mc
 for linux-mtd@lists.infradead.org; Sun, 01 Jul 2018 18:14:46 +0000
Date: Sun, 1 Jul 2018 20:14:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Colin King <colin.king@canonical.com>
Cc: Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, Boris
 Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Thierry
 Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] mtd: rawnand: fix a couple of spelling mistakes
Message-ID: <20180701201426.33d5bd90@xps13>
In-Reply-To: <93be5d64cc447fb282bcc14fed853f0c@agner.ch>
References: <20180626102629.31083-1-colin.king@canonical.com>
 <93be5d64cc447fb282bcc14fed853f0c@agner.ch>
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

Hi Colin,

> On 26.06.2018 12:26, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >=20
> > Trival fix of two spelling mistakes in dev_err error messages:
> > "supportes" -> "supports" and "strenght" -> "strength" =20
>=20
> Acked-by: Stefan Agner <stefan@agner.ch>
>=20
> >=20
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---

Thanks for fixing this, I squashed this change with the patch adding
the driver itself.

Thanks,
Miqu=C3=A8l
