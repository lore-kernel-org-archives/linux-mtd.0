Received: from mailout09.sul.t-online.com ([194.25.134.84])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17pdAO-0007B8-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Sep 2002 00:14:32 +0100
To: karim@opersys.com
Cc: Jack Lu <jlu@rdmcorp.com>, linux-mtd@lists.infradead.org
From: Wolfgang Denk <wd@denx.de>
Subject: Re: the procedure setting up jffs2 
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Thu, 12 Sep 2002 18:37:53 EDT."
             <3D811741.FB5178A@opersys.com>
Date: Fri, 13 Sep 2002 01:14:11 +0200
Message-Id: <20020912231417.0ED47FA8D@denx.denx.de>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi Karim,

in message <3D811741.FB5178A@opersys.com> you wrote:
> 
> The chip you mention is bottom-boot, so the above will very likely wipe-out
> the bootloader. You probably want to partition your MTD device by modifying
> the mapping driver and then write the JFFS2 image to another partition then
> /dev/mtd0. Check drivers/mtd/tqm8xxl.c for an example.

We (more  or  less)  consider  this  method  of  static  partitioning
obsolete.   We  use  (and  recommend  to  our  customers)  a  dynamic
partitioning, where "partition table" information is  passed  to  the
Linux kernel by PPCBoot using the kernel command line.

For example, passing the kernel a boot argument of

	mtdparts=0:256k(PPCboot)ro,768k(Kernel),-(Rest);1:-(myJFFS2)

results in this partitioning:

	...
	TQM flash bank 0: Using command line partition definition
	Creating 3 MTD partitions on "TQM8xxL Bank 0":
	0x00000000-0x00040000 : "PPCboot"
	0x00040000-0x00100000 : "Kernel"
	0x00100000-0x00400000 : "Rest"
	TQM flash bank 1: Using command line partition definition
	Creating 1 MTD partitions on "TQM8xxL Bank 1":
	0x00000000-0x00400000 : "myJFFS2"
	...

See the config option "CONFIG_MTD_CMDLINE_PARTS" in our kernel
sources.

Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-4596-87  Fax: (+49)-8142-4596-88  Email: wd@denx.de
The price one pays for pursuing any profession,  or  calling,  is  an
intimate knowledge of its ugly side.                  - James Baldwin
