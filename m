Received: from [64.244.22.242] (helo=mail.seranoa.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dwM7-0003xq-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 16:46:03 +0000
Received: from seranoa.com (IDENT:andrew.dixon@[172.16.1.202])
	by mail.seranoa.com (8.11.0/8.11.0) with ESMTP id g1LH6os16806
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 12:06:50 -0500
Message-ID: <3C7525DB.7697E6B7@seranoa.com>
Date: Thu, 21 Feb 2002 11:52:43 -0500
From: Andrew Dixon <andrew.dixon@seranoa.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: error on remount of a jffs2 filesystem
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

Hey everyone -

I was wondering if someone could shed some light on a problem that I've
been having.  I'm using two Intel Strataflash chips as both a boot rom
and a permanent backing store.  I've hacked some of the mtd drivers so
that I now have the two chips recognized as one device and a partition
on that device that I want to mount as a jffs2.  This all works great. 
I can mount the device, write to it, read from it, all that good stuff. 
The problems comes when I try to unmount and then remount the device.  I
get the following:

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01f60004:
0x0080 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01f60008:
0x0080 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01f6000c:
0x0080 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01f60010:
0x0080 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01f60014:
0x0080 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01f60018:
0x0080 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01f6001c:
0x0080 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01f60020:
0x0080 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01f60024:
0x0080 instead

This is repeated over and over again and then the device is mounted but
it's been erased.  If, however, I power off the board I can mount the
partition just fine and all of my data is still there.  I believe that
the problem is that the chip is not in the FL_READY state after it is
unmounted, but on a power cycle it gets set up again.

Any ideas on how I might fix this.  I've been hacking on
cfi_cmdset_0001.c with little success.

thanks,
Andy

P.S.  I'm using the mtd stuff from the Linux 2.4.16 kernel.
-- 
Andrew Dixon
Software Engineer
Seranoa Networks
978.897.3434 x231
