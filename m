From: tglx@linutronix.de (Thomas Gleixner)
Date: Wed, 19 Feb 2003 21:22:28 +0100
Subject: Kernel oops with an unclean unmounted filesystem
In-Reply-To: <lyr8a41m8y.fsf@ensc-pc.intern.sigma-chemnitz.de>
References: <lyr8a41m8y.fsf@ensc-pc.intern.sigma-chemnitz.de>
Message-ID: <200302192122.28841.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Wednesday 19 February 2003 13:35, Enrico Scholz wrote:
> Hello,
>
> after creating and/or modifying a file in a JFFS2 filesystem, I
> turned off the device without unmounting/syncing the device.
What exactly did you do there ? I mean creating and/or modifying.
The problem is the node is written with valid CRC, so it seems to be
correct, but the node content is totally crap. Compressed data size = 
0x6b6b6b6b.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
