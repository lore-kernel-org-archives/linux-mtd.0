From: Stephan.Linke@epygi.de (Stephan Linke)
Date: Fri, 7 Mar 2003 10:46:36 +0100
Subject: canT use jffs2 with nand
In-Reply-To: <200303062246.40023.tglx@linutronix.de>
Message-ID: <FCEAKDJJAPHPLJFINDAJOEIECOAA.Stephan.Linke@epygi.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi Thomas,

actualy I did not use the patch script. But on the other hand I don't like the way it modifies my kernel. Since CVS can't deal with
links...
Is it possible to add an option that uses copies instead of links?
That would be fine.

Now I will test it with the automaticaly patched kernel. Thanks.

Stephan

> -----Original Message-----
> From: Thomas Gleixner [mailto:tglx at linutronix.de]
> Sent: Donnerstag, 6. M?rz 2003 22:47
> To: Stephan Linke; Linux-Mtd
> Subject: Re: canT use jffs2 with nand
>
>
> On Thursday 06 March 2003 17:58, Stephan Linke wrote:
> > Hi,
> >
> > I'm trying to use some nand chips on my board. Some selfmade tests in the
> > bootloader show that they are already working fin in the system.
> > But I have trouble using them in linux.
> > When trying to use touch to create an empty file on a JFFS2 mounted on the
> > nand I get the following result: "nand_write_ecc: Attempt to write not page
> > aligned data" which is actualy true since the FS is trying to write only 12
> > bytes... I tried to use YAFFS first but the result was more difficult to
> > "translate". Writing an mounting a cramfs image worked fine.
> Seem's, that CONFIG_JFFS2_NAND is missing.
> Have you used patchin.sh ?
> Have you read http://linux-mtx.infradead.org/tech/nand.html ?
>
> --
> Thomas
> ________________________________________________________________________
> linutronix - competence in embedded & realtime linux
> http://www.linutronix.de
> mail: tglx at linutronix.de
>
>
