Received: from yw-out-1718.google.com ([74.125.46.152])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LAJRc-00028B-Iv
	for linux-mtd@lists.infradead.org; Wed, 10 Dec 2008 07:25:16 +0000
Received: by yw-out-1718.google.com with SMTP id 5so236952ywm.72
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Dec 2008 23:25:15 -0800 (PST)
Message-ID: <493F6ED2.5080402@gmail.com>
Date: Tue, 09 Dec 2008 23:25:06 -0800
From: Don Mullis <don.mullis@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: CONFIG_MTD_UBI_DEBUG_DISABLE_BGT=y corrupts slab?
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With CONFIG_MTD_UBI_DEBUG_DISABLE_BGT=y, I get various corruption-caused 
OOPSes after a remount:

   # umount /cache
   # mount -t ubifs  -o ro ubi:cache /cache

>> UBIFS DBG (pid 172): mount_ubifs: commit number:       0
>> UBI DBG (pid 172): ubi_leb_read: read 160 bytes from LEB 2:11:0
>> UBI DBG (pid 172): ubi_io_read: read 160 bytes from PEB 13:4096
>> UBI DBG (pid 172): ubi_close_volume: close volume 2, mode 1
>> Unable to handle kernel paging request at virtual address ffffffff
>> pgd = c0004000
>> [ffffffff] *pgd=00002031, *pte=00000000, *ppte=00000000
>> Internal error: Oops: 817 [#1]
>> CPU: 0    Not tainted  (2.6.25-00101-gb6922fa-dirty #140)
>> PC is at free_block+0x84/0x158
>> LR is at 0xc5c02220
>> pc : [<c007c480>]    lr : [<c5c02220>]    psr: 00000093
>> sp : c5c23ef8  ip : c5f52000  fp : c5c23f24
>> r10: 00200200  r9 : 00100100  r8 : 00000018
>> r7 : c5c00300  r6 : 00000000  r5 : c5c05410  r4 : c5c00300
>> r3 : ffffffff  r2 : ffffffff  r1 : 00000000  r0 : c5f520a0
>> Flags: nzcv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
>> Control: 00003137  Table: 0555c000  DAC: 00000017
>> Process events/0 (pid: 4, stack limit = 0xc5c22268)
>> Stack: (0xc5c23ef8 to 0xc5c24000)
>> 3ee0:                                                       c5c23f2c c5c05410
>> 3f00: 00000018 c5c05400 c5c00300 c02db9f8 c0304cb4 00000005 c5c23f44 c5c23f28
>> 3f20: c007c5fc c007c408 c5c02220 c5c00300 00000000 c0304cc0 c5c23f7c c5c23f48
>> 3f40: c007d638 c007c560 00000000 c5411080 c5c23f9c c5c019e0 c5c22000 c007d5e0
>> 3f60: 00000000 00000000 00000000 00000000 c5c23f9c c5c23f80 c0048a24 c007d5ec
>> 3f80: c5c019e8 c5c22000 c5c019e0 c5c23fa4 c5c23fd4 c5c23fa0 c00494e8 c0048974
>> 3fa0: c5c13260 00000000 c5c13000 c004c5e0 c5c23fb0 c5c23fb0 c5c22000 c5c019e0
>> 3fc0: c00493f8 00000000 c5c23ff4 c5c23fd8 c004c2bc c0049404 00000000 00000000
>> 3fe0: 00000000 00000000 00000000 c5c23ff8 c003bc94 c004c26c 00000000 00000000
>> Backtrace:
>> [<c007c3fc>] (free_block+0x0/0x158) from [<c007c5fc>] (drain_array+0xa8/0xd8)
>> [<c007c554>] (drain_array+0x0/0xd8) from [<c007d638>] (cache_reap+0x58/0x120)
>>  r7:c0304cc0 r6:00000000 r5:c5c00300 r4:c5c02220
>> [<c007d5e0>] (cache_reap+0x0/0x120) from [<c0048a24>] (run_workqueue+0xbc/0x144)
>> [<c0048968>] (run_workqueue+0x0/0x144) from [<c00494e8>] (worker_thread+0xf0/0x104)
>>  r7:c5c23fa4 r6:c5c019e0 r5:c5c22000 r4:c5c019e8
>> [<c00493f8>] (worker_thread+0x0/0x104) from [<c004c2bc>] (kthread+0x5c/0x94)
>>  r7:00000000 r6:c00493f8 r5:c5c019e0 r4:c5c22000
>> [<c004c260>] (kthread+0x0/0x94) from [<c003bc94>] (do_exit+0x0/0x5f4)
>>  r6:00000000 r5:00000000 r4:00000000
>> Code: e592c01c e597e04c e59c2004 e59c3000 (e5823000)
>> Kernel panic - not syncing: Fatal exception

CONFIG_DEBUG_SLAB=y, or turning off CONFIG_MTD_UBI_DEBUG_DISABLE_BGT, 
causes this particular failure to go away.

I'm using a 2.6.25 kernel with the 100+ UBIFS-related patches from 
kernel.org back-ported into it, so some mismatch there is possible.

Has anyone has seen a similar failure with 
CONFIG_MTD_UBI_DEBUG_DISABLE_BGT=y on a 2.6.27 kernel?

thanks,
D
