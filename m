Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2jzf-0000Rz-3U
 for linux-mtd@lists.infradead.org; Wed, 19 Sep 2018 21:26:54 +0000
Date: Wed, 19 Sep 2018 23:26:30 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon
 <boris.brezillon@bootlin.com>, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/2] mtd: rawnand: denali: remove ->dev_ready() hook
Message-ID: <20180919232630.105c3373@xps13>
In-Reply-To: <1536305309-28026-2-git-send-email-yamada.masahiro@socionext.com>
References: <1536305309-28026-1-git-send-email-yamada.masahiro@socionext.com>
 <1536305309-28026-2-git-send-email-yamada.masahiro@socionext.com>
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

Masahiro Yamada <yamada.masahiro@socionext.com> wrote on Fri,  7 Sep
2018 16:28:28 +0900:

> The Denali NAND IP has no way to read out the current signal level
> of the R/B# pin.  Instead, denali_dev_ready() checks if the R/B#
> transition has already happened. (The INTR__INT_ACT interrupt is
> asserted at the rising edge of the R/B# pin.)  It is not a correct
> way to implement the ->dev_ready() hook.
>=20
> In fact, it has a drawback; in the nand_scan_ident phase, the chip
> detection iterates over maxchips until it fails to find a homogeneous
> chip.  For the last loop, nand_reset() fails if no chip is there.
>=20
> If ->dev_ready hook exists, nand_command(_lp) calls nand_wait_ready()
> after NAND_CMD_RESET.  However, we know denali_dev_ready() never
> returns 1 unless there exists a chip that toggles R/B# in that chip
> select.  Then, nand_wait_ready() just ends up with wasting 400 msec,
> in the end, shows the "timeout while waiting for chip to become ready"
> warning.
>=20
> Let's remove the mis-implemented dev_ready hook, and fallback to
> sending the NAND_CMD_STATUS and nand_wait_status_ready(), which
> bails out more quickly.
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Both patches applied on nand/next.

Thanks,
Miqu=C3=A8l
