From: phil@river-bank.demon.co.uk (Phil Thompson)
Date: Tue, 18 Feb 2003 13:21:03 +0000
Subject: NAND ECC and OOB usage
In-Reply-To: <200302181409.25070.tglx@linutronix.de>
References: <200302181409.25070.tglx@linutronix.de>
Message-ID: <200302181321.03287.phil@river-bank.demon.co.uk>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Tuesday 18 February 2003 1:09 pm, Thomas Gleixner wrote:
> I have changed the oob-selection for NAND as follows:
>
> 1. A default oob selector is added to the mtd structure. It can be
> initialized on compile time or modified on runtime. For partitioned devices
> a default selector is included in the partition description structure. This
> can be set on compile time (see autcpu12.c) or on runtime.

This means we really need to be able to specify the selector on the command 
line as part of mtdparts as well.

Anybody got any recommendations on the syntax? The current syntax isn't 
obviously extensible without introducing another delimiter.

How about...

<partdef> := <size>[@offset][<name>][<option-list>]
<option-list> := <option>['+' <option-list>]
<option> := [ro | oobnone | oobjffs2 | oobyaffs]

Phil
