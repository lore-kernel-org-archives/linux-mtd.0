Received: from mailout06.sul.t-online.com ([194.25.134.19])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 198FAL-0002RE-K0
	for <linux-mtd@lists.infradead.org>; Wed, 23 Apr 2003 08:59:41 +0100
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
From: Wolfgang Denk <wd@denx.de>
Mime-version: 1.0
In-reply-to: Your message of "Mon, 21 Apr 2003 13:55:44 +0200."
             <20030421115544.GB9550@wohnheim.fh-wedel.de>
Date: Wed, 23 Apr 2003 09:59:08 +0200
Sender: wd@denx.de
Message-Id: <20030423075913.34D7BC58B9@atlas.denx.de>
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
cc: Jeremy Bowen <Jeremy.Bowen@opennw.com>
cc: "'dwmw2@infradead.org'" <dwmw2@infradead.org>
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: Unable to write to some JFS partitions 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In message <20030421115544.GB9550@wohnheim.fh-wedel.de> you wrote:
>
> > > Note that there exist bootloaders which can boot
> > > from JFFS2 so you can put the kernel in there too.
> 
> David, do you have a longer list than grub and ecos? Just curious.

U-Boot (the "Universal Bootloader" which is available sor  some  100+
PowerPC,  ARM,  MIPS  and  x86  boards) supports commands to list the
directory contents and to load files from JFFS2 filesystems. No write
support though. See http://sourceforge.net/projects/u-boot

If JFFS2 support is a useful feature for a boot loader is subject  to
discussion  -  IMHO the initial scan of the JFFS2 filesytem takes too
long to make it interesting for embedded systems where boot  time  is
usually  critical  (if  I need to have the application up and running
within 3 seconds after poweron I cannot spend 2 seconds on the  JFFS2
scan). But YMMV.


Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-4596-87  Fax: (+49)-8142-4596-88  Email: wd@denx.de
If I have seen further it is by standing on the shoulders of  giants.
              - Isaac Newton, Letter to Robert Hooke, 5 February 1676
