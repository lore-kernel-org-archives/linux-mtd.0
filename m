Received: from host-212-158-219-180.bulldogdsl.com ([212.158.219.180]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CCGsx-0005Q7-71
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2004 08:15:12 -0400
Date: Tue, 28 Sep 2004 13:15:07 +0100
From: Ben Dooks <ben-mtd@fluff.org>
To: "Eric W. Biederman" <ebiederman@lnxi.com>
Message-ID: <20040928121507.GE22627@home.fluff.org>
References: <20040920234450.GA17169@home.fluff.org>
	<m3brfxycuf.fsf@maxwell.lnxi.com>
	<20040923210150.GF25491@home.fluff.org>
	<m3r7ossm5q.fsf@maxwell.lnxi.com>
	<m3pt4cqohc.fsf_-_@maxwell.lnxi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m3pt4cqohc.fsf_-_@maxwell.lnxi.com>
Sender: Ben Dooks <ben@fluff.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [CFT] FIX CFI cmdset 0002 for x16 and x32 devices.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 23, 2004 at 10:29:03PM -0600, Eric W. Biederman wrote:
> ebiederman@lnxi.com (Eric W. Biederman) writes:
> 
> > So it looks like the TODO item is to just look up what cfi standard
> > says are the unlock addresses for cfi command set 2. And make certain
> > the cfi hard codes are correct and nothing should be broken.
> 
> Looking at cfi specification and the AMD/Fujitsu specific
> portion of it.  This is what the CFI address assignment code
> needs to look like:
> 
> 		/* Set the default CFI lock/unlock addresses */
> 		cfi->addr_unlock1 = 0x555;
> 		cfi->addr_unlock2 = 0x2aa;
> 		/* Modify the unlock address if we are in compatibility mode */
> 		if (	/* x16 in x8 mode */
> 			((cfi->device_type == CFI_DEVICETYPE_X8) && 
> 				(cfi->cfiq->InterfaceDesc == 2)) ||
> 			/* x32 in x16 mode */
> 			((cfi->device_type == CFI_DEVICETYPE_X16) &&
> 				(cfi->cfiq->InterfaceDesc == 4))) 
> 		{
> 			cfi->addr_unlock1 = 0xaaa;
> 			cfi->addr_unlock2 = 0x555;
> 		}
> 
> 
> The previous code to handle this was quite bogus.  Unless I completely
> cannot read the code.
> 
> I have committed this change and corresponding change to use
> cfi_send_gen_cmd.
> 
> Will people please test this?

I've just had a chance to test this on my EB2410ITX (BAST) and it
seems to work (erased and then zeroed the spare partition). I'll
try and bootloader upgraded with it later.


-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
