Received: from p02c12o147.mxlogic.net ([208.65.145.80])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NKMf7-0006Gt-93
	for linux-mtd@lists.infradead.org; Tue, 15 Dec 2009 01:57:21 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Garbage Collection Questions?
Date: Mon, 14 Dec 2009 17:57:14 -0800
Message-ID: <CF3B33450CAA7449920664A1B6F11E6B03C29610@postak.glimmerglassnet.com>
From: "John Harbold" <harbold@glimmerglass.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 I have some questions on some JFFS2 =
scenarios running Linux kernel 2.6.10.=A0 These scenarios have to do =
with the state of a JFFS2 partition while its associated garbage =
collection kernel thread is running:

	* What would happen to a JFFS2 partition after a power failure when, 	=
before the power failure happened, the garbage collection thread was 	=
obsoleting nodes?

	* What would happen to a JFFS2 partition if while the garbage 	=
collection thread was active and the partition was marked as read-	=
only?=A0 Would the obsolete nodes be obliterated?

John Harbold
