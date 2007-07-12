Received: from www19.your-server.de ([213.133.104.19])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I92nA-0005GG-3y
	for linux-mtd@lists.infradead.org; Thu, 12 Jul 2007 13:49:33 -0400
Received: from [84.189.29.236] (helo=ulitu.handy-pc.constin-design.de)
	by www19.your-server.de with esmtpsa (TLSv1:RC4-SHA:128) (Exim 4.50)
	id 1I92n1-0002wU-5q
	for linux-mtd@lists.infradead.org; Thu, 12 Jul 2007 19:49:19 +0200
From: Uli Luckas <u.luckas@road.de>
To: linux-mtd@lists.infradead.org
Subject: "BUG at fs/jffs2/gc.c:337" with 2.6.22
Date: Thu, 12 Jul 2007 19:49:10 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200707121949.10408.u.luckas@road.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I have just upgraded my PXA based board's kernel from 2.6.21 to 2.6.22. Now 
shortly after booting into a brand new jffs2 rootfs I get the following BUG. 
A quick glance at the changeset did not reveal any relevant changes. Do you 
guys have any first guess, as to what could be happening? Does jffs2/2.6.22 
work for toher people?

Thanks for your time
Uli


[  107.380000] Inode #5482 already in state 4 in jffs2_garbage_collect_pass()!
[  107.380000] kernel BUG at fs/jffs2/gc.c:337!
[  107.490000] Unable to handle kernel NULL pointer dereference at virtual 
address 00000000
[  107.490000] pgd = c0004000
[  107.500000] [00000000] *pgd=00000000
[  107.500000] Internal error: Oops: 817 [#1] PREEMPT
[  107.500000] Modules linked in: tun rtc_sa1100 pxaficp_ir ppp_generic slhc 
constin_battery irda crc_ccitt evdev pxa_audio af_packet
[  107.500000] CPU: 0    Tainted: P        (2.6.22 #16)
[  107.500000] PC is at __bug+0x20/0x2c
[  107.500000] LR is at notifier_call_chain+0x48/0x88
[  107.500000] pc : [<c0028d24>]    lr : [<c004dd04>]    psr: 60000013
[  107.500000] sp : c5871edc  ip : 00000000  fp : c5871ee8
[  107.500000] r10: c5c7482c  r9 : 00000000  r8 : c5dbeb60
[  107.500000] r7 : c5df13fc  r6 : c5c74800  r5 : c5870000  r4 : c5df0660
[  107.500000] r3 : 00000000  r2 : 00000000  r1 : c4848044  r0 : 00000033
[  107.500000] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user
[  107.500000] Control: 0000397f  Table: a4830000  DAC: 00000015
[  107.500000] Process jffs2_gcd_mtd3 (pid: 2084, stack l
[  107.500000] Stack: (0xc5871edc to 0xc5872000)
[  107.500000] 1ec0:                                                                
c5871f54
[  107.500000] 1ee0: c5871eec c0106ebc c0028d10 c568703c c5870000 c5687110 
0001039d db83e4f6
[  107.500000] 1f00: 00000021 c5870000 c029fee4 c5c74800 00000001 00000000 
00000000 00000000
[  107.500000] 1f20: c5871f40 c5871f30 c004a2f8 40000013 c5870000 c5c74800 
00000001 00000000
[  107.500000] 1f40: 00000000 00000000 c5871ff4 c5871f58 c01085bc c01067ac 
00000001 00000000
[  107.500000] 1f60: 00000080 00000000 00000000 00000000 c57d5000 00000000 
c0042c5c c00422dc
[  107.500000] 1f80: 401e9a84 00000001 c5871fa4 c5871f98 c0042c7c c0042bbc 
00000000 00000000
[  107.500000] 1fa0: 00000000 c5871fb0 c0024f24 c003b7d4 00000000 c5c74800 
c010847c c00422d0
[  107.500000] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 
00000000 00000000
[  107.500000] 1fe0: 00000000 00000000 00000000 c5871ff8 c00422d0 c0108488 
00000000 00000000
[  107.500000] Backtrace:
[  107.500000] [<c0028d04>] (__bug+0x0/0x2c) from [<c0106ebc>] 
(jffs2_garbage_collect_pass+0x71c/0x9ac)
[  107.500000] [<c01067a0>] (jffs2_garbage_collect_pass+0x0/0x9ac) from 
[<c01085bc>] (jffs2_garbage_collect_thread+0x140/0x198)
[  107.500000] [<c010847c>] (jffs2_garbage_collect_thread+0x0/0x198) from 
[<c00422d0>] (do_exit+0x0/0x8a8)
[  107.500000]  r7:00000000 r6:00000000 r5:00000000 r4:00000000
[  107.500000] Code: e1a01000 e59f000c eb005eb6 e3a03000 (e5833000)
  
-- 

------- ROAD ...the handyPC Company - - -  ) ) )

Uli Luckas
Software Development

ROAD GmbH
Bennigsenstr. 14 | 12159 Berlin | Germany
fon: +49 (30) 230069 - 64 | fax: +49 (30) 230069 - 69
url: www.road.de

Amtsgericht Charlottenburg: HRB 96688 B
Managing directors: Hans-Peter Constien, Hubertus von Streit
