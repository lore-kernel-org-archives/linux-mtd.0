Received: from mxs1.siemens.at ([194.138.12.131])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FOWs2-0001U1-EQ
	for linux-mtd@lists.infradead.org; Wed, 29 Mar 2006 04:21:49 -0500
Received: from vies1k7x.sie.siemens.at ([158.226.129.83])
	by mxs1.siemens.at  with ESMTP id k2T96dtG001523
	for <linux-mtd@lists.infradead.org>; Wed, 29 Mar 2006 11:06:39 +0200
Received: from nets138a.ww300.siemens.net ([158.226.129.98])
	by vies1k7x.sie.siemens.at (8.12.11.20060308/8.12.1) with ESMTP id
	k2T96crO027909
	for <linux-mtd@lists.infradead.org>; Wed, 29 Mar 2006 11:06:38 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Mar 2006 11:06:37 +0200
Message-ID: <38F58D7B92CB20438DF49D28B572CC6F13C4BC@budgw09a.ww300.siemens.net>
From: "Selmeci, Tamas" <tamas.selmeci@siemens.com>
To: <linux-mtd@lists.infradead.org>
Subject: JFFS2 + NAND solution
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello!

Now I have the solution for JFFS2 problem.

If you remember my previous message written yesterday, I could =
successfully mount the JFFS2 partition.

If you want to use it as rootfs, then the following kernel parameters =
must be given:

    root=3D/dev/mtdblock4 rootfstype=3Djffs2

That's it. I hope this little bit of information will help others.

Bye
--
Tamas Selmeci
Siemens PSE HU
Tel.   : +36-1-471-3861
Email  : tamas.selmeci@siemens.com
Address: H-1143 Budapest, Gizella ut 51-59
