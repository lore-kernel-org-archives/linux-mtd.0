From: dwmw2@infradead.org (David Woodhouse)
Date: 14 Feb 2003 13:56:27 +0000
Subject: Initialising NAND OOB with Software ECC
In-Reply-To: <200302141450.46892.tglx@linutronix.de>
References: <200302132020.02330.phil@river-bank.demon.co.uk>
 <200302141427.31025.tglx@linutronix.de>
 <1045229764.22719.56.camel@passion.cambridge.redhat.com>
 <200302141450.46892.tglx@linutronix.de>
Message-ID: <1045230987.22719.59.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Fri, 2003-02-14 at 13:50, Thomas Gleixner wrote:
> True, doe you have a better idea ?

We don't _really_ need to write both in a single atomic operation, do
we? Write to two different devices. You can always provide a library
routine to do the right thing if you really care about upsetting the
userspace programmer.

-- 
dwmw2
