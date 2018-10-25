Received: from mail1.bemta24.messagelabs.com ([67.219.250.116])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFigc-00022j-0O
 for linux-mtd@lists.infradead.org; Thu, 25 Oct 2018 16:42:38 +0000
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: PACKHAM Chris <chris.packham@alliedtelesis.co.nz>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>
CC: Fabio Bettoni <fbettoni@gmail.com>, Joakim Tjernlund
 <Joakim.Tjernlund@infinera.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH v2 06/10] mtd: cfi_cmdset_0002: Split do_write_oneword()
 op_done goto statement
Date: Thu, 25 Oct 2018 16:40:21 +0000
Message-ID: <TYAPR01MB2175D9060454CAA033A6F54EDCF70@TYAPR01MB2175.jpnprd01.prod.outlook.com>
References: <20181019165526.11159-1-ikegami@allied-telesis.co.jp>
 <20181019165526.11159-7-ikegami@allied-telesis.co.jp>
 <4dafd74641184172bc51e80668a393a5@svr-chch-ex1.atlnz.lc>
In-Reply-To: <4dafd74641184172bc51e80668a393a5@svr-chch-ex1.atlnz.lc>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: Chris Packham [mailto:Chris.Packham@alliedtelesis.co.nz]
> Sent: Thursday, October 25, 2018 6:34 AM
> To: IKEGAMI Tokunori; boris.brezillon@free-electrons.com
> Cc: Fabio Bettoni; Joakim Tjernlund; linux-mtd@lists.infradead.org
> Subject: Re: [PATCH v2 06/10] mtd: cfi_cmdset_0002: Split
> do_write_oneword() op_done goto statement
>=20
> On 20/10/18 5:55 AM, Tokunori Ikegami wrote:
> > To reduce function size and remove the goto statement split the op_done
> goto
> > statement part into do_write_oneword_done() created a function.
> >
> > Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> > Cc: Fabio Bettoni <fbettoni@gmail.com>
> > Co: Hauke Mehrtens <hauke@hauke-m.de>
> > Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
> > Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> > Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> > Cc: linux-mtd@lists.infradead.org
> > ---
> > Changes since v1:
> > - Add the patch.
> >
> >   drivers/mtd/chips/cfi_cmdset_0002.c | 21 +++++++++++++++------
> >   1 file changed, 15 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
> b/drivers/mtd/chips/cfi_cmdset_0002.c
> > index ae2d8bd7154e..2340a5a7cc39 100644
> > --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> > +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> > @@ -1609,6 +1609,20 @@ static int __xipram do_write_oneword_once(struct
> map_info *map, struct flchip *c
> >   	return ret;
> >   }
> >
> > +static void __xipram do_write_oneword_done(struct map_info *map,
> > +					   struct flchip *chip,
> > +					   unsigned long adr, int mode)
> > +{
> > +	if (mode =3D=3D FL_OTP_WRITE)
> > +		otp_exit(map, chip, adr, map_bankwidth(map));
> > +
> > +	chip->state =3D FL_READY;
> > +	DISABLE_VPP(map);
> > +	put_chip(map, chip, adr);
> > +
> > +	mutex_unlock(&chip->mutex);
>=20
> Personally I find it easier if the mutex_lock()/mutex_unlock() are in
> the same function. That way it's easier to audit the exit paths from a
> single function rather than needing to know that some functions
> implicitly release the lock. The same probably applies to
> get_chip/put_chip pairs.

[Ikegami] Thank you. I could understand well. Fixed but still remain the do=
ne function.
But added the start function to find easier the pairs instead of not change=
 to split as the done function.
Also for the exit paths to find easier added the patch 11 additionally.

>=20
> > +}
> > +
> >   static int __xipram do_write_oneword(struct map_info *map, struct
> flchip *chip,
> >   				     unsigned long adr, map_word datum,
> >   				     int mode)
> > @@ -1670,12 +1684,7 @@ static int __xipram do_write_oneword(struct
> map_info *map, struct flchip *chip,
> >   	xip_enable(map, chip, adr);
> >
> >    op_done:
> > -	if (mode =3D=3D FL_OTP_WRITE)
> > -		otp_exit(map, chip, adr, map_bankwidth(map));
> > -	chip->state =3D FL_READY;
> > -	DISABLE_VPP(map);
> > -	put_chip(map, chip, adr);
> > -	mutex_unlock(&chip->mutex);
> > +	do_write_oneword_done(map, chip, adr, mode);
> >
> >   	return ret;
> >   }
> >
