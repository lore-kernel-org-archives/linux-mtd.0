Received: from web25010.mail.ukl.yahoo.com ([217.12.10.46])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CRPnE-0006pf-Cn
	for linux-mtd@lists.infradead.org; Tue, 09 Nov 2004 01:47:56 -0500
Message-ID: <20041109064750.74495.qmail@web25010.mail.ukl.yahoo.com>
Date: Tue, 9 Nov 2004 06:47:50 +0000 (GMT)
From: Chan Siu Ming <namely_void@yahoo.co.uk>
To: linux-mtd@lists.infradead.org
In-Reply-To: <b4618e0f04110820333b6140d3@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: Re: Getting mtd to work with IBM Evaluation boards (Ebony/Walnut)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 --- bandwidthcrunch <bandwidthcrunch@gmail.com>
wrote: 
>
http://kelp.or.kr/korweblog/stories.php?story=04/06/30/7742286
> is
> doing something with one of these boards .
 
I've noticed that, too, but my Korean must be a bit
rusty since most of the text seems incomprehensible.
 
> On Mon, 8 Nov 2004 21:19:32 +0000 (GMT), Chan Siu
> Ming
> <namely_void@yahoo.co.uk> wrote:
> > My problems are:
> > * There doesn't seem to be a map for Walnut
> boards,
> >   anyone has got one?
> > * Ebony can read from the flash well, but cannot
> > write.
> >   Flash_info says: "0 erase regions". Flash_unlock
> and
> >   all write attemps fail, when trying to open the
> >   device in O_RDWR or O_WRONLY mode. What might be
> >   the problem?

I looked at code in maps/ebony.c and it seems to use
map_rom for one the chips. That must be why it cannot
be written to. The chips are AM29F040 which are JEDEC
chips. If I change the map_rom to "jedec_probe", I
think it should work. But I would like to know why
it has been set to map_rom originally. Is there some
problem that makes the actual flash chip driver not
to work with Ebony board, or what?

--






	
	
		
___________________________________________________________ALL-NEW Yahoo! Messenger - all new features - even more fun! http://uk.messenger.yahoo.com
