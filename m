Received: from nameservices.net ([208.234.25.16] helo=opersys.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17pe3R-0007HL-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Sep 2002 01:11:25 +0100
Message-ID: <3D812E1F.FC5AC8E5@opersys.com>
Date: Thu, 12 Sep 2002 20:15:27 -0400
From: Karim Yaghmour <karim@opersys.com>
Reply-To: karim@opersys.com
MIME-Version: 1.0
To: Wolfgang Denk <wd@denx.de>
CC: Jack Lu <jlu@rdmcorp.com>, linux-mtd@lists.infradead.org
Subject: Re: the procedure setting up jffs2
References: <20020912231417.0ED47FA8D@denx.denx.de>
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

Wolfgang Denk wrote:
> in message <3D811741.FB5178A@opersys.com> you wrote:
> >
> > The chip you mention is bottom-boot, so the above will very likely wipe-out
> > the bootloader. You probably want to partition your MTD device by modifying
> > the mapping driver and then write the JFFS2 image to another partition then
> > /dev/mtd0. Check drivers/mtd/tqm8xxl.c for an example.
> 
> We (more  or  less)  consider  this  method  of  static  partitioning
> obsolete.  

So do I. Unfortunately, drivers/mtd/cmdline.c is only available in the MTD
CVS for the time being (and Denx's kernel sources ;). Neither 2.5.34 nor
2.4.19 include this code. Instead, they currently include drivers/mtd/bootldr.c
which is only for ARM. Do you have any idea when cmdline.c will be part of the
mainline kernel?

Karim

===================================================
                 Karim Yaghmour
               karim@opersys.com
      Embedded and Real-Time Linux Expert
===================================================
