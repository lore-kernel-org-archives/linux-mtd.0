From: tglx@linutronix.de (Thomas Gleixner)
Date: Thu, 13 Feb 2003 17:52:54 +0100
Subject: copy filesystem to nand flash without ecc
In-Reply-To: <4EF56021.2C81712E.0265FBE9@netscape.net>
References: <4EF56021.2C81712E.0265FBE9@netscape.net>
Message-ID: <200302131752.54716.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Thursday 13 February 2003 12:16, Kschoo70C at netscape.net wrote:
> Hi,
>      I notice some update on the JFFS2 out of band usage in
> http://www.linux-mtd.infradead.org/tech/nand.html,
> whereby the offset 0x4 used to be ECC valid marker has been made obsolete.
> In this case, if I write a jffs image to the mtd device without adding the
> ECC in the out of band area, the nand driver will not know about that. The
> question here is, what is the consequence of writing an image without
> adding the ecc to the out of band area ? Isn't it true the jffs2 file
> system always uses read_ecc and write_ecc when the flash type is nand ?
True.
You will get a endless bunch of ECC failure warnings. They will go away,
if you copy files around. As ECC is essential for NAND, we removed the
non ECC stuff for JFFS2 :)

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
