Received: from protonic.xs4all.nl ([213.84.116.84] helo=protonic.prtnl)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EHyiu-0006xD-TH
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2005 03:09:01 -0400
From: David Jander <david.jander@protonic.nl>
To: linux-mtd@lists.infradead.org,
	"Nguyen Manh Dung (G7)" <DungNM2@fsoft.com.vn>
Date: Wed, 21 Sep 2005 09:08:46 +0200
References: <BD3D9FF82608A74BA5407250FF83ACB7023368@fsoft-email01.fsoft.fpt.vn>
In-Reply-To: <BD3D9FF82608A74BA5407250FF83ACB7023368@fsoft-email01.fsoft.fpt.vn>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200509210908.47825.david.jander@protonic.nl>
Cc: 
Subject: Re: System Memory Layout
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 21 September 2005 05:20, Nguyen Manh Dung (G7) wrote:
> Hi all !
> I'm building Embedded Linux System.
> My board has 16M of RAM and 8M of Flash.The RAM is mapped from address
> 0x0000000 to address 0x00FFFFFF, and the flash is mapped from address
> 0x40000000 to address 0x407FFFFF I use u-boot, kernel 2.6.12.5, JFFS2 root
> filesystem for my board.
>
> can you help me :
> 1. How to layout system memory?

You have to be more specific about what you have and what you mean by "memory 
layout". You already explained how your memory is mapped physically, and to 
me it looks fine.
Other than that, you need to tell the linux kernel about how much RAM you have 
(u-boot does this for you), and linux will enable virtual memory and paging, 
so there is not much more to worry about for you.
What processor/platform are you running on anyway?

> 2. how to store u-boot image, Kernel image, root filesystem in flash.

That depends on the platform. How do you define the reset entry-point on your 
processor? For example if your entry point is 0x40000000 (or any other 
address where the beginning of flash will apear "mirrored" at reset) you can 
place uboot there (it usually needs a little less than 128k depending on 
platform and configuration. Read the u-boot docs). After that you could leave 
a sector of flash free for u-boot configuration, and then place the kernel. 
2.6.x will take about 1Mbyte in flash (again depending on a lot of factors), 
so maybe the first 1.5Mbyte are used up until now. The rest might be used for 
jffs2.
I recommend making several partitions, for rootfs (read-only), application, 
data etc..
Partitioning in mtd is done via serveral mechanisms. Have a look inside 
drivers/mtd/maps/. Here you will find map "drivers" for several hardware 
platforms. You could write one specifically for your board, but you can also 
use a generic driver like pysmap.c, where definition of the available flash 
partitions is specified via the kernel-command-line. This amounts to 
basically setting a variable in u-boot which defines your flash layout.

Want to know more? Then read all you can google about embedded linux on you 
type of processor/platform and the documentation of mtd.

If you have more pecific questions, give more specific information about your 
setup.

Hope this helps.

Greetings,

-- 
David Jander
Protonic Holland.
