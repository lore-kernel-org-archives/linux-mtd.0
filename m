Date: Wed, 11 Feb 2015 10:40:16 +0100
From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 6/6] [RFC] mtd: mxc-nand: Warn on unimplemented commands
Message-ID: <20150211104016.0d7eec4d@ipc1.ka-ro>
In-Reply-To: <20150211090017.GW10842@pengutronix.de>
References: <1423594800-24214-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1423594800-24214-7-git-send-email-u.kleine-koenig@pengutronix.de>
 <20150211094256.2ef2805b@ipc1.ka-ro>
 <20150211090017.GW10842@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Uwe Kleine-K=C3=B6nig wrote:
> Hello Lothar,
>=20
> On Wed, Feb 11, 2015 at 09:42:56AM +0100, Lothar Wa=C3=9Fmann wrote:
> > > diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> > > index 0083b4ee4f33..372e0e38f59b 100644
> > > --- a/drivers/mtd/nand/mxc_nand.c
> > > +++ b/drivers/mtd/nand/mxc_nand.c
> > > @@ -1160,6 +1160,10 @@ static void mxc_nand_command(struct mtd_info *=
mtd, unsigned command,
> > >  		memcpy32_fromio(host->data_buf, host->main_area0, 512);
> > >  		host->buf_start =3D 0;
> > >  		break;
> > > +	default:
> > > +		WARN_ONCE(1, "Unimplemented command (cmd=3D%u)\n",
> > > +			  command);
> > > +		break;
> > >  	}
> > useless break;
> Do you mean the line break? That's right, I fixed it here for a later
> v2. But I guess you mean the (literal) break here. Right, it could be
> dropped without change in semantic, but I thought adding it matches the
> usually recommended style?!
>=20
Documentation/CodingStyle has this example:
|        default:
|                break;
|        }
but there is no useful statement in the 'default' case, so the
'break' is necessary here.
IMO this doesn't mandate to add a 'break' at the end of the default
clause if there are actual statements in this path.


Lothar Wa=C3=9Fmann
--=20
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
