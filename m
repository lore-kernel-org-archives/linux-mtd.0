From: tglx@linutronix.de (Thomas Gleixner)
Date: Fri, 14 Feb 2003 14:50:46 +0100
Subject: Initialising NAND OOB with Software ECC
In-Reply-To: <1045229764.22719.56.camel@passion.cambridge.redhat.com>
References: <200302132020.02330.phil@river-bank.demon.co.uk>
 <200302141427.31025.tglx@linutronix.de>
 <1045229764.22719.56.camel@passion.cambridge.redhat.com>
Message-ID: <200302141450.46892.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Friday 14 February 2003 14:36, David Woodhouse wrote:
> On Fri, 2003-02-14 at 13:27, Thomas Gleixner wrote:
> > True, but pread/pwrite does not support two pointers.
> >
> > We can use one pointer, but then you have to copy things around in
> > userspace.
>
> _ANYTHING_ is better than an ioctl which takes pointers to userspace
> buffers.
True, doe you have a better idea ?

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
