Received: from chrudim.coprosys.cz ([194.108.73.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17x5Zh-0004cD-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 Oct 2002 13:59:29 +0100
Received: from wolfhill.cz (user@ales.coprosys.cz [192.168.1.97])
	by chrudim.coprosys.cz (8.9.3/8.9.3) with ESMTP id OAA16816
	for <linux-mtd@lists.infradead.org>; Thu, 3 Oct 2002 14:59:25 +0200
Message-ID: <3D9C3F2C.1040901@wolfhill.cz>
Date: Thu, 03 Oct 2002 14:59:24 +0200
From: Ales Makarov <ales.makarov@wolfhill.cz>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: JFFS2 without compression
Content-Type: text/plain; charset=us-ascii; format=flowed
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

we use MTD & JFFS2 on our board (based on Motorola DragonBall VZ) running 
uClinux with AMD/Fujitsu 29LVxxx flashes.

It seems to work most of the time, but the kernel sometimes crashes and produces 
ooops messages. Right now I have some file that crashes kernel every time I try 
to write it to JFFS2 filesystem. Now I suspect there is a problem with the 
compression...

Example:

I have this file named "outputs" and is 83 bytes long.

# cat outputs
0;RELAY 1
0;RELAY 2 (movement sensor)
0;RELAY 3
0;RELAY 4 (not connected)
0;BUZZER
#

When I try to edit the file (I change the 3rd line to "0;COOLER") and save the 
file, the kernel crashes with:

*** Exception 981 ***   FORMAT=3
Current process id is 65
BAD KERNEL TRAP: 00000000
PC: [<00a7b04f>]
SR: 3f55  SP: 00a79cb2  a2: 000e8d58
d0: 00000000    d1: 00000001    d2: 00000000    d3: 00000000
d4: 00152d1a    d5: 00000003    a0: 00a79da0    a1: 00000003
Process vi (pid: 65, stackpage=00a79000)
Frame format=3 eff addr=20000006
Stack from 00a79cea:
         b2b00000 00000000 00030000 00000020 00000000 00000018 9dfc00df f46000df
         f46000a7 9df00000 000000a7 9da40000 00000000 00000000 000000a7 80000000
         00000006 d7a400df f3600000 00000018 9dfc0000 000300a7 9da000a7 b04f0000
         00000018 9dfc0000 00010000 00440000 00020000 00ff00a7 9dfc0005 a13e00df
         f4600000 00000018 9dfc0000 000300a7 9da000a7 b04f3de6 73840000 0047ffff
         ffff0000 000300d8 54c600c5 1d4000c3 310000c


Here is this file after the reboot:

# cat outputs
0;RELAY 1
0;RELAY 2 (movement sensor)
0;COOLER
0;RELAY 4 (not connected)
0;BUZZ#


I'd like to try the JFFS2 without compression. Where can I disable the zlib 
compression?

Thanks.

Ales Makarov
