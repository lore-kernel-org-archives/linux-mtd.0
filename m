Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a02sT-0003iK-Iu
 for linux-mtd@lists.infradead.org; Sat, 21 Nov 2015 07:46:34 +0000
Date: Sat, 21 Nov 2015 08:46:04 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: "Bean Huo =?UTF-8?B?6ZyN5paM5paM?= (beanhuo)" <beanhuo@micron.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: enhance ONFI table reliability/stable
Message-ID: <20151121084604.23fff6f9@bbrezillon>
In-Reply-To: <20151120235927.GD64635@google.com>
References: <A765B125120D1346A63912DDE6D8B6310BF37D1C@NTXXIAMBX02.xacn.micron.com>
 <20151118025010.GB140057@google.com>
 <A765B125120D1346A63912DDE6D8B6310BF51459@NTXXIAMBX02.xacn.micron.com>
 <20151120235927.GD64635@google.com>
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

On Fri, 20 Nov 2015 15:59:27 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> On Thu, Nov 19, 2015 at 04:21:01AM +0000, Bean Huo =E9=9C=8D=E6=96=8C=E6=
=96=8C (beanhuo) wrote:
> > > On Tue, Jul 21, 2015 at 02:42:34PM +0000, Bean Huo =E9=9C=8D=E6=96=8C=
=E6=96=8C (beanhuo)
> > > wrote:
> > > > Hi,
> > > >
> > > > Recently, I faced some case about ONFI table reliability, now it us=
ed CRC.
> > > > If there is bit flips in ONFI parameter pages, parameter backup pag=
e will be
> > > taken.
> > > > For latest linux,default read three copys.
> > > >
> > > > 	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
> > > > 	for (i =3D 0; i < 3; i++) {
> > > > 		for (j =3D 0; j < sizeof(*p); j++)
> > > > 			((uint8_t *)p)[j] =3D chip->read_byte(mtd);
> > > > 		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) =3D=3D
> > > > 				le16_to_cpu(p->crc)) {
> > > > 			break;
> > > > 		}
> > > > 	}
> > > >
> > > > However ,with technoogy improvement,for TLC and new generatin MLC,I
> > > > think, three copys of
> > >=20
> > > Ha, "improvement" :)
> > >=20
> > > > Parameter tables is not powerful enough.my question is that if there
> > > > is a good method to protect and corrent parameter page. For example=
,we
> > > > can use linux software BCH ecc. Any suggections and input be
> > > > welcomed,if you having any concerns about this,don't free tell me.
> > >=20
> > > I recall this being brought up at my old job, and I all I can say is.=
..
> > > (please pardon my censored language)
> >=20
> >=20
> > Yes , you ever told about this. I just follow.
> > Sorry for my rude following.
> > I only want to share my one suggestion about using software ECC to prot=
ect=20
> > ONFI table that read from NAND. I want to hear every MTD expert 's valu=
able=20
> > Feedback on this. if OK, I can do it.=20
>=20
> Perhaps I'm misunderstanding you, I don't understand how you could
> possibly "do it" if it is a circular dependency. You have nowhere to
> store ECC/parity data for a parameter page, because you can't actually
> read/write the NAND flash until after you know its geometry.

Well, while I agree with most of your answer (why the hell are NAND
vendors storing the ONFI parameter page, and other sensitive information
in normal NAND pages, especially when we're talking about TLC/MLC
NANDs???), it's perfectly possible to have ECC in this case, as long as
the geometry is known in advance (at least this is true for BCH).

Say you have only 3 copies of the parameter page and ECC are stored
after that. You can define the following layout:

|3 x parameter page size|3 x ECC bytes|

Of course this implies reserving the space after the 3 parameter pages
for the ECC bytes, which according to the current ONFI spec is not true
(you should have at least 3 copies, but you can have more).

And we would choose the ECC geometry with this logic:

ECC chunk size =3D sizeof(struct nand_onfi_params)
ECC strength =3D iteratively tested with different pre-defined values

This being said, I don't know how you would change the ONFI spec and
keep it compatible with the previous version. As I said, the current
version of the spec does not reserve any area after the mandatory
parameter pages...
You'll probably have to add a NAND_CMD_ALT_PARAM to support this kind
of thing.

>=20
> > > ...that is complete and utter bulls***. An ONFI standard that can't g=
uarantee
> > > "reliable enough" parameter pages is no standard at all.
> > >=20
> > > To step back a bit: How would one expect to store and retrieve ECC pa=
rity
> > > data? ...on the NAND flash? But to do that, we have to know the geome=
try
> > > parameters of said NAND flash. How do we figure out the geometry? Fro=
m the
> > > ONFI parameter pages! Nice Catch 22 you have there.
>=20
> I realize a non-native English speaker might not understand the "Catch
> 22" reference. Wikipedia has a nice summary:
>=20
>   https://en.wikipedia.org/wiki/Catch-22_(logic)
>=20
> Essentially, it's a circular argument, or a contradiction. An
> impossibility.
>=20
> > > Please encourage your employer never to produce "ONFI-compliant" flas=
h that
> > > are this bad.
>=20
> I still stand by the above statement.
>=20
> But now that I'm in a slightly more charitable mood, there are ways to
> improve our ability to recover from slightly corrupted parameter pages
> (ECC is not one of them).
>=20
> For one, you could do some kind of bit majority. e.g.:
>=20
>  (1) try pages 1-3
>  (2) if none pass the CRC check, then compute bit majority of all 3; if
>      the CRC of this combined page passes, then use it
>  (3) ???

Should work too, but it's probably less reliable than BCH ECC (we only
have 3 copies :-/).

Best Regards,

Boris

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
