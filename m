Received: from antispam02.maxim-ic.com ([205.153.101.183])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QtE8t-0007Hf-5m
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2011 07:32:56 +0000
From: Brian Foster <brian.foster@maxim-ic.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: [BUG] mtdinfo -a: Tries to open NULL pointer for NOR with
	Eraseblock Regions
Date: Tue, 16 Aug 2011 09:31:02 +0200
References: <201107251148.51262.brian.foster@maxim-ic.com>
	<CAMjpGUcjhuc6MaH0y2vGdM5ru00BJEmVeBwMUebkbfoxDNY28g@mail.gmail.com>
	<1313381489.2200.19.camel@koala>
In-Reply-To: <1313381489.2200.19.camel@koala>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-ID: <201108160931.02543.brian.foster@maxim-ic.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Brian Norris <computersforpeace@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 15 August 2011 06:11:27 Artem Bityutskiy wrote:
> On Tue, 2011-08-09 at 13:34 -0400, Mike Frysinger wrote:
> > On Mon, Aug 8, 2011 at 19:19, Brian Norris wrote:
> > > "Alternatively, --all only prints what it can get,
> > > and --help warns there _may_ be additional data not
> > > printed by --all (and to use =E2=80=98mtdinfo /dev/mtd<N>=E2=80=99)."
> >=20
> > that's really the only other option of the three.
> > 1: add region_info to sysfs
> > 2: add a warning --all that it could be incomplete
> > 3: have --all use the legacy lookup func to get /dev/mtd#
>=20
> How about: make a quick fix and release mtd-utils-1.4.6, then just kill
> the -a option.  [...]

 You should decide what =E2=80=98-a=E2=80=99 means:  =E2=80=9Call informati=
on=E2=80=9D
 or =E2=80=9Call devices=E2=80=9D.  If =E2=80=9Call information=E2=80=9D, t=
hen either a
 bunch of work needs to be done, or else =E2=80=98-a=E2=80=99 removed.

 But if =E2=80=9Call devices=E2=80=9D  =E2=80=94 which happens to be both w=
hat
 I think it means and how I use it =E2=80=94  then it is very
 useful, at least in my situation where I'm bringing up
 a new SoC and board.  It's a nice summary of what I'm
 usually interested in; if it didn't exist, I'd =E2=80=9Chave=E2=80=9D
 to script it.  And in either case, if and when I do
 need all the information about _a_ device, then I do
 =E2=80=98mtdinfo /dev/mtd<N>=E2=80=99.

cheers!
	-blf-
=2D-=20
Brian FOSTER
Principal MTS, Software

Maxim Integrated Products (Microcontroller BU), formerly Innova Card
ZI Ath=C3=A9lia IV - Le Forum, B=C3=A2t. A
Quartier Roumagoua
13600 La Ciotat - France
Phone  : +33 (0)4 42 98 15 35
=46ax    : +33 (0)4 42 08 33 19
Email  : brian.foster@maxim-ic.com
Web    : http://www.maxim-ic.com/
