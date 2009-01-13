Received: from mail.transmode.se ([83.241.175.147])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LMjMR-00087j-Vq
	for linux-mtd@lists.infradead.org; Tue, 13 Jan 2009 13:31:18 +0000
Subject: BUG in JFFS2 kernel 2.6.27
To: linux-mtd@lists.infradead.org
Message-ID: <OFB0D82DEF.AEFFD688-ONC125753D.0045FF81-C125753D.004A3AF2@transmode.se>
From: joakim.tjernlund@transmode.se
Date: Tue, 13 Jan 2009 14:30:19 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Just got this BUG:

Data CRC 22c90447 !=3D calculated CRC cbf47f8b for node at 07d2aadc
------------[ cut here ]------------
kernel               BUG               at              fs/jffs2/file.c:=
251!
Oops:      Exception      in      kernel      mode,     sig:     5     =
[#1]
TMCUTU
NIP:        c00eb5d0        LR:        c004ab34        CTR:        c00e=
b57c
REGS:      ce217bf0      TRAP:     0700    =A0=A0 Not     tainted    =A0=
 (2.6.27)
MSR:     00029032    <EE,ME,IR,DR>   =A0 CR:    24022422   =A0 XER:    =
00000000
TASK       =3D       ce1d6800[424]      'ne_swumd'      THREAD:      ce=
216000
GPR00:  00000001  ce217ca0  ce1d6800  ce296520  cf51b708  00000000 002a=
6000
00001000
GPR08:  00001000  00000000  c016bac4  cf86f600  00400000  10069018 1006=
0000
00000000
GPR16:  002a6000  00000000  00000000  c021010c  00000000  ce296520 cf86=
f400
cf51b648
GPR24:  00000000  00001000  00000000  002a6000  00000000  cf51b670 ce21=
6000
c0441820
NIP                  [c00eb5d0]                  jffs2_write_end+0x54/0=
x228
LR            [c004ab34]            generic_file_buffered_write+0x178/0=
x634
Call                                                                 Tr=
ace:
[ce217ca0]       [c016aa94]       release_sock+0x94/0xa8       (unrelia=
ble)
[ce217ce0]        [c004ab34]        generic_file_buffered_write+0x178/0=
x634
[ce217d70]      [c004b394]      __generic_file_aio_write_nolock+0x3a4/0=
x568
[ce217df0]           [c004b6b0]           generic_file_aio_write+0x68/0=
x120
[ce217e20]                [c006a1a4]               do_sync_write+0xc8/0=
x13c
[ce217ef0]                  [c006a2b4]                 vfs_write+0x9c/0=
x174
[ce217f10]                  [c006a468]                  sys_write+0x4c/=
0x90
[ce217f40]               [c000f3ec]               ret_from_syscall+0x0/=
0x38
--- Exception: c01 at 0xf9c1744
=A0=A0=A0 LR =3D 0x1003ce20
Instruction dump:
83a40000 7f384214 54dc053a 817d008c 82cb019c 92e10008 3afdffd8 80090000=

70090008  41820004  7c000026 54001ffe <0f000000> 6b291000 7d2bfe70 7d60=
4a78
---[ end trace 79c27f7a1b03cf81 ]---

Anyone seen something similar?


Found a few JFFS2 messages in dmesg boot too:

Empty flash at 0x0779bf20 ends at 0x0779cb1c
Empty flash at 0x07cd1c00 ends at 0x07cdb11c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x07cdb11c:
0xffff instead
Empty flash at 0x07cdb120 ends at 0x07cdbd1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x07cdbd1c:
0xffff instead
Empty flash at 0x07cdbd20 ends at 0x07cdcb1c
.....

   Jocke
PS.
      Sorry  if  this  mail  looks  funny,  just  switched  mail  syste=
m to
Lotus/Domino.=
