Received: from mga03.intel.com ([143.182.124.21] helo=azsmga101-1.ch.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FPEp5-0008RJ-H7
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 03:17:46 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Mar 2006 09:17:00 +0100
Message-ID: <39CC97884CA19A4D8D6296FE94357BCB04DF5B14@swsmsx404>
From: "Kolakowski, Mikolaj" <Mikolaj.Kolakowski@intel.com>
To: <linux-mtd@lists.infradead.org>
Subject: erase suspend functionality
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


During kernel booting I observe that my system supports erase suspend. I
searched for any description how JFFS2 should use this feature, what
will be the observable result.=20
I assume that when I delete huge file and JFFS2 erases sectors from
erase pending list I finish do any small write within a moment and erase
will be suspended for this purpose. What I observe is JFFS2 blocking any
write until all sectors from the list are erased. Is it bug or it just
works like that?

Thank you,
Mikolaj
