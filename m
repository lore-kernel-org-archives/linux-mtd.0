From: tglx@linutronix.de (Thomas Gleixner)
Date: Fri, 14 Feb 2003 10:03:10 +0100
Subject: copy filesystem to nand flash without ecc
In-Reply-To: <1045213180.22719.0.camel@passion.cambridge.redhat.com>
References: <4EF56021.2C81712E.0265FBE9@netscape.net>
 <200302131752.54716.tglx@linutronix.de>
 <1045213180.22719.0.camel@passion.cambridge.redhat.com>
Message-ID: <200302141003.10539.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Friday 14 February 2003 09:59, David Woodhouse wrote:
> On Thu, 2003-02-13 at 16:52, Thomas Gleixner wrote:
> > You will get a endless bunch of ECC failure warnings. They will go away,
> > if you copy files around. As ECC is essential for NAND, we removed the
> > non ECC stuff for JFFS2 :)
>
> Weren't we talking about having an ioctl or something to select whether
> writes from userspace had ECC done on them or not?

Yep, but nobody coded it until now :)

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
