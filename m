Received: from mail1.bemta23.messagelabs.com ([67.219.246.213])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJpI8-0003iW-Jk
 for linux-mtd@lists.infradead.org; Tue, 06 Nov 2018 00:32:28 +0000
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 Fabio Bettoni <fbettoni@gmail.com>, PACKHAM Chris
 <chris.packham@alliedtelesis.co.nz>, Joakim Tjernlund
 <Joakim.Tjernlund@infinera.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH v3 03/11] mtd: cfi_cmdset_0002: Remove goto statement from
 do_write_buffer()
Date: Tue, 6 Nov 2018 00:32:06 +0000
Message-ID: <TYAPR01MB2175B59378F0445F3D95D055DCCB0@TYAPR01MB2175.jpnprd01.prod.outlook.com>
References: <20181025163219.25788-1-ikegami@allied-telesis.co.jp>
 <20181025163219.25788-4-ikegami@allied-telesis.co.jp>
 <20181105141437.1a517176@bbrezillon>
In-Reply-To: <20181105141437.1a517176@bbrezillon>
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
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Monday, November 05, 2018 10:15 PM
> To: IKEGAMI Tokunori
> Cc: boris.brezillon@free-electrons.com; Fabio Bettoni; PACKHAM Chris;
> Joakim Tjernlund; linux-mtd@lists.infradead.org
> Subject: Re: [PATCH v3 03/11] mtd: cfi_cmdset_0002: Remove goto statement
> from do_write_buffer()
>=20
> On Fri, 26 Oct 2018 01:32:11 +0900
> Tokunori Ikegami <ikegami@allied-telesis.co.jp> wrote:
>=20
> > For a maintainability by reducing the goto statement remove it from
> > do_write_buffer().
>=20
> I guess that's a matter of taste, but I don't find this version more
> readable than the previous one. Any strong reason to get rid of the
> op_done label?

No there is no strong reason.
I have just thought also that it is better for the maintainability.

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
> > - Split the patch v1 3/3.
> >
> >  drivers/mtd/chips/cfi_cmdset_0002.c | 46
> +++++++++++++++--------------
> >  1 file changed, 24 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
> b/drivers/mtd/chips/cfi_cmdset_0002.c
> > index c2e51768a02c..deffafab067e 100644
> > --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> > +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> > @@ -1884,38 +1884,40 @@ static int __xipram do_write_buffer(struct
> map_info *map, struct flchip *chip,
> >
> >  		if (chip_good(map, adr, datum)) {
> >  			xip_enable(map, chip, adr);
> > -			goto op_done;
> > +			break;
> >  		}
> >
> > -		if (time_after(jiffies, timeo))
> > +		if (time_after(jiffies, timeo)) {
> > +			ret =3D -EIO;
> >  			break;
> > +		}
> >
> >  		/* Latency issues. Drop the lock, wait a while and retry
> */
> >  		UDELAY(map, chip, adr, 1);
> >  	}
> >
> > -	/*
> > -	 * Recovery from write-buffer programming failures requires
> > -	 * the write-to-buffer-reset sequence.  Since the last part
> > -	 * of the sequence also works as a normal reset, we can run
> > -	 * the same commands regardless of why we are here.
> > -	 * See e.g.
> > -	 *
> http://www.spansion.com/Support/Application%20Notes/MirrorBit_Write_Bu
> ffer_Prog_Page_Buffer_Read_AN.pdf
> > -	 */
> > -	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
> > -			 cfi->device_type, NULL);
> > -	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
> > -			 cfi->device_type, NULL);
> > -	cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, chip->start, map, cfi,
> > -			 cfi->device_type, NULL);
> > -	xip_enable(map, chip, adr);
> > -	/* FIXME - should have reset delay before continuing */
> > +	if (ret) {
> > +		/*
> > +		 * Recovery from write-buffer programming failures
> requires
> > +		 * the write-to-buffer-reset sequence.  Since the last
> part
> > +		 * of the sequence also works as a normal reset, we can
> run
> > +		 * the same commands regardless of why we are here.
> > +		 * See e.g.
> > +		 *
> http://www.spansion.com/Support/Application%20Notes/MirrorBit_Write_Bu
> ffer_Prog_Page_Buffer_Read_AN.pdf
> > +		 */
> > +		cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start,
> map, cfi,
> > +				 cfi->device_type, NULL);
> > +		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start,
> map, cfi,
> > +				 cfi->device_type, NULL);
> > +		cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, chip->start,
> map, cfi,
> > +				 cfi->device_type, NULL);
> > +		xip_enable(map, chip, adr);
> > +		/* FIXME - should have reset delay before continuing */
> >
> > -	printk(KERN_WARNING "MTD %s(): software timeout,
> address:0x%.8lx.\n",
> > -	       __func__, adr);
> > +		printk(KERN_WARNING "MTD %s(): software timeout,
> address:0x%.8lx.\n",
> > +		       __func__, adr);
> > +	}
> >
> > -	ret =3D -EIO;
> > - op_done:
> >  	chip->state =3D FL_READY;
> >  	DISABLE_VPP(map);
> >  	put_chip(map, chip, adr);
