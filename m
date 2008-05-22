Received: from mail09.syd.optusnet.com.au ([211.29.132.190])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jz4AM-0005ZQ-U1
	for linux-mtd@lists.infradead.org; Thu, 22 May 2008 06:20:43 +0000
Received: from [192.168.70.104] (218-214-145-58.people.net.au [218.214.145.58])
	(authenticated sender jamessteward)
	by mail09.syd.optusnet.com.au (8.13.1/8.13.1) with ESMTP id
	m4M6KORx024621
	for <linux-mtd@lists.infradead.org>; Thu, 22 May 2008 16:20:26 +1000
Subject: Help needed with MTD on AT91SAM9263-EK please.
From: James <jamessteward@optusnet.com.au>
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Date: Thu, 22 May 2008 16:20:23 +1000
Message-Id: <1211437223.6129.82.camel@Ubuntu-Desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I get very little joy from the NAND flash on my AT91SAM9263-EK board.  I
have 2 partitions, one starts at 0x100000 and finishes at 0x04000000,
then other starts from there and finishes at the end of the device at
256MB.  E.g.

/*
 * NAND flash
 */
static struct mtd_partition __initdata ek_nand_partition[] = {
        {
                .name   = "Partition 1",
                .offset = 0x100000,
                .size   = (64 * 1024 * 1024) - 0x100000,
        },
        {
                .name   = "Partition 2",
                .offset = 64 * 1024 * 1024,
                .size   = MTDPART_SIZ_FULL,
        },
};

The kernel seems happy with this:
NAND device: Manufacturer ID: 0x2c, Chip ID: 0xda (Micron NAND 256MiB
3,3V 8-bit)
AT91 NAND: 8-bit, Software ECC
Scanning device for bad blocks
Creating 2 MTD partitions on "at91_nand":
0x00100000-0x04000000 : "Partition 1"
0x04000000-0x10000000 : "Partition 2"

So I try running some diagnostics, such as;
root@at91sam9263ek:~/mtd-tools$ nandtest -p1 -o0 -l0x100000 /dev/mtd0
ECC corrections: 0
ECC failures   : 0
Bad blocks     : 0
BBT blocks     : 0
00000000: reading... 
ECC failed at 00000000
00000000: checking...
compare failed. seed 1804289383
Byte 0x7c40 is 0c should be ff
Byte 0xa58f is 0c should be ff
Byte 0xd354 is 0c should be 5c
Byte 0xd355 is 0c should be ff
Byte 0x108b4 is 0c should be a0
Byte 0x108b5 is 0c should be ff
Byte 0x108b8 is ff should be b6
Byte 0x108b9 is ff should be 2e
Byte 0x108bc is ff should be 4a

Always the same, and the same if I chose /dev/mtd1.

Also, this;

root@at91sam9263ek:~/mtd-tools$ ./flash_eraseall -j /dev/mtd0
Erasing 128 Kibyte @ 3ee0000 -- 99 % complete. Cleanmarker written at
3ee0000.
root@at91sam9263ek:~/mtd-tools$ ls /dev/mtd*
/dev/mtd0       /dev/mtd1       /dev/mtdblock0
/dev/mtd0ro     /dev/mtd1ro     /dev/mtdblock1
root@at91sam9263ek:~/mtd-tools$ nandwrite -a -p /dev/mtd0 /boot/uImage
Writing data to block 0
Writing data to block 20000
Writing data to block 40000
Writing data to block 60000
Writing data to block 80000
Writing data to block a0000
Writing data to block c0000
Writing data to block e0000
Writing data to block 100000
Writing data to block 120000
Writing data to block 140000
Writing data to block 160000
Writing data to block 180000
Writing data to block 1a0000
Writing data to block 1c0000
Writing data to block 1e0000
Writing data to block 200000
Writing data to block 220000
Writing data to block 240000
root@at91sam9263ek:~/mtd-tools$ nanddump -f text.out -l 0x260000 -s
0 /dev/mtd0
ECC failed: 3
ECC corrected: 0
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x00260000...
ECC: 1 uncorrectable bitflip(s) at offset 0x00001000
ECC: 1 uncorrectable bitflip(s) at offset 0x00001800
ECC: 1 uncorrectable bitflip(s) at offset 0x00002000
ECC: 1 uncorrectable bitflip(s) at offset 0x00002800
ECC: 1 uncorrectable bitflip(s) at offset 0x00003000
ECC: 1 uncorrectable bitflip(s) at offset 0x00004800
ECC: 1 uncorrectable bitflip(s) at offset 0x00007000
ECC: 1 uncorrectable bitflip(s) at offset 0x0000c800
ECC: 1 uncorrectable bitflip(s) at offset 0x0000f000
ECC: 1 uncorrectable bitflip(s) at offset 0x00011000
ECC: 1 uncorrectable bitflip(s) at offset 0x00011800
ECC: 1 uncorrectable bitflip(s) at offset 0x00014000
ECC: 1 uncorrectable bitflip(s) at offset 0x00014800
ECC: 1 uncorrectable bitflip(s) at offset 0x00015000
ECC: 1 uncorrectable bitflip(s) at offset 0x00015800
ECC: 1 corrected bitflip(s) at offset 0x00016000
ECC: 1 uncorrectable bitflip(s) at offset 0x00017000
ECC: 1 uncorrectable bitflip(s) at offset 0x00019800
ECC: 1 uncorrectable bitflip(s) at offset 0x0001c000
ECC: 1 uncorrectable bitflip(s) at offset 0x0001f000
ECC: 1 uncorrectable bitflip(s) at offset 0x00024800
ECC: 1 uncorrectable bitflip(s) at offset 0x00025000
ECC: 1 uncorrectable bitflip(s) at offset 0x00025800
ECC: 1 uncorrectable bitflip(s) at offset 0x00026000
ECC: 1 uncorrectable bitflip(s) at offset 0x00027000
ECC: 1 uncorrectable bitflip(s) at offset 0x00027800
ECC: 1 uncorrectable bitflip(s) at offset 0x00028800
ECC: 1 uncorrectable bitflip(s) at offset 0x00029000
<snip>

There were no bad blocks reported on the device as new.

Is anyone able to use the NAND flash on one of these boards?  If so,
with what kernel version, and in what manner (r/w JFFS2, ro CRAMFS,
etc).

Any other details of what/how I might get this to work, or where the
trouble is likely to be, would be much appreciated.

Sincerely,
James.
