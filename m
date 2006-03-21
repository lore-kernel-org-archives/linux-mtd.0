Received: from 67.111.72.3.ptr.us.xo.net ([67.111.72.3]
	helo=nonameb.ptu.promise.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLUNx-0006WC-L3
	for linux-mtd@lists.infradead.org; Mon, 20 Mar 2006 19:06:09 -0500
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Mar 2006 16:06:15 -0800
Message-ID: <B70A50D07063384EB9BCE3330D18414F024CCD28@nonameb.ptu.promise.com>
From: "Lakshmi N. Sundararajan" <lakshmi.s@promise.com>
To: <linux-mtd@lists.infradead.org>
Subject: boot issue.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Team:
This may or may not be only related to MTD, but chances are someone
would be knowing
solutions for my case.

I have a compressed ext2 filesystem on a FLASH partition which I would
like
to use as a root file system mounted in RAM. The FLASH is accessed via
MTD layer.

The kernel parameters are "console=3DttyS0,115200  noinitrd mem=3D128M
root=3D/dev/mtdblock5"
But kernel panics saying "VFS: Cannot mount root unknown device (31,5)".

If I were to use cramfs on FLASH and use the same kernel command line,
I am able to bringup the system.I am using 2.6 linux.

Would anyone know about this issue? Is there any thing I got to do?
Any pointers would be helpful.

Thanks,
-LN
