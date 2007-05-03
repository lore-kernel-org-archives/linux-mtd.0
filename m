Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HjXKH-0007UM-VD
	for linux-mtd@lists.infradead.org; Thu, 03 May 2007 05:10:27 -0400
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1HjXK6-0006FJ-M9
	for linux-mtd@lists.infradead.org; Thu, 03 May 2007 11:10:02 +0200
Received: from ASt-Lambert-152-1-55-248.w82-120.abo.wanadoo.fr
	([82.120.206.248]) by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 May 2007 11:10:02 +0200
Received: from matthieu.castet by
	ASt-Lambert-152-1-55-248.w82-120.abo.wanadoo.fr with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 May 2007 11:10:02 +0200
To: linux-mtd@lists.infradead.org
From: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: RO jffs2 implementation for bootloader
Date: Thu, 3 May 2007 08:40:32 +0000 (UTC)
Message-ID: <loom.20070503T102421-36@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I need to mount a jffs2 partition in a bootloader. I tried u-boot that support
jffs2, but it is very slow (2 minutes for mounting a 64MB partition).

Do you know if there are other (fast) implemenation of jffs2 suitable for a
bootloader ?


I want to avoid to use raw partition on NAND :
- because the bootloader need to access several files (kernel, boot data, rescue
images, some configuration).
- nand scrubbing (on read) is not possible to handle (jffs2 don't handle it
either if it is a read only partition)


Thanks
