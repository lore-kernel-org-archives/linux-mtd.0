Received: from ns4a.townisp.com ([216.195.0.137] helo=ns4.townisp.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BAZ7K-0008DV-H6
	for linux-mtd@lists.infradead.org; Mon, 05 Apr 2004 19:46:43 +0100
Date: Mon, 5 Apr 2004 14:46:22 -0400 (EDT)
From: Jamie Guinan <guinan@bluebutton.com>
To: Thayne Harbaugh <tharbaugh@lnxi.com>
In-Reply-To: <1081179116.4799.140.camel@tubarao>
Message-ID: <Pine.LNX.4.44.0404051426360.32515-100000@gemini.home.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: linux-mtd@lists.infradead.org
Subject: Re: SST 39VF1601
Reply-To: Jamie Guinan <guinan@bluebutton.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5 Apr 2004, Thayne Harbaugh wrote:

> On Fri, 2004-04-02 at 16:30, Jamie Guinan wrote:
> > Hello,
> > 
> > I've been struggling to get a pair of these chips working, under Linux
> > 2.6.4, on a custom ARM board based on the Sharp/LogicPD LPD7A404.  I have
> > two 1Mbx16 chips side-by-side for 32-bit data access.
> > 
> > The chip is not CFI compliant, as is the case with a similar chip
> > mentioned in this thread,
> > 
> >    http://lists.infradead.org/pipermail/linux-mtd/2002-May/005059.html
> > 
> > but unfortunately that thread kind of petered out without a clear
> > solution.
> 
> I read the thread - it sounds interesting re. the  three write sequence
> rather than the typical two.  Sick.  SST seems to be quite creative in
> thinking up ways to make their parts non-standard.  I could go on about
> some of their other parts that they claim have particular *features*
> that are better know to me as *bugs* and lack of attention to details,
> but this is a family mailing list and my comments wouldn't be
> appropriate.

Acknowledged.  :)

<snip>

> > [1]
> > 
> > #define SST39VF1601     0x234b
> > 
> > ...
> > 
> >          }, {
> >                 .mfr_id         = MANUFACTURER_SST,
> >                 .dev_id         = SST39VF1601,
> >                 .name           = "SST 39VF1601",
> >                 /* I don't think this is supported.*/
> >                 .uaddr          = {
> >                   [0] = MTD_UADDR_UNNECESSARY,
> >                   [1] = MTD_UADDR_UNNECESSARY,
> 
> Shouldn't this be MTD_UADDR_0x5555_0x2AAA?

I tried that, and the code goes through this path in jedec_probe_chip():

		switch(unlockpass++) {
		case 0:
			cfi->addr_unlock1 |= cfi->addr_unlock1 << 4;
			cfi->addr_unlock2 |= cfi->addr_unlock2 << 4;
			goto retry;

which leaves the values as follows,

  cfi->addr_unlock1 = 0xaaaa 
  cfi->addr_unlock2 = 0x5554

Then later in jedec_match() it fails this test,

	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): check unlock addrs 0x%.4x 0x%.4x\n",
	       __func__, cfi->addr_unlock1, cfi->addr_unlock2 );
	if ( MTD_UADDR_UNNECESSARY != uaddr && MTD_UADDR_DONT_CARE != uaddr
	     && ( unlock_addrs[uaddr].addr1 != cfi->addr_unlock1
		  || unlock_addrs[uaddr].addr2 != cfi->addr_unlock2 ) ) {
		DEBUG( MTD_DEBUG_LEVEL3,
		       "MTD %s(): 0x%.4x 0x%.4x did not match\n",
		       __func__,
		       unlock_addrs[uaddr].addr1,
		       unlock_addrs[uaddr].addr2 );
		goto match_done;
	}

I could try adding a new enum uaddr MTD_UADDR_0x5554_0xAAAA and
corresponding unlock_addrs[] entry, if that doesn't sound
unreasonable.

> >                   [2] = MTD_UADDR_UNNECESSARY,
> >                 },
> >                 .DevSize        = SIZE_128KiB,
> >                 .CmdSet         = P_ID_AMD_STD,
> >                 .NumEraseRegions= 1,
> >                 .regions        = {
> >                         ERASEINFO(0x01000,64),
> 
> Shouldn't this be ERASEINFO(0x00800, 64)?

The chip supports 2k sector or 32k block erase, so I think either of
ERASEINFO(0x00800,1024) ERASEINFO(0x08000,64) or should work.

Btw, current DEBUG messages look like,
  Search for id:(bf 234b) interleave(2) type(2)
  MTD jedec_match(): Check fit 0x00000000 + 0x00200000 = 0x00200000
  MTD jedec_match(): check unlock addrs 0xaaaa 0x5554
  MTD jedec_match(): 0x5555 0x2aaa did not match

Cheers,
-Jamie
