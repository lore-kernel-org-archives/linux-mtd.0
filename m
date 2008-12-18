Received: from smtp6.centerbeam.com ([64.95.134.54])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LD740-0005T7-8B
	for linux-mtd@lists.infradead.org; Thu, 18 Dec 2008 00:48:28 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Data loss on unclean powercycle with JFFS2/NAND
Date: Wed, 17 Dec 2008 16:48:25 -0800
Message-ID: <705901BA1DF18142AB3DE716DDF374F801FBD840@CBA0E2K03.CBA0.centerbeam.com>
From: "Manu Rao" <MRao@AlienTechnology.com>
To: <linux-mtd@lists.infradead.org>,
	<linux-users-list@lists.timesys.com>
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

We have recently discovered units where the inittab suddenly becomes a
zero-length file. My conjecture was that this had to do with the
write-buffering, and when I add a sync after the move, it helps
somewhat.

The way I understood jffs2, if we have a FileA that is being replaced
with a FileB, we should always have access to either FileA or FileB. But
without any doubt, inittab is getting zeroed out.

How does a move in the Filesystem occur? How can the size become zero?

Any pointers appreciated.

Thanks
Manu Rao
San Jose, CA
