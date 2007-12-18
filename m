Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J4Y93-0008L2-TA
	for linux-mtd@lists.infradead.org; Tue, 18 Dec 2007 08:49:52 +0000
Subject: Re: [RFC][patch] NAND partial page read functionality
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
In-Reply-To: <Pine.LNX.4.64.0712171454550.29723@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0712131747490.16624@pentafluge.infradead.org>
	<1197720795.25999.57.camel@sauron>
	<Pine.LNX.4.64.0712171454550.29723@pentafluge.infradead.org>
Content-Type: text/plain; charset=utf-8
Date: Tue, 18 Dec 2007 10:48:51 +0200
Message-Id: <1197967731.18962.25.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: joern@logfs.org, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-12-17 at 15:46 +0000, Alexey Korolev wrote:
> Good point. The question is what name would be better. I used partial
> page read because of NAND datasheet (Intel, St, Micron uses term partial
> page read or write instead of subpage read or write). May be it will be
> better to switch to this name to make search more easy?

For me it is not fundamental, but I'd vote for subpage - just because we
already have this. And wendors anyway tend to name things differently.

> > 3. Run nand-tests to make sure you did not brake anything:
> > git://git.infradead.org/~ahunter/nand-tests.git
> >=20
> Thank you for link - we will try it.=20
> (before sending out this code we performed excessive testing - about 500
> items were executed, including stress, multithread, power loss tests

This is good, but the tests I pointed to work straight with MTD devices
and were designed to test NANDs, so they might be useful anyway. For
example we found quite a few bugs in OneNAND driver with them, although
the FS tests had looked working fine.

> Yes. I looked at this implementation. Your idea of partial/subpage write =
implementation=20
> looks good. In fact there will be some drawbacks - if every request will
> become small, write performance will become lower - because writing and
> positioning are not for free.=20

Well, this depends. If an MTD user wants to write 4KiB, and issues 4KiB
write request, then it is of course faster to write 2x2048, then 8x512,
and it is even faster to do some kind of multi-page write (some old
flashes had this AFAIK).

But surely if the driver is not dumb, it will do 2x2048?

I've glanced at jffs2_flash_writev(), and it seems it is also not dumb -
if in needs to write a 4KiB buffer, it first finishes current
write-buffer, flushes it, then it calles mtd->write() for multiple min.
I/O units (note, it does not use wbuf now), and only the rest, which
does not comprise whole min. I/O unit, goes to the wbuf.

Thus, I'd conclude, JFFS2 should benefit.

> May be it make sence to add this feature under flag.=20

No, no flags please. It should either be transparent of not exist I
believe :-)


> It is not clear how to handle the situation with oob write requests.
> What to do if some one wil ask to write a part of page and oob at the
> same time?=20

Yup, it seems to be a problem.

> I did not understand this part of the code about subpage write:
> 	/*
> 	 * Allow subpage writes up to ecc.steps. Not possible for MLC
> 	 * FLASH.
> 	 */
> 	if (!(chip->options & NAND_NO_SUBPAGE_WRITE) &&
> 	    !(chip->cellinfo & NAND_CI_CELLTYPE_MSK)) {
> 		switch(chip->ecc.steps) {
> 		case 2:
> 			mtd->subpage_sft =3D 1;
> 			break;
> 		case 4:
> 		case 8:
> 			mtd->subpage_sft =3D 2;
> 			break;
> 		}
> 	}
> Why it sets subpage shift to 2 in case of eight ECC steps? It should be
> 3. (step size is 1/8 of page)

Frankly, I do not deeply understand nand_base.c, but it looks like you
are right. Thomas Gleixner is the author, you should ask him.

> > >  #define NAND_HAS_COPYBACK(chip) ((chip->options & NAND_COPYBACK))
> > > +#define NAND_CANPARTREAD(chip) ((chip->options & NAND_PART_READ) &&\
> > > +				(chip->ecc.mode =3D=3D NAND_ECC_SOFT))
> >=20
> > Why chip->ecc.mode =3D=3D NAND_ECC_SOFT?
> >
> I added this limitation because I have only ECC_SOFT chips and afraid to
> broke workability non SOFT_ECC chiups. I guess it should work fine for
> other devices. Just kind of over protection. It is not a problem to
> remove it.=20

Well, I could try your patch on OLPC which has an ST-Micro NAND and CAFE
controller which, among other things, does HW ECC for NAND.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
