Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcb6j-0005ID-Tw
 for linux-mtd@lists.infradead.org; Mon, 09 Jul 2018 18:42:00 +0000
Date: Mon, 9 Jul 2018 20:41:44 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: Re: [PATCH v6 0/6] mtd: rawnand: support MT29F1G08ABAFAWP-ITE:F
Message-ID: <20180709204144.30d1033e@bbrezillon>
In-Reply-To: <20180709183124.22f39f1b@bbrezillon>
References: <c27f10f9efc14fed817c1a343d8b67d4@SIWEX5A.sing.micron.com>
 <20180709183124.22f39f1b@bbrezillon>
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

On Mon, 9 Jul 2018 18:31:24 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> Hi Bean,
>=20
> On Mon, 9 Jul 2018 15:54:11 +0000
> "Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:
>=20
> > Hi, Boris and Chris
> >  =20
> > >>
> > >> I see 2 solutions to this problem:
> > >> 1/ Bean provides us a solution to reliably detect when ECC can be
> > >>    de-actived and when it can't
> > >> 2/ We only ever expose 64 bytes of OOB to the user and consider that
> > >>    ECC can be disabled, even if it can't in reality
> > >>   =20
> > >
> > >After reading the doc again, I forgot one thing you can try before dec=
iding to
> > >go for option #2.
> > >
> > >8th bit in byte 5 of READID's result encodes whether the on-die ECC st=
ate
> > >(enabled or not). I remember we had a discussion with Bean where he to=
ld us
> > >this was a runtime status reflecting the on-die ECC state, which is cr=
azy, since
> > >READID might return different values depending on the NAND state, and =
most
> > >of the code in the core assumes READID provides a fixed ID that encode=
s the
> > >chip characteristics/capabilities, not its state.
> > >
> > >Anyway, if this bit is actually reflecting the on-die ECC state and on=
-die
> > >cannot be disabled on your chip, it should stay at 1 even after you ha=
ve sent
> > >the SET_FEATURES(DISABLE_ECC) command. Let's hope this works as I expe=
ct,
> > >otherwise we're back to option #2 until Bean suggest something else.  =
 =20
> >=20
> > MT29F1G08ABAFAWP-ITE:F is Micron 70s SLC NAND with on-die ECC.
> > If the bit7 in the byte 5 of READID default is 1(ECC Enabled), it is tr=
ue on-die ECC
> > Cannot be disabled by SET Feature command.
> > In case sending Set Feature command, you can check previous command is =
success or not by
> > Get Feature =20
>=20
> Chris tried that already and it didn't work. GET_FEATURES(ECC) returns a
> value with the bit cleared (meaning that ECC is supposedly disabled)
> after SET_FEATURES(ECC, DISABLE) has been sent. Are you sure that
> GET_FEATURES(ECC) is supposed to return the actual state of the ECC
> engine and not the last value you wrote in the internal reg (would be
> the case if this reg is just a dummy reg when on-die ECC is forcibly
> enabled).

My bad, that's not exactly what Chris reported. He said that the
SET_FEATURES(ECC)/GET_FEATURES(ECC) detection logic was reporting the
NAND as "not supporting on-die ECC", which kind of reflects what's
described in the datasheet (in "Table 10: Feature Address 90h =E2=80=93 Arr=
ay
Operation Mode" of MT29F1G08ABAFAWP-ITE:F spec, there's no ECC
enable/disable bit).

This means the detection logic we have simply doesn't work.

>=20
> > or check this bit7 in byte 5 of READID later. =20
>=20
> This, we'll have to test.
>=20
> >=20
> > To check if this device supports on-die ECC or not, you can use inter E=
CC level (bit 0 and bit1 in byte 5 of READID) =20
> > http://lists.infradead.org/pipermail/linux-mtd/2017-April/073370.html =
=20
>=20
> Okay, I think we already had this discussion, but I'm asking it again.
> What are the possible values for that field and what do they mean?

Still, it's not clear to me what "Internal ECC level" means. It seems
that NAND chips having on-die ECC have this field set to 10b (0x2), 00b
seems to be reserved for "no on-die ECC", but what are 01b and 11b
reserved for?

> Also, is it even used to encode the fact that the NAND has on-die ECC
> on all your NANDs? We already had the problem of incompatible ID
> schemes, so I wouldn't be surprised if that was the case here, hence my
> initial suggestion to base the detection on the model name.

I'd really need to have an answer on that one to take a decision. Also,
I couldn't find a datasheet for an IT (without E) version of the
MT29F1G08ABAFAWP part. Does it exist, or can we assume MT29F1G08ABAFAWP
chips always come with forcibly enabled on-die ECC?
