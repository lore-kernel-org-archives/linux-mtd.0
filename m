Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dIrin-0006Cy-HN
 for linux-mtd@lists.infradead.org; Thu, 08 Jun 2017 07:19:11 +0000
Date: Thu, 8 Jun 2017 09:18:33 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>, Artem
 Bityutskiy <artem.bityutskiy@linux.intel.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao
 Dong <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, devicetree@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Brian Norris
 <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, Rob
 Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v5 00/23] mtd: nand: denali: Denali NAND IP patch bomb
Message-ID: <20170608091833.5dfd091b@bbrezillon>
In-Reply-To: <CAK7LNASu=cmQo+gCmfY=MFLoGtm0oeZQ036Nst63bZOEwFxR4g@mail.gmail.com>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNAQMCCxZAJc=7EwEPmpxD+-VsgOvMxwk5ySLfxLVsarqhw@mail.gmail.com>
 <CAK7LNASu=cmQo+gCmfY=MFLoGtm0oeZQ036Nst63bZOEwFxR4g@mail.gmail.com>
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

Le Thu, 8 Jun 2017 16:12:49 +0900,
Masahiro Yamada <yamada.masahiro@socionext.com> a =C3=A9crit :

> 2017-06-08 15:16 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com=
>:
> > Hi Boris,
> >
> > 2017-06-07 20:52 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.c=
om>: =20
> >> This patch series intends to solve various problems.
> >>
> >> [1] The driver just retrieves the OOB area as-is
> >>     whereas the controller uses syndrome page layout.
> >> [2] Many NAND chip specific parameters are hard-coded in the driver.
> >> [3] ONFi devices are not working
> >> [4] It can not read Bad Block Marker
> >>
> >> Outstanding changes are:
> >> - Fix raw/oob callbacks for syndrome page layout
> >> - Implement setup_data_interface() callback
> >> - Fix/implement more commands for ONFi devices
> >> - Allow to skip the driver internal bounce buffer
> >> - Support PIO in case DMA is not supported
> >> - Switch from ->cmdfunc over to ->cmd_ctrl =20
> >
> >
> > I am planning v6, but
> > how many can you pick-up from this series?
> >
> > I did not see your comments for 01-05, so are they applicable?
> >
> > Could you add
> > Acked-by: Rob Herring <robh@kernel.org>
> > for 05  (http://patchwork.ozlabs.org/patch/772388/)
> >
> > He had already acked it, but I just missed it.
> > =20
>=20
> BTW, this series can not apply to Boris's tree
> because of the following commit.
>=20
> commit 4a78cc644eed3cf2dae00c3a959910a86c140fd6
> Author: Boris Brezillon <boris.brezillon@free-electrons.com>
> Date:   Fri May 26 17:10:15 2017 +0200
>=20
>     mtd: nand: Make sure drivers not supporting SET/GET_FEATURES
> return -ENOTSUPP
>=20
>=20
>=20
> I will send v6 rebased on nand/next branch.
>=20

Please wait a bit before spamming the ML again. I'd like to finish
reviewing patches and apply uncontroversial ones.
