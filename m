From: tglx@linutronix.de (Thomas Gleixner)
Date: Thu, 06 Mar 2003 22:46:40 +0100
Subject: canT use jffs2 with nand
In-Reply-To: <FCEAKDJJAPHPLJFINDAJCEHLCOAA.Stephan.Linke@epygi.de>
References: <FCEAKDJJAPHPLJFINDAJCEHLCOAA.Stephan.Linke@epygi.de>
Message-ID: <200303062246.40023.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Thursday 06 March 2003 17:58, Stephan Linke wrote:
> Hi,
>
> I'm trying to use some nand chips on my board. Some selfmade tests in the
> bootloader show that they are already working fin in the system.
> But I have trouble using them in linux.
> When trying to use touch to create an empty file on a JFFS2 mounted on the
> nand I get the following result: "nand_write_ecc: Attempt to write not page
> aligned data" which is actualy true since the FS is trying to write only 12
> bytes... I tried to use YAFFS first but the result was more difficult to
> "translate". Writing an mounting a cramfs image worked fine.
Seem's, that CONFIG_JFFS2_NAND is missing.
Have you used patchin.sh ?
Have you read http://linux-mtx.infradead.org/tech/nand.html ?

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
