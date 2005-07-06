Received: from njpmail.satyam.com ([204.179.188.132])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Dq3U0-0000Ur-Rw
	for linux-mtd@lists.infradead.org; Wed, 06 Jul 2005 02:34:10 -0400
Received: from blr.satyam.com (blr.satyam.com [208.220.245.73])
	by njpmail.satyam.com (8.11.6/8.11.6) with ESMTP id j666LSI08855
	for <linux-mtd@lists.infradead.org>; Wed, 6 Jul 2005 02:21:33 -0400
Received: from Disclaimerbng.corp.satyam.ad (bng.satyam.com [172.19.57.211])
	by blr.satyam.com (8.12.8/8.12.8) with ESMTP id j666SnSj003263
	for <linux-mtd@lists.infradead.org>; Wed, 6 Jul 2005 11:58:49 +0530
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 6 Jul 2005 12:00:55 +0530
Message-ID: <D8595042F3765A4285B848A78A2C2ED10162C4@bsdmsg002.corp.satyam.ad>
From: "Vikrant_Basotra" <Vikrant_Basotra@Satyam.com>
To: <linux-mtd@lists.infradead.org>
Cc: Nishant_Galange <Nishant_Galange@Satyam.com>,
	Apoorv_Sangal <Apoorv_Sangal@Satyam.com>
Subject: Porting Linux on MPC8266 custom board
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,
		I am porting Linux on MPC8266 custom board, after
getting in to Linux the system seems to be struck at a point.
Saved Environment variable:-
      bootargs console=3DttyS0,11520 root=3D1f00 and downloaded the =
Kernel
image at address 0x02000000 in the RAM.
>From the u-boot prompt the bootm command is invoked as:-=20
	bootm 0x02000000

After that what I get on the terminal is pasted below for your
reference.
I couldn't make out any thing from the output, can any body tell me
where I am doing wrong, and also I don't have any idea about the
bootargs argument "root". Can any body give the precise description of
this argument?


++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++
=3D> bootm 02000000 ## Booting image at 02000000...
   Image Name:   2.4.24 MPC8260ADS
   Image Type:   PowerPC Linux Kernel Image (gzip compressed)
   Data Size:    725838 Bytes =3D 708.8 kB
   Load Address: 00000000
   Entry Point:  00000000
   Verifying Checksum ... OK
   Uncompressing Kernel Image ... OK
Memory BAT mapping: BAT2=3D128Mb, BAT3=3D0Mb, residual: 0Mb

Linux version 2.4.24-pre2 (root@pmcserver) (gcc version 3.3.4) #2 Tue
Jul 5 15:05:10 IST 2005

On node 0 totalpages: 32768

zone(0): 32768 pages.

zone(1): 0 pages.

zone(2): 0 pages.

Kernel command line: console=3DttyS0,115200 root=3D1f00

Warning: real time clock seems stuck!

Calibrating delay loop... 131.89 BogoMIPS

Memory: 127812k available (1232k kernel code, 412k data, 64k init, 0k
highmem)

Dentry cache hash table entries: 16384 (order: 5, 131072 bytes)

Inode cache hash table entries: 8192 (order: 4, 65536 bytes)

Mount cache hash table entries: 512 (order: 0, 4096 bytes)

Buffer cache hash table entries: 8192 (order: 3, 32768 bytes)

Page-cache hash table entries: 32768 (order: 5, 131072 bytes)

POSIX conformance testing by UNIFIX

Linux NET4.0 for Linux 2.4

Based upon Swansea University Computer Society NET3.039

Initializing RT netlink socket

Starting kswapd

JFFS2 version 2.1. (C) 2001 Red Hat, Inc., designed by Axis
Communications AB.

i2c-core.o: i2c core module version 2.6.1 (20010830)

i2c-dev.o: i2c /dev entries driver module version 2.6.1 (20010830)

CPM UART driver version 0.01

ttyS0 on SMC1 at 0x0000, BRG7

ttyS1 on SMC2 at 0x0040, BRG8

ttyS2 on SCC1 at 0x8000, BRG1

ttyS3 on SCC2 at 0x8100, BRG2

pty: 256 Unix98 ptys configured
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
=09
Waiting eagerly,
Regards,
VB


DISCLAIMER:
This email (including any attachments) is intended for the sole use of =
the intended recipient/s and may contain material that is CONFIDENTIAL =
AND PRIVATE COMPANY INFORMATION. Any review or reliance by others or =
copying or distribution or forwarding of any or all of the contents in =
this message is STRICTLY PROHIBITED. If you are not the intended =
recipient, please contact the sender by email and delete all copies; =
your cooperation in this regard is appreciated.
