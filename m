Date: Tue, 11 Dec 2018 10:07:18 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Liang Yang <liang.yang@amlogic.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Jianxin Pan
 <jianxin.pan@amlogic.com>, <linux-mtd@lists.infradead.org>, Yixun Lan
 <yixun.lan@amlogic.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Carlo Caione <carlo@caione.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>, Jian Hu
 <jian.hu@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Victor Wan
 <victor.wan@amlogic.com>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 2/2] mtd: rawnand: meson: add support for Amlogic
 NAND flash controller
Message-ID: <20181211100718.51d2cd6c@xps13>
In-Reply-To: <356aed95-518d-7cd0-4337-184f181472ad@amlogic.com>
References: <1542386439-30166-1-git-send-email-jianxin.pan@amlogic.com>
 <1542386439-30166-3-git-send-email-jianxin.pan@amlogic.com>
 <20181207102456.1dc67e07@xps13>
 <823825a3-86fb-9a20-ae29-85cc52d44093@amlogic.com>
 <20181210123809.5ade45c4@bbrezillon>
 <79a797c2-f37f-7f7c-e907-2d3c2283ec2d@amlogic.com>
 <20181210155057.38788656@xps13>
 <d60bac6f-732d-0ddc-2644-17f650dfa885@amlogic.com>
 <20181211085445.68e57e0e@xps13>
 <356aed95-518d-7cd0-4337-184f181472ad@amlogic.com>
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

Hi Liang,

Liang Yang <liang.yang@amlogic.com> wrote on Tue, 11 Dec 2018 16:36:47
+0800:

> Hi Miquel,
>=20
> Thanks for your quickly reply.
>=20
> On 2018/12/11 15:54, Miquel Raynal wrote:
> > Hi Liang,
> >=20
> > Liang Yang <liang.yang@amlogic.com> wrote on Tue, 11 Dec 2018 09:56:25
> > +0800:
> >  =20
> >> Hi Miquel,
> >>
> >> On 2018/12/10 22:50, Miquel Raynal wrote: =20
> >>> Hi Liang,
> >>>
> >>> Liang Yang <liang.yang@amlogic.com> wrote on Mon, 10 Dec 2018 20:12:39
> >>> +0800: =20
> >>>    >>>> On 2018/12/10 19:38, Boris Brezillon wrote: =20
> >>>>> On Mon, 10 Dec 2018 19:23:46 +0800
> >>>>> Liang Yang <liang.yang@amlogic.com> wrote: =20
> >>>>>     >>>>>> +			mtd->ecc_stats.failed++; =20
> >>>>>>>> +			continue;
> >>>>>>>> +		}
> >>>>>>>> +		mtd->ecc_stats.corrected +=3D ECC_ERR_CNT(*info);
> >>>>>>>> +		bitflips =3D max_t(u32, bitflips, ECC_ERR_CNT(*info));
> >>>>>>>> +	} =20
> >>>>>>>
> >>>>>>> Are you sure you handle correctly empty pages with bf? =20
> >>>>>>>      >> if scramble is enable, i would say yes here. =20
> >>>>>> when scramble is disabled, i am considering how to use the helper
> >>>>>> nand_check_erased_ecc_chunk, but it seems that i can't get the ecc
> >>>>>> bytes which is caculated by ecc engine.by the way, nfc dma doesn't=
 send
> >>>>>> out the ecc parity bytes. =20
> >>>>>
> >>>>> Even if the ECC engine is disabled? =20
> >>>>>     >> No. =20
> >>>> When ECC engine is disabled, it can read the ecc parity bytes ; but =
there is another problem that i need to consider how code struct looks bett=
er when reading error with ecc opened and then try to raw read.
> >>>> Is there a good idea? =20
> >>>
> >>> When reading with ECC enabled, in case of uncorrectable error you
> >>> must re-read without ECC, then check if the page is empty or not with
> >>> the core helpers (nand_check_erased_*()).
> >>>
> >>> Is this what you meant? =20
> >>>    >> yes. when uncorrectable ECC error, i need firstly read out the =
ECC bytes without ECC engine and then use the helper nand_check_erased_ecc_=
chunk to check if blank page. =20
> >> Of course, the precondition is without scrambler, or the bland page ca=
n be detected by meson NFC. =20
> >=20
> > A suppose you meant "blank page"? If yes, then you don't need the
> > helper to check for only-0xFF pages. If the controller tells you if the
> > page was blank, then just check for that bit.
> >  =20
>=20
> i think not. we need to return back the previous problem that how i can g=
et the bitflips of one blank page. i think i need the helper.

You are right, I suppose the "blank page" flag is only triggered if
there is no bitflip. In this case you can assume there are no
bitflips. Otherwise the controller will trigger an
uncorrectable error event and you will have to re-read the page
without ECC and check for bitflips with the helper.


Thanks,
Miqu=C3=A8l
