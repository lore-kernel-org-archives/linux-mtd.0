From: tglx@linutronix.de (Thomas Gleixner)
Date: Fri, 14 Feb 2003 15:06:17 +0100
Subject: Initialising NAND OOB with Software ECC
In-Reply-To: <1045230987.22719.59.camel@passion.cambridge.redhat.com>
References: <200302132020.02330.phil@river-bank.demon.co.uk>
 <200302141450.46892.tglx@linutronix.de>
 <1045230987.22719.59.camel@passion.cambridge.redhat.com>
Message-ID: <200302141506.17642.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Friday 14 February 2003 14:56, David Woodhouse wrote:
> On Fri, 2003-02-14 at 13:50, Thomas Gleixner wrote:
> > True, doe you have a better idea ?
>
> We don't _really_ need to write both in a single atomic operation, do
> we? Write to two different devices. You can always provide a library
> routine to do the right thing if you really care about upsetting the
> userspace programmer.
I would like to do it in one go, as we calc ECC and put it into the supplied 
buffer, which comes either from kernel or from userspace. You should have the 
same functionality in userspace than in kernel space.
With two devices, who have two operations, which can get out of sync. Not a 
really good idea IMHO. Such a interface would be useful to test and debug 
filesystems from userspace. So you can use the same functionality as if you 
are in the kernel.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
