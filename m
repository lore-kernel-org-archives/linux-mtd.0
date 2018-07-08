Date: Sun, 8 Jul 2018 23:58:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Han Xu
 <han.xu@nxp.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] mtd: rawnand: Bunch of cleanup
Message-ID: <20180708235817.3a06abad@xps13>
In-Reply-To: <20180705102733.29673-1-boris.brezillon@bootlin.com>
References: <20180705102733.29673-1-boris.brezillon@bootlin.com>
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

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Thu,  5 Jul 2018
12:27:25 +0200:

> Hello,
>=20
> These are just random cleanups that I did while working on the raw NAND
> API sanitization (see here [1] for a preview of the upcoming changes).
>=20
> Regards,
>=20
> Boris
>=20
> [1]https://github.com/bbrezillon/linux-0day/commits/nand/api-cleanup
>=20
> Boris Brezillon (8):
>   mtd: rawnand: Kill cafe_nand_bug()
>   mtd: rawnand: Remove nand_do_read() prototype from rawnand.h
>   mtd: rawnand: Remove forward declaration of mtd_info
>   mtd: rawnand: Remove forward declaration of device_node
>   mtd: rawnand: Rename nand_default_bbt() into nand_create_bbt()
>   mtd: rawnand: Kill the chip->scan_bbt() hook
>   mtd: rawnand: orion_nand: Kill orion_nand_data.dev_ready()
>   mtd: rawnand: plat_nand: Kill pdata->ctrl.{hwcontrol,read_byte}()
>=20

Series applied to nand/next,

Thanks,
Miqu=C3=A8l
