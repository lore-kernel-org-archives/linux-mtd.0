From: tglx@linutronix.de (Thomas Gleixner)
Date: Sat, 08 Mar 2003 20:36:23 +0100
Subject: canT use jffs2 with nand
In-Reply-To: <FCEAKDJJAPHPLJFINDAJOEIECOAA.Stephan.Linke@epygi.de>
References: <FCEAKDJJAPHPLJFINDAJOEIECOAA.Stephan.Linke@epygi.de>
Message-ID: <200303082036.23628.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Friday 07 March 2003 10:46, Stephan Linke wrote:
> Hi Thomas,
>
> actualy I did not use the patch script. But on the other hand I don't like
> the way it modifies my kernel. Since CVS can't deal with links...
> Is it possible to add an option that uses copies instead of links?
> That would be fine.
CVS up. 
./patchin.sh -c ....
will copy the files into the kerneltree instead of linking them.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
