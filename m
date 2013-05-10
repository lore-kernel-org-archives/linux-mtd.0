Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UafKQ-0008H1-Vm
 for linux-mtd@lists.infradead.org; Fri, 10 May 2013 04:53:11 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Mike Frysinger <vapier@gentoo.org>
Subject: RE: [PATCH [mtd-utils] 3/3] nandwrite: add --input-{skip,size} options
Date: Fri, 10 May 2013 04:52:40 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9C371E@DBDE04.ent.ti.com>
References: <1368054125-32214-1-git-send-email-vapier@gentoo.org>
 <1368057794-32735-3-git-send-email-vapier@gentoo.org>
 <20980858CB6D3A4BAE95CA194937D5E73E9C32D8@DBDE04.ent.ti.com>
 <201305091157.48673.vapier@gentoo.org>
In-Reply-To: <201305091157.48673.vapier@gentoo.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=20
> On Thursday 09 May 2013 06:42:01 Gupta, Pekon wrote:
> > >  	pagelen =3D mtd.min_io_size + ((writeoob) ? mtd.oob_size : 0);
> > > +		imglen =3D inputsize ? : pagelen;
> > > +		if (inputskip) {
> > > +			errmsg("seeking stdin does not work");
> > > +			goto closeall;
> > > +		}
> > >  	} else {
> > > -		struct stat st;
> > > -		if (fstat(ifd, &st)) {
> > > -			sys_errmsg("unable to stat input image");
> > > +		if (!inputsize) {
> > > +			struct stat st;
> > > +			if (fstat(ifd, &st)) {
> > > +				sys_errmsg("unable to stat input
> > > image");
> > > +				goto closeall;
> > > +			}
> > > +			imglen =3D st.st_size;
> > > +		} else
> > > +			imglen =3D inputsize;
> >
> > [Pekon]: It would be good to check that both 'inputsize' & 'inputskip'
> > are multiples of:
> > -  mtd->writesize : if not using '-o' option, OR
> > - (mtd->writesize + mtd->oobsize): is using '-o' option.
> > Or Simply, both arguments should be aligned to 'pagelen' boundary.
>=20
> mmm, i don't think so.  the input alignment (inputskip) is entirely
> irrelevant
> to the output.
>=20
[Pekon]: I'm coming from the back-ground that most users 'dd' or=20
'nanddump' to generate write-data for 'nandwrite'.=20
Thus the write-data would be mostly 'pagelen' aligned.
Example:
If the write-data contains OOB data, and user forgets to take that=20
into account while calculating 'inputskip' offset, then everything=20
would be wrongly shifted by the offset.
So you need not flag an Error, but a warning may do, so user is=20
hinted at his mistake.


> as for inputsize, we already do that check.  if you read the code further
> (like 5 lines below the diff here), you'll see the --pad flag handling.
>=20
[Pekon]: Ok.. yes, its there..

> -mike

with regards, pekon
