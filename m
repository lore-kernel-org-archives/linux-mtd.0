Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Vyrt-00082L-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Jan 2003 18:54:29 +0000
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H8C00918Z9CMH@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Tue, 07 Jan 2003 20:24:48 +0100 (MET)
Date: Tue, 07 Jan 2003 20:23:51 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Compile error in mtdblock-core...
In-reply-to: <3E1A97C2.DA5A0FC0@imc-berlin.de>
To: Steven Scholz <steven.scholz@imc-berlin.de>
Cc: linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200301072023.51233.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <3E199E9D.8A02D98F@imc-berlin.de>
 <200301062003.40607.tglx@linutronix.de> <3E1A97C2.DA5A0FC0@imc-berlin.de>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tuesday 07 January 2003 10:02, Steven Scholz wrote:
> Thomas Gleixner wrote:
> > On Monday 06 January 2003 16:19, Steven Scholz wrote:
> > > -DKBUILD_BASENAME=mtdblock_core  -c -o mtdblock-core.o mtdblock-core.c
> > > In file included from
> > > /opt/BITKEEPER/Exports/linuxppc_2_4_devel-2003-01-06.test/include/linux
> > >/blk .h:4, from mtdblock-core.c:18:
> > > /opt/BITKEEPER/Exports/linuxppc_2_4_devel-2003-01-06.test/include/linux
> > >/blk dev.h:147: parse error before `struct'
> >
> > Check in blkdev.h, if the define before the struct contains any control
> > characters. Happens sometimes and gcc is not very happy with this. Should
> > not be a problem of mtd, because mtd does not modify blkdev.h.
>
> Hmm, I see. But this only happens after I used the patchin script from MTD
> CSV.
It has nothing to do with patchin. The offending line is 
blkdev.h:147: extern inline int rq_data_dir(struct request *rq)
which is a backport of a 2.5 function

This is also defined in include/linux/mtd/compatmac.h, which is the 
compability header for 2.4/2.5. 

GCC output is not very informative, but with a little intuition and "grep" it 
can be found :)

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
