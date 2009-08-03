Received: from mail.gw-instruments.de ([82.144.60.34]
	helo=redbean.intranet.gw-instruments.de)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MY554-0007AH-4P
	for linux-mtd@lists.infradead.org; Mon, 03 Aug 2009 21:28:35 +0000
Date: Mon, 3 Aug 2009 23:24:01 +0200 (CEST)
From: Peter Wippich <pewi@gw-instruments.de>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: [Patch 1/1] don't suspend erase for erase in cfi_cmdset_0002
In-Reply-To: <OF72036C94.805A993F-ONC1257607.004E3748-C1257607.004EB8F2@transmode.se>
Message-ID: <Pine.LNX.4.63.0908032256130.28700@redbean.intranet.gw-instruments.de>
References: <Pine.LNX.4.63.0908031237170.17084@redbean.intranet.gw-instruments.de>
	<OFB6C7C37A.2F2E4229-ONC1257607.00415F5E-C1257607.0041DA2F@transmode.se>
	<Pine.LNX.4.63.0908031457390.17084@redbean.intranet.gw-instruments.de>
	<OFBAEDF1C6.8F5FCB39-ONC1257607.00490427-C1257607.0049B758@LocalDomain>
	<OFFB406BDC.E5A2549B-ONC1257607.0049E3EA-C1257607.004A0DC0@transmode.se>
	<Pine.LNX.4.63.0908031541080.17084@redbean.intranet.gw-instruments.de>
	<OF72036C94.805A993F-ONC1257607.004E3748-C1257607.004EB8F2@transmode.se>
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


Hi Jocke,

On Mon, 3 Aug 2009, Joakim Tjernlund wrote:

> Hi again :)
> 
> I think mine is better because:
> 1) It matches cmdset_0001 and the code in general better.
> 2) It can handle FL_WRITING too.
> 
> But I am not the maintainer and I don't use 0002 myself, just trying to
> help out.
> 
> I hope you will constuct a cfip too for your JEDEC chips. It is no
> fun to be without erase suspend :(
> 

It's fine to have some discussion about that. From that at least we agree 
that something is wrong here. The main difference between the suggested 
patches is the change in behaviour from the current implementation. 
Currently the default behaviour is that erase suspend will work with jedec 
and cfi probed chips. I can not tell if this is by intention or by chance, 
but I think if we change something it should not break existing 
implementations.
So at least a final fix shall:
- use erase suspend for jedec chips for "read only" suspends were 
  cfip == NULL
- use erase suspend for all cfi probed chips for "read only" suspends
  if supported (as indicated by cfip->EraseSuspend)

And for the write case, I can not tell why the erase suspend is viewed to 
be broken here. If we change this,  as in your patch, severe testing is 
needed to make sure it is realy working. Currently I don't have the free 
resources to do this testing. Maybe we'll find some volunteer ?!.......

I'll try to find a fix which will not break current implementations and 
allows updates to implement erase suspend for writes easily. Appriciate 
your comments. 

BTW: who's the maintainer and what are her/his  thoughts. 

Ciao, 

Peter 


|       Peter Wippich                   Voice: +49 30 46776411          |
|       G&W Instruments GmbH            fax:   +49 30 46776419          |
|       Gustav-Meyer-Allee 25, Geb. 12  Email: pewi@gw-instruments.de   |
|       D-13355 Berlin  / Germany                                       |
