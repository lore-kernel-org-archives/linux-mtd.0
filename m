Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pkvpu-00074I-Iv
	for linux-mtd@lists.infradead.org; Thu, 03 Feb 2011 09:50:47 +0000
In-Reply-To: <OFAEC8E64A.F4C40EA8-ONC125782C.002A10F5-C125782C.002D0641@transmode.se>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>	<OF6FB39892.8BB946B6-ONC1257823.006654EE-C1257823.006801B7@transmode.se>
	<F4EC0B87-B4D8-4577-A36B-64E1723634BC@prograde.net>	<OF669CD6B0.87299771-ONC1257823.007EE3A7-C1257823.007F2FD2@transmode.se>
	<25631ED7-C6A0-44B1-B33D-F48DC48C812E@prograde.net>	<OF695F4526.1DB1C212-ONC125782B.00602EFA-C125782B.006F0621@transmode.se>
	<626D0191-85FC-41E2-94C7-CBFF9D9629BE@prograde.net>
	<OFAEC8E64A.F4C40EA8-ONC125782C.002A10F5-C125782C.002D0641@transmode.se>
Subject: Re: Numonyx NOR and chip->mutex bug?
Message-ID: <OF562F5C46.D2EDB17F-ONC125782C.00358774-C125782C.0036154D@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 3 Feb 2011 10:50:43 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=ISO-8859-15
Content-transfer-encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Holger brunck <holger.brunck@keymile.com>,
	Stefan Bigler <stefan.bigler@keymile.com>,
	Michael Cashwell <mboards@prograde.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>
> Michael Cashwell <mboards@prograde.net> wrote on 2011/02/02 22:19:58:=

> >
> > On Feb 2, 2011, at 3:12 PM, Joakim Tjernlund wrote:

...

> >
> > >      map_write(map, CMD(0xd0), adr);
> > > +    /* some numonyx P30 parts have an apparent delay after start=
ing or
> > > +     resuming some commands. this is normally covered by the cac=
he
> > > +     invalidation done between the command and the start of read=
ing
> > > +     for the busy status bit to clear. but no such cache invalid=
ation
> > > +     is done when resuming and this allows the status-reading th=
read
> > > +     awakened below to read the status too soon and think its op=
eration
> > > +     has finished when it fact its resumption is still underway.=
 */
> > > +    udelay(20);
> > >
> > > I don't follow your reasoning here. This Read Status command isn'=
t saved anywhere so how can the code get confused later on?
> >
> > It's not that the read happens here and is saved. It happens in the=
 thread awakened a few lines later. That thread went to sleep while wai=
ting for its WSM operation to complete so it's in a loop reading and te=
sting that. The first thing it does on wake up is read the WSM status.
> >
> > My point is that in the case of erase-resume there is much less rea=
l time between the write of the resume command and the later read of th=
e status register than there is when starting an erase or program opera=
tion anew. This is because the latter perform a cache flush that takes =
time.
> >
> > My failures were caused by the erase-resume status read "seeing" a =
non-busy WSM. Adding a 20=B5s delay before that read (actually after th=
e command write, but it amounts to the same thing) prevents this from h=
appening. By the time awakened "wait-for-completion" code does its firs=
t status read it
> sees the WSM as busy as it should until the erase actually finishes.

Perhaps you can test for ESS(SR.6) too?
something like:
  if DWS && !ESS

 Jocke=
