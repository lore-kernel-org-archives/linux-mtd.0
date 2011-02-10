Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PnYnl-0005og-OA
	for linux-mtd@lists.infradead.org; Thu, 10 Feb 2011 15:51:26 +0000
In-Reply-To: <AACADCF3-69C5-4D7F-810F-6E60945769BC@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>	<OF0B032533.FA33B99E-ONC125782D.003AF89B-C125782D.003B43AA@transmode.se>
	<4D4BDD48.6040600@keymile.com>
	<OF5A6BB547.3462D591-ONC125782D.00475578-C125782D.0047EC74@transmode.se>
	<541E19B8-D428-4F59-B6BB-A3BD8F455AE4@prograde.net>
	<OF42EF<F66AF016-8A2B-4116-BE49-CE05B91BE50F@prograde.net>
	<OF56DD046D.3279E067
	<9098074B-C8F0-4608-BE25-D99A4C22176B@prograde.net>	<0488D3BA-7BA3-4E98-B289-3F3D1DB485D4@prograde.net>
	<OF2C1ABD39
	<4D5005E4.1040506@keymile.com>	<OFFF2C6D34.91E5D6C3-ONC1257	<96BD3889-E8AD-408D-8275-ED1A5FD55F1B@prograde.net>
	<OF9738D658.F46
	<4C117A67-5057-4ACD-8EBE-04E9C782570C@prograde.net>	<OF6D40AC82.1008D3DD-ONC1
	<4D53E660.4020305@users.sourceforge.net> <OF4E49CFD6
	<AACADCF3-69C5-4D7F-810F-6E60945769BC@prograde.net>
Subject: Re: Numonyx NOR and chip->mutex bug?
To: Michael Cashwell <mboards@prograde.net>
Message-ID: <OF99405172.EDDBCEBE-ONC1257833.0056D2A4-C1257833.005719A5@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 10 Feb 2011 16:51:21 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=ISO-8859-15
Content-transfer-encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, stefan.bigler@keymile.com,
	Holger brunck <holger.brunck@keymile.com>,
	=?ISO-8859-15?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Michael Cashwell <mboards@prograde.net> wrote on 2011/02/10 16:43:40:
>
> On Feb 10, 2011, at 9:04 AM, Joakim Tjernlund wrote:
>
> > Anders Grafstr=F6m <grfstrm@users.sourceforge.net> wrote on 2011/02=
/10 14:21:36:
> >
> >> I've seen this issue with Intel 28F640J5 chips as well.
> >>
> >> There's an old thread on it.
> >> http://lists.infradead.org/pipermail/linux-mtd/2008-April/021266.h=
tml
> >>
> >> A delay was suggested similar to the one you're experimenting with=
 I think.
> >> http://lists.infradead.org/pipermail/linux-mtd/2008-April/021436.h=
tml
> >
> > Oh, I had forgotten about this thread :)
> >
> > I agree with the latency theory, for Numonyx there is this:
> >
> > W602 is the typical time between an initial block erase or erase re=
sume command and the a subsequent erase suspend
> > command. Violating the specification repeatedly during any particul=
ar block erase may cause erase failures.
>
> Interesting. I saw the W602 value but it also talks about "erase fail=
ures" which are not precisely what I'm seeing. I see failed buffered wr=
ite. But it's sounding like the issue anyway.
>
> I've just instrumented a suspend count and the erase that was active =
when a failed write occurred was suspended 29 times. That's not really =
very high so it fits with the idea that the issue is not the number of =
suspend/resumes but their timing.

29 sounds very low, it may be some additional issue you see.

>
> > W602 is defined to 500us
> >
> > Adding a delay after resume will do it but is a bit crude. Possibly=
 one could add a timestamp at resume/initial erase and a check in suspe=
nd that enough time has passed before suspending again.
> >
> > How does that sound?
>
>
> I like this idea but how do we deal with the lack of precision? 500=B5=
s "typical" and violating this timing "repeatedly"? Yuk. Without hard n=
umbers coding it will be tricky. And what about this all being Numonyx-=
specific? Do we need to key off of the manufacturer ID or does it apply=
 to all chips
handled by this cmd set?
>
> Lastly, what's the general kernel API for =B5s resolution time? I rec=
all having issues in the past when high-resolution timers is not enable=
d in the kernel config.

I don't know, I have seen drivers(mpc52xx_spi.c) use get_tbl() though.=
