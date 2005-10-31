Received: from mailgw3.ericsson.se ([193.180.251.60])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EWYqL-0003Ea-T7
	for linux-mtd@lists.infradead.org; Mon, 31 Oct 2005 07:33:02 -0500
Received: from esealmw128.eemea.ericsson.se (unknown [153.88.254.121])
	by mailgw3.ericsson.se (Symantec Mail Security) with ESMTP id 9E0125CE
	for <linux-mtd@lists.infradead.org>;
	Mon, 31 Oct 2005 13:32:46 +0100 (CET)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Oct 2005 13:31:54 +0100
Message-ID: <EF4121B4EBC4E045BDE1273F9D0A87FFCD410C@esealmw107.eemea.ericsson.se>
From: =?iso-8859-1?Q?Fredrik_J=F6nsson_B_=28AL/EAB=29?=
	<fredrik.b.jonsson@ericsson.com>
To: <linux-mtd@lists.infradead.org>
Subject: The magic bitmask question - again
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This may be a stupid question, but I still need to ask.

We have a system with a 128Mb NOR-flash of which 3Mb is used as a =
keep-off area for the kernel and the rest for a JFFS2 root file system. =
The system boots and mounts properly and everything seems fine, but =
during mounting a number of messages such as the one below are shown for =
each of the first four erase-blocks of the mtd partition.

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000: =
0x4800 instead

Is this the expected behaviour? I've been fiddling with the padding =
option to mkfs.jffs2 in order to make the message go away without =
success. I've noted in the JFFS paper that four free flash sectors is =
"required" for garbage collection to work properly. Is it some sort of =
spare four sectors that mkfs.jffs2 creates for this purpose or what?

I've seen this question a number of times on the web, but have not seen =
it properly answered anywhere.=20

Grateful for any help on the matter,

	/Fredrik J=F6nsson
