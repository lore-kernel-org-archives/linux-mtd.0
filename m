Received: from dsl-210-15-250-78.nsw.netspace.net.au ([210.15.250.78]
	helo=mail.magtech.com.au)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DEFn2-00081h-Td
	for linux-mtd@lists.infradead.org; Wed, 23 Mar 2005 19:01:34 -0500
Received: from mail.magtech.com.au (localhost [127.0.0.1])
	by localhost.magtech.com.au (Postfix) with ESMTP id 157CD894049
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Mar 2005 11:01:26 +1100 (EST)
Received: from [192.168.65.196] (unknown [192.168.65.196])
	by mail.magtech.com.au (Postfix) with ESMTP id 4900D894049
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Mar 2005 11:01:25 +1100 (EST)
Message-ID: <42420354.5000407@magellan-technology.com>
Date: Thu, 24 Mar 2005 11:01:24 +1100
From: Aras Vaichas <arasv@magellan-technology.com>
MIME-Version: 1.0
To: MTD-LIST <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: flashcp problem when called via execlp
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm calling "flashcp" from a utility in order to write a file to a NOR flash 
device. When I call flashcp from my utility, it doesn't work properly.

In my utility I create a temporary file, fill it with data and then I call 
flashcp via execlp like so:

execlp( "flashcp", "flashcp", filenamep, MTDFILE, (char *)0 );

where: filenamep is the temporary filename, MTDFILE is "/dev/mtd/2"

The problems are:

* I lose about 6 bytes from the beginning of the file
* all zeroes between the text are converted to linefeeds
* all zeroes at the end of the file are converted to 0xff

If I call flashcp from the command line, it copies the file over perfectly.

e.g.

1) calling flashcp from the command line you can see the zero at $0000336 and 
the zeroes at the end of the file:
$ flashcp uenv_Zdp5Bp /dev/mtd/2 && hexdump /dev/mtd/2

... SNIP ...
0000330 7361 6820 7265 0065 6e61 7464 6568 736e
0000340 6d6f 6d65 726f 3d65 7241 7361 6920 2073
0000350 7473 6c69 206c 6568 6572 202c 6164 6d6d
0000360 7469 0000 0000 0000 0000 0000 0000 0000
0000370 0000 0000 0000 0000 0000 0000 0000 0000
*
0020000

2) Calling flashcp via execlp you can see that the zero that was at $000336 has 
been turned into a linefeed (0x0a) and moved to $0000332, and that the zeroes 
at the end of the file are now 0xff.

0000330 7265 0a65 6e61 7464 6568 736e 6d6f 6d65
0000340 726f 3d65 7241 7361 6920 2073 7473 6c69
0000350 206c 6568 6572 202c 6164 6d6d 7469 0a0a
0000360 ffff ffff ffff ffff ffff ffff ffff ffff
*
0020000


bin # mtd_debug info /dev/mtd/2
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 131072 (128K)
mtd.erasesize = 131072 (128K)
mtd.oobblock = 0
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 0

I'm running Linux 2.4.28-lck1, on an SC520 i386 compatible platform. We've been 
running JFFS for years and JFFS2 recently on this platform with no problems.

regards,

Aras Vaichas
