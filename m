Received: from ext-ch1gw-2.online-age.net ([216.34.191.36])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BmzKy-0002De-J5
	for linux-mtd@lists.infradead.org; Tue, 20 Jul 2004 14:27:39 -0400
Received: from int-ch1gw-5.online-age.net (int-ch1gw-5 [3.159.232.69])
	by ext-ch1gw-2.online-age.net (8.12.9/8.12.9/990426-RLH) with ESMTP id
	i6KIRRnZ016401 for <linux-mtd@lists.infradead.org>;
	Tue, 20 Jul 2004 14:27:28 -0400 (EDT)
Received: from cinmlef01.e2k.ad.ge.com (localhost [127.0.0.1])
	by int-ch1gw-5.online-age.net (8.12.9/8.12.3/990426-RLH) with ESMTP id
	i6KIRQ4o016395 for <linux-mtd@lists.infradead.org>;
	Tue, 20 Jul 2004 14:27:27 -0400 (EDT)
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Jul 2004 20:18:39 +0200
Message-ID: <09A97B4DFB4DB64FB8B58BBC4A1F3C2905EF2904@GNTMLVEM01.e2k.ad.ge.com>
From: "Billalabeitia,
	Jose Carlos \(GE Consumer & Industrial\)" <jc.billalabeitia@ge.com>
To: <linux-mtd@lists.infradead.org>
Subject: JFFS2 Flash Filesystem corrupted
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


	Hi:
=09
	I have a custom board with the following features:

		CPU MPC860T (PowerPC)
		16 MB of FLASH (2 29LV650UE (4Mx16 bit) compatible JEDEC & CFI )
		16 MB of RAM
		linux-2.4.4-2002-02-14-denx
		linux-2.4.4-jffs2-2002-05-01.patch for the JFFS2 (basically improve GC =
performace)

	We have experienced in a very few occasions, in fact only twice or =
three times, a weird problem.
Our application are composed of multiple excutable and module files that =
are started and insmoded=20
respectively one by one during the boot up process. After a system =
rebooting everything was fine
and we got the app running, therefore executable and module files were =
right.=20
However one day after a rebooting we realized that the app. didn=B4t go =
and we check the integrity of the
excutable and module files by comparing them with the original ones, and =
we discovered that 4Kbytes of=20
executable module file were replaced with all zeros.=20

	Due to the low probability of this type of problem that we have =
encountered it makes me think
that it might be a hardware problem, but in this case I can=B4t find a =
good explanation for it.

	Another thing that surprises me is that the filesystem says that that =
file is OK, so I suppose
then that the CRCs of the nodes were the zeros are located are correct, =
so my suspect is that those
zeros were put intentionally.

	On the other hand that file never changes so I think that the only one =
responsible for moving
those data would be the GC when the "wear levelling" process. Any ideas?

									Thank you
										Billa
