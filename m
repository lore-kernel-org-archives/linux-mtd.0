From: enrico.scholz@sigma-chemnitz.de (Enrico Scholz)
Date: Mon, 24 Feb 2003 13:37:55 +0100
Subject: Kernel oops with an unclean unmounted filesystem
In-Reply-To: <1045748089.2242.37.camel@passion.cambridge.redhat.com> (David
 Woodhouse's message of "20 Feb 2003 13:34:50 +0000")
References: <lyr8a41m8y.fsf@ensc-pc.intern.sigma-chemnitz.de>
 <200302192122.28841.tglx@linutronix.de>
 <1045748089.2242.37.camel@passion.cambridge.redhat.com>
Message-ID: <lyu1etzwf0.fsf@ensc-pc.intern.sigma-chemnitz.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

David Woodhouse <dwmw2@infradead.org> writes:

>> What exactly did you do there ? I mean creating and/or
>> modifying.  The problem is the node is written with valid
>> CRC, so it seems to be correct, but the node content is
>> totally crap. Compressed data size = 0x6b6b6b6b.
>
> That's slab poisoning...
>
> What other drivers are present in your system?

I am running a heavily patched 2.5.59 kernel (rmk + ported PXA +
specific architecture patches) with potentially broken hardware
(PXA250 B1 stepping) so it is possible that other parts of the
system are guilty.

But because the problem disappears with recent CVS version of
JFFS2 it is probably caused by it. Since it is fixed in CVS I do
not know if it is worth to trace it further; when you give me
patches adding additional debugging checks I can try to get the
necessary information.


> Can you reproduce this?

Yes; 100% when doing a 'touch foobar' on the original 2.5.59
kernel (JFFS2 is not touched by my patches).




Thanks for your explainations
Enrico
