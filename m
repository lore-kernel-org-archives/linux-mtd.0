From: tglx@linutronix.de (Thomas Gleixner)
Date: Tue, 18 Feb 2003 16:19:56 +0100
Subject: NAND ECC and OOB usage
In-Reply-To: <200302181321.03287.phil@river-bank.demon.co.uk>
References: <200302181409.25070.tglx@linutronix.de>
 <200302181321.03287.phil@river-bank.demon.co.uk>
Message-ID: <200302181619.56976.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Tuesday 18 February 2003 14:21, Phil Thompson wrote:
> On Tuesday 18 February 2003 1:09 pm, Thomas Gleixner wrote:
> > I have changed the oob-selection for NAND as follows:
> >
> > 1. A default oob selector is added to the mtd structure. It can be
> > initialized on compile time or modified on runtime. For partitioned
> > devices a default selector is included in the partition description
> > structure. This can be set on compile time (see autcpu12.c) or on
> > runtime.
> This means we really need to be able to specify the selector on the command
> line as part of mtdparts as well.
You don't need that, as the filesystem forces layout selection itself.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
