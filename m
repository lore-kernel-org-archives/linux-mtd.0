Received: from 213-97-242-113.uc.nombres.ttd.es ([213.97.242.113] helo=rebirth.wojtyla.org)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17GNFk-00012p-00
	for <linux-mtd@lists.infradead.org>; Fri, 07 Jun 2002 18:10:21 +0100
Received: from devil.teleline.es (devil.iqc-services.local [192.168.197.3])
	by rebirth.wojtyla.org (8.11.6/8.8.7) with ESMTP id g57H3aL06616
	for <linux-mtd@lists.infradead.org>; Fri, 7 Jun 2002 19:03:37 +0200
Message-Id: <5.1.0.14.2.20020607190502.02d5d030@pop3.iqc-services.com>
Date: Fri, 07 Jun 2002 19:07:57 +0200
To: linux-mtd@lists.infradead.org
From: Securez <securez@teleline.es>
Subject: JFFS2 error, Cna naybody help?
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

I have a mtd partition that i mount for testing the JFFS2 on our board.
when i copy some files, i get the abobe error when coping some one:

/mnt/bin> cp /bin/vi .
bad frame format: 00000000
PC: [<4cb9bd84>]
SR: 3235  SP: 007bbd20  a2: 007bbd78
d0: 4c3e000c    d1: 00000000    d2: 261f0006    d3: 00000018
d4: 00000006    d5: 00000112    a0: 00000010    a1: 007bbd78
Process cp (pid: 34, stackpage=007bb000)
Frame format=0
Stack from 007bbd54:
         32322004 02051c3e 261f0006 00000700 000001c1 000001bf 000001be 
00168000
         0016808a 00000000 00000000 00010004 00130041 00c601ca 03d50800 
10002000
         40008000 007bbdd8 02051e26 0016808a 00000112 00168b32 00168000 
00168b0e
         00000006 000005d0 00000000 00110000 00000001 02051c62 00168000 
00168000
         007d57c0 007bbe00 0205295a 00168000 00168b0e 00000006 0000059b 
00000000
         00000054 00000b9a 00100000 007bbe38 020512f0 00168000 00110000 
000005d0
Call Trace:
         [<02051c3e>] [<02051e26>] [<02051c62>] [<0205295a>]
         [<020512f0>] [<0205060e>] [<0205081a>] [<0200bcb0>]
         [<02050040>] [<0204ff50>] [<0204ff74>] [<0204f5aa>]
         [<02057c74>] [<020151d2>] [<0201988c>] [<020029c6>]
Code: bad frame format: 00000000
PC: [<4cb9bd84>]
SR: 3035  SP: 007bbc8c  a2: 007bc000
d0: 00000000    d1: 004c4b40    d2: 00000000    d3: 5f780080
d4: 007bc000    d5: 00000112    a0: 4cb9bd84    a1: 00000000
Process cp (pid: 34, stackpage=007bb000)
Frame format=0
Stack from 007bbcc0:
         30302714 02000f28 261f0006 00000018 00000006 0200bcb0 007bbd20 
007bbd00
         020012ce 007bbd20 00030a1f 007ba23c 00000022 007bb000 007bbd78 
0016808a
         007bbd14 02000c78 00030766 007bbd20 00000000 007bbd98 02002650 
007bbd20
         00000000 261f0006 00000018 00000006 00000112 00000010 007bbd78 
007bbd78
         4c3e000c ffffffff 00000000 32354cb9 bd840008 32322004 02051c3e 
261f0006
         00000700 000001c1 000001bf 000001be 00168000 0016808a 00000000 
00000000
Call Trace:
         [<02000f28>] [<0200bcb0>] [<020012ce>] [<02000c78>]
         [<02002650>] [<02051c3e>] [<02051e26>] [<02051c62>]
         [<0205295a>] [<020512f0>] [<0205060e>] [<0205081a>]
         [<0200bcb0>] [<02050040>] [<0204ff50>] [<0204ff74>]
         [<0204f5aa>] [<02057c74>] [<020151d2>] [<0201988c>]
         [<020029c6>]
Code: bad frame format: 00000000
PC: [<4cb9bd84>]
SR: 3035  SP: 007bbbf8  a2: 007bc000
d0: 00000000    d1: 004c4b40    d2: 00000000    d3: 5f780080
d4: 007bc000    d5: 00000112    a0: 4cb9bd84    a1: 00000000
Process cp (pid: 34, stackpage=007bb000)
Frame format=0
Stack from 007bbc2c:
         30302714 02000f28 00000000 5f780080 007bc000 0200bcb0 007bbc8c 
007bbc6c
         020012ce 007bbc8c 00030a1f 007ba23c 00000022 007bb000 007bc000 
007bbd20
         007bbc80 02000c78 00030766 007bbc8c 00000000 007bbcdc 02002650 
