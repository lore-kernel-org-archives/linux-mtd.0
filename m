Received: from mail.fh-wedel.de ([213.39.232.194])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BBfUp-0005VO-DZ
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2004 20:47:31 +0100
Date: Thu, 8 Apr 2004 21:47:34 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20040408194734.GA6743@wohnheim.fh-wedel.de>
References: <40742192.5030901@imc-berlin.de> <407553A5.5010702@imc-berlin.de>
	<20040408143717.GA1921@wohnheim.fh-wedel.de>
	<200404082128.23060.tglx@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200404082128.23060.tglx@linutronix.de>
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
cc: Steven Scholz <steven.scholz@imc-berlin.de>
Subject: Re: kernel oops in cfi_cmdset_0002.c:do_write_one()...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 8 April 2004 21:28:23 +0200, Thomas Gleixner wrote:
> On Thursday 08 April 2004 16:37, Jörn Engel wrote:
> >
> > Don't blame him, this is the result of using CVS, which is designed
> > around the assumption of a single central repository.  If current sync
> > speed is to slow for you, try to make it easier for him to send
> > patches forward.
> 
> I don't know, if he is really happy, if everybody starts to send patches 
> upstream. He does a good job on this and he focussed more on 2.6 in the last 
> months. But I'm sure that he can be convinced to bring 2.4 to the same state 
> as 2.6 at least. On the other hand we live very well with the MTD patches 
> since long, so what :) I never trust the kernel stuff of subsystems, which 
> have a active development team :)

That was not what I meant (although it did sound confusing, sorry).

You can prepare patches and send them to David.  Preparing those
patches is stupid and boring work, I guess David likes it as little as
I do.  Then he can see if they are good enough and send them forward.

Or, alternatively, you can accept the current situation as the best
you can get for your money, which is for free.

Jörn

-- 
My second remark is that our intellectual powers are rather geared to
master static relations and that our powers to visualize processes
evolving in time are relatively poorly developed.
-- Edsger W. Dijkstra
