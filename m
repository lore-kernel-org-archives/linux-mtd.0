Received: from smtp6.centerbeam.com ([64.95.134.54])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LCjp4-0002BU-5G
	for linux-mtd@lists.infradead.org; Tue, 16 Dec 2008 23:59:30 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: 
Date: Tue, 16 Dec 2008 15:59:29 -0800
Message-ID: <705901BA1DF18142AB3DE716DDF374F801FBD2F0@CBA0E2K03.CBA0.centerbeam.com>
From: "Manu Rao" <MRao@AlienTechnology.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We have an embedded system with ARM9, running linux 2.6.22 and jffs2 on
Samsung nand.
As part of our bootup process, we modify the /etc/inittab so that the
getty login screen is replaced with our application.

  if sed "/^#*T0/cT0:23:respawn:/sbin/getty -L -n -l /our_app/app ttyS0"
/etc/inittab > /etc/inittab_tmp; then
	mv /etc/inittab_tmp /etc/inittab

We have recently discovered units where the inittab has a length of
zero. My conjecture was that this had to do with the write-buffering,
and when I add a sync after the move, I don't see the problem anymore.

My boss, whose a hardware guy, insists that if we have a FileA that is
being replaced with a FileB, we should always have access to either
FileA or FileB, and that agrees with how I thought JFFS2 worked. But
without any doubt, inittab is getting zeroed out.

How does a move in the Filesystem occur? How can the size become zero?
Any pointers appreciated.
Thanks
Manu Rao
San Jose, CA
