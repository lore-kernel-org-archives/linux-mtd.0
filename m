Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CUMOe-0005WV-Hm
	for linux-mtd@lists.infradead.org; Wed, 17 Nov 2004 04:46:42 -0500
Date: Wed, 17 Nov 2004 10:46:35 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20041117094634.GC2201@synertronixx3>
References: <20041117085555.GA22829@synertronixx3>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20041117085555.GA22829@synertronixx3>
Subject: Re: jffs2 Oops on 2.6.10-rc1-mm5
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2004-11-17 09:55 +0100 schrieb Konstantin Kletschke:
> 
> If that is not helpful, how can I start debugging this?

I realize ATM I might have not pasted some useful output, 
look at the EEK line:

Probing scb9328_flash at physical address 0x10000000 (16-bit buswidth)
scb9328_flash: Found 1 x16 devices at 0x0 in 16-bit bank              
 Intel/Sharp Extended Query Table at 0x0031             
Using buffer write method                  
cfi_cmdset_0001: Erase suspend on write enabled
4 cmdlinepart partitions found on MTD device scb9328_flash
Creating 4 MTD partitions on "scb9328_flash":             
0x00000000-0x00020000 : "U-boot"             
0x00020000-0x00040000 : "U-boot_env"
0x00040000-0x00140000 : "kernel"    
0x00140000-0x01000000 : "root"  
NET: Registered protocol family 2
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 1024 bind 2048)
EEEEEK. jffs2_mark_node_obsolete called with NULL node  
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c0004000                                                              
[00000000] *pgd=00000000
Internal error: Oops: 5 [#1]
Modules linked in:          
CPU: 0            
pc : [<c00b3974>]    lr : [<00000001>]    Not tainted
sp : c01d9cbc  ip : 60000093  fp : c01d9cdc          
r10: c028fcac  r9 : c028fc00  r8 : c028fcbc
r7 : c028fc00  r6 : c01d9cf4  r5 : c02aa7e4  r4 : 00000000
r3 : c0175f98  r2 : 00000000  r1 : c01d8000  r0 : 0000003a
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment kernel
Control: C000717F  Table: 08004000  DAC: 0000001D         
Process swapper (pid: 1, stack limit = 0xc01d8190)
Stack: (0xc01d9cbc to 0xc01da000)                 
9ca0:                                                                c02aa7e4 
9cc0: c01d9cf8 c01d9cf8 00000000 c028fcbc c01d9d28 c01d9ce0 c00b3df8 c00b3954 
9ce0: c028fcf8 c028fcdc c028fcd4 c028fccc c028fcc4 00000000 00000034 00000000 
9d00: c028fc00 00020000 00000000 c028fa00 c0281800 00000000 c017a0b8 c01d9d4c 
9d20: c01d9d2c c00b5f9c c00b3a3c c028fa00 c028fc00 00008000 00000000 c0281800 
9d40: c01d9d70 c01d9d50 c00b6584 c00b5e7c ffffffea 00000003 c0297000 00008000 
9d60: c01d9d7c c01d9de4 c01d9d74 c00b67b0 c00b6504 c0281800 c007ebcc c0200224 
9d80: c01c9600 c01d9dac c01d9d94 c0089048 00000001 00000001 00000000 c01d9dc4 
9da0: c027d300 c027d300 c01c92a0 c0297000 c017a0b8 00008000 c01d9ed0 c01c92a0 
9dc0: fffffff4 c0297000 c017a0b8 00008000 c01d9ed0 00000000 c01d9e0c c01d9de8 
9de0: c0078564 c00b6648 00008000 c0296000 00000000 c0297000 00000000 c0291000 
9e00: c01d9f38 c01d9e10 c008fc6c c0078520 c005317c c0052b60 00000000 c01d8000 
9e20: c0177490 c01774a0 00000000 00000000 00000001 60000093 c01d9e80 c01d9e48 
9e40: c0053960 c005308c 00000001 60000013 00000000 c0177474 00000001 c0177474 
9e60: 00000000 c01d8000 c0177490 c01774a0 00000000 00000000 00000001 60000093 
9e80: c01d9ec8 c01d9e90 c0053960 c005308c 00000001 60000013 00000000 c0177474 
9ea0: 00000001 c0177474 00000000 000000d0 c01777e0 00000000 c01d3d60 c01d9f08 
9ec0: c01d9ecc c0053b94 c0053678 00000000 c01cc554 c01c9600 00000010 60000013 
9ee0: 00000000 00000001 00000001 00000000 00008000 c018c648 c0156f40 c01d9f18 
9f00: c01d9f0c c0053f80 c0053a34 c01d9f38 00000000 00000000 c0296000 00008000 
9f20: 00008000 c018c648 c0156f40 c01d9f68 c01d9f3c c00900c4 c008f680 00000000 
9f40: 00000000 c0297000 c0291000 c01e4000 c0182ff7 c01e4006 c01e4000 c01d9fb8 
9f60: c01d9f6c c0008d90 c0090038 00000000 00000000 c01d9f89 c01d3d60 01f00003 
9f80: c0156f40 00000001 c0014b80 00000000 c00150c9 c00150bc 00000001 c0014b80 
9fa0: 00000000 00000000 00000000 c01d9fd4 c01d9fbc c0008fa8 c0008cb0 00000000 
9fc0: c0156db8 c0014b80 c01d9ff4 c01d9fd8 c0016174 c0008f5c 00000000 00000000 
9fe0: 00000000 00000000 00000000 c01d9ff8 c0034e08 c0016088 e24cb004 e5915010 
Backtrace:                                                                    
Function entered at [<c00b3944>] from [<c00b3df8>]
 r8 = C028FCBC  r7 = 00000000  r6 = C01D9CF8  r5 = C01D9CF8
 r4 = C02AA7E4                                             
Function entered at [<c00b3a2c>] from [<c00b5f9c>]
Function entered at [<c00b5e6c>] from [<c00b6584>]
 r8 = C0281800  r7 = 00000000  r6 = 00008000  r5 = C028FC00
 r4 = C028FA00                                             
Function entered at [<c00b64f4>] from [<c00b67b0>]
 r8 = C01D9D7C  r7 = 00008000  r6 = C0297000  r5 = 00000003
 r4 = FFFFFFEA                                             
Function entered at [<c00b6638>] from [<c0078564>]
Function entered at [<c0078510>] from [<c008fc6c>]
Function entered at [<c008f670>] from [<c00900c4>]
Function entered at [<c0090028>] from [<c0008d90>]
 r7 = C01E4000  r6 = C01E4006  r5 = C0182FF7  r4 = C01E4000
Function entered at [<c0008ca0>] from [<c0008fa8>]         
Function entered at [<c0008f4c>] from [<c0016174>]
 r5 = C0014B80  r4 = C0156DB8                     
Function entered at [<c0016078>] from [<c0034e08>]
 r7 = 00000000  r6 = 00000000  r5 = 00000000  r4 = 00000000
Code: 0a000005 e1a01004 e1a00007 ebffe38d (e5944000)       
 <0>Kernel panic - not syncing: Attempted to kill init!

I will try to patch the sources with snapshot next couple hours...

K


-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
