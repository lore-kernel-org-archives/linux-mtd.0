Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOTyk-0003dN-QS
 for linux-mtd@lists.infradead.org; Sun, 18 Nov 2018 20:47:42 +0000
Date: Sun, 18 Nov 2018 21:47:17 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: sh_flctl: convert to SPDX identifiers
Message-ID: <20181118214717.16ecfca1@xps13>
In-Reply-To: <20181108095728.6c19b8f0@bbrezillon>
References: <87muqkytbv.wl-kuninori.morimoto.gx@renesas.com>
 <20181108095728.6c19b8f0@bbrezillon>
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

Hi Kuninori,

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Thu, 8 Nov 2018
09:57:28 +0100:

> On Thu, 8 Nov 2018 06:39:20 +0000
> Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:
>=20
> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >=20
> > This patch updates license to use SPDX-License-Identifier
> > instead of verbose license text.
> >=20
> > As original license mentioned, it is GPL-2.0 in SPDX.
> > Then, MODULE_LICENSE() should be "GPL v2" instead of "GPL".
> > See ${LINUX}/include/linux/module.h
> >=20
> > 	"GPL"		[GNU Public License v2 or later]
> > 	"GPL v2"	[GNU Public License v2] =20

Applied to nand/next.


Thanks,
Miqu=C3=A8l
