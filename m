Received: from mx4.tellabs.com ([204.154.129.57])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DTkZa-00035p-Q8
	for linux-mtd@lists.infradead.org; Thu, 05 May 2005 13:55:43 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 5 May 2005 12:55:37 -0500
Message-ID: <E167ED46776D284B893BE52E888B69BC030F2125@USNVEX3.tellabs-west.tellabsinc.net>
From: "Burch, John T." <John.Burch@tellabs.com>
To: <linux-mtd@lists.infradead.org>
Subject: JFFS2 format compatibility between kernel versions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Is a JFFS2 type filesystem formatted from blank flash (running as part
of
kernel 2.4.17) fully compatible with JFFS2 running on kernel 2.6.8?
In other words, if a system's kernel is upgraded from 2.4.17 to 2.6.8,
will a filesystem created under 2.4.17 be fully compatible when accessed
by the 2.6.8 kernel?  I haven't seen any problems, but want to make sure
there isn't any form of incompatibility that might show up later.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The information contained in this message may be privileged
and confidential and protected from disclosure. If the reader
of this message is not the intended recipient, or an employee
or agent responsible for delivering this message to the
intended recipient, you are hereby notified that any reproduction,
dissemination or distribution of this communication is strictly
prohibited. If you have received this communication in error,
please notify us immediately by replying to the message and
deleting it from your computer. Thank you. Tellabs
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
