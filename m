Received: from [213.239.205.147] (helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bi4Vm-0001lB-40
	for linux-mtd@lists.infradead.org; Wed, 07 Jul 2004 00:58:26 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Rainer Weikusat <rainer.weikusat@sncag.com>
In-Reply-To: <87fz85eidc.fsf@farside.sncag.com>
References: <87fz85eidc.fsf@farside.sncag.com>
Content-Type: text/plain
Message-Id: <1089175919.27856.0.camel@thomas.tec.linutronix.de>
Mime-Version: 1.0
Date: Wed, 07 Jul 2004 06:51:59 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: cmdlineparts.c
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-07-06 at 08:53, Rainer Weikusat wrote:
> Hi.
> 
> I have rewritten cmdlineparts.c to no longer cause aligment traps on
> ARM, to enable freeing of now-unsed cmdline_mtd_parition structs after
> the real partitioning info has been passed to an upper layer and to
> get rid of the recursion (using kmalloc instead has the [theoretical]
> advantage that OOM problems can be dealt with gracefully instead of
> causing stack overflows with possibly drastic consequences). Is there
> any interest in this? [Mainly, I intend to use this for a project I am
> currently working on].

Sure, provide a patch :)

tglx
