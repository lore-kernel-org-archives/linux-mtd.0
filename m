Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D6tmE-00031Y-5O
	for linux-mtd@lists.infradead.org; Thu, 03 Mar 2005 12:06:19 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Steve Wahl <steve.wahl@qlogic.com>
In-Reply-To: <20050303153627.GM2119@qlogic.com>
References: <018701c51fac$bef413b0$1b0a060a@WellSyn.org>
	<1109838505.5398.3.camel@tglx.tec.linutronix.de>
	<01e801c51fcc$ae93fa10$1b0a060a@WellSyn.org>
	<1109840487.5398.16.camel@tglx.tec.linutronix.de>
	<20050303153627.GM2119@qlogic.com>
Content-Type: text/plain
Date: Thu, 03 Mar 2005 18:06:09 +0100
Message-Id: <1109869570.4032.39.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: compile error (undefined reference to jffs2_getlink) forkernel
	2.4.26
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-03-03 at 09:36 -0600, Steve Wahl wrote:
> In other words, the whole text about "ancient kernels" can easily be
> interpreted to mean anything *before 2.4.26*, and that 2.4.26 and on
> is still fair game to ask the mailing list at the moment.  

You're right.

> It also says that in the *future*, 2.4 will be completely put into
> maintenance mode.  If that future is now, IMHO somebody should update
> that web page to say so.

Will happen.

> [Personally, I don't think you should move to that future just yet;
> 2-6 more months would be where I would do it.  Where I work, there was
> some resistance to moving to 2.6 because it isn't yet "mature" in the
> embedded space, as in the major embedded suppliers like MontaVista
> aren't really shipping 2.6 yet.

In my opinion we should have removed it since long. It's lying around,
makes the tree ugly, breaks on a regular base and nobody cares to fix
it. The active MTD developers are doing 2.6 only and are blamed on a
regular base, why it does not work on 2.4.

If somebody stands up and takes the responsibility to keep the 2.4 stuff
alive, I could be convinced to keep it alive.

Anybody up to it?

tglx
