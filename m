Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NAiJY-0006pP-9W
	for linux-mtd@lists.infradead.org; Wed, 18 Nov 2009 11:03:12 +0000
In-Reply-To: <1258541677.27437.196.camel@localhost>
References: <4B012D0D.4080500@aimvalley.nl>	
	<1258446318.27437.60.camel@localhost>
	<4B02CE86.5000908@aimvalley.nl>
	<1258532918.27437.126.camel@localhost> <4B03BDBD.3040409@aimvalley.nl>
	<1258537224.27437.193.camel@localhost>	
	<OF0C424CF9.C5017633-ONC1257672.003A3412-C1257672.003A6DE6@transmode.se>
	<1258541677.27437.196.camel@localhost>
Subject: Re: a UBIFS image makes task pdflush blocked > 120 seconds
To: dedekind1@gmail.com
Message-ID: <OFF54BEA87.57D1F1F2-ONC1257672.003C37F0-C1257672.003C95F9@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Wed, 18 Nov 2009 12:01:45 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1@gmail.com> wrote on 18/11/2009 11:54:37:
>
> On Wed, 2009-11-18 at 11:38 +0100, Joakim Tjernlund wrote:
> > Artem Bityutskiy <dedekind1@gmail.com> wrote on 18/11/2009 10:40:24:
> > >
> > > On Wed, 2009-11-18 at 10:26 +0100, Norbert van Bolhuis wrote:
> > > > Artem Bityutskiy wrote:
> > > >
> > > > >
> > > > > The best way to say thanks is:
> > > > >
> > > > > 1. Add a small documentation section about your case to UBIFS howto, so
> > > > > others could benefit. You could send a patch against the MTD web-site:
> > > > > http://git.infradead.org/mtd-www.git
> > > > >
> > > >
> > > > Ok, I'll do this.
> > >
> > > Cool. I guess a section to this page would work well:
> > > http://www.linux-mtd.infradead.org/faq/ubifs.html
> > >
> > > > > 2. Make your solution work in upstream out-of-the box.
> > > > >
> > > >
> > > > The solution is to enable erase-suspend for writing for which
> > > > Joakim already sent earlier patches.
> > > > So if it's OK with him I will send the patch for cmdset_0002.
> >
> > I am fine with that, I sent them earlier because I wanted someone
> > with cmdset_0002 to pick them up, test and submit.
> >
> > >
> > > Why his patch is not in upstream yet? I think he mentioned some issues
> > > with modules.
> >
> > Nope, that was a another JFFS2 issue. Not related to this.
>
> I'm do not know CFI, but if you or Norbet re-submit the patch with CC to
> Nicolas, put some good description which problems it solves, tell that
> you tested it, I can help merging it by putting it to my l2-mtd-2.6.git.

That would be Norberts task, I only pointed out and suggested a fix for a bug
I found in cmdset_0002, I don't use cmdset_0002 so I have no intention
do any more work in this area. I merely tried to help out

       Jocke
