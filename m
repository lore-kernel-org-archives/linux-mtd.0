Received: from mail.mediatrix.com ([205.237.248.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 154nt3-0006uW-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 May 2001 19:06:33 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D99546E@mail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: "David Woodhouse (E-mail)" <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Found a potential bug in MTD
Date: Tue, 29 May 2001 14:05:53 -0400
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

	I did as it is said in document
ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs/mtd/mtd-jffs/HOWTO.txt to add =
MTD
support in linux kernel 2.4.4 for my PowerPC MPC860 embedded platform.  =
I
have a single flash chip on by board, an ATMEL AT49BV1614, which has a =
2MB
capacity.  So I configured xconfig with CFI support ( since I had found =
that
my atmel chip was CFI compliant ) and geometry 1x16 but the MTD driver
didn't detect the flash.  Then I tryed not to specify the geometry of =
my
flash chip, and two 8-bits chips ( 2x8 geometry ) was detected.  At =
this
point, I began suspecting a bug in the cfi_probe.c functions, which I
tracked down and found (at least, I think). =20

	In /mtd/chips/cfi_probe.c, function cfi_qry_mode( ).  Calls to
function cfi_send_gen that read as:
=20
		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map,
cfi->interleave, CFI_DEVICETYPE_X8, NULL);
		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map,
cfi->interleave, CFI_DEVICETYPE_X8, NULL);
		cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map,
cfi->interleave, CFI_DEVICETYPE_X8, NULL);
=20
should, in my opinion, read like:
		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map,
cfi->interleave, cfi->device_type, NULL);
		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map,
cfi->interleave, cfi->device_type, NULL);
		cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map,
cfi->interleave, cfi->device_type, NULL);  =20

	I compiled and tested the change with my board, and it works OK.  It
also make sense since CFI_DEVICETYPE_X8 is an hardcoded value for 8 =
bits
type devices, and cfi->device_type holds the buswidth specified in =
xconfig.

	Please come back to me on that.=20

Best regards,

Fr=E9d=E9ric Giasson
