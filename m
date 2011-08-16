Received: from antispam01.maxim-ic.com ([205.153.101.182])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QtDxq-00074K-8j
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2011 07:21:31 +0000
From: Brian Foster <brian.foster@maxim-ic.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH v3 5/5] mtdinfo: consolidate help as display_help()
Date: Tue, 16 Aug 2011 09:18:15 +0200
References: <CAMjpGUdR-Z-mSN0oRgeVfWJ7jFjmvaKyKL3aMo-58-HZsmNidQ@mail.gmail.com>
	<CAN8TOE9EEtGQCHL3_2aspTstu12p5TxVB_t8ED6_UF+MUV4XXA@mail.gmail.com>
	<CAMjpGUcNqGkbTQUX9Lq+B+gSN8TUySs=p_kxZE4TQn1amwk2ow@mail.gmail.com>
In-Reply-To: <CAMjpGUcNqGkbTQUX9Lq+B+gSN8TUySs=p_kxZE4TQn1amwk2ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-ID: <201108160918.15975.brian.foster@maxim-ic.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 16 August 2011 06:00:57 Mike Frysinger wrote:
> On Mon, Aug 15, 2011 at 13:27, Brian Norris wrote:
> > On Sat, Aug 13, 2011 at 11:10 AM, Mike Frysinger wrote:
> >> On Fri, Aug 12, 2011 at 12:37, Brian Norris wrote:
> > ...
> >>> "mtdinfo"). I suppose we could either hardcode the spaces in or try to
> >>> do some sort of "ARRAY_SIZE" trickery (as found in the Linux kernel)
> >>
> >> you could probably use %*s and then pass in "" as well as <some max
> >> spacing number - strlen(PROGRAM_NAME)>.
> >>
> >> printf("%*s\n", 80 - strlen(PROGRAM_NAME), "");
> >
> > Yes, that's what I meant...of course "strlen" is better than writing
> > your own ARRAY_SIZE() when you already have the full C library :)
>=20
> gcc optimizes strlen("constant") into a number

 And =E2=80=98ARRAY_SIZE(...)=E2=80=99, in this case, is simply =E2=80=98si=
zeof(...)=E2=80=99
 (or, actually, =E2=80=98sizeof(...)-1=E2=80=99 to be equivalent to =E2=80=
=98strlen=E2=80=99).

 Albeit I won't worry about the case of  strlen > 80  here,
 I am mildly curious what the output would be if that were
 indeed true...?

 The other thing I won't worry about is the assumption every
 output byte in PROGRAM_NAME is a printing glyph occupying
 exactly one cell.  That is true (in this case) ....

cheers!
	-blf-
=2D-=20
Brian FOSTER
Principal MTS, Software
Maxim Integrated Products (Microcontroller BU), formerly Innova Card
Web    : http://www.maxim-ic.com/
