Received: from fmmailgate04.web.de ([217.72.192.242])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HGWKw-0006d7-Cp
	for linux-mtd@lists.infradead.org; Mon, 12 Feb 2007 03:15:02 -0500
Received: from web.de
	by fmmailgate04.web.de (Postfix) with SMTP id BB3A270E77B
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Feb 2007 09:14:56 +0100 (CET)
Date: Mon, 12 Feb 2007 09:14:56 +0100
Message-Id: <1390363360@web.de>
MIME-Version: 1.0
From: Tobias Arp <tobiasarp@web.de>
To: linux-mtd@lists.infradead.org
Subject: fsync problem with mtd device and jffs2
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

am using linux-2.6.13-ep93xx-gao66 on my edb9315 board and i am using
jffs2 on a mtd device (AT49BV322DT flash). Sometimes when i copy a file
to this device it is not completly written although i have made fsync or
sync. But when i decrease the dirty=5Fwriteback=5Fcentisecs time it is
always completely written.
Why does fsync or sync not work=3F Is it a good way to solve the problem
by decreasing dirty=5Fwriteback=5Fcentisecs time or do i have to decrease
the dirty=5Fexpire=5Fcentisecs time too=3F Normally it is only written to this
device during my firmware updates. So its nor really often accessed.
Sorry for posting this message agin on this list, but i thought it would
be the better place for it.
Regards

Tobias
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
Viren-Scan f=FCr Ihren PC! Jetzt f=FCr jeden. Sofort, online und kostenlos.
Gleich testen! http://www.pc-sicherheit.web.de/freescan/=3Fmc=3D022222
