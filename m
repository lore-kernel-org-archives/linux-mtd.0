Received: from mail1.bemta23.messagelabs.com ([67.219.246.211])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJyM5-00038V-Nc
 for linux-mtd@lists.infradead.org; Tue, 06 Nov 2018 10:13:09 +0000
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>, "ikegami_to@yahoo.co.jp"
 <ikegami_to@yahoo.co.jp>
CC: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 Fabio Bettoni <fbettoni@gmail.com>, PACKHAM Chris
 <chris.packham@alliedtelesis.co.nz>, Joakim Tjernlund
 <Joakim.Tjernlund@infinera.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH v3 02/11] mtd: cfi_cmdset_0002: Remove chip_ready() from
 do_write_buffer()
Date: Tue, 6 Nov 2018 10:12:50 +0000
Message-ID: <TYAPR01MB21750C2E3F4011B439B59A12DCCB0@TYAPR01MB2175.jpnprd01.prod.outlook.com>
References: <20181025163219.25788-1-ikegami@allied-telesis.co.jp>
 <20181025163219.25788-3-ikegami@allied-telesis.co.jp>
 <20181105140303.6c3a247a@bbrezillon>
In-Reply-To: <20181105140303.6c3a247a@bbrezillon>
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

Sorry for late to reply to the mail below. (The mail was unexpectedly moved=
 from the inbox.)

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Monday, November 05, 2018 10:03 PM
> To: IKEGAMI Tokunori
> Cc: boris.brezillon@free-electrons.com; Fabio Bettoni; PACKHAM Chris;
> Joakim Tjernlund; linux-mtd@lists.infradead.org
> Subject: Re: [PATCH v3 02/11] mtd: cfi_cmdset_0002: Remove chip_ready()
> from do_write_buffer()
>=20
> On Fri, 26 Oct 2018 01:32:10 +0900
> Tokunori Ikegami <ikegami@allied-telesis.co.jp> wrote:
>=20
> > It is enough to use chip_good() only so chip_ready() is not necessary.
>=20
> I'd like a short explanation saying why chip_good() is enough:
> chip_good() is doing the same check chip_ready() is doing plus an extra
> check to make sure we end up with the data we wrote.

I see so I will update as this.

>=20
> > For this change the order to check timeout is also needed to chagne.
>=20
>=20
> 	^change.

Will fix this.

>=20
> And I don't think changing the order is a hard requirement, it's just
> better to avoid the case where the data update happens just after the
> timeout has expired.

I will update as so.

>=20
> To sum-up, I'm okay with the diff, I'd just like the commit message
> to be adjusted.

I see.

Regards,
Ikegami

>=20
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
> > Changes since v2:
> > - None.
> >
> > Changes since v1:
> > - None.
> >
> >  drivers/mtd/chips/cfi_cmdset_0002.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
> b/drivers/mtd/chips/cfi_cmdset_0002.c
> > index 251c9e1675bd..c2e51768a02c 100644
> > --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> > +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> > @@ -1882,14 +1882,14 @@ static int __xipram do_write_buffer(struct
> map_info *map, struct flchip *chip,
> >  			continue;
> >  		}
> >
> > -		if (time_after(jiffies, timeo) && !chip_ready(map, adr))
> > -			break;
> > -
> >  		if (chip_good(map, adr, datum)) {
> >  			xip_enable(map, chip, adr);
> >  			goto op_done;
> >  		}
> >
> > +		if (time_after(jiffies, timeo))
> > +			break;
> > +
> >  		/* Latency issues. Drop the lock, wait a while and retry
> */
> >  		UDELAY(map, chip, adr, 1);
> >  	}
