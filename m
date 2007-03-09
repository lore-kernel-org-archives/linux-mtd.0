Received: from moutng.kundenserver.de ([212.227.126.187])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HPhhV-0007P7-Ao
	for linux-mtd@lists.infradead.org; Fri, 09 Mar 2007 11:12:19 -0500
Received: from localhost (localhost [127.0.0.1])
	by comm-neu.esd (Postfix) with ESMTP id E39E3108048
	for <linux-mtd@lists.infradead.org>;
	Fri,  9 Mar 2007 17:07:23 +0100 (CET)
Received: from comm-neu.esd ([127.0.0.1])
	by localhost (comm [127.0.0.1]) (amavisd-new, port 10024) with LMTP
	id 24379-02-25 for <linux-mtd@lists.infradead.org>;
	Fri,  9 Mar 2007 17:07:23 +0100 (CET)
Received: from debby.esd (debby.esd [10.0.0.190])
	by comm-neu.esd (Postfix) with ESMTP id 5B050108046
	for <linux-mtd@lists.infradead.org>;
	Fri,  9 Mar 2007 17:07:23 +0100 (CET)
From: Matthias Fuchs <matthias.fuchs@esd-electronics.com>
To: linux-mtd@lists.infradead.org
Subject: nandwrite -j issue
Date: Fri, 9 Mar 2007 17:07:16 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200703091707.16777.matthias.fuchs@esd-electronics.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am trying to write a jffs2 image to an NAND flash partition using nandwrite.
My nandwrite is a very recent version from the mtd_utils git reposity.
Linux kernel is around 2.6.21-rc1.

nandwrite fails because of an obsolete ioctl:

du440:/# nandwrite -j /dev/mtd4 /rootfs.jffs2
MEMSETOOBSEL: Inappropriate ioctl for device

I read some posting about removal of this ioctl. So are there any patches for 
nandwrite to get rid of this issue? Or am I doing something completely 
wrong?

Matthias
