Received: from canuck.infradead.org ([2001:8b0:10b:4::1])
	by pentafluge.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DYwEI-0007BF-2n
	for linux-mtd@lists.infradead.org; Fri, 20 May 2005 02:23:11 +0100
Received: from 207.88.121.43.ptr.us.xo.net ([207.88.121.43]
	helo=mail.realmsys.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DYwEF-0001Vp-Ei
	for linux-mtd@lists.infradead.org; Thu, 19 May 2005 21:23:08 -0400
From: Peter Grayson <pgrayson@realmsys.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1116538221.4427.206.camel@pgrayson1.realmsys.com>
References: <1115400358.4422.92.camel@pgrayson1.realmsys.com>
	<42846606.8070108@inf.u-szeged.hu>
	<1116038903.4857.30.camel@pgrayson1.realmsys.com>
	<428B4995.9010103@inf.u-szeged.hu>
	<1116521440.4427.199.camel@pgrayson1.realmsys.com>
	<1116538221.4427.206.camel@pgrayson1.realmsys.com>
Content-Type: text/plain
Message-Id: <1116550355.4422.5.camel@pgrayson1.realmsys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Centralized Summary on root filesystem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Fri, 20 May 2005 01:28:15 -0000

The problem I am running into is that Linux will not unmount the root
filesystem; instead it remounts the filesystem read-only. The
centralized summary is not written to flash at remount time. This comes
into play when rebooting or shutting down. Because the centralized
summary is not up to date, the full jffs2_scan_medium() must take place.

I did the obvious and attempted to make the centralized summary be
written out when a read-write filesystem is remounted read-only in
jffs2_remount_fs(). Unfortunately, my feeble attempt yields some sort of
problem with the inode cache at boot-time. I see the following error:

  Eep. Trying to read_inode #1 when it's already in state 2!

I was wondering if anyone was using a jffs2 filesystem with CS as their
root partition? Is there a better way to get around this problem?

Pete
