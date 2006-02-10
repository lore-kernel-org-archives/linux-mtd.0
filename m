Received: from 67.111.72.3.ptr.us.xo.net ([67.111.72.3]
	helo=nonameb.ptu.promise.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F7dVH-00082H-Dl
	for linux-mtd@lists.infradead.org; Fri, 10 Feb 2006 14:00:26 -0500
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Feb 2006 10:50:42 -0800
Message-ID: <B70A50D07063384EB9BCE3330D18414F024CEC5D@nonameb.ptu.promise.com>
From: "Lakshmi N. Sundararajan" <lakshmi.s@promise.com>
To: <linux-mtd@lists.infradead.org>
Subject: Newbie Q
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Forum:
I need to write a device driver for Spansion Flash on a new board.
I read through the MTD documentation, whatever I can get, from the
internet.=20

I have few question which I know you could help me out.

I would like to understand the files that needs to be modified/written
for bringing up a FLASH device; the complete picture.

So, can someone point one currently supported FLASH (With its
specification
and its associated board) and its associated driver files that had been
written to bring this up
on linux.

I understand there should atleast be two files.
1) Board specific mapping files; comes under mtd/maps
2) CFI layer for flash; comes under mtd/chips

And where/how does top layer file systems gets hooked onto the device.
This should be the MTD layer, correct?

I also see another directory under mtd, namely mtd/devices.
Cannot figure what this is for and how different is it from other
directories.

Please let me know about these.

Thanks & Regards,
-LN
