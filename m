Received: from webmanixhosting.com ([216.40.225.16]
	helo=www.webmanixhosting.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkRDI-0005UI-Vk
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2004 13:37:09 -0400
From: "Dan Post" <djp.mtd@onemyth.net>
To: Nicolas Pitre <nico@cam.org>
Date: Tue, 13 Jul 2004 09:33:59 -0800
Message-Id: <20040713173359.M64485@onemyth.net>
In-Reply-To: <Pine.LNX.4.44.0407131248030.18865-100000@xanadu.home>
References: <20040713163622.M68171@onemyth.net>
	<Pine.LNX.4.44.0407131248030.18865-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: linux-mtd@lists.infradead.org, "Eric W. Biederman" <ebiederman@lnxi.com>
Subject: Re: [RFC] refactoring MTD cmdset ops, jedec_probe, and cfi_probe
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 13 Jul 2004 12:52:13 -0400 (EDT), Nicolas Pitre wrote
> On Tue, 13 Jul 2004, Dan Post wrote:
> > [L18 / hardware partitions]
> 
> I committed support for that a while ago already.  SMP and 
> preemption safe too.  Anything you think might be missing (besides 
> the crude probing code that certainly could benefit from more work)?

Ahhh, I thought you reversed that :)  Some must have slipped by.  David, if
you're listening, I miss your lovely cvsweb interface... any word on when that
will be back up?

I'm downloading the latest snapshot as we speak.  Maybe I'll have to wait
until tomorrow... ugly firewall doesn't let CVS through, so I'd miss a lot of
updates I think.  At any rate, I'll check it out and give it a try.

Here is a preliminary 'missing' list:

OTP [protection register] support.  I have some preliminary code that supports
reading / writing / locking / querying the primary + extended OTP space
(extended is only available on L18).  It's targeted against an ancient version
of the MTD, but I've been updating it to work against my djp1.  It's good
reference code, and the only thing that will change significantly is the code
that actually writes / reads the OTP bits.  There are several functions on top
of that to make access to the two regions transparent and contiguous.  I can't
hand out the OTP stuff today, but I'll push this up on my priority list.  Also
todo is make OTP work on chips with only the primary OTP space (e.g. K3).

XIP.  :)  This is my job.  It works in djp1, but needs porting to the modern
stuff.

Needs better probing code: I trust you on that one.

Dan
