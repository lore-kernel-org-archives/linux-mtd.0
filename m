Received: from chrudim.coprosys.cz ([194.108.73.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 179mm9-0004YQ-00
	for <linux-mtd@lists.infradead.org>; Mon, 20 May 2002 14:00:33 +0100
Received: from wolfhill.cz (user@ales.coprosys.cz [192.168.1.97])
	by chrudim.coprosys.cz (8.9.3/8.9.3) with ESMTP id PAA09824
	for <linux-mtd@lists.infradead.org>; Mon, 20 May 2002 15:00:26 +0200
Message-ID: <3CE8F3BE.A197F885@wolfhill.cz>
Date: Mon, 20 May 2002 15:01:50 +0200
From: Ales Makarov <ales.makarov@wolfhill.cz>
Reply-To: ales.makarov@wolfhill.cz
MIME-Version: 1.0
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: The problem with GC
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

I've the problem with JFFS2 when the device gets full. I can mount it,
but immediatelly after prompt I get:

# *** ILLEGAL INSTRUCTION ***   FORMAT=3
Current process id is 41
BAD KERNEL TRAP: 00000000
PC: [<00155865>]
SR: 3015  SP: 00cdbd34  a2: 000f2fdc
d0: 00000000    d1: 00000002    d2: 00000002    d3: 00000002
d4: 00176c9a    d5: 00000000    a0: 00155865    a1: 00000aaa
Process jffs2_gcd_mtd2 (pid: 41, stackpage=00cdb000)
Frame format=3 eff addr=20040006
Stack from 00cdbd6c:
        ecb00000 00000000 000a0000 00000010 00000000 00000035 20840016
42600016
        426000cd be7a0015 58a500cd be2a0000 00000000 00000000 000000cd
be220007
        19d00007 1a4a0017 6ce00000 00000035 20840000 000a00cd be260015
58650000
        00000005 20840000 00010000 00280000 00000000 000200cd be860005
896c0016
        42600000 00000005 20840000 000a00cd be260015 5865ffff ffff0000
00610000
        00000005 205c0000 003200cd be7a00cd d6b00015 589000cd bed60000
000000cd
Call Trace:
Code: *** UNASSIGNED RESERVED 12 ***   FORMAT=3
Current process id is 41
BAD KERNEL TRAP: 00000000
PC: [<00155865>]
SR: 3035  SP: 00cdbc06  a2: 00cdc000
d0: 00000000    d1: 000c8389    d2: 00cdc004    d3: 00000000
d4: f2c60000    d5: 00cdc000    a0: 00155865    a1: 00000000
Process jffs2_gcd_mtd2 (pid: 41, stackpage=00cdb000)
...

I have kernel in RAM (from 0 to 0x000f4084) and the partition with JFFS2
is at 0x01300000. What can be wrong :-(

Ales
