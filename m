Received: from fep04-mail.bloor.is.net.cable.rogers.com ([66.185.86.74])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 199com-00083o-V2
	for <linux-mtd@lists.infradead.org>; Sun, 27 Apr 2003 04:27:09 +0100
Date: Sat, 26 Apr 2003 23:26:46 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@infradead.org>
To: lhl <lhl@phy.ccnu.edu.cn>
In-Reply-To: <E197StG-0000Sy-Nb@pentafluge.infradead.org>
Message-ID: <Pine.LNX.4.44.0304262320530.1910-100000@CPE00e0292061fa-CM014370001917.cpe.net.cable.roger>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: DOC2000 grub boot problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 21 Apr 2003, lhl wrote:

> grub> kernel(dc0,0)/boot/vmlinuz-doc root=/dev/hda4
> Loading kernel image......
> 	Linux-bzImage,setup=0xa00 size=0xec7a4

What was the problem?  If the kernel didn't go past the shown line, it's 
very likely that the kernel image was compiled for a newer processor.  So 
the board with a 386 CPU won't run the kernel compiled for 586.

Ilguiz
