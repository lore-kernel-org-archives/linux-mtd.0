Received: from eppat.qlogic.com ([63.170.40.2] helo=EPEXCH01.qlogic.org)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D6sNZ-0002GO-8n
	for linux-mtd@lists.infradead.org; Thu, 03 Mar 2005 10:36:46 -0500
Date: Thu, 3 Mar 2005 09:36:27 -0600
From: Steve Wahl <steve.wahl@qlogic.com>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20050303153627.GM2119@qlogic.com>
References: <018701c51fac$bef413b0$1b0a060a@WellSyn.org>
	<1109838505.5398.3.camel@tglx.tec.linutronix.de>
	<01e801c51fcc$ae93fa10$1b0a060a@WellSyn.org>
	<1109840487.5398.16.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1109840487.5398.16.camel@tglx.tec.linutronix.de>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: compile error (undefined reference to jffs2_getlink) forkernel
	2.4.26
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 03, 2005 at 10:01:27AM +0100, Thomas Gleixner wrote:
> On Thu, 2005-03-03 at 16:40 +0800, Kevin Liao wrote:
> > Thanks for the reply. Actully I had read it before I ask this question.
> > According to the webpage, the kernel version I used should be ok.
> > I think the root cause is not the kernel version. Because I serach
> > the whole directory extracted from snapshop 20050302 but found
> > no implementation for jffs2_getlink function. Maybe I search the
> > wrong place?
> 
> Yes, jffs2_getlink is removed. There was an update to jffs2 a couple of
> days ago. It broke the 2.4 code.
> 
> Frankly spoken, I personally don't care.
> 
> 2.4 is as is and we are not going to do anything about. Feel free to fix
> it by porting the link changes back to super-v24.c or use an snapshot
> before said changes.

I'm a real outsider here, and don't care much about whether the code
works under 2.4 or not.

But at least one way of interpreting
http://www.linux-mtd.infradead.org/#kernelversions is:

	Code in the 2.6 kernel tree gets updated.  Code in the 2.4
	tree doesn't, you'll have to fetch it from CVS yourself.  You
	need at least 2.4.26; anything lower than that is ancient and
	we're not interested in supporting it.

In other words, the whole text about "ancient kernels" can easily be
interpreted to mean anything *before 2.4.26*, and that 2.4.26 and on
is still fair game to ask the mailing list at the moment.  

It also says that in the *future*, 2.4 will be completely put into
maintenance mode.  If that future is now, IMHO somebody should update
that web page to say so.

With the way that page currently reads, I don't think being curt with
someone who asks about 2.4.26 and pointing them at the web page is
really fair.

[Personally, I don't think you should move to that future just yet;
2-6 more months would be where I would do it.  Where I work, there was
some resistance to moving to 2.6 because it isn't yet "mature" in the
embedded space, as in the major embedded suppliers like MontaVista
aren't really shipping 2.6 yet.  That was a couple of months ago, and
I haven't been paying attentiion; they might be there now.  At any
rate, I recognize my opinion doesn't really matter because I'm not an
active developer; I'm only suggesting what I think is a way to create
less friction in this community.]

Thanks for listening; If I cause more heat than light with this, I
appologize profusely.

--> Steve Wahl
