Received: from orvill.sda.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17hb2y-0000b8-00
	for <linux-mtd@lists.infradead.org>; Wed, 21 Aug 2002 20:21:40 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H1700KXSKF9EM@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Wed, 21 Aug 2002 21:21:10 +0200 (MEST)
Date: Wed, 21 Aug 2002 21:20:54 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Cannot mount my NAND device with JFFS2
In-reply-to: <E5BE2C26-B535-11D6-92ED-000393467F1A@arlut.utexas.edu>
To: Ken Offer <koffer@arlut.utexas.edu>
Cc: LinuxMTD <linux-mtd@lists.infradead.org>
Message-id: <1029957655.3996.4.camel@thomas.tec.linutronix.de>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7BIT
References: <E5BE2C26-B535-11D6-92ED-000393467F1A@arlut.utexas.edu>
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

On Wed, 2002-08-21 at 20:43, Ken Offer wrote:
> Hi all,
> 
> I can erase and test my smart media card NAND driver just fine 
> (i.e. eraseall seems to work, nandtest works, mtd0 and mtd1 show 
> up in /proc/mtd).  So far so good.  However, when I try to mount 
> the device with jffs2 I get:
>  > mount -v -t jffs2 /dev/mtdblock1 /mnt/jffs
> mount: wrong fs type, bad option, bad superblock on /dev/mtdblock1,
>         or too many mounted file systems
Have you erased the flash before mount or have you copied stuff to the
flash ?
Can you please turn on JFFS2 debugging  to 1 and send the output ? 
make sure that you do
#echo 9 >proc/sys/kernel/printk

> I have:
> 
> (a) applied the 
> "ftp://ftp.??.kernel.org/pub/linux/kernel/people/dwmw2/shared-
> zlib/linux-2.4.19-pre10-shared-zlib.bz2" patch to a 2.4.19 
> kernel,
> (b) copied the latest and greatest cvs mtd/jffs2 sources into my kernel,
> (c) made the appropriate changes to "file.c" for Page_uptodate,
???
> (d) made the change for "CONFIG_JFFS2_FS_NAND" to "fs/Config.in",
> (e) made a change to "include/linux/mtd/compatmac.h" to define 
> "set_user_nice" (isn't defined for 2.4.19).
looks good. 
> My driver is based on the autcpu12 driver in the nand sources.  
good choice :)
> I have noticed that there is a "autcpu12-nvram" map driver to 
> perform NVRAM mapping.  Is such a mapping device REQUIRED for 
> JFFS2 support???  Or is it just for mapping the device to 
> address space for other purposes?  The documentation is not 
> clear (what's new...)
nvram is Non-Volatile-Ram and used for total different stuff 
> Got any ideas?
See above
-- 
Thomas 
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
