From: tglx@linutronix.de (Thomas Gleixner)
Date: Tue, 18 Feb 2003 18:20:52 +0100
Subject: NAND ECC and OOB usage
In-Reply-To: <200302181553.41412.phil@river-bank.demon.co.uk>
References: <200302181409.25070.tglx@linutronix.de>
 <200302181745.16506.tglx@linutronix.de>
 <200302181553.41412.phil@river-bank.demon.co.uk>
Message-ID: <200302181820.52341.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Tuesday 18 February 2003 16:53, Phil Thompson wrote:
> > 1. It's the only way to set the dfault for a partition

> In which case my original point is valid - you should also be able to set
> the default through mtdparts.
Good point. 
But please stop before implementing. I'm going to change the whole thing 
again, as I was slightly brain-damaged when I implemented it this way.
I will go back to the original path and make a pointer, which let's 
filesystems do what they need, without changing NAND code anymore.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
