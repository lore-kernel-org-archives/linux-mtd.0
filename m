Received: from mail.dataprom.com ([200.198.101.12])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MndZa-0003xq-8b
	for linux-mtd@lists.infradead.org; Tue, 15 Sep 2009 19:20:22 +0000
Received: from [192.168.0.149] (eng009.dataprom.com [192.168.0.149])
	by mail.dataprom.com (Postfix) with ESMTPSA id 46549B0004F0
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Sep 2009 15:54:56 -0300 (BRT)
Subject: Oops on 2.6.31 with udev and root using ubifs
From: Raphael Derosso Pereira <raphael.pereira@dataprom.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 15 Sep 2009 16:02:02 -0300
Message-Id: <1253041322.4496.6.camel@eng009>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have just compiled a UBIFS enable 2.6.31 kernel and when I use it to
boot with a NAND ubifs root partition, as soon as the udev daemon starts
to populate the nodes, I get a Oops:

[   59.261166] Unable to handle kernel paging request at virtual address
fffffff0
[   59.283061] pgd = c0004000
[   59.291211] [fffffff0] *pgd=a0906021, *pte=00000000, *ppte=00000000
[   59.317151] Internal error: Oops: 17 [#1] PREEMPT
[   59.331114] Modules linked in:
[   59.340167] CPU: 0    Not tainted  (2.6.31-cmx0sc #20)
[   59.355456] PC is at ubi_leb_read+0x14/0x190
[   59.368136] LR is at gluebi_read+0xdc/0x114
[   59.380566] pc : [<c021c070>]    lr : [<c0223ef0>]    psr: 60000013
[   59.380581] sp : e39b1eb8  ip : e39b1ef8  fp : e39b1ef4
[   59.414702] r10: e3cbe4c0  r9 : 00000200  r8 : 00000000
[   59.430237] r7 : e393e000  r6 : e3c5b000  r5 : 00000200  r4 :
00000200
[   59.449648] r3 : 00000000  r2 : e3c5b000  r1 : 00000000  r0 :
fffffff0
[   59.469060] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM
Segment kernel
[   59.490795] Control: 0000397f  Table: c3d74018  DAC: 00000035
[   59.507880] Process mtdblockd (pid: 293, stack limit = 0xe39b0278)
[   59.526255] Stack: (0xe39b1eb8 to 0xe39b2000)
[   59.539200] 1ea0:
c019effc e39b61c0 
[   59.563754] 1ec0: e3be1640 00000000 00000000 00000200 00000200
e3c5b000 e393e000 00000000 
[   59.588306] 1ee0: 00000200 e3cbe4c0 e39b1f34 e39b1ef8 c0223ef0
c021c068 00000200 00000000 
[   59.612861] 1f00: 00000000 00000000 e3be1640 00000000 e39b1f4c
00000200 00000000 00000000 
[   59.637415] 1f20: 0001f000 e3c5b000 e39b1f84 e39b1f38 c020d0dc
c0223e20 00000200 e39b1f54 
[   59.661968] 1f40: e3c5b000 e3be1640 e39b1f6c e393e000 c0190cb0
c019b0c0 00000008 00000008 
[   59.686522] 1f60: e3be1640 00000000 c03fc1dc e3c5b000 00000000
e39ab900 e39b1fc4 e39b1f88 
[   59.711076] 1f80: c020c8a0 c020d08c c02d8350 e39b0000 e39ab910
e39b61c0 e39b1fc4 e3823f08 
[   59.735629] 1fa0: c03fc1dc c020c690 00000000 00000000 00000000
00000000 e39b1ff4 e39b1fc8 
[   59.760183] 1fc0: c005ff28 c020c69c 00000000 00000000 e39b1fd0
e39b1fd0 00000000 00000000 
[   59.784738] 1fe0: 00000000 00000000 00000000 e39b1ff8 c0025fe8
c005feac 2064656c 72642600 
[   59.809306] [<c021c070>] (ubi_leb_read+0x14/0x190) from [<c0223ef0>]
(gluebi_read+0xdc/0x114)
[   59.834650] [<c0223ef0>] (gluebi_read+0xdc/0x114) from [<c020d0dc>]
(mtdblock_readsect+0x5c/0x134)
[   59.861298] [<c020d0dc>] (mtdblock_readsect+0x5c/0x134) from
[<c020c8a0>] (mtd_blktrans_thread+0x210/0x32c)
[   59.890244] [<c020c8a0>] (mtd_blktrans_thread+0x210/0x32c) from
[<c005ff28>] (kthread+0x88/0x90)
[   59.916376] [<c005ff28>] (kthread+0x88/0x90) from [<c0025fe8>]
(kernel_thread_exit+0x0/0x8)
[   59.941211] Code: e92ddff0 e24cb004 e24dd014 ebf823de (e5904000) 


I think that the problem may be ralated to the fact that /dev/mtd6,
which is emulated from ubi0_0 is "double-accessed" without proper lock
or something else. Can someone give me a hint?

Best Regards,

P.S.: I'm not subscribed on the list

--
Raphael Derosso Pereira
DATAPROM®
Departamento de Engenharia
Tel.: +55 41 3014-1325
Fax.: +55 41 3014-1201

raphael.pereira@dataprom.com

www.dataprom.com 
