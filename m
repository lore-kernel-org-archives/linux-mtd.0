From: dwmw2@infradead.org (David Woodhouse)
Date: 14 Feb 2003 08:59:40 +0000
Subject: copy filesystem to nand flash without ecc
In-Reply-To: <200302131752.54716.tglx@linutronix.de>
References: <4EF56021.2C81712E.0265FBE9@netscape.net>
 <200302131752.54716.tglx@linutronix.de>
Message-ID: <1045213180.22719.0.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Thu, 2003-02-13 at 16:52, Thomas Gleixner wrote:
> You will get a endless bunch of ECC failure warnings. They will go away,
> if you copy files around. As ECC is essential for NAND, we removed the
> non ECC stuff for JFFS2 :)

Weren't we talking about having an ioctl or something to select whether
writes from userspace had ECC done on them or not?


-- 
dwmw2
