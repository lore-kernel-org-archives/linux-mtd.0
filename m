Received: from bay1-f74.bay1.hotmail.com ([65.54.245.74] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BPrPs-0001b7-SY
	for linux-mtd@lists.infradead.org; Tue, 18 May 2004 00:21:05 +0100
From: "lokesh kumar" <lokeshk@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Mon, 17 May 2004 19:20:53 -0400
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <BAY1-F74G7Tyc1ZoHGt0001c7c9@hotmail.com>
Subject: jffs2 2.4.18 kernel problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I have a jffs2 partition on my mpc8xx board, running 2.4.18 kernel. I am 
using mtd snapshot of july 2002. The mtd partition size is 2MB.

I enabled the mtd options in kernel, and then built an image for this 
partition using

mkfs.jffs2 -e 0x20000 -b -r rootdir -o img

and then I copy this image over this partition using u-boot or debugger. I 
can then boot the board and mount this partition on a mount point. Then I 
can cd to this partition and create a directory and copy a file to this 
directory. Now, I turn the power off and when I reboot, I can mount the file 
system and can see that the directory and file exist, but when I say "rm -fr 
file" or "rm -fr directory", it crashes the kernel saying "kernel access of 
bad area"

What am I doing wrong?

Lokesh

_________________________________________________________________
Express yourself with the new version of MSN Messenger! Download today - 
it's FREE! http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/
