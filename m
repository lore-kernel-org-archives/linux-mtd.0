Received: from mail.mediatrix.com ([66.129.134.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17AElp-0006W8-00
	for <linux-mtd@lists.infradead.org>; Tue, 21 May 2002 19:54:05 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D014ECF47@mail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: 'David Woodhouse' <dwmw2@infradead.org>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: RE: Kernel oops after sync command in jffs2 
Date: Tue, 21 May 2002 14:54:02 -0400
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

Here is the oops trace:

sync
mtxmap_write16() called when erasing!
waiting for erase to complete timed out.<4>Erase at 0x00030000 failed
immediately: errno -5
Oops: kernel access of bad area, sig: 11
NIP: C000FA20 XER: 20000000 LR: C000FA1C SP: C1B79E10 REGS: c1b79d60 =
TRAP:
0300    Not tainted
MSR: 00001032 EE: 0 PR: 0 FP: 0 ME: 1 IR/DR: 11
DAR: 00000000, DSISR: 20000000
TASK =3D c1b78000[155] 'sync' Last syscall: 36
last math c1b78000 last altivec 00000000
GPR00: 00001032 C1B79E10 C1B78000 00000001 00009032 00000001 00000000
00000016
GPR08: 003F0000 C00BCEE0 00400000 C1B79E28 0F000000 1001F398 00000000
00000000
GPR16: 00000000 00000000 00000000 00000000 00009032 01B79F40 00000000
00000003
GPR24: C0130000 C0130000 C1B79E28 00000001 00000000 00000000 00000001
C1B79E10
Call backtrace:
00000000 C00BCEFC C00BD26C C008E460 C008E6F8 C008F7F4 C003CEE0
C0038344 C0038398 C0005ADC 10000B38 0FED0780 00000000


Here is the call backtrace decoding:
C00BCEFC:	concat_erase_callback()
C00BD26C:	concat_erase()
C008E460:	jffs2_erase_block()
C008E6F8:	jffs2_erase_pending_blocks()
C008F7F4:	jffs2_write_super(0
C003CEE0:	sync_supers()
C0038344:	fsync_dev()
C0038398:	sys_sync()
C0005ADC:	ret_from_syscall1()


Something is even more interesting that the call backtrace itself in =
the
trace log above:
"mtxmap_write16() called when erasing!"

This is a trace which I put down at the map driver level which prints =
only
when the write16() function is called when the flash device is erasing =
(i.e.
in the meantime that the 6 commands of an erase cycle are sent to the =
flash
and the time DQ6 stops toggling).
This should not happen!  I have only 1 flash device on my board and
cfi_cmdset_0002.c chip driver does not support multiple banks, which =
allows
to read or write to another bank while the first is erasing. =20

Moreover, the trace: "waiting for erase to complete timed out." comes =
from
the chip driver's do_erase_oneblock() function and pops because DQ5 has =
been
asserted, meaning that a write has been attempted to a sector in the =
same
bank that the sector that was erasing.  This is confirmed by the first
traced I highlighted.

I keep on actively searching for the cause of the problem.

Fr=E9d=E9ric Giasson








|-----Original Message-----
|From: David Woodhouse [mailto:dwmw2@infradead.org]
|Sent: Thursday, May 16, 2002 1:35 PM
|To: Frederic Giasson
|Cc: 'linux-mtd@lists.infradead.org'
|Subject: Re: Kernel oops after sync command in jffs2=20
|
|
|
|Show oops? Decoded.
|
|--
|dwmw2
|
|
