Received: from proxy01.el-me.de ([212.184.203.66] helo=proxy02.el-me.de)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KuPWG-0000lO-By
	for linux-mtd@lists.infradead.org; Mon, 27 Oct 2008 10:40:20 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: JFFS2 driver under 2.4.31 fails to trigger garbage
	collection/compression
Date: Mon, 27 Oct 2008 11:40:17 +0100
Message-ID: <9503E3D8EC34CC4EA3FBC01F3BFAB8AE6AA502@exchange05.elmedmn.local>
From: "Heinig Gerald" <g.heinig@el-me.de>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

First off, I hope this is the correct mailing list for jffs2 under =
kernel 2.4. If it isn't, my apologies and please point me to the correct =
site. Thanks in advance.

I have encountered a problem with the jffs2 flash filesystem in kernel =
version 2.4.31.
Booting an NFS-root Kernel version 2.4.25 and mounting the flash =
filesystem with a particular image will indicate 140 kbytes of free =
space and can be written to without any problems.
Mounting this filesystem under a 2.4.31 NFS-root kernel and trying to =
write to it gives an error of no space left on device with 0 kbytes =
free, which is incorrect.
The garbage collection / compression algorithm apparently fails to =
detect the dirty blocks and therefore does not remove them, leading to =
erroneous memory usage accounting.
I tried waiting for up to 2 hours for the compression algorithm to =
start, without success.

Anyone have any ideas.

Beste Gr=FC=DFe / Best regards
=A0
Gerald Heinig
Software Development

------------------------------------------------------------------------
EL-ME =
AG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0Fon: +49 8752 864 0
Gewerbering =
1=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0Fax: =
+49 8752 860 100
84072 Au i. d. Hallertau=A0=A0=A0=A0=A0=A0=A0=A0 =A0www.el-me.de=20
g.heinig@el-me.de

HRB 128557 - Registergericht M=FCnchen=20
Aufsichtsratsvorsitzender Jacobus J.Verhaegen=20
Vorstand Reinhard R. Blum (Vorsitzender)=20
Vorstand G=FCnther Froschermeier=20
