Received: from anchor-post-31.mail.demon.net ([194.217.242.89])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BTds0-0002gz-Nt
	for linux-mtd@lists.infradead.org; Fri, 28 May 2004 05:41:48 -0400
Received: from mailgate.cabletime.com ([80.177.138.66] helo=cabletime.com)
	by anchor-post-31.mail.demon.net with esmtp (Exim 3.35 #1)
	id 1BTdrw-0006tH-0V
	for linux-mtd@lists.infradead.org; Fri, 28 May 2004 10:41:40 +0100
From: Andy Hawkins <a.hawkins@cabletime.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1085737289.5617.3.camel@adh>
Mime-Version: 1.0
Date: 28 May 2004 10:41:29 +0100
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Large flash concatenation
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm trying to add support to the kernel for concatenating a number of
large flash devices (1Gb Samsung K9F1G08).

I've added the following line to nand_ids.c:

	{"NAND 1GiB 3,3V", 0xf1, 30, 0x4000, 0},

and the devices are correctly detected (I've also written the required
code in drivers/mtd/nand), showing a size of 0x40000000 for each device.
However, when I concatenate 15 of these devices, I end up with a
partition of size 0xc000000. I assume that this is because the total
size is stored in 32 bits, and as such is overflowing.

I want to be able to use these multiple chips as a single flash
filesystem (probably JFFS2).

Can anyone help as to how I can do this?

Many thanks.

Andy
