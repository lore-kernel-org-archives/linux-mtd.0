Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19fg0f-0008J0-9k
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jul 2003 14:19:53 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HIJ00GX56CBR0@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Thu, 24 Jul 2003 15:19:24 +0200 (MEST)
Date: Thu, 24 Jul 2003 16:16:12 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <Law14-OE49bFP9qM5Jy00011206@hotmail.com>
To: Vikram Mehta <vm6580@hotmail.com>, mtd <linux-mtd@lists.infradead.org>
Message-id: <200307241616.12837.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <Law14-OE49bFP9qM5Jy00011206@hotmail.com>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: Re: Garbage Collection thread questions
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 23 July 2003 02:02, Vikram Mehta wrote:
> Hi Folks,
>
> I am trying to solve the problem of  mount-crashing-the-system problem.
>
> 1.) The GC thread written in background.c is primarily a optimization.
> So can I avoid using it for the time being.
> I am almost certain that GC is the  problem for my mount crashing the
> system
You can by rewriting the code.
I'm almost sure, that GC is not the problem.

> 2.) Kernel_thread used in background.c makes a new thread  .. right?
> But I have read that in uClinux, parent and child thread have the same
> stack. ( Correct me if I am wrong anywhere)
> So if the stack space is the same, will not one thread curropt the return
> addresses etc of hte other thread.
> So iun uClinux , how do I make sure this does not happen. I am getting
> little confused here

It runs on uClinux wihtout any problem.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
