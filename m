Received: from smtp8.wanadoo.fr ([193.252.22.23] helo=mwinf0802.wanadoo.fr)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BN7iU-00063f-AW
	for linux-mtd@lists.infradead.org; Mon, 10 May 2004 11:08:58 +0100
Received: from CHENE (ARennes-303-1-10-185.w81-48.abo.wanadoo.fr
	[81.48.138.185])
	by mwinf0802.wanadoo.fr (SMTP Server) with ESMTP id 0361D18001BF
	for <linux-mtd@lists.infradead.org>;
	Mon, 10 May 2004 12:08:57 +0200 (CEST)
From: "Pascal Fifre" <pascal.fifre@cleode.com>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 10 May 2004 12:08:56 +0200
Message-ID: <000601c43676$ce9b6db0$3055a8c0@cleode.local>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: PB with millenium plus 64
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm developing a controller board with a DOC plus 64 MB.

In a first time, the OS not recognize it. Then I saw in the
doc2001plus.c  code, that the 16 bit access on DOC was not implemented.
Is it true?
I put my DOC in a 8 bit access and then, the OS recognize it, and the 2
FLASH chips (Mfr =3D 0x98 and Id =3D 0x75) were recognized too.
=20
Then, when I've tried to format it with "nftl_format" on Linux. The
nftl_format  told me "Unrecognized Erase size, 0x8000 - I'm confused\n".

I modify the code for accepted the 0x8000 size and retry: this operation
made an ERASE operation on DOC. Since I did it, I can't read the ID chip
of flash (Manufacturer and Id chip)? I read always 0xFF on the 2
parameters.

I think, in the same time, the LOCK pin was on. Perhaps my DOC is
locked?
In this case how can I do to unlock it?

What's wrong with DOC?

Thanks a lot

Pascal FIFRE
Responsable Syst=E8mes Embarqu=E9s
CLEODE
5, rue de Broglie
22300 LANNION
Tel : 02 96 48 68 18
http://www.cleode.com
