From: tglx@linutronix.de (Thomas Gleixner)
Date: Fri, 14 Feb 2003 14:27:31 +0100
Subject: Initialising NAND OOB with Software ECC
In-Reply-To: <1045228464.22719.54.camel@passion.cambridge.redhat.com>
References: <200302132020.02330.phil@river-bank.demon.co.uk>
 <200302141402.53443.tglx@linutronix.de>
 <1045228464.22719.54.camel@passion.cambridge.redhat.com>
Message-ID: <200302141427.31025.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Friday 14 February 2003 14:14, David Woodhouse wrote:
> On Fri, 2003-02-14 at 13:02, Thomas Gleixner wrote:
> > But then we should add two pointers, so you can hold two different
> > buffers from userspace.
>
> Ug. This rapidly becomes vile. How about adding a new device for the OOB
> data, using pread/pwrite on that.
True, but pread/pwrite does not support two pointers.

We can use one pointer, but then you have to copy things around in userspace.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
