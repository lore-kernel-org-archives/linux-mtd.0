From: Stephan.Linke@epygi.de (Stephan Linke)
Date: Thu, 6 Mar 2003 17:58:21 +0100
Subject: canT use jffs2 with nand
Message-ID: <FCEAKDJJAPHPLJFINDAJCEHLCOAA.Stephan.Linke@epygi.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi,

I'm trying to use some nand chips on my board. Some selfmade tests in the bootloader show that they are already working fin in the
system.
But I have trouble using them in linux.
When trying to use touch to create an empty file on a JFFS2 mounted on the nand I get the following result: "nand_write_ecc: Attempt
to write not page aligned data" which is actualy true since the FS is trying to write only 12 bytes...
I tried to use YAFFS first but the result was more difficult to "translate".
Writing an mounting a cramfs image worked fine.

Any help is appreciated.
  Thanks, Stephan

P.S.: I have pretty new MTD and YAFFS sources and a 2.4.18 kernel.
