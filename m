Received: from west-smtp1.trimble.com ([155.63.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LsK5I-0008MU-2p
	for linux-mtd@lists.infradead.org; Fri, 10 Apr 2009 17:00:15 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
Subject: RE: UBIFS Corrupt during power failure
Date: Fri, 10 Apr 2009 11:00:04 -0600
Message-ID: <C77C279BA71FD14985DC8E75FB265AB702FE5324@usw-am-xch-02.am.trimblecorp.net>
In-Reply-To: <1239378582.3390.66.camel@localhost.localdomain>
References: <C77C279BA71FD14985DC8E75FB265AB702DEEF07@usw-am-xch-02.am.trimblecorp.net>
	<49C8FC89.7040709@nokia.com>
	<C77C279BA71FD14985DC8E75FB265AB702DEF104@usw-am-xch-02.am.trimblecorp.net>
	<1238050770.3321.41.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702DEFBF5@usw-am-xch-02.am.trimblecorp.net>
	<C77C279BA71FD14985DC8E75FB265AB702E4C3CA@usw-am-xch-02.am.trimblecorp.net>
	<1239366310.3390.9.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE51AC@usw-am-xch-02.am.trimblecorp.net>
	<1239376652.3390.49.camel@localhost.localdomain>
	<1239378582.3390.66.camel@localhost.localdomain>
From: "Eric Holmberg" <Eric_Holmberg@Trimble.com>
To: <dedekind@infradead.org>
Cc: Adrian Hunter <adrian.hunter@nokia.com>, linux-mtd@lists.infradead.org,
	Urs Muff <urs_muff@trimble.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c index=20
> 1066297..9afa056 100644
> --- a/fs/ubifs/recovery.c
> +++ b/fs/ubifs/recovery.c
> @@ -675,9 +675,10 @@ struct ubifs_scan_leb=20
> *ubifs_recover_leb(struct ubifs_info *c, int lnum,
>  			clean_buf(c, &buf, lnum, &offs, &len);
>  			need_clean =3D 1;
>  		} else {
> -			ubifs_err("corrupt empty space at LEB %d:%d",
> -				  lnum, offs);
> -			goto corrupted;
> +			ubifs_warn("ignore corrupt empty space=20
> at LEB %d:%d",
> +				   lnum, offs);
> +			clean_buf(c, &buf, lnum, &offs, &len);
> +			need_clean =3D 1;
>  		}
>  	}
> =20
> --
> Best regards,
> Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)

Artem,

Thank you very much for your help so far.  I am going to do two things:
 1. Turn off write buffering which converts the NOR minimum I/O size =
from 1 to effectively 32 16-bit words (64 bytes) and re-run all of the =
tests.
 2. While this is running, I'm going to start following the =
modifications and debugging path that you outlined.

I'll report back with findings and potential modifications -- as always, =
feel free to ping me if you don't hear anything!

Thanks again,

Eric
=20

