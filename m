Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J4cMP-0000No-Cv
	for linux-mtd@lists.infradead.org; Tue, 18 Dec 2007 13:19:55 +0000
Subject: Re: [RFC][patch] NAND partial page read functionality
From: Artem Bityutskiy <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20071218114232.GA1741@lazybastard.org>
References: <Pine.LNX.4.64.0712131747490.16624@pentafluge.infradead.org>
	<1197720795.25999.57.camel@sauron>
	<Pine.LNX.4.64.0712171454550.29723@pentafluge.infradead.org>
	<1197967731.18962.25.camel@sauron>
	<20071218114232.GA1741@lazybastard.org>
Content-Type: text/plain; charset=utf-8
Date: Tue, 18 Dec 2007 14:57:55 +0200
Message-Id: <1197982675.18962.34.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Alexey Korolev <akorolev@infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-12-18 at 12:42 +0100, J=C3=B6rn Engel wrote:
> On Tue, 18 December 2007 10:48:51 +0200, Artem Bityutskiy wrote:
> >=20
> > Well, this depends. If an MTD user wants to write 4KiB, and issues 4KiB
> > write request, then it is of course faster to write 2x2048, then 8x512,
> > and it is even faster to do some kind of multi-page write (some old
> > flashes had this AFAIK).
>=20
> Not necessarily.  The alauda chip has a "page program" and a "block
> program" command.  With a naive implementation the block program is
> faster.  But when doing asynchronous transfers on the usb bus, page
> program becomes just as fast.  In this particular case, block program
> can only reduce the number of synchronous bus latencies for a
> non-optimized implementation.

Well, in the context of discussion this example is not really relevant,
since aluda have its own write_page, and we are talking about the
nand_base.c's implementation.

> If writesize is 256 and pagesize is 2048, every wbuf flush will write
> exactly 256.  Any remaining clean multiple of 256 is written directly,
> but this will rarely be an aligned clean multiple of 2048.  Every wbuf
> flush ensures that either the previous or the following writes is not.

Indeed, you are right.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
