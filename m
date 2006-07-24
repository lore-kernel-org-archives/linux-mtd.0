Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G4yqG-0006sI-Ho
	for linux-mtd@lists.infradead.org; Mon, 24 Jul 2006 07:44:10 -0400
Date: Mon, 24 Jul 2006 13:43:22 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Wolfgang Denk <wd@denx.de>
Subject: Re: Bit Field Programming for Spansion MirrorBit Flashes
Message-ID: <20060724114322.GC20849@wohnheim.fh-wedel.de>
References: <20060723220027.2D872352B36@atlas.denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060723220027.2D872352B36@atlas.denx.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 24 July 2006 00:00:27 +0200, Wolfgang Denk wrote:
> 
> Has anybody noticed the Spansion Software Application Note titled
> "Bit Field Programming for Flash Products Based on 230-nm and 200-nm
> MirrorBit(TM) Technology" at
> http://www.spansion.com/application_notes/bitfieldprogMirrorbit_an_a3_e.pdf
> ?
> 
> This seems to be an (intentionally ?) obscure description of  serious
> problems  with the Spansion 'M' type MirrorBit flash chips. In short,
> when reprogramming the  same  flash  addresses  (like  when  changing
> individual  bits  in  a  byte  from 1 to 0) this may (a) just work as
> expected, (b) leave the bits that should become 0 unchanged (1),  (c)
> change the data stored at other addresses (!) [I am aware that the AN
> quoted  above  does  not go into such detail. Please contact Spansion
> support in case you want to know more.]
> 
> No need to say that (b) and especially (c) are .... really nasty.
> 
> 
> >From what I've seen, none of the existing flash drivers  attempts  to
> implement the suggested workaround.
> 
> 
> Any recommendations what to do (except avoiding  'M'  type  MirrorBit
> flashes) ?

Judging by your description alone, the flashes effectively require
that no part of the flash is written to twice.  So you just need to
pick some writesize greater zero and set it in the flash driver.  And
possibly fix a bug or two afterwards, but in principle...

Jörn

-- 
If you're willing to restrict the flexibility of your approach,
you can almost always do something better.
-- John Carmack
