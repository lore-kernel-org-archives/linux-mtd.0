Received: from mailout.ltindia.com ([203.199.60.6])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BxQLe-0005kT-Gt
	for linux-mtd@lists.infradead.org; Wed, 18 Aug 2004 09:19:28 -0400
Received: (from EMAIL [192.168.172.1])
	by LNTMAIL.LNTMAIL.LTINDIA.COM (SAVSMTP 3.1.2.35) with SMTP id
	M2004081818491726193
	for <linux-mtd@lists.infradead.org>; Wed, 18 Aug 2004 18:49:17 +0530
Message-Id: <s123a51a.003@EMAIL>
Date: Wed, 18 Aug 2004 18:50:51 +0530
From: "Raghav K" <raghavk@myw.ltindia.com>
To: <linux-mtd@lists.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Subject: Raw writes using MTD Char Driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings all,

Hi, I  have 8MB AMD29FXX flash organized as  16 chips of 0.5 MB each as =
DIMM package on a=20
MPC885 board. The same is accessed as a 4 x 2MB interleaved flash, of =
effective sector size=20
256k. I'm using the  MTD concatation option to interleave thes chips. I'm =
using Arabella Linux,=20
kernel 2.4.25.

When I attempt to write a 256k chunk of data to an erased sector the kerel =
crashes
with the followng dump

Waitin c03b2000[25] 'driv_mtd' Last syscall: 4
last math 00000000 last altivec 00000000
GPR00: 00040000 7FFFFDC0 00000000 0000000A 00000001 00000008 3006C2A4 =
00000001
GPR08: 7FFFFCD0 00000190 00000001 10010EAC 300052EC 00000000 30005140 =
30005000
GPR16: 00000002 000000CC riv_mtd' Last syscall: 4
last math 00000000 last altivec 00000000
GPR00: 00040000 7FFFFDC0 00000000 0000000A 00000001 00000008 3006C2A4 =
00000001
GPR08: 7FFFFCD0 00000190 00000001 10010EAC 300052EC 00000000 30005140 =
30005000
GPR16: 00000002 000000CC 300050A0 000000CC 30002D6C 30000C1C 00003915 =
30005154
GPR24: 30000130 30000000 10000000 10000000 00000003 10014000 00000000 =
00000000
Call backtrace:
100008A0 30026FE0 30026FFC 10000780 00000000 7FFFFF74
Kernel panic: Aiee, killing interrupt handler!
In interrupt handler - not syncing
 <0>Rebooting in 180 seconds..

However when I try to write to the same sector in smaller chunks of 512 =
bytes,
the write operation to entire sector is successful, however a warning is =
raised.=20

Warning: DQ5 raised while program operation was in progress, however =
operation completed OK

I have the following is  my  kernel configuration :

CONFIG_MTD=3Dy
CONFIG_MTD_PARTITIONS=3Dy
CONFIG_MTD_CONCAT=3Dy
CONFIG_MTD_CHAR=3Dy
CONFIG_MTD_BLOCK=3Dy

CONFIG_MTD_CFI=3Dy
CONFIG_MTD_JEDECPROBE=3Dy
CONFIG_MTD_GEN_PROBE=3Dy
CONFIG_MTD_CFI_ADV_OPTIONS=3Dy
CONFIG_MTD_CFI_BE_BYTE_SWAP=3Dy
CONFIG_MTD_CFI_GEOMETRY=3Dy
CONFIG_MTD_CFI_B4=3Dy
CONFIG_MTD_CFI_I4=3Dy
CONFIG_MTD_CFI_AMDSTD=3Dy

CONFIG_MTD_PHYSMAP=3Dy
CONFIG_MTD_PHYSMAP_START=3D2800000
CONFIG_MTD_PHYSMAP_LEN=3D800000
CONFIG_MTD_PHYSMAP_BUSWIDTH=3D4


Is there a maximum chunk that be written to a sector a one shot?
What am I doing wrong?

TIA,
-raghav-