007bbc8c
         004c4b40 00000000 5f780080 007bc000 00000112 4cb9bd84 00000000 
007bc000
         00000000 ffffffff 00000000 30354cb9 bd840008 30302714 02000f28 
261f0006
         00000018 00000006 0200bcb0 007bbd20 007bbd00 020012ce 007bbd20 
00030a1f
Call Trace:
         [<02000f28>] [<0200bcb0>] [<020012ce>] [<02000c78>]
         [<02002650>] [<02000f28>] [<0200bcb0>] [<020012ce>]
         [<02000c78>] [<02002650>] [<02051c3e>] [<02051e26>]
         [<02051c62>] [<0205295a>] [<020512f0>] [<0205060e>]
         [<0205081a>] [<0200bcb0>] [<02050040>] [<0204ff50>]
         [<0204ff74>] [<0204f5aa>] [<02057c74>] [<020151d2>]
         [<0201988c>] [<020029c6>]
Code: bad frame format: 00000000
PC: [<4cb9bd84>]
SR: 3035  SP: 007bbb64  a2: 007bc000
d0: 00000000    d1: 004c4b40    d2: 00000000    d3: 5f780080
d4: 007bc000    d5: 00000112    a0: 4cb9bd84    a1: 00000000
Process cp (pid: 34, stackpage=007bb000)
Frame format=0
Stack from 007bbb98:
         30302714 02000f28 00000000 5f780080 007bc000 0200bcb0 007bbbf8 
007bbbd8
         020012ce 007bbbf8 00030a1f 007ba23c 00000022 007bb000 007bc000 
007bbc8c
         007bbbec 02000c78 00030766 007bbbf8 00000000 007bbc48 02002650 
007bbbf8
         004c4b40 00000000 5f780080 007bc000 00000112 4cb9bd84 00000000 
007bc000
         00000000 ffffffff 00000000 30354cb9 bd840008 30302714 02000f28 
00000000
         5f780080 007bc000 0200bcb0 007bbc8c 007bbc6c 020012ce 007bbc8c 
00030a1f
Call Trace:
         [<02000f28>] [<0200bcb0>] [<020012ce>] [<02000c78>]
         [<02002650>] [<02000f28>] [<0200bcb0>] [<020012ce>]
         [<02000c78>] [<02002650>] [<02000f28>] [<0200bcb0>]
         [<020012ce>] [<02000c78>] [<02002650>] [<02051c3e>]
         [<02051e26>] [<02051c62>] [<0205295a>] [<020512f0>]
         [<0205060e>] [<0205081a>] [<0200bcb0>] [<02050040>]
         [<0204ff50>] [<0204ff74>] [<0204f5aa>] [<02057c74>]
         [<020151d2>] [<0201988c>] [<020029c6>]
Code: bad frame format: 00000000
PC: [<4cb9bd84>]
SR: 3035  SP: 007bbad0  a2: 007bc000
d0: 00000000    d1: 004c4b40    d2: 00000000    d3: 5f780080
d4: 007bc000    d5: 00000112    a0: 4cb9bd84    a1: 00000000
Process cp (pid: 34, stackpage=007bb000)
Frame format=0
Stack from 007bbb04:
         30302714 02000f28 00000000 5f780080 007bc000 0200bcb0 007bbb64 
007bbb44
         020012ce 007bbb64 00030a1f 007ba23c 00000022 007bb000 007bc000 
007bbbf8
         007bbb58 02000c78 00030766 007bbb64 00000000 007bbbb4 02002650 
007bbb64
         004c4b40 00000000 5f780080 007bc000 00000112 4cb9bd84 00000000 
007bc000
         00000000 ffffffff 00000000 30354cb9 bd840008 30302714 02000f28 
00000000
         5f780080 007bc000 0200bcb0 007bbbf8 007bbbd8 020012ce 007bbbf8 
00030a1f
Call Trace:
         [<02000f28>] [<0200bcb0>] [<020012ce>] [<02000c78>]
         [<02002650>] [<02000f28>] [<0200bcb0>] [<020012ce>]
         [<02000c78>] [<02002650>] [<02000f28>] [<0200bcb0>]
         [<020012ce>] [<02000c78>] [<02002650>] [<02000f28>]
         [<0200bcb0>] [<020012ce>] [<02000c78>] [<02002650>]
         [<02051c3e>] [<02051e26>] [<02051c62>] [<0205295a>]
         [<020512f0>] [<0205060e>] [<0205081a>] [<0200bcb0>]
         [<02050040>] [<0204ff50>] [<0204ff74>] [<0204f5aa>]
         [<02057c74>] [<020151d2>] [<0201988c>] [<020029c6>]

Can anybody tell me what is happend?
When i reboot and remount the partition i get some CRC errors.
I use uClinux 2.4.17 basen on a m68knommu architecture.

Regards.
