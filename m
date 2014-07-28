Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XBoBz-0004kB-US
 for linux-mtd@lists.infradead.org; Mon, 28 Jul 2014 16:54:33 +0000
Message-ID: <1406566449.23376.61.camel@sauron.fi.intel.com>
Subject: Re: Using UBIFS as an FTL
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Reply-To: artem.bityutskiy@linux.intel.com
To: Daniel Ehrenberg <dehrenberg@google.com>
Date: Mon, 28 Jul 2014 19:54:09 +0300
In-Reply-To: <CAAK6Zt03J=0=tv5rPvZH0pTZWM8ha5eu0gqFbZ6P_FgSrgwW-A@mail.gmail.com>
References: <CAAK6Zt03J=0=tv5rPvZH0pTZWM8ha5eu0gqFbZ6P_FgSrgwW-A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-07-25 at 11:21 -0700, Daniel Ehrenberg wrote:
> Hi Artem, others,
> 
> For my project, I'm looking into using ext4 on top of NAND flash, in
> order to use some fancy ext4 features. For this, I need an FTL in the
> middle. I'm wondering which would be good to use. Options that I've
> looked at are:
> - ubiblock--the read-modify-write sounds unacceptable to me, even if
> wear leveling and atomicity are handled.

This may not give you the optimal performance.

> - Some coworkers have suggested a new effort to build a new block
> device, but that that's a huge project and takes a long time to get
> right.

Yes.

> - loopback-mounting a file on ubifs--From skimming the code, it looks
> to me like ubifs uses some nice datastructures to handle writes within
> a file without doing read-modify-writes all the time as ubiblock
> forces. ubifs authors/maintainers, do you see any downside to using
> ubifs this way?

I never tried loopback over UBIFS. Should work in theory.
Synchronization (as in 'fsync()') is something which comes to mind.

What I mean is that when ext4 handles an fsync(), or a commit, it
eventually needs to make sure the data goes to the underlying media. It
sends REQ_FLUSH bios, and it seems that the loopback driver will map
that to UBIFS's 'vfs_fsync()'. That should be fine, but may be too
coarse? You could just write the right pages instead, to gain better
performance?

Then ext4 commit has various ordering requirements, and I do not know
how this works with loopback.

This all matters if you need to have some kind of power-cut tolerance.

Thanks!

-- 
Best Regards,
Artem Bityutskiy
