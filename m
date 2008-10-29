Subject: Re: [PATCH][nandsim] FIX RAM wasting via kmalloc
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
In-Reply-To: <alpine.LFD.1.10.0810271251540.18203@casper.infradead.org>
References: <alpine.LFD.1.10.0810221611550.30499@casper.infradead.org>
	<1225091926.3833.2.camel@sauron>
	<alpine.LFD.1.10.0810271251540.18203@casper.infradead.org>
Content-Type: text/plain; charset=utf-8
Date: Wed, 29 Oct 2008 11:27:10 +0200
Message-Id: <1225272430.4350.16.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-10-27 at 12:59 +0000, Alexey Korolev wrote:
> Hi,
>=20
> > > Nandsim consumes ~2x more RAM than the density of simulated device.=20
> > > It becomes critical if we need to simulate 256MB NAND and run stress =
tests=20
> > > on it.
> >=20
> > I'm applying your patch to our local tree, just to test it. But there
> > is a trailing white-space.
> >=20
> > [dedekind@gollum ubifs-2.6]$ git-am nandsim
> > Applying FIX RAM wasting via kmalloc
> > .dotest/patch:64: trailing whitespace.
> >                  * then kernel memory alloc runs writeback which goes t=
o
> > the FS
> > warning: 1 line adds whitespace errors.
> >=20
> > :-)
> >
> Thanks. I removed the trailing space. Also for just a case did an addtion=
al
> tests to make sure it works fine.
> I think this one should be better :)?

I suggest you to re-send your patch again, with nice commit comments,
because when I applied this patch using git-am, I had to edit the text
to remove junk ">" symbols. It is just nice if your patch does not
require much editing.

Feel free to add:

Tested-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Acked-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
