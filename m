Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f41bg-0001Ap-9E
 for linux-mtd@lists.infradead.org; Thu, 05 Apr 2018 09:55:13 +0000
Date: Thu, 5 Apr 2018 11:54:48 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Xidong Wang
 <wangxidong_97@163.com>, Mans Rullgard <mans@mansr.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/1] mtd:nand:fix memory leak
Message-ID: <20180405115448.36d2372f@bbrezillon>
In-Reply-To: <6ae95633-d82f-1294-c7c7-db59c00d1d4d@free.fr>
References: <1522811151-18853-1-git-send-email-wangxidong_97@163.com>
 <20180404082807.0f211578@xps13>
 <20180404090710.4f74b5b4@bbrezillon>
 <20180404090831.37e85d59@bbrezillon>
 <6ae95633-d82f-1294-c7c7-db59c00d1d4d@free.fr>
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

On Thu, 5 Apr 2018 11:12:11 +0200
Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:

> On 04/04/2018 09:08, Boris Brezillon wrote:
>=20
> > On Wed, 4 Apr 2018 09:07:10 +0200
> > Boris Brezillon <boris.brezillon@bootlin.com> wrote:
> >  =20
> >> On Wed, 4 Apr 2018 08:28:07 +0200
> >> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >> =20
> >>> Hi Xidong,
> >>>
> >>> As part of a reorganization in the NAND subsystem, you should now
> >>> prefix your commit title this way:
> >>>
> >>>         mtd: rawnand: tango: fix memory leak
> >>>
> >>> Not sure if this patch is candidate to cc:stable?
> >>>
> >>> On Wed,  4 Apr 2018 11:05:51 +0800, Xidong Wang
> >>> <wangxidong_97@163.com> wrote:
> >>>    =20
> >>>> In function tango_nand_probe(), the memory allocated by
> >>>> clk_get() is not released on the normal path and
> >>>> the error path that IS_ERR(nfc->chan) returns true.     =20
> >>>
> >>> The fact that the error path returns true looks out of topic, can you
> >>> remove it? Just saying that you fix a memory leak is enough I guess.
> >>>    =20
> >>>> This will result in a memory leak bug.
> >>>>
> >>>> Signed-off-by: Xidong Wang <wangxidong_97@163.com>
> >>>> ---
> >>>>  drivers/mtd/nand/tango_nand.c | 5 ++++-
> >>>>  1 file changed, 4 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_=
nand.c
> >>>> index c5bee00b..8083459 100644
> >>>> --- a/drivers/mtd/nand/tango_nand.c
> >>>> +++ b/drivers/mtd/nand/tango_nand.c
> >>>> @@ -648,12 +648,15 @@ static int tango_nand_probe(struct platform_de=
vice *pdev)
> >>>>  		return PTR_ERR(clk);
> >>>> =20
> >>>>  	nfc->chan =3D dma_request_chan(&pdev->dev, "rxtx");
> >>>> -	if (IS_ERR(nfc->chan))
> >>>> +	if (IS_ERR(nfc->chan)) {
> >>>> +		clk_put(clk);
> >>>>  		return PTR_ERR(nfc->chan);
> >>>> +	}
> >>>> =20
> >>>>  	platform_set_drvdata(pdev, nfc);
> >>>>  	nand_hw_control_init(&nfc->hw);
> >>>>  	nfc->freq_kHz =3D clk_get_rate(clk) / 1000;
> >>>> +	clk_put(clk);     =20
> >>>
> >>> If the clock is used only here, better do the frequency derivation
> >>> right after the clock_get(), and follow with a clk_put()? This way you
> >>> don't have to change the error path and 'related' actions remain
> >>> grouped.   =20
> >>
> >> Hm, definitely not a good idea to release the reference you have on the
> >> clk if the driver depends on it. I recommend using devm_clk_get() to
> >> solve this leak. =20
> >=20
> > BTW, it's also weird that the driver does not prepare_enable the clk.
> > Marc, any comments? =20
>=20
> I was not aware that clk_get() allocated memory, and required clk_put()
> for cleanup. IIRC, I looked at Documentation/clk.txt
>=20
> On tango, clocks are configured by the boot loader. The existing clk driv=
er
> provides only read access to various clocks -- except the CPU clock, which
> can be changed by tweaking a post-divider. Tweaking the PLLs requires much
> more complex code. The boot loader enables every clock, and Linux has no
> way to gate any of them.

Well, even if that's not supported today, it's always a good practice
to retain reference and prepare/enable clks your HW depends on. This
change should be harmless and when/if you someday decide to provide a
way to gate clks, it will work out of the box.

>=20
> In the nfc driver, all I needed was the system frequency, since the NFC is
> driven by the system clock (which can never be disabled).
>=20
> Thus, I wrote the naive (and apparently incorrect)
>=20
>   clk =3D clk_get(&pdev->dev, NULL);
>   nfc->freq_kHz =3D clk_get_rate(clk) / 1000;
>=20
>=20
> I suppose the following patch would fix the memory leak, and
> matches what Miqu=C3=A8l suggested.
>=20
> Regards.
>=20
>=20
> diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
> index c5bee00b7f5e..fba162af333f 100644
> --- a/drivers/mtd/nand/tango_nand.c
> +++ b/drivers/mtd/nand/tango_nand.c
> @@ -646,6 +646,8 @@ static int tango_nand_probe(struct platform_device *p=
dev)
>         clk =3D clk_get(&pdev->dev, NULL);

Why not using devm_clk_get() and be done with it?

>         if (IS_ERR(clk))
>                 return PTR_ERR(clk);
> +       nfc->freq_kHz =3D clk_get_rate(clk) / 1000;
> +       clk_put(clk);

And that's where I disagree. Clearly, you're not following one of the
clk consumer's rule: "when you need a clk, keep a reference to it and
enable it before you start using the HW".

> =20
>         nfc->chan =3D dma_request_chan(&pdev->dev, "rxtx");
>         if (IS_ERR(nfc->chan))
> @@ -653,7 +655,6 @@ static int tango_nand_probe(struct platform_device *p=
dev)
> =20
>         platform_set_drvdata(pdev, nfc);
>         nand_hw_control_init(&nfc->hw);
> -       nfc->freq_kHz =3D clk_get_rate(clk) / 1000;
> =20
>         for_each_child_of_node(pdev->dev.of_node, np) {
>                 err =3D chip_init(&pdev->dev, np);
