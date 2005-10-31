Received: from mailgw4.ericsson.se ([193.180.251.62])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EWdPq-00086Z-NJ
	for linux-mtd@lists.infradead.org; Mon, 31 Oct 2005 12:25:54 -0500
Received: from esealmw129.eemea.ericsson.se (unknown [153.88.254.120])
	by mailgw4.ericsson.se (Symantec Mail Security) with ESMTP id 2F3144AD
	for <linux-mtd@lists.infradead.org>;
	Mon, 31 Oct 2005 18:25:47 +0100 (CET)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Oct 2005 18:25:45 +0100
Message-ID: <EF4121B4EBC4E045BDE1273F9D0A87FFCD4143@esealmw107.eemea.ericsson.se>
From: =?iso-8859-1?Q?Fredrik_J=F6nsson_B_=28AL/EAB=29?=
	<fredrik.b.jonsson@ericsson.com>
To: <linux-mtd@lists.infradead.org>
Subject: The magic bitmask question - problem solved
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=20
Hi,

The problem was the /dev/mtdblock/2. At this stage of the boot this is =
not recognized. Replacing it with /dev/mtdblock2 removed the problem.

To the people who spared some time to my issue; thank you very much for =
you efforts.

Regards,

	/Fredrik J=F6nsson Norrstr=F6m

> The relevant bit of the command line for the kernel at boot is:
> root=3D/dev/mtdblock/2 rootfstype=3Djffs2=20
> mtdparts=3DUSERFLASH:3072k(kernel),-(jffs)
