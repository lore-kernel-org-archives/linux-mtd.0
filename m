Received: from mail.mediatrix.com ([205.237.248.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 154So3-0005hG-00
	for <linux-mtd@lists.infradead.org>; Mon, 28 May 2001 20:36:00 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D99546A@mail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: "David Woodhouse (E-mail)" <dwmw2@infradead.org>
Cc: "linux-mtd@lists.infrared.org" <linux-mtd@lists.infradead.org>
Subject: Bug in MTD xconfig?
Date: Mon, 28 May 2001 15:35:06 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,

	I downloaded the lastest MTD code from infradead's CVS site and I am
experiencing a problem with the kernel configuration.  In menu "Memory
Technology Devices" / "Maping drivers for chips access", I set "CFI =
Flash
device in physical memory map" to 'y', but I whenever I enter values =
for
Physical start address and length,  my values always change to =
something
like 0x8000000 and 0x4000000.  I had to hardcode the real values for =
the
flash physical address and length of my board in autoconf.h.  Did you =
ever
heard/dealed with this problem?  =20

Thank you!

Fr=E9d=E9ric Giasson
Software Developper=20
Mediatrix Telecom, Inc.=20
4229 Garlock Street=20
Sherbrooke (Quebec)=20
Canada J1L 2C8=20
Tel...: (819) 829-8749 EXT. 366
Fax...: (819) 829-5100=20
Web...: <http://www.mediatrix.com/>=20
Email.: <mailto:fgiasson@mediatrix.com>=20
