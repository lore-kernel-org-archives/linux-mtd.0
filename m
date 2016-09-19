Date: Mon, 19 Sep 2016 11:34:59 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Cc: linux-arm-kernel@lists.infradead.org, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org (open
 list:NAND FLASH SUBSYSTEM), linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH BUGFIX] mtd: nand: mxc: fix obiwan error in
 mxc_nand_v[12]_ooblayout_free() functions
Message-ID: <20160919113459.4a5b7e6e@bbrezillon>
In-Reply-To: <20160916100925.1a4d1af7@ipc1.ka-ro>
References: <1473432251-24728-1-git-send-email-LW@KARO-electronics.de>
 <20160915180605.4aed48d3@bbrezillon>
 <20160916100925.1a4d1af7@ipc1.ka-ro>
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

On Fri, 16 Sep 2016 10:09:25 +0200
Lothar Wa=C3=9Fmann <LW@KARO-electronics.de> wrote:

> Hi,
>=20
> On Thu, 15 Sep 2016 18:06:05 +0200 Boris Brezillon wrote:
> > Hi Lothar,
> >=20
> > On Fri,  9 Sep 2016 16:44:11 +0200
> > Lothar Wa=C3=9Fmann <LW@KARO-electronics.de> wrote:
> >  =20
> > > commit a894cf6c5a82 ("mtd: nand: mxc: switch to mtd_ooblayout_ops")
> > > introduced a regression accessing the OOB area from the mxc_nand
> > > driver due to an Obiwan error in the mxc_nand_v[12]_ooblayout_free()
> > > functions. They report a bogus oobregion { 64, 7 } which leads to
> > > errors accessing bogus data when reading the oob area.
> > >=20
> > > Prior to the commit the mtd-oobtest module could be run without any
> > > errors. With the offending commit, this test fails with results like:
> > > |Running mtd-oobtest
> > > |
> > > |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > > |mtd_oobtest: MTD device: 5
> > > |mtd_oobtest: MTD device size 524288, eraseblock size 131072, page si=
ze 2048, count of eraseblocks 4, pages per eraseblock 64, OOB size 64
> > > |mtd_test: scanning for bad eraseblocks
> > > |mtd_test: scanned 4 eraseblocks, 0 are bad
> > > |mtd_oobtest: test 1 of 5
> > > |mtd_oobtest: writing OOBs of whole device
> > > |mtd_oobtest: written up to eraseblock 0
> > > |mtd_oobtest: written 4 eraseblocks
> > > |mtd_oobtest: verifying all eraseblocks
> > > |mtd_oobtest: error @addr[0x0:0x19] 0x9a -> 0x78 diff 0xe2
> > > |mtd_oobtest: error @addr[0x0:0x1a] 0xcc -> 0x0 diff 0xcc
> > > |mtd_oobtest: error @addr[0x0:0x1b] 0xe0 -> 0x85 diff 0x65
> > > |mtd_oobtest: error @addr[0x0:0x1c] 0x60 -> 0x62 diff 0x2
> > > |mtd_oobtest: error @addr[0x0:0x1d] 0x69 -> 0x45 diff 0x2c
> > > |mtd_oobtest: error @addr[0x0:0x1e] 0xcd -> 0xa0 diff 0x6d
> > > |mtd_oobtest: error @addr[0x0:0x1f] 0xf2 -> 0x60 diff 0x92
> > > |mtd_oobtest: error: verify failed at 0x0
> > > [...]
> > >=20
> > > Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
> > > ---
> > >  drivers/mtd/nand/mxc_nand.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> > > index 5173fad..fdee907 100644
> > > --- a/drivers/mtd/nand/mxc_nand.c
> > > +++ b/drivers/mtd/nand/mxc_nand.c
> > > @@ -893,7 +893,7 @@ static int mxc_v1_ooblayout_free(struct mtd_info =
*mtd, int section,
> > >  {
> > >  	struct nand_chip *nand_chip =3D mtd_to_nand(mtd);
> > > =20
> > > -	if (section > nand_chip->ecc.steps)
> > > +	if (section >=3D nand_chip->ecc.steps)
> > >  		return -ERANGE; =20
> >=20
> > Hm, looking at the commit you're pointing to, it seems that this test
> > is correct (we have X + 1 free sections, where X is the number of ECC
> > steps).
> >  =20
> You are right. I didn't verify the v1 case (for which I have no HW here
> any more).
> I'll send a corrected patch.

No need to resend, I fixed it locally.

Thanks,

Boris
