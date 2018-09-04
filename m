Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxJJx-0003QR-OD
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2018 21:57:15 +0000
Date: Tue, 4 Sep 2018 23:56:51 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon
 <boris.brezillon@bootlin.com>, Dinh Nguyen <dinguyen@kernel.org>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Brian
 Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: nand: denali: use SPDX-License-Identifier and fix
 license mismatch
Message-ID: <20180904235651.12708e91@xps13>
In-Reply-To: <1534735596-10876-1-git-send-email-yamada.masahiro@socionext.com>
References: <1534735596-10876-1-git-send-email-yamada.masahiro@socionext.com>
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

Masahiro Yamada <yamada.masahiro@socionext.com> wrote on Mon, 20 Aug
2018 12:26:36 +0900:

> Use SPDX-License-Identifier instead of the license boilerplates.
>=20
> This conversion makes it easier for us to scan the license, then
> I notice license mismatch problems.
>=20
> The license blocks in denali* indicate GPL-2.0 "only", while the
> MODULE_LICENSE in denali.c and denali_dt.c is GPL-2.0 "or later"
> as explained in include/linux/module.h as follows:
>=20
>   "GPL"                           [GNU Public License v2 or later]
>   "GPL v2"                        [GNU Public License v2]
>=20
> I fixed the MODULE_LICENSE tags, assuming the license blocks are
> the authors' intention.
>=20
> Also, add missing MODULE_DESCRIPTION/AUTHOR to denali.c
>=20
> While I am touching the license things, I added my credit to denali.c
> because this driver was largely re-written by me in 2017.
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to nand/next with subject prefix s/nand/rawnand/.

Thanks,
Miqu=C3=A8l
