Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QN0ny-0002fn-C4
	for linux-mtd@lists.infradead.org; Thu, 19 May 2011 10:50:11 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QN0nv-0007Hi-PX
	for linux-mtd@lists.infradead.org; Thu, 19 May 2011 12:50:07 +0200
Received: from mar92-9-82-237-75-54.fbx.proxad.net ([82.237.75.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 19 May 2011 12:50:07 +0200
Received: from gilles.ganault by mar92-9-82-237-75-54.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 19 May 2011 12:50:07 +0200
To: linux-mtd@lists.infradead.org
From: Gilles <gilles.ganault@free.fr>
Subject: [ubifs] "cannot parse device table file 'device_table.txt'"
Date: Thu, 19 May 2011 12:49:54 +0200
Message-ID: <9ms9t650c8kmhe1ed5gdb7mv7cqdovcrca@4ax.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

I'd like to compile Ubifs in uClinux, but am getting the following
error:
===========
...
/usr/src/uClinux-dist/user/mtd-utils/mkfs.ubifs --squash-uids -m 2048
-e 204800 -c 1024 -d /usr/src/uClinux-dist/romfs -D device_table.txt
-o /usr/src/uClinux-dist/images/rootfs.ubifs

Error: count cannot be zero if increment is non-zero
Error: cannot parse '/dev/mtdblock0     b       640     0       0 31
0       0       1       -'
Error: cannot parse device table file 'device_table.txt'
make[5]: *** [image.rootfs.ubifs.force] Error 255
===========

Google didn't return much information, but it seems like mkfs.ubifs is
part of mtd-utils:
http://mtd-utils.sourcearchive.com/documentation/20090606/devtable_8c-source.html

I tried to copy the manufacturer's "device_table.txt" in ./romfs/, but
am still getting the same error.

Does someone know the cause for the error?

Thank you.
