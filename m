Received: from nz-out-0506.google.com ([64.233.162.224])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HiPPg-0007YE-Gi
	for linux-mtd@lists.infradead.org; Mon, 30 Apr 2007 02:31:09 -0400
Received: by nz-out-0506.google.com with SMTP id i11so1222704nzi
	for <linux-mtd@lists.infradead.org>;
	Sun, 29 Apr 2007 23:31:06 -0700 (PDT)
Message-ID: <e4ef6e860704292331k151c5159tadb2320baf06678a@mail.gmail.com>
Date: Mon, 30 Apr 2007 12:01:06 +0530
From: "Mark U" <mark.urs@gmail.com>
To: akpm@osdl.org, linux-mtd@lists.infradead.org
Subject: JFFS2:CRC != calculated CRC
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm trying JFFS2 as root file system on a MIPS MALTA board, the flash
device is Spansion S29GL256N. Linux kernel is 2.6.10. The User FS
partition in 16MB, but my JFSS2 image is < 4 MB. I'm getting the error
message only the FIRST PASS with the inux kernel.

-------------------------------
Node CRC c0aff8b6 != calculated CRC 11794aa7 for node at 0002b7d8
Node CRC 73469bdd != calculated CRC 0b69c67d for node at 0002c024
Node CRC 497f568e != calculated CRC 90603a58 for node at 0002c8d8
Node CRC 1174cf35 != calculated CRC d342c760 for node at 0002d268
Node CRC 8a48a778 != calculated CRC ae8926dc for node at 0002db98
Node CRC 178d5977 != calculated CRC e43eb7e4 for node at 0002e460
Node CRC a7b29213 != calculated CRC 4712ef5c for node at 0002ecd8
Node CRC 68be1666 != calculated CRC 593ce3cc for node at 0002f380
Node CRC da999e76 != calculated CRC 2ea08eeb for node at 0002fca8
Node CRC 8678f4a7 != calculated CRC 9680b180 for node at 0003069c
Node CRC db487237 != calculated CRC aa2fe606 for node at 000310d0
Node CRC 501d07fd != calculated CRC 63e62535 for node at 00031a90
-----------------------------


This error is thrown only the _first_ _time_ I erase the flash
partition and flash the image to the partition. From next time booting
(without re-flashing the image) this error is not shown by the Kernel.
Each time I relash the partition with the _same_ _JFFS2_ image to the
same location in flash the locations shown in CRC error keeps
changing.

I tried '-p' option in the mkfs.jffs2 utility this error is not coming.

 -p, --pad[=SIZE]       Pad output to SIZE bytes with 0xFF. If SIZE is
                         not specified, the output is padded to the end of
                         the final erase block

Could anyone let me know why its giving the earler CRC error.
-- 


Thanks and regards,
Mark
