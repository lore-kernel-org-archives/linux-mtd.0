Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dnNV6-0007Yk-R7
 for linux-mtd@lists.infradead.org; Thu, 31 Aug 2017 11:19:10 +0000
Date: Thu, 31 Aug 2017 13:18:36 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Cc: Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/2] mtd: nand: fix regression introduced by splitting
 off manufacturer dependent code
Message-ID: <20170831131836.777aa652@bbrezillon>
In-Reply-To: <1504001833-18097-1-git-send-email-LW@KARO-electronics.de>
References: <1504001833-18097-1-git-send-email-LW@KARO-electronics.de>
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

On Tue, 29 Aug 2017 12:17:11 +0200
Lothar Wa=C3=9Fmann <LW@KARO-electronics.de> wrote:

> commit c51d0ac59f24 ("mtd: nand: Move Samsung specific init/detection
> logic in nand_samsung.c") introduced a regression for Samsung SLC NAND
> chips by skipping the initialization of chip->bits_per_cell that is
> done in nand_decode_ext_id() from which the manufacturer dependent
> code was extracted.
> The regression should also affect Hynix and Macronix chips whose code
> was separated out in further commits but which I cannot test.
> AMD/Spansion and Toshiba NAND are not affected, since they are calling=20
> nand_decode_ext_id() (which initializes bhip->bits_per_cell) in their
> .detect function.
>=20
> Fix the regression and add a warning to nand_is_slc() to prevent
> further regressions of this kind.

Applied both to nand/next and generated a new PR to push this in 4.14.
Also added the Fixes and Cc-stable tag to the first patch.

Thanks,

Boris
