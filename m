Received: from mail.datacom-telematica.com.br ([200.102.77.20]
	helo=eserver.datacom-telematica.com.br)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DyEIf-0003E5-2l
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2005 15:44:21 -0400
From: DataCom - =?iso-8859-1?q?Virg=EDlio?=
	<virgilio@datacom-telematica.com.br>
To: linux-mtd@lists.infradead.org
Date: Thu, 28 Jul 2005 16:40:54 -0300
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200507281640.54771.virgilio@datacom-telematica.com.br>
Subject: Single bit error correction on NAND.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have noticed that NAND support on MTD can detect/correct single bit error=
s=20
in 256 bytes, using software ECC. However, the correct data is not written=
=20
back to flash. In other words, the bit stays "flipped" in flash. Isn't that=
=20
dangerous? I mean, if another bitflip occurs in the same 256 bytes, we won'=
t=20
be able to correct by software ECC...

Am I missing something here? Thanks in advance.

=2D-=20
Virg=EDlio Silva
