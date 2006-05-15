Received: from 67.111.72.3.ptr.us.xo.net ([67.111.72.3]
	helo=nonameb.ptu.promise.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FfgQO-0004zp-48
	for linux-mtd@lists.infradead.org; Mon, 15 May 2006 13:00:13 -0400
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 May 2006 10:01:00 -0700
Message-ID: <B70A50D07063384EB9BCE3330D18414F024CECBA@nonameb.ptu.promise.com>
From: "Lakshmi N. Sundararajan" <lakshmi.s@promise.com>
To: "mtd" <linux-mtd@lists.infradead.org>
Subject: jffs2 compatibility 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Team:
I have an AMD 32MB/64Ksector block and a SPANSION 32MB/128Ksector block
FLASH chips.

I create partitions on both of them, to align on the 128KB boundary.
Now, can I create a jffs2 filesystem once, and make it run on both of
them successfully?
Is there any issues that makes the same image not to run on both of
them?

I also see an option eraseblock whose size is default to 64KB. I guess
this needs
to match the sector block size, but it can be made a multiple of 64KB
also right=20
(on the AMD Flash with 64KB sector size, can it also be chosen to be
128KB)?

Please JFFS2 experts can you comment on this one.

BTW, I also see BADMAGIC JFFS2 partition not recognized, expected magic
0x1984
got something else from jffs2_scan_eraseblock() on bootup sometimes.
What does this
really mean? And sometimes the boot is successfull. Sometimes the system
hangs=20
(Cannot mount root). Infact the root filesystem is not even JFFS2 it is
compressed ext2.=20
But during the initialization, other jffs2 partitions are mounted.

Any pointers on this?=20

Thanks,
-LN



CONFIDENTIALITY NOTICE: The information contained in or attached to this
email message is either proprietary and/or confidential information, or
information intended solely for the use of the individual or entity
named above.  If the reader of this message is not the intended
recipient, or the employee or agent responsible to deliver it to the
intended recipient, you are hereby notified that any dissemination,
distribution or copying of this communication is strictly prohibited.
If you have received this communication in error, please immediately
notify us by email and delete the original message from your
computer/server with confirmation to us that you have done so.  Thank
you.
