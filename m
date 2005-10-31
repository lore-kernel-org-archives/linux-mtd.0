Received: from mailgw3.ericsson.se ([193.180.251.60])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EWcDS-0007O4-Lf
	for linux-mtd@lists.infradead.org; Mon, 31 Oct 2005 11:09:06 -0500
Received: from esealmw127.eemea.ericsson.se (unknown [153.88.254.122])
	by mailgw3.ericsson.se (Symantec Mail Security) with ESMTP id 9A92672D
	for <linux-mtd@lists.infradead.org>;
	Mon, 31 Oct 2005 16:52:54 +0100 (CET)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Oct 2005 16:52:32 +0100
Message-ID: <EF4121B4EBC4E045BDE1273F9D0A87FFCD4134@esealmw107.eemea.ericsson.se>
From: =?iso-8859-1?Q?Fredrik_J=F6nsson_B_=28AL/EAB=29?=
	<fredrik.b.jonsson@ericsson.com>
To: <linux-mtd@lists.infradead.org>
Subject: RE: The magic bitmask question - again
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> How do you define your partition layout?

mtd1: 00300000 00040000 "kernel"
mtd2: 07d00000 00040000 "jffs"

> Are you sure that the beginning of the first jffs2 partition=20
> of MTD is not overlapping with your "keep-off" region?=20

Yes, and studying the data on the partition confirms this.

> Eventually you could be trying to interpret parts of the=20
> kernel image as jffs2 filesystem. In that case you will get=20
> such messages.

That came to my mind, but this is unfortunately not the case, unless the =
scanning algorithm starts at wrong adress, i.e, at adress 0x0, and not =
the beginning of the /dev/mtd/2 (I'm using devfs) partition, at address =
0x00300000.=20

I just realized that this would be consistent with the output since the =
actual kernel spans four erase blocks after which the flash is empty up =
to the jffs partition. An inspection of the kernel partition confirms =
that the scan is starting from the 0x0 address.

The relevant bit of the command line for the kernel at boot is:
root=3D/dev/mtdblock/2 rootfstype=3Djffs2 =
mtdparts=3DUSERFLASH:3072k(kernel),-(jffs)

I would have expected the jffs2 scan to start att the /dev/mtd/2 device =
when the file system is mounted at boot, but this is obviously not the =
case. However, if I boot from something else and mount the partition =
afterwards it works just fine, with no error output from the scan.

I'm not quite sure what I am missing here.

Regards,

	/Fredrik J=F6nsson Norrstr=F6m
