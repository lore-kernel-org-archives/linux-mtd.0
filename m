Received: from kynes.gatewest.net ([198.163.227.7]
	helo=10-10-1-6.gatewest.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19zNFd-0001qi-2B
	for <linux-mtd@lists.infradead.org>; Tue, 16 Sep 2003 22:20:45 +0100
Received: from iders01.iders.ca (h24-77-222-52.wp.shawcable.net
	[24.77.222.52])8.12.0.Beta19) with ESMTP id h8GLIRs8006892
	for <linux-mtd@lists.infradead.org>; Tue, 16 Sep 2003 16:18:27 -0500
Received: from kilauea.iders.ca (kilauea.iders.ca [200.123.101.201])
	by iders01.iders.ca (8.12.6/8.12.8) with SMTP id h8GLKqdA004695
	for <linux-mtd@lists.infradead.org>; Tue, 16 Sep 2003 16:20:52 -0500
From: Cam Mayor <cmayor@iders.ca>
To: a-linux-mtd <linux-mtd@lists.infradead.org>
Date: Tue, 16 Sep 2003 16:20:51 -0500
MIME-Version: 1.0
Message-Id: <03091616205108.17934@kilauea.iders.ca>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: 8 is enough? - mtd block devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

g'day all,

The Summary:
Can i have mtd block devices higher than the range 0-7?  ie, more than 8?

I'm working on an embedded system where i partition the some of the mtd from 
the kernel command line and other devices grab their own mtd.  in my current 
command line case, mtdparts=phys:4m(system),-(userarea), which uses up to 
mtd6.
i can add one more partition than that, but if i add two or more, another 
device is mapped to /dev/mtd8 (or higher) and i cannot access it through the 
/dev/mtdblock read-write block devices (ie. block, major 31, minors 0-7) as 
the block devices don't go as high as 8. 

on a whim, i tried making mtdblock8 at major 31, minor 16, blindly hoping it 
would work, but it does not.  Any light you could shed on whether this is 
possible with the current state of affairs or what i might be doing wrong 
would be great.

If it helps, i am currently using 2.4.19-rmk7 (+minor mods) with and MTD tree 
from March 25/2003 on a cs89712-based system with 8M NOR flash and (random 
amount) NAND flash.

regards,
cam

-- 
Cameron Mayor
Iders Incorporated
