Received: from lion.vector.com.pl ([81.210.9.36])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BaBAS-0002OH-P1
	for linux-mtd@lists.infradead.org; Tue, 15 Jun 2004 06:27:51 -0400
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Jun 2004 12:27:41 +0200
Message-ID: <80908CC5B2C9DB47AAF8C77892FCB44315F7B2@lion.vector.com.pl>
From: "Andriy Korud" <a.korud@vector.com.pl>
To: <linux-mtd@lists.infradead.org>
Subject: CLEANMARKER node found at has totlen 0xc != normal 0x0  ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,=20
I'm playing with jffs2 on NAND chips (Samsung 128Mbyte), MTD CVS is week =
old and kernel is 2.6.5.

I'm making image with=20
./mkfs.jffs2 -b --eraseblock=3D131072 --pagesize=3D2048 -p -r /test_root =
-v -o test_root.img

and then copy it with cp (nandwrite seems to have problems wiht =
endianess). Everything work fine except on mounting filesystem I have =
messages:

CLEANMARKER node found at 0x00000000 has totlen 0xc !=3D normal 0x0
CLEANMARKER node found at 0x00020000 has totlen 0xc !=3D normal 0x0
CLEANMARKER node found at 0x00040000 has totlen 0xc !=3D normal 0x0
....
and so on for every block.

Shoud I take care of that messages? What do they mean?

regards,

Andriy Korud
