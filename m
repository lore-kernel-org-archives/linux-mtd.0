From: phil@river-bank.demon.co.uk (Phil Thompson)
Date: Fri, 14 Feb 2003 14:18:33 +0000
Subject: Initialising NAND OOB with Software ECC
In-Reply-To: <1045230987.22719.59.camel@passion.cambridge.redhat.com>
References: <200302132020.02330.phil@river-bank.demon.co.uk> <200302141450.46892.tglx@linutronix.de> <1045230987.22719.59.camel@passion.cambridge.redhat.com>
Message-ID: <200302141418.34025.phil@river-bank.demon.co.uk>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Friday 14 February 2003 1:56 pm, David Woodhouse wrote:
> On Fri, 2003-02-14 at 13:50, Thomas Gleixner wrote:
> > True, doe you have a better idea ?
>
> We don't _really_ need to write both in a single atomic operation, do
> we? Write to two different devices. You can always provide a library
> routine to do the right thing if you really care about upsetting the
> userspace programmer.

Given that you have to pass a pointer to the data in order to calculate the 
ECC, and you have to allow filesystems to supply some OOB data, then you 
still need 2 pointers into user space even if you separate the writes.

Phil
