Received: from mail.gw-instruments.de ([82.144.60.34]
	helo=redbean.intranet.gw-instruments.de)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MYJ5X-0004gn-Jm
	for linux-mtd@lists.infradead.org; Tue, 04 Aug 2009 12:26:00 +0000
Date: Tue, 4 Aug 2009 14:21:25 +0200 (CEST)
From: Peter Wippich <pewi@gw-instruments.de>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: [Patch 1/1] don't suspend erase for erase in cfi_cmdset_0002
In-Reply-To: <OF1C80C3B2.7311AECA-ONC1257607.007CE8A8-C1257607.007DD956@transmode.se>
Message-ID: <Pine.LNX.4.63.0908041353290.30362@redbean.intranet.gw-instruments.de>
References: <Pine.LNX.4.63.0908031237170.17084@redbean.intranet.gw-instruments.de>
	<OFB6C7C37A.2F2E4229-ONC1257607.00415F5E-C1257607.0041DA2F@transmode.se>
	<Pine.LNX.4.63.0908031457390.17084@redbean.intranet.gw-instruments.de>
	<OFBAEDF1C6.8F5FCB39-ONC1257607.00490427-C1257607.0049B758@LocalDomain>
	<OFFB406BDC.E5A2549B-ONC1257607.0049E3EA-C1257607.004A0DC0@transmode.se>
	<Pine.LNX.4.63.0908031541080.17084@redbean.intranet.gw-instruments.de>
	<OF72036C94.805A993F-ONC1257607.004E3748-C1257607.004EB8F2@transmode.se>
	<Pine.LNX.4.63.0908032256130.28700@redbean.intranet.gw-instruments.de>
	<OF1C80C3B2.7311AECA-ONC1257607.007CE8A8-C1257607.007DD956@transmode.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


And Hi again, 

On Tue, 4 Aug 2009, Joakim Tjernlund wrote:

> Peter Wippich <pewi@gw-instruments.de> wrote on 03/08/2009 23:24:01:
> >
> >
> > Hi Jocke,
> >
> > On Mon, 3 Aug 2009, Joakim Tjernlund wrote:
> >
> > > Hi again :)
> > >
> > > I think mine is better because:
> > > 1) It matches cmdset_0001 and the code in general better.
> > > 2) It can handle FL_WRITING too.
> > >
> > > But I am not the maintainer and I don't use 0002 myself, just trying to
> > > help out.
> > >
> > > I hope you will constuct a cfip too for your JEDEC chips. It is no
> > > fun to be without erase suspend :(
> > >
> >
> > It's fine to have some discussion about that. From that at least we agree
> > that something is wrong here. The main difference between the suggested
> > patches is the change in behaviour from the current implementation.
> > Currently the default behaviour is that erase suspend will work with jedec
> > and cfi probed chips. I can not tell if this is by intention or by chance,
> > but I think if we change something it should not break existing
> > implementations.
> > So at least a final fix shall:
> > - use erase suspend for jedec chips for "read only" suspends were
> >   cfip == NULL
> 
> Are you sure all JEDEC chips support RO suspends? If not,
> I think this is a 3 step/pathes procedure:
> 1) Just fix the if stmt as I outlined. Then JEDEC chips wont bug, but won't have erase
>    suspend either unless:
> 
> 2) Add a fixup for your JEDEC flash that fills in the erase suspend bits you need. If all
>    JEDEC chips support RO suspends you can do a JEDEC generic fixup that adds this capability
>    to cfip.
> 
> 3) remove the FIXME and test if it works for you. Send it to the
>    list too and ask for some testing.
> 
> > - use erase suspend for all cfi probed chips for "read only" suspends
> >   if supported (as indicated by cfip->EraseSuspend)
> >
> > And for the write case, I can not tell why the erase suspend is viewed to
> > be broken here. If we change this,  as in your patch, severe testing is
> > needed to make sure it is realy working. Currently I don't have the free
> > resources to do this testing. Maybe we'll find some volunteer ?!.......
> >
> > I'll try to find a fix which will not break current implementations and
> > allows updates to implement erase suspend for writes easily. Appriciate
> > your comments.
> >
> > BTW: who's the maintainer and what are her/his  thoughts.
> 
> Don't konw.
 
Partly disagree. For Step 1 we shall leave erase suspend active for Jedec 
Chips because this is the current behaviour. If this behaviour is wrong 
we would have seen a lot of complains on the list (which aren't there). 
If we change the default behaviour then we have to add fxups for each and 
every Jedec chip which is used out there and supports erase suspend. And 
from cherry picking in the long list most chips which use 
cfi_cmdset_0002 support erase suspend. 

And BTW: I realy hate this "cfip->EraseSuspend & 0x1" stuff. Nobody knows 
what this is unless going through the CFI specification. It would make 
the code much better readable if we introduce some symbolic constants 
here. 

Ciao, 

Peter 
