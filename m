Received: from ganon.smb.utfors.se ([195.58.112.27])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GLMZ-0000Qo-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2002 15:41:31 +0000
Received: from LUMENTIS02 ([212.105.56.242])
 by ganon.smb.utfors.se (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H6500L4E3O0NP@ganon.smb.utfors.se> for
 linux-mtd@lists.infradead.org; Mon, 25 Nov 2002 17:12:01 +0100 (MET)
Date: Mon, 25 Nov 2002 17:12:00 +0100
From: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
Subject: RE: crc32() optimization
In-reply-to: <3DE24808.2040606@WirelessNetworksInc.com>
To: Herman Oosthuysen <Herman@WirelessNetworksInc.com>,
 linux-mtd@lists.infradead.org
Reply-to: joakim.tjernlund@lumentis.se
Message-id: <IGEFJKJNHJDCBKALBJLLGEENFIAA.joakim.tjernlund@lumentis.se>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Yes, there are. In 2.5 these has been replace with a common lib(see lib/crc32.c).
I have a back port to 2.4, but first we try get the optimized version into 2.5 and
then do a new back port to 2.4 and then try to get that into 2.4.

The final 2.5 patch should appear sometime today on lkm.

  Jocke

> 
> Is there not a look-up table based CRC32 elsewhere in the kernel already?
> 
> Multiple CRC32 algorithms seem to me to be a terrible waste.
> -- 
> 
> ------------------------------------------------------------------------
> Herman Oosthuysen
> B.Eng.(E), Member of IEEE
> Wireless Networks Inc.
> http://www.WirelessNetworksInc.com
> E-mail: Herman@WirelessNetworksInc.com
> Phone: 1.403.569-5687, Fax: 1.403.235-3965
> ------------------------------------------------------------------------
> 
> 
> Marc Singer wrote:
> > On Mon, Nov 11, 2002 at 02:37:33AM +0100, Wolfgang Denk wrote:
> > 
> >>In message <20021111013114.GB27214@buici.com> you wrote:
> >>
> >>>>>What's "Duff's Device"?
> >>>>
> >>>>It's a tricky way to implement general loop unrolling directly in  C.
> >>>>Applied  to your problem, code that looks like this (instead of 8 any
> >>>>other loop count may be used, but  you  need  to  adjust  the  "case"
> >>>>statements then):
> >>>>
> >>>>	register int n = (len + (8-1)) / 8;
> >>>>
> >>>>	switch (len % 8) {
> >>>>	case 0: do {	val = crc32_table ... ;
> >>>>	case 7:		val = crc32_table ... ;
> >>>>	case 6:		val = crc32_table ... ;
> >>>>	case 5:		val = crc32_table ... ;
> >>>>	case 4:		val = crc32_table ... ;
> >>>>	case 3:		val = crc32_table ... ;
> >>>>	case 2:		val = crc32_table ... ;
> >>>>	case 1:		val = crc32_table ... ;
> >>>>		} while (--n > 0);
> >>>>	}
> >>>
> >>>This doesn't look right to me.  You are decrementing n but using the
> >>>modulus of len in the switch.  The len modulus is correct when n == 1,
> >>>but not when n > 1.  The idea makes sense, but the implementation
> >>>appears to be missing a detail.
> >>
> >>You don't understand. The  switch  is  only  needed  for  the  first,
> >>partial loop where we want less than N statements; then we're nunning
> >>the remaining fully unrolled loos in the do{}while loop.
> > 
> > 
> > I see.  I misread the code.  I cannot see why this would not be better
> > than the original poster's version.  I'll test it on my code to see if
> > there is an improvement. 
> > 
> > 
> > 
> >>>As for performance problems, I believe that the trouble is evident
> >>>from the assembler output.  The reason that the unrolled loop is more
> >>>efficient than the simple loop is mainly because you don't jump as
> >>>often.  We all know that jumps tend to perturb the instruction fetch
> >>>queue and cache.
> >>
> >>Did you enable optimization?
> > 
> > 
> > Indeed.  But it doesn't matter since it executes the switch jump only
> > one time.
> > 
> > 
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> > 
> 
> -- 
> 
> ------------------------------------------------------------------------
> Herman Oosthuysen
> B.Eng.(E), Member of IEEE
> Wireless Networks Inc.
> http://www.WirelessNetworksInc.com
> E-mail: Herman@WirelessNetworksInc.com
> Phone: 1.403.569-5687, Fax: 1.403.235-3965
> ------------------------------------------------------------------------
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
