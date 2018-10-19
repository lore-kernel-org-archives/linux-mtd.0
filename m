Received: from mail1.bemta24.messagelabs.com ([67.219.250.209])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDRBN-0003UX-Pi
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 09:35:04 +0000
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Hauke Mehrtens
 <hauke@hauke-m.de>, Koen Vandeputte <koen.vandeputte@ncentric.com>
CC: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 Fabio Bettoni <fbettoni@gmail.com>, PACKHAM Chris
 <chris.packham@alliedtelesis.co.nz>, Joakim Tjernlund
 <Joakim.Tjernlund@infinera.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH 1/3] mtd: cfi_cmdset_0002: Change do_write_oneword() to
 use chip_good()
Date: Fri, 19 Oct 2018 09:34:39 +0000
Message-ID: <TY2PR01MB2169F6F87AD5B5372259D18EDCF90@TY2PR01MB2169.jpnprd01.prod.outlook.com>
References: <20181019081320.12843-1-ikegami@allied-telesis.co.jp>
 <20181019081320.12843-2-ikegami@allied-telesis.co.jp>
 <20181019102954.23e26c2e@bbrezillon>
In-Reply-To: <20181019102954.23e26c2e@bbrezillon>
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

Let me comment below in the mail.

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Friday, October 19, 2018 5:30 PM
> To: IKEGAMI Tokunori
> Cc: boris.brezillon@free-electrons.com; Fabio Bettoni; PACKHAM Chris;
> Joakim Tjernlund; linux-mtd@lists.infradead.org
> Subject: Re: [PATCH 1/3] mtd: cfi_cmdset_0002: Change do_write_oneword()
> to use chip_good()
>=20
> On Fri, 19 Oct 2018 17:13:18 +0900
> Tokunori Ikegami <ikegami@allied-telesis.co.jp> wrote:
>=20
> > This is required for OpenWrt Project to result the flash write issue as
> > below patche.
> >
> >
> <https://git.openwrt.org/?p=3Dopenwrt/openwrt.git;a=3Dcommitdiff;h=3Dddc1=
1c3
> 932c7b7b7df7d5fbd48f207e77619eaa7>
>=20
> This part is not really explaining why this fix is needed. Can you
> please give more details about why chip_good() should be used instead of
> chip_ready().

[Ikegami] The reason is that just actually fix the issue.
And also in the past I fixed the erase function also as same way by the pat=
ch below.
  <https://patchwork.ozlabs.org/patch/922656/>
   Note: The reason for the patch for erase is same.
In my understanding the chip_ready() is just checked the value twice from f=
lash.
So I think that sometimes incorrect value is read twice and it is depended =
on the flash device behavior but not sure..

Hauke-san and Koen-san,

  If you have any advice please let me know.


>=20
> >
> > So change to use chip_good() instead of chip_ready().
> >
> > Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> > Cc: Fabio Bettoni <fbettoni@gmail.com>
> > Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> > Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> > Cc: linux-mtd@lists.infradead.org
>=20
> Would be great to have Fixes and Cc-stable tags here.

[Ikegami] I see I will do that.

>=20
> > ---
> >  drivers/mtd/chips/cfi_cmdset_0002.c | 18 ++++++++++++------
> >  1 file changed, 12 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
> b/drivers/mtd/chips/cfi_cmdset_0002.c
> > index 72428b6bfc47..251c9e1675bd 100644
> > --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> > +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> > @@ -1627,31 +1627,37 @@ static int __xipram do_write_oneword(struct
> map_info *map, struct flchip *chip,
> >  			continue;
> >  		}
> >
> > -		if (time_after(jiffies, timeo) && !chip_ready(map, adr)){
> > +		if (chip_good(map, adr, datum))
> > +			break;
> > +
> > +		if (time_after(jiffies, timeo)){
> >  			xip_enable(map, chip, adr);
> >  			printk(KERN_WARNING "MTD %s(): software
> timeout\n", __func__);
> >  			xip_disable(map, chip, adr);
> > +			ret =3D -EIO;
> >  			break;
> >  		}
> >
> > -		if (chip_ready(map, adr))
> > -			break;
> > -
> >  		/* Latency issues. Drop the lock, wait a while and retry
> */
> >  		UDELAY(map, chip, adr, 1);
> >  	}
> > +
> >  	/* Did we succeed? */
> > -	if (!chip_good(map, adr, datum)) {
> > +	if (ret) {
> >  		/* reset on all failures. */
> >  		map_write(map, CMD(0xF0), chip->start);
> >  		/* FIXME - should have reset delay before continuing */
> >
> > -		if (++retry_cnt <=3D MAX_RETRIES)
> > +		if (++retry_cnt <=3D MAX_RETRIES) {
> > +			ret =3D 0;
> >  			goto retry;
> > +		}
> >
> >  		ret =3D -EIO;
> >  	}
> > +
> >  	xip_enable(map, chip, adr);
> > +
> >   op_done:
> >  	if (mode =3D=3D FL_OTP_WRITE)
> >  		otp_exit(map, chip, adr, map_bankwidth(map));
