Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BAa2U-0000K1-Ax
	for linux-mtd@lists.infradead.org; Mon, 05 Apr 2004 20:45:46 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Jamie Guinan <guinan@bluebutton.com>
In-Reply-To: <Pine.LNX.4.44.0404051426360.32515-100000@gemini.home.net>
References: <Pine.LNX.4.44.0404051426360.32515-100000@gemini.home.net>
Content-Type: text/plain
Message-Id: <1081193953.4799.185.camel@tubarao>
Mime-Version: 1.0
Date: 05 Apr 2004 13:39:13 -0600
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: SST 39VF1601
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-04-05 at 12:46, Jamie Guinan wrote:
> On 5 Apr 2004, Thayne Harbaugh wrote:
> 
> > On Fri, 2004-04-02 at 16:30, Jamie Guinan wrote:

> > > [1]
> > > 
> > > #define SST39VF1601     0x234b
> > > 
> > > ...
> > > 
> > >          }, {
> > >                 .mfr_id         = MANUFACTURER_SST,
> > >                 .dev_id         = SST39VF1601,
> > >                 .name           = "SST 39VF1601",
> > >                 /* I don't think this is supported.*/
> > >                 .uaddr          = {
> > >                   [0] = MTD_UADDR_UNNECESSARY,
> > >                   [1] = MTD_UADDR_UNNECESSARY,
> > 
> > Shouldn't this be MTD_UADDR_0x5555_0x2AAA?
> 
> I tried that, and the code goes through this path in jedec_probe_chip():
> 
> 		switch(unlockpass++) {
> 		case 0:
> 			cfi->addr_unlock1 |= cfi->addr_unlock1 << 4;
> 			cfi->addr_unlock2 |= cfi->addr_unlock2 << 4;
> 			goto retry;
> 
> which leaves the values as follows,
> 
>   cfi->addr_unlock1 = 0xaaaa 
>   cfi->addr_unlock2 = 0x5554

self.kick(force="hard")

Okay, I've been looking at jedec_probe.c v1.45 and linux-2.6.4 uses
jedec_probe.c v1.29.  It's going to take me a bit to remember all the
quirks of 1.29.  You might be better off trying to update at least your
jedec_probe.c (should be independent of other updates - don't trust me
on that, though).

> Then later in jedec_match() it fails this test,
> 
> 	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): check unlock addrs 0x%.4x 0x%.4x\n",
> 	       __func__, cfi->addr_unlock1, cfi->addr_unlock2 );
> 	if ( MTD_UADDR_UNNECESSARY != uaddr && MTD_UADDR_DONT_CARE != uaddr
> 	     && ( unlock_addrs[uaddr].addr1 != cfi->addr_unlock1
> 		  || unlock_addrs[uaddr].addr2 != cfi->addr_unlock2 ) ) {
> 		DEBUG( MTD_DEBUG_LEVEL3,
> 		       "MTD %s(): 0x%.4x 0x%.4x did not match\n",
> 		       __func__,
> 		       unlock_addrs[uaddr].addr1,
> 		       unlock_addrs[uaddr].addr2 );
> 		goto match_done;
> 	}

Yeah, if the unlock addrs are incorrect then it will fail the sanity
checks.

> I could try adding a new enum uaddr MTD_UADDR_0x5554_0xAAAA and
> corresponding unlock_addrs[] entry, if that doesn't sound
> unreasonable.

Right now, I suggest adding some simple hacks to get the thing working. 
Once you can read and then write to the chip it would be worth while to
figure out how to make it work in the framework.

> 
> > >                   [2] = MTD_UADDR_UNNECESSARY,
> > >                 },
> > >                 .DevSize        = SIZE_128KiB,
> > >                 .CmdSet         = P_ID_AMD_STD,
> > >                 .NumEraseRegions= 1,
> > >                 .regions        = {
> > >                         ERASEINFO(0x01000,64),
> > 
> > Shouldn't this be ERASEINFO(0x00800, 64)?
> 
> The chip supports 2k sector or 32k block erase, so I think either of
> ERASEINFO(0x00800,1024) ERASEINFO(0x08000,64) or should work.

I might be particularly dense today (it's happened before 8^).  I just
re-read and the size is 2k words which is ERASEINFO(0x01000,512):

0x01000 Bytes = 2**12 Bytes = 4 KiB
4 KiB * 512 = 2 MiB = 16 Mib
-or-
512 = 2**9
2**12 Bytes * 2**9 = 2**21 = 2 MiB = 16 Mib

Shouldn't .DevSize be SIZE_2MiB?  Isn't the part 16 Mib = 2 MiB?

> Btw, current DEBUG messages look like,
>   Search for id:(bf 234b) interleave(2) type(2)
>   MTD jedec_match(): Check fit 0x00000000 + 0x00200000 = 0x00200000
>   MTD jedec_match(): check unlock addrs 0xaaaa 0x5554
>   MTD jedec_match(): 0x5555 0x2aaa did not match

Expected.

-- 
Thayne Harbaugh
Linux Networx
