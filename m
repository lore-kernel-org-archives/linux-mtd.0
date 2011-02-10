In-Reply-To: <OF4E49CFD6.F0E578FE-ONC1257833.004BF8B1-C1257833.004D48AA@transmode.se>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>	<OF0B032533.FA33B99E-ONC125782D.003AF89B-C125782D.003B43AA@transmode.se>
	<4D4BDD48.6040600@keymile.com>	<OF5A6BB547.3462D591-ONC125782D.00475578-C125782D.0047EC74@transmode.se>
	<541E19B8-D428-4F59-B6BB-A3BD8F455AE4@prograde.net>		<OF42EF<F66AF016-8A2B-4116-BE49-CE05B91BE50F@prograde.net>
	<OF56DD046D.3279E067	<9098074B-C8F0-4608-BE25-D99A4C22176B@prograde.net>	<0488D3BA-7BA3-4E98-B289-3F3D1DB485D4@prograde.net>
	<OF2C1ABD39	<4D5005E4.1040506@keymile.com>	<OFFF2C6D34.91E5D6C3-ONC1257	<96BD3889-E8AD-408D-8275-ED1A5FD55F1B@prograde.net>
	<OF9738D658.F46	<4C117A67-5057-4ACD-8EBE-04E9C782570C@prograde.net>	<OF6D40AC82.1008D3DD-ONC1
	<4D53E660.4020305@users.sourceforge.net>
	<OF4E49CFD6.F0E578FE-ONC1257833.004BF8B1-C1257833.004D48AA@transmode.se>
Subject: Re: Numonyx NOR and chip->mutex bug?
Message-ID: <OF1160F22A.C6961712-ONC1257833.00526535-C1257833.0052DAD1@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 10 Feb 2011 16:04:59 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=UTF-8
Cc: linux-mtd-bounces@lists.infradead.org, stefan.bigler@keymile.com,
	Michael Cashwell <mboards@prograde.net>, linux-mtd@lists.infradead.org,
	=?ISO-8859-15?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>,
	Holger brunck <holger.brunck@keymile.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> Anders Grafström <grfstrm@users.sourceforge.net> wrote on 2011/02/10 14:21:36:
> >
> > On 2011-02-09 22:59, Michael Cashwell wrote:
> > > On Feb 9, 2011, at 3:13 PM, Joakim Tjernlund wrote:
> > >
> > >> hmm, this sounds similar(from http://www.numonyx.com/Documents/Specification%20Updates/SU-309045_P30.pdf)
> > >>
> > >> 5. W602: erase suspend resume operation
> > >> Problem: P30 product may fail to erase in intensive erase/suspend/resume environments. This is
> > >>        due to an internal firmware issue that is exhibited in certain applications that require at
> > >>       least 3000 to 4000 erase/suspend/resume cycles during the erase of a single block.
> > >> Implication: Customer may see erase failure (SR reports “A0”) during a background erase. This
> > >>                does not damage the device in any way, but data in the block may be disturbed from its
> > >>               original state.
> >
> > I've seen this issue with Intel 28F640J5 chips as well.
> >
> > There's an old thread on it.
> > http://lists.infradead.org/pipermail/linux-mtd/2008-April/021266.html
> >
> > A delay was suggested similar to the one you're experimenting with I think.
> > http://lists.infradead.org/pipermail/linux-mtd/2008-April/021436.html
>
> Oh, I had forgotten about this thread :)
>
> I agree with the latency theory, for Numonyx there is this:
>
> W602 is the typical time between an initial block erase or erase resume command and the a subsequent erase suspend
> command. Violating the specification repeatedly during any particular block erase may cause erase failures.
>
> W602 is defined to 500us
>
> Adding a delay after resume will do it but is a bit crude. Possibly one
> could add a timestamp at resume/initial erase and a check in suspend that enough time has passed
> before suspending again.
>
> How does that sound?

A simpler impl. would be a suspend counter. When no. of suspends > 1000, do usleep(500)
or usleep(500) every 100-500 suspends.

 Jocke
