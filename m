Received: from nameservices.net ([208.234.25.16] helo=opersys.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17pcX1-00075f-00
	for <linux-mtd@lists.infradead.org>; Thu, 12 Sep 2002 23:33:51 +0100
Message-ID: <3D811741.FB5178A@opersys.com>
Date: Thu, 12 Sep 2002 18:37:53 -0400
From: Karim Yaghmour <karim@opersys.com>
Reply-To: karim@opersys.com
MIME-Version: 1.0
To: Jack Lu <jlu@rdmcorp.com>
CC: linux-mtd@lists.infradead.org
Subject: Re: the procedure setting up jffs2
References: <DFEAJMIABOLKNEBOPGDHAECJCBAA.jlu@rdmcorp.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Jack Lu wrote:
> I am using RPX850 Lite with 16MB flash(4 chips of Am29Lv320MB) with buswidth
> 32 and interleave 4.
> I have complied the MTD and JFFS2 module into the kernel.
> When I start up the Linux, Linux found the 16MB flash, the whole flash
> corresponds to /dev/mtd0.
> 
> 1. where can I get the mkfs.jffs2 excutable for MPC850?

Hmm... There are quite a few places that provide pre-packaged PPC tools,
Denx (denx.de) is one of those. If you have the cross-compiling tools
already, then building it on your own should be fairly easy also.

> 2. the bottom 256KB is the boot loader code of the 16MB flash. the rest si
> for storing data
>         if I do
>         #cat jffs2.image > /dev/mtd0
>         will the bootloader be erased?

The chip you mention is bottom-boot, so the above will very likely wipe-out
the bootloader. You probably want to partition your MTD device by modifying
the mapping driver and then write the JFFS2 image to another partition then
/dev/mtd0. Check drivers/mtd/tqm8xxl.c for an example.

Karim

===================================================
                 Karim Yaghmour
               karim@opersys.com
      Embedded and Real-Time Linux Expert
===================================================
