Received: from smtp6.wanadoo.fr ([193.252.22.25])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EiCwC-0001nv-AL
	for linux-mtd@lists.infradead.org; Fri, 02 Dec 2005 10:35:09 -0500
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf0607.wanadoo.fr (SMTP Server) with ESMTP id F0BE41C00202
	for <linux-mtd@lists.infradead.org>;
	Fri,  2 Dec 2005 16:35:00 +0100 (CET)
Received: from genevrier (ARennes-251-1-35-231.w81-250.abo.wanadoo.fr
	[81.250.198.231])
	by mwinf0607.wanadoo.fr (SMTP Server) with ESMTP id A7C7C1C00219
	for <linux-mtd@lists.infradead.org>;
	Fri,  2 Dec 2005 16:35:00 +0100 (CET)
From: "Pascal Fifre" <pascal.fifre@cleode.com>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 2 Dec 2005 16:34:59 +0100
Message-ID: <004d01c5f755$f50edd00$1856a8c0@cleode.local>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Chekfs and big-endian
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I use a JFFS2 file system on a NAND Flash with a 2.4.25 kernel. It works
fine for now.

But I want to run the checkfs utility against the power-fail problem.

=20

My system is big-endian. How can I fix the checkfs utility to run =
checkfs on
my system ?

=20

Thanks


Pascal FIFRE
Responsable Syst=E8mes Embarqu=E9s
CLEODE
5, rue de Broglie
22300 LANNION
Tel : 02 96 48 68 18
http://www.cleode.com
