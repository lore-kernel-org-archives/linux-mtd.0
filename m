Received: from musenki.com ([192.207.126.3] helo=dinky.musenki.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173g17-0005On-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 May 2002 17:34:45 +0100
Received: from zaphod.musenki.com. (cs6625184-203.austin.rr.com [66.25.184.203])
	by dinky.musenki.com (Postfix) with ESMTP id E06D9F40D1
	for <linux-mtd@lists.infradead.org>; Fri,  3 May 2002 11:34:43 -0500 (CDT)
From: Jim Thompson <jim@musenki.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <15570.48163.648146.185360@zaphod.musenki.com>
Date: Fri, 3 May 2002 11:34:43 -0500
To: linux-mtd@lists.infradead.org
Subject: patches to 2.4.18
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

Is the recommended course of action to simply replace the driver set
in 2.4.18 (or 2.4.19) with what is found at
ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs/

We're currently using
http://ftp.debian.org/debian/pool/main/m/mtd/mtd_20011217.orig.tar.gz,
but there seem to be a few... issues.

Also, I (like so many others lately), had to comment out the call to
invalidate_device() in mtdblock.c::mtdblock_release() in order to get
my root filesystem (jffs2 on mtdblock on Intel Strataflash) to mount.

I note that the call is still there in the CVS vsion:
  ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs/mtd/drivers/mtd/mtdblock.c

and we are getting crashes on halt/reboot if we've modified the
filesystem.

Similar questions about jffs2 have been asked:

	http://mhonarc.axis.se/jffs-dev/msg01297.html

With no apparent answer.

anyone with clue to offer?

Jim
