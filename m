Received: from 66.238.111.229.ptr.us.xo.net ([66.238.111.229]
	helo=ex1.ad.aktino.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CFz8S-00018S-Ug
	for linux-mtd@lists.infradead.org; Fri, 08 Oct 2004 14:06:34 -0400
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 8 Oct 2004 11:06:31 -0700
Message-ID: <02DAE179D5CEED4C992055C823ED90FF114CD2@ex1>
From: "Vijay Sampath" <Vijay.Sampath@aktino.com>
To: <linux-mtd@lists.infradead.org>
Subject: kernel BUG at nodemgmt.c / Raw node at ... wasn't in node lists for
	ino...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

We are using Timesys Linux on our embedded system based on Linux kernel
version 2.4.18. We have been running the JFFS2 filesystem on our flash
drives for a while now without problems, but lately have begun to see
kernel crashes/warnings related to file system access (see traces 1 and
2 below).

I tried upgrading the JFFS2 version to the latest, but it appears that I
need the 2.6 kernel or atleast something newer than 2.4.18 (which is
what we are using.)

So the question is, is this a known problem that has gone away in later
releases? Also what is the easiest way to upgrade JFFS2 without
upgrading the kernel? What other things can be done to prevent the error
from occurring?

Thanks,

Vijay


Linux version 2.4.18-timesys-4.0.354

Version of nodemgmt.c: 1.45.2.1 2002/02/23 14:13:34
Version of scan.c: 1.51.2.2 2002/02/23 13:34:31
Version of gc.c: 1.52.2.2 2002/02/23 14:25:36

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Trace =
1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=


  Oops: Exception in kernel mode, sig: 4
  NIP: C009A0B8 XER: 20000000 LR: C009A0B8 SP: C36DDDD0 REGS: c36ddd20
TRAP: 0700
  MSR: 00009030 CTR: c00b69b0 EE: 1 PR: 0 ME: 1 IR/DR: 11  Tainted: P
  TASK =3D c36dc000[140] 'tl1agent' Last syscall: 4
  last math 00000000 last altivec 00000000
  PLB0: bear=3D 0x00000000 acr=3D   0x00000000 besr=3D  0x00000000
  PLB0 to OPB: bear=3D 0x80000000 besr0=3D 0x00000000 besr1=3D =
0x00000000
 =20
  GPR00: C009A0B8 C36DDDD0 C36DC000 00009030 00001030 00000005 00003E46
FFFFFE67
  GPR08: 00003E67 00000000 C0170000 C0160000 42048022 00000000 00000000
C3762240
  GPR16: C36DDEBC 00000000 C38C5A8C 00000BA8 00000000 00000BBC 00000BA8
C38C5BB0
  GPR24: 00000000 C05DA1AC C05DA2D4 00000000 C05DC2A8 C05DA1AC C36C1F60
00000130
 =20
  Stack: c36dde00 c009a0b8 22048044 c38c5bb0 00000000 c05da1ac 00000130
0023e0e8
         c3bc5a10 c05da000 00000000 c36c1f60 c36dde50 c009bc18 c3c18100
00000044
         c37bb000 000000ec 00000130 c05da1ac c36dde64 c36dde60 c37bb000
c05da1ac
         0004b000 00000bbc c02f0d2c c37bb000 c38c5a20 00000006 c38c5bb0
c3c18100
         c36ddeb0 c0098840 0023e0e8 00001f18 00000bbc 000000ec 00030002
c38c5b20
         c36dde80 0000004b 00000000 24004028 100e4310 c38c5a20 00000014
c3762220
  Code: 3880010e 4bf6953d (00000000) 38600000 4bfffdf0 801c0010
  Code at LR: 3880010e 4bf6953d (00000000) 38600000 4bfffdf0 801c0010
  Call backtrace:
  C009A0B8 C009BC18 C0098840 C002E108 C003BB78 C0002E24 7C0802A6
  kernel BUG at nodemgmt.c:270!
  Cur state 0x00000010 New state 0x00000001
  Attempt to activate beam ...
  Oops: Exception in kernel mode, sig: 4
  NIP: C009A0B8 XER: 20000000 LR: C009A0B8 SP: C36DDDD0 REGS: c36ddd20
TRAP: 0700
  MSR: 00009030 CTR: c00b69b0 EE: 1 PR: 0 ME: 1 IR/DR: 11  Tainted: P
  TASK =3D c36dc000[140] 'tl1agent' Last syscall: 4
  last math 00000000 last altivec 00000000
  PLB0: bear=3D 0x00000000 acr=3D   0x00000000 besr=3D  0x00000000
  PLB0 to OPB: bear=3D 0x80000000 besr0=3D 0x00000000 besr1=3D =
0x00000000
 =20
  GPR00: C009A0B8 C36DDDD0 C36DC000 00009030 00001030 00000005 00003E46
FFFFFE67
  GPR08: 00003E67 00000000 C0170000 C0160000 42048022 00000000 00000000
C3762240
  GPR16: C36DDEBC 00000000 C38C5A8C 00000BA8 00000000 00000BBC 00000BA8
C38C5BB0
  GPR24: 00000000 C05DA1AC C05DA2D4 00000000 C05DC2A8 C05DA1AC C36C1F60
00000130
 =20
  Stack: c36dde00 c009a0b8 22048044 c38c5bb0 00000000 c05da1ac 00000130
0023e0e8
         c3bc5a10 c05da000 00000000 c36c1f60 c36dde50 c009bc18 c3c18100
00000044
         c37bb000 000000ec 00000130 c05da1ac c36dde64 c36dde60 c37bb000
c05da1ac
         0004b000 00000bbc c02f0d2c c37bb000 c38c5a20 00000006 c38c5bb0
c3c18100
         c36ddeb0 c0098840 0023e0e8 00001f18 00000bbc 000000ec 00030002
c38c5b20
         c36dde80 0000004b 00000000 24004028 100e4310 c38c5a20 00000014
c3762220
  Code: 3880010e 4bf6953d (00000000) 38600000 4bfffdf0 801c0010
  Code at LR: 3880010e 4bf6953d (00000000) 38600000 4bfffdf0 801c0010
  Call backtrace:
  C009A0B8 C009BC18 C0098840 C002E108 C003BB78 C0002E24 7C0802A6

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D Trace 2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Raw node at 0x00f82fc0 wasn't in node lists for ino #73
