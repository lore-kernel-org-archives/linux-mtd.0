Received: from mail.ipcas.de ([83.236.147.227])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HlLIh-00064P-KM
	for linux-mtd@lists.infradead.org; Tue, 08 May 2007 04:44:15 -0400
Received: from localhost (unknown [127.0.0.1])
	by mail.ipcas.de (Postfix) with ESMTP id AA5DAA0403
	for <linux-mtd@lists.infradead.org>;
	Tue,  8 May 2007 10:44:01 +0200 (CEST)
Received: from mail.ipcas.de ([127.0.0.1])
	by localhost (mail.ipcas.de [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP
	id 29357-05 for <linux-mtd@lists.infradead.org>;
	Tue,  8 May 2007 10:43:59 +0200 (CEST)
Received: from midgard.ipcas.de (firewall.ipcas.de [83.236.147.226])
	by mail.ipcas.de (Postfix) with ESMTP id 22A51A03F2
	for <linux-mtd@lists.infradead.org>;
	Tue,  8 May 2007 10:43:59 +0200 (CEST)
Received: from franken3 (unknown [192.109.223.63])
	by midgard.ipcas.de (Postfix) with ESMTP id 19F6876C103
	for <linux-mtd@lists.infradead.org>;
	Tue,  8 May 2007 10:43:59 +0200 (CEST)
Date: Tue, 08 May 2007 10:44:01 +0200
From: =?UTF-8?Q?Michael_K=C3=B6nig?= <Michael.Koenig@ipcas.de>
To: linux-mtd@lists.infradead.org
Subject: Problems with cfi_cmdset_0002 and Atmel AT49BV642D
Message-ID: <D1CA5322EC0446D8F2053C9D@franken3>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello there,

as a short introduction (I'll be more precise later):
We built our own Linux device utilizing the ETRAX 100LX microcontroller and =

using the SDK provided by Axis. As a Flash chip we chose the Atmel=20
AT49BV642D.

With the Linux 2.4 based SDK that includes cfi_cmdset_0002.c v1.62=20
2003/01/24 the Flash worked fine although it wasn't correctly recognised by =

the CFI probe (the Atmel patches weren't there yet), but it seems that=20
JEDEC seems to fix that up. Excerpt from dmesg on Linux 2.4:

 Amd/Fujitsu Extended Query Table v1.0 at 0x0041
cse0: JEDEC Device ID is 0xD6. Assuming broken CFI table.
cse0: Swapping erase regions for broken CFI table.
number of CFI chips: 1
cfi_cmdset_0002: Disabling fast programming due to code brokenness.

I'm not totally sure what the last line means exactly, but Flash operations =

seem to work fine nontheless.


The new SDK from Axis is based on Linux 2.6 and includes cfi_cmdset_0002.c=20
v1.122 2005/11/07. In this case the Flash is correctly recognised thanks to =

the Atmel patches (I also made sure that fixup_convert_atmel_pri() gets=20
called and the AT49BV642D is identified as a bottom boot device):

cse0: Probing a 0x04000000 bytes large window at 0xe0000000.
cse0: Found 1 x16 devices at 0x0 in 16-bit bank
cse0: Found an alias at 0x800000 for the chip at 0x0
cse0: Found an alias at 0x1000000 for the chip at 0x0
cse0: Found an alias at 0x1800000 for the chip at 0x0
cse0: Found an alias at 0x2000000 for the chip at 0x0
cse0: Found an alias at 0x2800000 for the chip at 0x0
cse0: Found an alias at 0x3000000 for the chip at 0x0
cse0: Found an alias at 0x3800000 for the chip at 0x0
 Amd/Fujitsu Extended Query Table at 0x0041
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.


The system boots fine and reading isn't a problem either, but it seems that =

no data is actually written to the Flash. When creating a new file on JFFS2 =

I get an error message like this:

Node totlen on flash (0xffffffff) !=3D totlen from node ref (0x00000044)

I guess the magic number 0x1985 isn't checked, otherwise it might even fail =

before checking the totlen.

At first I thought that the problem is just with do_write_buffer(), but=20
Axis have a bootblocktool that lets you write data to a specific partition=20
that is classified as a mtdchar device. While I don't get error messages in =

this case, the written data simply cannot be read back, so I guess there=20
must be a problem with do_write_one_word() as well.

I noticed that do_write_buffer() seems to use some kind of burst mode, but=20
I wasn't able to find that command sequence (0xAA, 0x55, 0x25) in neither=20
the documentation for the AT49BV642D nor an AMD one (Am29DL640D) I looked=20
at for comparison.

Since the AT49BV642D is a successor of the AT49BV6416 I tried activating=20
fixup_use_atmel_lock() for it as well, but that didn't help either.

All the tests were performed on the same device and once I switch from=20
Linux 2.6 back to 2.4 everything works fine, so I doubt that there is a=20
problem with the Flash itself.

Does anybody have an idea what might be the cause of this problem?

Thanks in advance!

--=20
Mit freundlichen Gr=C3=BC=C3=9Fen
Best regards
Michael K=C3=B6nig

ipcas GmbH
Wetterkreuz 17
91058 Erlangen, Germany
Tel.: +49 9131 7677-31
Fax: +49 9131 7677-78
mailto:Michael.Koenig@ipcas.de

Gesch=C3=A4ftsf=C3=BChrer: Dipl.-Ing. S. Sutiono
Sitz der Gesellschaft: Erlangen
Registergericht: F=C3=BCrth, HBR 3676
WEEE-Reg.-Nr. DE 77202473

Hinweis: Diese E-Mail und etwaige Anlagen k=C3=B6nnen Betriebs- oder
Gesch=C3=A4ftsgeheimnisse, dem Anwaltsgeheimnis unterliegen oder sonstige
vertrauliche Informationen enthalten. Sollten Sie diese E-Mail
irrt=C3=BCmlich erhalten haben, ist Ihnen der Status dieser E-Mail bekannt.
Bitte benachrichtigen Sie uns in diesem Fall sofort durch Antwort-Mail
und l=C3=B6schen Sie diese E-Mail nebst etwaigen Anlagen von Ihrem System.
Ebenso d=C3=BCrfen Sie diese E-Mail oder seine Anlagen
nicht kopieren oder an Dritte weitergeben. Vielen Dank.
