Received: from freesurfmta06.sunrise.ch ([194.230.0.34]
	helo=freesurfmail.sunrise.ch)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19L7zp-0000r7-Ce
	for <linux-mtd@lists.infradead.org>; Wed, 28 May 2003 21:58:05 +0100
Received: from theodul (194.230.187.31) by freesurfmail.sunrise.ch (6.0.055)
	id 3ED4AE740001398C for linux-mtd@lists.infradead.org;
	Wed, 28 May 2003 22:59:08 +0200
From: Felix Frey <ffrey@freesurf.ch>
To: linux-mtd@lists.infradead.org
Date: Wed, 28 May 2003 22:58:42 +0200
MIME-Version: 1.0
Message-Id: <03052822584200.01023@theodul>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Problem with nftl-driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Today, I tried to test the new nftl-code. Therefor I took the code from C=
VS=20
and patched a 2.4.20 kernel. At the same time the grub-firmware was built=
 and=20
loaded using DFORMAT (V5.1.4) on a DOC-Millenium.
Everything went fine so far, the DOC was bootable and correctly recognise=
d.
However, the nftla-device was not accessible, neither by fdisk nor by mou=
nt.=20
I even couldn't mount the DOS-partition created by dformat.
fdisk mentioned: "Unable to open /dev/nftla".
A similar test with the alternative driver for DOC-Millenium ended up equ=
ally.

Any suggestions?

Felix=20
