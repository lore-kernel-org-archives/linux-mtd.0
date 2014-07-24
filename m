Received: from mail.karo-electronics.de ([81.173.242.67])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XACtA-0007Ab-Jk
 for linux-mtd@lists.infradead.org; Thu, 24 Jul 2014 06:52:37 +0000
Date: Thu, 24 Jul 2014 08:49:15 +0200
From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCHv4 4/5] of/mtd/nand: add generic binding and helper for
 NAND_BBT_NO_OOB_BBM
Message-ID: <20140724084915.703a1fa0@ipc1.ka-ro>
In-Reply-To: <20140724020627.GD3711@ld-irv-0074>
References: <1402579245-13377-1-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-2-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-3-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-4-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-5-git-send-email-LW@KARO-electronics.de>
 <20140724020627.GD3711@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Mark Rutland <mark.rutland@arm.com>,
 Boris BREZILLON <b.brezillon.dev@gmail.com>, linux-doc@vger.kernel.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-mtd@lists.infradead.org,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Jingoo Han <jg1.han@samsung.com>, Shawn Guo <shawn.guo@freescale.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Fabio Estevam <fabio.estevam@freescale.com>, linux-kernel@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, Rob Landley <rob@landley.net>,
 Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Brian Norris wrote:
> (BTW, that's a mighty CC list you have! I'm not sure all CC'd parties
> are interested in this series; e.g., Russel and the ARM list seem
> unrelated)
>=20
> Hi Lothar,
>=20
> Sorry for the delay on this. I get busy enough that I can't/don't reply
> to everything quickly...
>=20
> On Thu, Jun 12, 2014 at 03:20:44PM +0200, Lothar Wa=C3=9Fmann wrote:
> > add a boolean property 'nand-no-oob-bbm' and helper function to be
> > able to set the NAND_BBT_NO_OOB_BBM flag in DT capable NAND drivers
> > and use it for i.MX and MXS nand drivers.
>=20
> If I'm understanding your previous conversations with Huang correctly,
> you *must* use NAND_BBT_NO_OOB_BBM if you're going to use the
> fsl,no-blockmark-swap option. Correct? If so, then you might not need
> a separate 'nand-no-oob-bbm' binding; your driver should imply from
> 'fsl,no-blockmark-swap' that it must also enable NAND_BBT_NO_OOB_BBM.
>=20
no-blockmark-swap implies NO_OOB_BBM but NO_OOB_BBM may also be used
independent from no-blockmark-swap.

IMO writing a bad block marker to flash (which is prevented by
the NAND_BBT_NO_OOB_BBM flag) is a misinterpretation of the purpose of
the BB mark in the first place. The manufacturer guarantees that blocks
which are initially bad will have at least one zero bit in the position
of the BB mark. That's all to it.

There is no guarantee, that you will even be able to write any
deterministic data to a block that has turned bad due to wearout or
other flash defects. It is rather bogus to rely on data written to a
known bad block to reflect the state of the block.

> Also, as I noted in [1], I don't really like exposing a ton of
> individual boolean DT properties like this. (At least this property is
> orthogonal to the bad block table; I was a little off-base in [1].)
>=20
How else should this information be conveyed to the flash drivers?


Lothar Wa=C3=9Fmann
--=20
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
