Received: from c-67-165-125-5.client.comcast.net ([67.165.125.5]
	helo=deathgrab.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AzNS1-0002Bu-9g
	for linux-mtd@lists.infradead.org; Fri, 05 Mar 2004 22:05:49 +0000
Received: from www.deathgrab.com (localhost [127.0.0.1])
	by deathgrab.com (8.12.10/8.12.4) with ESMTP id i25NFcrA017293
	for <linux-mtd@lists.infradead.org>; Fri, 5 Mar 2004 14:15:38 -0900
Message-ID: <63072.65.37.112.188.1078528537.squirrel@mail.deathgrab.com>
Date: Fri, 5 Mar 2004 14:15:37 -0900 (AKST)
From: libber@deathgrab.com
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Subject: can only save empty files
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings, I am trying to get a read/write partition working for the
linksys WRT54G. To this end I have created a new partition which is the
correct size and is alinged on erase-block bounderies and such, I have
crosscompiled most of the programs in util from cvs. All should be well,
but alas it is not, I can erase my new partition (this is an amd flash
chip on a broadcom board if that changes things) and erasing works, I can
mount the partition rw which works. the really strange thing is that when
I write an empty file ('touch blah') and unmount or reboot or whatnot, the
file is saved and is there when I remount the partition. But if a file is
created that actuially has information in it then it is not saved. I have
no idea what the problem is here but I find it very strange, I have also
tried mkfs.jffs2 with the output going to the block device and that does
not work, I have also tried making an image with mkjfs.jffs2 and dding the
image to the device /dev/mtdblock/4 and that also does not work. This
might not even be related to jffs2 and is a problem with the driver for
the flash chip or something else,I am just hoping my post here will help
illuminate the problem. I am using kernel 2.4. I would be happy to provide
more information as needed.

Thanks for your time,
Libber
