Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BAWBF-0007NN-Fp
	for linux-mtd@lists.infradead.org; Mon, 05 Apr 2004 16:38:33 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Jamie Guinan <guinan@bluebutton.com>
In-Reply-To: <Pine.LNX.4.44.0404021808100.22997-100000@gemini.home.net>
References: <Pine.LNX.4.44.0404021808100.22997-100000@gemini.home.net>
Content-Type: text/plain
Message-Id: <1081179116.4799.140.camel@tubarao>
Mime-Version: 1.0
Date: 05 Apr 2004 09:31:57 -0600
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

On Fri, 2004-04-02 at 16:30, Jamie Guinan wrote:
> Hello,
> 
> I've been struggling to get a pair of these chips working, under Linux
> 2.6.4, on a custom ARM board based on the Sharp/LogicPD LPD7A404.  I have
> two 1Mbx16 chips side-by-side for 32-bit data access.
> 
> The chip is not CFI compliant, as is the case with a similar chip
> mentioned in this thread,
> 
>    http://lists.infradead.org/pipermail/linux-mtd/2002-May/005059.html
> 
> but unfortunately that thread kind of petered out without a clear
> solution.

I read the thread - it sounds interesting re. the  three write sequence
rather than the typical two.  Sick.  SST seems to be quite creative in
thinking up ways to make their parts non-standard.  I could go on about
some of their other parts that they claim have particular *features*
that are better know to me as *bugs* and lack of attention to details,
but this is a family mailing list and my comments wouldn't be
appropriate.

> I made some progress by adding a few bits to jedec_probe.c[1], and I got 
> as far as this:
> 
> Search for id:(bf 234b) interleave(2) type(2)

I was a bit confused, but then I realized that the thread mentioned
above is an SST39VF160 and your part is an SST39VF1601.

> MTD jedec_match(): Check fit 0x00000000 + 0x00020000 = 0x00020000
> MTD jedec_match(): check unlock addrs 0xaaaa 0x5554
> MTD jedec_match(): check ID's disappear when not in ID mode
> MTD jedec_match(): return to ID mode
> MTD jedec_probe_chip(): matched device 0xbf,0x234b unlock_addrs: 0xaaaa 0x5554
> Found: SST 39VF1601

> Things get a bit weird after that (Probe at addr_unlock1 ... past the
> end), but I wanted to start with the basics.

I hesitate to say that's broken in some respects.  Some chips take
addresses outside of their address space.  I guess that if such a chip
is in use then it needs to have more space than just the read size
mapped.  I can think of a few cases where this should be fixed.

> Questions:
> 
> 1) What are "unlock addrs"?

The unlock addrs are the special sequences that are written for starting
a destructive operation such as an erase or a write.  The name could
possibly be confused with locking/unlocking regions of the flash for
read/write, but that's what they have been historically called.

>  The chip does not have an "unlock bypass"
> mode like I've seen in other chips, if that is what it means.  Will not
> having this cause problems later on?  I'm using MTD_UADDR_UNNECESSARY for
> all 3 .uaddr[] elements.

Shouldn't cause problems later on.  If you want to erase and program
then the unlock addrs are necessary - they're even necessary for
entering ID mode.  How you get the above sequence of DEBUG messages when
the unlock addrs are set to MTD_UADDR_UNNECESSARY is confusing.

> 
> 2) The .DevSize field is per-chip or for the pair of devices?
> I obviously haven't set that right yet.

Per chip - it is multiplied for interleaved chips.

> 
> -Jamie
> 
> [1]
> 
> #define SST39VF1601     0x234b
> 
> ...
> 
>          }, {
>                 .mfr_id         = MANUFACTURER_SST,
>                 .dev_id         = SST39VF1601,
>                 .name           = "SST 39VF1601",
>                 /* I don't think this is supported.*/
>                 .uaddr          = {
>                   [0] = MTD_UADDR_UNNECESSARY,
>                   [1] = MTD_UADDR_UNNECESSARY,

Shouldn't this be MTD_UADDR_0x5555_0x2AAA?

>                   [2] = MTD_UADDR_UNNECESSARY,
>                 },
>                 .DevSize        = SIZE_128KiB,
>                 .CmdSet         = P_ID_AMD_STD,
>                 .NumEraseRegions= 1,
>                 .regions        = {
>                         ERASEINFO(0x01000,64),

Shouldn't this be ERASEINFO(0x00800, 64)?

>                 }

-- 
Thayne Harbaugh
Linux Networx
