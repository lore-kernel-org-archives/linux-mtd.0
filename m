Received: from [69.90.147.196] (helo=mail.kenati.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Ghsn4-0006Ck-VX
	for linux-mtd@lists.infradead.org; Wed, 08 Nov 2006 14:08:56 -0500
Received: from [192.168.1.67] (adsl-71-130-109-177.dsl.snfc21.pacbell.net
	[71.130.109.177])
	by mail.kenati.com (Postfix) with ESMTP id B1707E4052
	for <linux-mtd@lists.infradead.org>;
	Wed,  8 Nov 2006 12:08:52 -0800 (PST)
Message-ID: <4552272B.1010500@kenati.com>
Date: Wed, 08 Nov 2006 10:51:23 -0800
From: Carlos Munoz <carlos@kenati.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Can't get SST 39VF3201 flash device to work
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

I'm working on an custom embedded board (kernel 2.6.14) with a SST 
39VF3201 flash chip. I have tried all configurations I can think off and 
still can't get the kernel to successfully access the flash (jffs2 
filesystem). With the following configuration in the jedec_probe.c file 
I get the best results:

.mfr_id         = MANUFACTURER_SST,     /* should be CFI */
.dev_id         = SST39VF3201,
.name           = "SST 39VF3201",
.uaddr          = {
        [0] = MTD_UADDR_0x5555_0x2AAA,  /* x8 */
        [1] = MTD_UADDR_0x5555_0x2AAA   /* x16 */
},
.DevSize        = SIZE_4MiB,
.CmdSet         = P_ID_AMD_STD,
.NumEraseRegions= 1,
.regions        = {
        ERASEINFO(0x10000,64)
}

Has anyone been able to use this device under linux ? If so, how did you 
configure the kernel/mtd subsystem to get it to work ?

I'm including the boot log in case it helps:

Linux version 2.6.14.6 (carlos@whitetip) (gcc version 3.4.3) #46 PREEMPT 
Tue Nov 7 19:48:32 PST 2006
CPU: ARM926EJ-Sid(wb) [41069260] revision 0 (ARMv5TEJ)
Machine: MV88W8518
Using U-Boot passing parameters structure - U-Boot release 1.1.1.18
Memory policy: ECC disabled, Data cache writeback
CPU0: D VIVT write-back cache
CPU0: I cache: 32768 bytes, associativity 1, 32 byte lines, 1024 sets
CPU0: D cache: 32768 bytes, associativity 4, 32 byte lines, 256 sets
Built 1 zonelists
Kernel command line: root=/dev/mtdblock0 rw rootfstype=jffs2 
console=ttyS0,38400 init=/bin/sh
PID hash table entries: 128 (order: 7, 2048 bytes)
Dentry cache hash table entries: 4096 (order: 2, 16384 bytes)
Inode-cache hash table entries: 2048 (order: 1, 8192 bytes)
Memory: 16MB = 16MB total
Memory: 14080KB available (1715K code, 303K data, 72K init)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
NET: Registered protocol family 16
JFFS2 version 2.2. (NAND) (C) 2001-2003 Red Hat, Inc.
Serial: 8250/16550 driver $Revision: 1.1.2.9 $ 2 ports, IRQ sharing enabled
ttyS0 at MMIO 0xf800c840 (irq = 11) is a 16550A
io scheduler noop registered
io scheduler deadline registered
PHY found at addr 16,  ID 1410c87,  mii_status 7849
eth0: mv88w8xx8 FEC @ 80008000, 00:09:11:22:33:45 irq 9
PPP generic driver version 2.4.2
PPP Deflate Compression module registered
PPP BSD Compression module registered
Found: SST 39VF3201
MV88W8XX8 flash memory: Found 1 x16 devices at 0x0 in 16-bit bank
number of JEDEC chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
MV88W8XX8 flash map (size->0x400000 mem->0xFFC00000)
Creating 3 MTD partitions on "MV88W8XX8 flash memory":
0x00000000-0x00250000 : "Rootfs"
0x00250000-0x00260000 : "U-Boot environment"
0x00260000-0x00400000 : "U-Boot"
u32 classifier
    OLD policer on
NET: Registered protocol family 2
IP route cache hash table entries: 256 (order: -2, 1024 bytes)
TCP established hash table entries: 1024 (order: 0, 4096 bytes)
TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
TCP: Hash tables configured (established 1024 bind 1024)
TCP reno registered
ip_conntrack version 2.3 (128 buckets, 1024 max) - 228 bytes per conntrack
ip_tables: (C) 2000-2002 Netfilter core team
TCP bic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
flash_size=250000 used_size=0 dirty_size=0 wasted_size=0 
free_size=250000 erasing_size=0 bad_size=0 sector_size=10000 
unchecked_size=0
Eep. Child "sh" (ino #55) of dir ino #2 doesn't exist!
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 72K
Failed to execute /bin/sh.  Attempting defaults...


Thanks,


Carlos
