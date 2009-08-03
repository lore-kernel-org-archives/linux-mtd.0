Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MY6QS-0008UI-QZ
	for linux-mtd@lists.infradead.org; Mon, 03 Aug 2009 22:54:45 +0000
In-Reply-To: <Pine.LNX.4.63.0908032256130.28700@redbean.intranet.gw-instruments.de>
References: <Pine.LNX.4.63.0908031237170.17084@redbean.intranet.gw-instruments.de>
	<OFB6C7C37A.2F2E4229-ONC1257607.00415F5E-C1257607.0041DA2F@transmode.se>
	<Pine.LNX.4.63.0908031457390.17084@redbean.intranet.gw-instruments.de>
	<OFBAEDF1C6.8F5FCB39-ONC1257607.00490427-C1257607.0049B758@LocalDomain>
	<OFFB406BDC.E5A2549B-ONC1257607.0049E3EA-C1257607.004A0DC0@transmode.se>
	<Pine.LNX.4.63.0908031541080.17084@redbean.intranet.gw-instruments.de>
	<OF72036C94.805A993F-ONC1257607.004E3748-C1257607.004EB8F2@transmode.se>
	<Pine.LNX.4.63.0908032256130.28700@redbean.intranet.gw-instruments.de>
Subject: Re: [Patch 1/1] don't suspend erase for erase in cfi_cmdset_0002
To: Peter Wippich <pewi@gw-instruments.de>
Message-ID: <OF1C80C3B2.7311AECA-ONC1257607.007CE8A8-C1257607.007DD956@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Tue, 4 Aug 2009 00:54:36 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Peter Wippich <pewi@gw-instruments.de> wrote on 03/08/2009 23:24:01:
>
>
> Hi Jocke,
>
> On Mon, 3 Aug 2009, Joakim Tjernlund wrote:
>
> > Hi again :)
> >
> > I think mine is better because:
> > 1) It matches cmdset_0001 and the code in general better.
> > 2) It can handle FL_WRITING too.
> >
> > But I am not the maintainer and I don't use 0002 myself, just trying to
> > help out.
> >
> > I hope you will constuct a cfip too for your JEDEC chips. It is no
> > fun to be without erase suspend :(
> >
>
> It's fine to have some discussion about that. From that at least we agree
> that something is wrong here. The main difference between the suggested
> patches is the change in behaviour from the current implementation.
> Currently the default behaviour is that erase suspend will work with jedec
> and cfi probed chips. I can not tell if this is by intention or by chance,
> but I think if we change something it should not break existing
> implementations.
> So at least a final fix shall:
> - use erase suspend for jedec chips for "read only" suspends were
>   cfip == NULL

Are you sure all JEDEC chips support RO suspends? If not,
I think this is a 3 step/pathes procedure:
1) Just fix the if stmt as I outlined. Then JEDEC chips wont bug, but won't have erase
   suspend either unless:

2) Add a fixup for your JEDEC flash that fills in the erase suspend bits you need. If all
   JEDEC chips support RO suspends you can do a JEDEC generic fixup that adds this capability
   to cfip.

3) remove the FIXME and test if it works for you. Send it to the
   list too and ask for some testing.

> - use erase suspend for all cfi probed chips for "read only" suspends
>   if supported (as indicated by cfip->EraseSuspend)
>
> And for the write case, I can not tell why the erase suspend is viewed to
> be broken here. If we change this,  as in your patch, severe testing is
> needed to make sure it is realy working. Currently I don't have the free
> resources to do this testing. Maybe we'll find some volunteer ?!.......
>
> I'll try to find a fix which will not break current implementations and
> allows updates to implement erase suspend for writes easily. Appriciate
> your comments.
>
> BTW: who's the maintainer and what are her/his  thoughts.

Don't konw.