> -----Original Message-----
> From: Artem Bityutskiy [mailto:dedekind@infradead.org]=20
> Sent: Friday, April 10, 2009 9:50 AM
> To: Eric Holmberg
> Cc: Urs Muff; linux-mtd@lists.infradead.org; Adrian Hunter
> Subject: RE: UBIFS Corrupt during power failure
>=20
> On Fri, 2009-04-10 at 18:17 +0300, Artem Bityutskiy wrote:
> > Hi,
> >=20
> > On Fri, 2009-04-10 at 08:27 -0600, Eric Holmberg wrote:
> > > Test setup:
> > >  * Using U-Boot 1.3.0
> > >  * Write buffering enabled
> > >  * S29GL256F 256Mbit NOR flash w/ 32-word write buffer
> > >  * Test software that performs read/erase/write operations
> > >  * JTAG debugger that randomly resets the board
> > >=20
> > > Reset during write (unexpected test pattern written after=20
> > > un-programmed
> > > values):
> > >=20
> > > 30352240  aa55aa0a aa55aa0a aa55aa0a aa55aa0a 30352250  aa55aa0a=20
> > > aa55aa0a aa55aa0a aa55aa0a 30352260  aa55aa0a aa55aa0a aa55aa0a=20
> > > aa55aa0a 30352270  aa55aa0a aa55aa0a aa55aa0a aa55aa0a 30352280 =20
> > > ffffffff ffffffff ffffffff ffffffff 30352290  ffffffff ffffffff=20
> > > ffffffff ffffffff 303522a0  ffffffff ffffffff ffffffff ffffffff=20
> > > 303522b0  aa55aa0a aa55aa0a aa55aa0a aa55aa0a 303522c0  ffffffff=20
> > > ffffffff ffffffff ffffffff 303522d0  ffffffff ffffffff ffffffff=20
> > > ffffffff 303522e0  ffffffff ffffffff ffffffff ffffffff
> >=20
> > Yeah, I think the recovery assumes that if you cut power during=20
> > writing than:
> >=20
> > 1. The min. I/O unit which has been written to at the moment power
> >    cut happened will contain garbage.
> > 2. But the next min. I/O unit will contain 0xFFs.
> >=20
> > We have been working only with NAND flash, and min. I/O=20
> unit for NAND=20
> > is one NAND page (usually 2KiB). We have never worked with=20
> NOR flash.=20
> > We only tested UBIFS several times on the mtdram NOR flash emulator.
> >=20
> > In case of NOR, UBIFS assumes min. I/O unit size is 8=20
> bytes. Well, it=20
> > is actually 1 byte, but because UBIFS aligns all its on-flash data=20
> > structures to 8-byte boundaries, we used 8 for NOR, because it was=20
> > easier implementation-wise.
> >=20
> > Thus, UBIFS will panic when it meets the above pattern. And UBIFS=20
> > would need some changes to make it understand this type of=20
> > corruptions. All the recovery logic is in recovery.c. It=20
> should not be=20
> > very difficult to change this.
> >=20
> > You may ask - if while scanning you meet a corrupted node -=20
> why do you=20
> > keep checking the rest of the node, and want to see 0xFFs there?
> >=20
> > The reason why we do this check is that if we meet a=20
> corrupted node,=20
> > we want to figure out the nature of the corruption - is this a=20
> > non-finished write or a physical corruption, e.g. due to radiation,=20
> > worn-out flash, etc. UBIFS writes eraseblocks from the=20
> beginning, to=20
> > the end - always. So if the corrupted node is the last, this is=20
> > harmless corruption because of power-cut, and we recover.=20
> But if the=20
> > corruption is in a middle, this is something serious and we panic.
> >=20
> > So in your case, UBIFS decides that it met a corrupted node in the=20
> > middle, and panics.
>=20
> So you need to play with ubifs_recover_leb() function.
>=20
> There is the following code:
>=20
>         if (!empty_chkd && !is_empty(buf, len)) {
>                 if (is_last_write(c, buf, offs)) {
>                         clean_buf(c, &buf, lnum, &offs, &len);
>                         need_clean =3D 1;
>                 } else {
>                         ubifs_err("corrupt empty space at LEB %d:%d",
>                                   lnum, offs);
>                         goto corrupted;
>                 }
>         }
>=20
> So in your case "is_last_write()" returns zero, and UBIFS=20
> prints cryptic "corrupt empty space" and panics.
>=20
> I would try to hack the code and remove that panic part, and=20
> see what happens. UBIFS should probably successfully recover the LEB.
> This is done in 'fix_unclean_leb()'. What this function will=20
> do it will:
>=20
> 1. Read all _good_ nodes from this LEB (ubi_read()) 2.=20
> Atomically change the corrupted LEB (ubi_leb_change())
>=20
> Atomic LEB change is UBI operation, read here about it:
> http://www.linux-mtd.infradead.org/doc/ubi.html#L_lebchange
>=20
> In few words, on the physical flash level it will do:
>=20
> 1. Write the good nodes to a new, erased physical eraseblock=20
> 2. Erase the current physical eraseblock.
>=20
> So, try the suggested hack out (inlined below). See what=20
> happens, may be you discover other problems. After you played=20
> with recovery code and have some success, we may push some=20
> nice solution to UBIFS, e.g.
>=20
> 1. Introduce a mount option which tells UBIFS to assume that=20
> power-cuts
>    during writing may disturb not only the current min_io_unit, but
>    also the next ones.
> 2. Assume this if the flash type is NOR. May be there is some limit
>    we may assume?
>=20
> diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c index=20
> 1066297..9afa056 100644
> --- a/fs/ubifs/recovery.c
> +++ b/fs/ubifs/recovery.c
> @@ -675,9 +675,10 @@ struct ubifs_scan_leb=20
> *ubifs_recover_leb(struct ubifs_info *c, int lnum,
>  			clean_buf(c, &buf, lnum, &offs, &len);
>  			need_clean =3D 1;
>  		} else {
> -			ubifs_err("corrupt empty space at LEB %d:%d",
> -				  lnum, offs);
> -			goto corrupted;
> +			ubifs_warn("ignore corrupt empty space=20
> at LEB %d:%d",
> +				   lnum, offs);
> +			clean_buf(c, &buf, lnum, &offs, &len);
> +			need_clean =3D 1;
>  		}
>  	}
> =20
> --
> Best regards,
> Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
>=20
>=20
