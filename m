Received: from smartmx-01.inode.at ([213.229.60.33])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CUoC2-0004wv-Jm
	for linux-mtd@lists.infradead.org; Thu, 18 Nov 2004 10:27:32 -0500
From: Erwin Authried <eauth@softsys.co.at>
To: tharbaugh@lnxi.com
In-Reply-To: <1100789053.3171.96.camel@tubarao>
References: <418F5E68.3010200@sysgo.de>
	<20041108120624.GE13105@home.fluff.org>  <418F6CA7.6000808@sysgo.de>
	<1099943453.10812.16.camel@tubarao>  <4194D39A.9000700@sysgo.de>
	<1100274921.3549.13.camel@justakiss>  <4194E233.70902@sysgo.de>
	<1100277677.3549.22.camel@justakiss>  <419C7E72.8040005@sysgo.de>
	<1100789053.3171.96.camel@tubarao>
Content-Type: text/plain
Message-Id: <1100791607.623.10.camel@justakiss>
Mime-Version: 1.0
Date: Thu, 18 Nov 2004 16:26:47 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Alexander Hoffmann <ahoffmann@sysgo.de>
Subject: Re: Usage of MTD_UADDR_UNNECESSARY broken?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Don, den 18.11.2004 schrieb Thayne Harbaugh um 15:44:
> On Thu, 2004-11-18 at 11:50 +0100, Alexander Hoffmann wrote:
> 
> > Then I guess that there is really the bug I described in my first mail.
> > I would recommend a check for MTD_UADDR_UNNECESSARY in the 
> > cfi_jedec_setup(), before
> > the unlock_addrs[] array is  referenced:
> > 
> > if ( uaddr != MTD_UADDR_UNNECESSARY ) {
> >                 p_cfi->addr_unlock1 = unlock_addrs[uaddr].addr1 & mask;
> >                 p_cfi->addr_unlock2 = unlock_addrs[uaddr].addr2 & mask;
> > }
> > return 1;
> 
> Apparently the "& mask" is not done anymore - you must be using an older
> version of jedec_probe.c.
> 
> It looks like your suggestion might be appropriate after the window
> check in jedec_setup() and before the finfo_uaddr() lookup.
> 
> I'm still trying to sort the test at the top of jedec_probe_chip():
> 
>  retry:
> 	if (!cfi->numchips) {
> 		uaddr_idx++;
> 
> 		if (MTD_UADDR_UNNECESSARY == uaddr_idx)
> 			return 0;
> 
> 		cfi->addr_unlock1 = unlock_addrs[uaddr_idx].addr1;
> 		cfi->addr_unlock2 = unlock_addrs[uaddr_idx].addr2;
> 	}
> 
> 
> I'm thinking that the MTD_UADDR_UNNECESSARY test (which checks for the
> end-of-loop condition) should be *prior* to the uaddr_idx++.  The way it
> is, chips that are MTD_UADDR_UNNECESSARY will *never* be tested and will
> *always* fail.

I believe that your conclusion is wrong. jedec_probe doesn't know
a-priori which chip is there, thus it can't omit the test. A test for a
chip with MTD_UADDR_UNNECESSARY will match at the first tested unlock
address, because a chip with MTD_UADDR_UNNECESSARY doesn't care about
the unlock sequence at all.

Regards,
Erwin  
