Received: from www41.genericdns.com ([209.51.150.17] helo=thattiko.net)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DdhUZ-0003xz-H5
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2005 00:39:41 -0400
Message-ID: <429E87D5.5050906@thattiko.net>
Date: Thu, 02 Jun 2005 00:15:17 -0400
From: Ratan Panneerselvam <ratan@thattiko.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <20050601134130.GA19482@synertronixx3>
In-Reply-To: <20050601134130.GA19482@synertronixx3>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: Intel flash that powers up locked
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Konstantin Kletschke wrote:

>Has anybody Intel K3 unlocking working and if yes, how is his or her map
>driver looking?
>  
>
I had the Intel K3 unlocked successfully in the map driver on a 2.4.20
kernel with this call:
nor_info->unlock( nor_info, 0, nor_info->size );

However on the 2.6.12 from cvs@ftp.linux-mips.org, the same map driver
gives an oops similar to yours.

regards,
ratan

map driver code snippet:
>>>>>
    simple_map_init(&nor_map);
    nor_info = do_map_probe("cfi_probe", &nor_map);
    if (!nor_info) {
        err("cfi_probe: NOR flash probe failed");
        iounmap(nor_map.virt);
        return -ENXIO;
    }

    nor_info->owner = THIS_MODULE;
   
    if (nor_info->unlock)
    {
        info("Unlocking the entire NOR flash");
        nor_info->unlock( nor_info, 0, nor_info->size );
    }

#ifdef CONFIG_MTD_PARTITIONS
    rval = add_mtd_partitions(nor_info, nor_partition,
NUM_PARTITIONS(nor_partition));
#else   
    rval = add_mtd_device(nor_info);
#endif
>>>>>>
 


>>>>>>
[4294667.381000] nor_flash[FBC0]: virt=0xBC000000 phys=0x1C000000
size=0x100000
[4294667.382000] Xilleon NOR flash [Memory Mapped]: Found 1 x16 devices
at 0x0 in 16-bit bank
[4294667.383000]  Intel/Sharp Extended Query Table at 0x0031
[4294667.384000] Using buffer write method
[4294667.385000]   Feature/Command Support:      01E6
[4294667.386000]      - Chip Erase:              unsupported
[4294667.387000]      - Suspend Erase:           supported
[4294667.388000]      - Suspend Program:         supported
[4294667.389000]      - Legacy Lock/Unlock:      unsupported
[4294667.390000]      - Queued Erase:            unsupported
[4294667.391000]      - Instant block lock:      supported
[4294667.392000]      - Protection Bits:         supported
[4294667.393000]      - Page-mode read:          supported
[4294667.394000]      - Synchronous read:        supported
[4294667.395000]      - Simultaneous operations: unsupported
[4294667.396000]   Supported functions after Suspend: 01
[4294667.397000]      - Program after Erase Suspend: supported
[4294667.398000]   Block Status Register Mask: 0007
[4294667.399000]      - Lock Bit Active:      yes
[4294667.400000]      - Valid Bit Active:     yes
[4294667.401000]      - Unknown Bit 2 Active: yes
[4294667.402000]   Vcc Logic Supply Optimum Program/Erase Voltage: 3.3 V
[4294667.403000] cfi_cmdset_0001: Erase suspend on write enabled
[4294667.404000] Unlocking the entire NOR flash
[4294667.414000] CPU 0 Unable to handle kernel paging request at virtual
address 00000000, epc == 80122d94, ra == 80122e48
[4294667.414000] Oops in arch/mips/mm/fault.c::do_page_fault, line 167[#1]:
[4294667.414000] Cpu 0
[4294667.414000] $ 0   : 00000000 1000f800 00000000 00000000
[4294667.414000] $ 4   : 802a826c 00000003 00000001 00000000
[4294667.414000] $ 8   : 80295fe0 0000f800 00000000 8023c000
[4294667.414000] $12   : 00000000 00000000 00000000 7fffffff
[4294667.414000] $16   : 1000f801 80245a70 00000001 802a826c
[4294667.414000] $20   : 00000000 00000000 00000003 80295e94
[4294667.414000] $24   : 00000000 00000000                 
[4294667.414000] $28   : 80294000 80295dd0 80295dd0 80122e48
[4294667.414000] Hi    : 00000000
[4294667.414000] Lo    : 00000000
[4294667.414000] epc   : 80122d94 __wake_up_common+0x44/0xb8     Not tainted
[4294667.414000] ra    : 80122e48 __wake_up+0x40/0x7c
[4294667.414000] Status: 1000f802    KERNEL EXL
[4294667.414000] Cause : 90800008
[4294667.414000] BadVA : 00000000
[4294667.414000] PrId  : 00018448
[4294667.414000] Process swapper (pid: 1, threadinfo=80294000,
task=8028dc08)
[4294667.414000] Stack : fffb6c96 00000002 80295e08 80240000 1000f801
80245a70 802a8218 00000000
[4294667.414000]         00000001 80295e9c 80295e98 80295e08 80122e48
1000f801 00100100 00200200
[4294667.414000]         fffb6c96 4b87ad6e 00000000 8028dc08 802a8250
80295e30 8021a074 00000002
[4294667.414000]         80270000 00000000 80295e40 80135624 00000002
00000000 00418937 fffbbab6
[4294667.414000]         80245a70 00000000 00000001 80295e68 8021f11c
8021eefc 80245a70 00000001
[4294667.414000]         ...
[4294667.414000] Call Trace:
[4294667.414000]  [<80122e48>] __wake_up+0x40/0x7c
[4294667.414000]  [<8021a074>] put_chip+0x9c/0x404
[4294667.414000]  [<80135624>] msleep+0x64/0x8c
[4294667.414000]  [<8021f11c>] do_xxlock_oneblock+0x330/0x8d4
[4294667.414000]  [<8021eefc>] do_xxlock_oneblock+0x110/0x8d4
[4294667.414000]  [<802184f4>] cfi_varsize_frob+0x278/0x384
[4294667.414000]  [<8015ae44>] cache_alloc_debugcheck_after+0xe0/0x1c4
[4294667.414000]  [<80220000>] mtd_do_chip_probe+0x298/0x418
[4294667.414000]  [<80220000>] mtd_do_chip_probe+0x298/0x418
[4294667.414000]  [<8021f858>] cfi_intelext_unlock+0x98/0x100
[4294667.414000]  [<8021edec>] do_xxlock_oneblock+0x0/0x8d4
[4294667.414000]  [<8026ee08>] xilleon_nor_init+0x160/0x1dc
[4294667.414000]  [<8026ede8>] xilleon_nor_init+0x140/0x1dc
[4294667.414000]  [<80100520>] init+0xa0/0x270
[4294667.414000]  [<80100520>] init+0xa0/0x270
[4294667.414000]  [<80103c08>] kernel_thread_helper+0x14/0x1c
[4294667.414000]
[4294667.414000]
[4294667.414000] Code: 00a0b021  00c09021  00e0a821 <10730010> 8c710000 
2464fff4  8c820008  8c70fff4  02c02821
[4294667.415000] Kernel panic - not syncing: Attempted to kill init!
>>>>>>
