Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CAhhh-00043x-Gt
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2004 00:29:06 -0400
To: Ben Dooks <ben-mtd@fluff.org>,  linux-mtd@lists.infradead.org
References: <20040920234450.GA17169@home.fluff.org>
	<m3brfxycuf.fsf@maxwell.lnxi.com>
	<20040923210150.GF25491@home.fluff.org>
	<m3r7ossm5q.fsf@maxwell.lnxi.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 23 Sep 2004 22:29:03 -0600
In-Reply-To: <m3r7ossm5q.fsf@maxwell.lnxi.com>
Message-ID: <m3pt4cqohc.fsf_-_@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Eric W. Biederman" <eric@lnxi.com>
Cc: Christopher Hoover <ch@hpl.hp.com>, David Woodhouse <dwmw2@infradead.org>,
	Thayne Harbaugh <tharbaugh@lnxi.com>
Subject: [CFT] FIX CFI cmdset 0002 for x16 and x32 devices.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ebiederman@lnxi.com (Eric W. Biederman) writes:

> So it looks like the TODO item is to just look up what cfi standard
> says are the unlock addresses for cfi command set 2. And make certain
> the cfi hard codes are correct and nothing should be broken.

Looking at cfi specification and the AMD/Fujitsu specific
portion of it.  This is what the CFI address assignment code
needs to look like:

		/* Set the default CFI lock/unlock addresses */
		cfi->addr_unlock1 = 0x555;
		cfi->addr_unlock2 = 0x2aa;
		/* Modify the unlock address if we are in compatibility mode */
		if (	/* x16 in x8 mode */
			((cfi->device_type == CFI_DEVICETYPE_X8) && 
				(cfi->cfiq->InterfaceDesc == 2)) ||
			/* x32 in x16 mode */
			((cfi->device_type == CFI_DEVICETYPE_X16) &&
				(cfi->cfiq->InterfaceDesc == 4))) 
		{
			cfi->addr_unlock1 = 0xaaa;
			cfi->addr_unlock2 = 0x555;
		}


The previous code to handle this was quite bogus.  Unless I completely
cannot read the code.

I have committed this change and corresponding change to use
cfi_send_gen_cmd.

Will people please test this?

If I don't hear any bug reports I will assume everything is perfect
and start pushing this code upstream.  

Eric
