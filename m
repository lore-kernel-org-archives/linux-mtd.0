Received: from [210.241.255.67] (helo=mail.cable.net.tw)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AoQcY-0007kR-L8
	for linux-mtd@lists.infradead.org; Wed, 04 Feb 2004 17:15:28 +0000
Received: from linuxer (unknown [203.162.167.47])
	by mail.cable.net.tw (Postfix) with ESMTP id F05D340018
	for <linux-mtd@lists.infradead.org>;
	Thu,  5 Feb 2004 01:17:48 +0000 (UTC)
Message-ID: <00e301c3eb42$8dfbbc80$030910ac@linuxer>
From: "Pham Huy Vu" <vuph@mail.cable.net.tw>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 5 Feb 2004 01:15:52 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Copy files to jffs2 partition have problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
I have used uClinux on my Samsung ARM7 board,
My flash (MX 29LV320TTC- 4MB) have
    + configurations:
    static const struct awtel_info awtel_flash_board_desc[PHYSMAP_NUMBER] =
            {   // DATA Flash configuration
                "MX FLASH",          // name
                0xE0000000,          // window_addr
                0x400000,              // window_size
                2,                          // buswidth 16 bits mode
                5,                          // num_partitions
        },
    +5 partitons:
                {
                        name: "Whole partition",
                        size: 0x400000,
                        offset: 0x000000,
                },
                {
                        name: "Bios partition",
                        size: 0x010000,
                        offset: 0x000000,
                },
                {
                        name: "Kernel partition",
                        size: 0x1e0000,
                        offset: 0x010000,
                },
                {
                        name: "Data partition", // jffs2 fs on this
partition
                        size: 0x1e0000,
                        offset: 0x200000,
                },
                {
                        name: "Configuration partition",
                        size: 0x010000,
                        offset: 0x3e0000,
                },

In amd_flash.c:
static const struct amd_flash_info table[] = {
....
    //This my flash setup
        mfr_id: MANUFACTURER_MX,
        dev_id: MX29LV320T,
        name: "MXIC MX29LV320T",
        size: 0x00400000,
        numeraseregions: 3,
        regions: {
            { offset: 0x000000, erasesize: 0x10000, numblocks: 48 },
            { offset: 0x300000, erasesize: 0x10000, numblocks: 15 },
            { offset: 0x3f0000, erasesize: 0x02000, numblocks:  8 },
        }
....
}

BUT I always go problem when copy files:
---------------------
Booting messages:
......
awtel_flash device: 400000 at e0000000
awtel_flash: ioremap is e0000000
buswidth is 2
MX FLASH: Probing for AMD compatible flash...
buswidth is 2
amd_flash.c:362:buswidth is 2
awtel_write16:0xe0000aaa, 0xaa
amd_flash.c:198 flash WRITE addr=0xaaa, val=0xaa00aa
awtel_write16:0xe0000554, 0x55
amd_flash.c:198 flash WRITE addr=0x554, val=0x550055
awtel_write16:0xe0000aaa, 0xf0
amd_flash.c:198 flash WRITE addr=0xaaa, val=0xf000f0
awtel_write16:0xe0000aaa, 0xaa
amd_flash.c:198 flash WRITE addr=0xaaa, val=0xaa00aa
awtel_write16:0xe0000554, 0x55
amd_flash.c:198 flash WRITE addr=0x554, val=0x550055
awtel_write16:0xe0000aaa, 0x90
amd_flash.c:198 flash WRITE addr=0xaaa, val=0x900090
awtel_read16:0xe0000000
amd_flash.c:184 flash READ addr=0x0, val=0xc2
awtel_write16:0xe0000aaa, 0xaa
amd_flash.c:198 flash WRITE addr=0xaaa, val=0xaa00aa
awtel_write16:0xe0000554, 0x55
amd_flash.c:198 flash WRITE addr=0x554, val=0x550055
awtel_write16:0xe0000aaa, 0xf0
amd_flash.c:198 flash WRITE addr=0xaaa, val=0xf000f0
awtel_write16:0xe0000aaa, 0xaa
amd_flash.c:198 flash WRITE addr=0xaaa, val=0xaa00aa
awtel_write16:0xe0000554, 0x55
amd_flash.c:198 flash WRITE addr=0x554, val=0x550055
awtel_write16:0xe0000aaa, 0x90
amd_flash.c:198 flash WRITE addr=0xaaa, val=0x900090
awtel_read16:0xe0000002
amd_flash.c:184 flash READ addr=0x2, val=0x22a7
amd_flash.c:385: buswidth:2, mfr_id=0xc2, dev_id=0x22a7
MX FLASH: Found 1 x 4MiB MXIC MX29LV320T at 0x0
awtel_write16:0xe0000aaa, 0xaa
amd_flash.c:198 flash WRITE addr=0xaaa, val=0xaa00aa
awtel_write16:0xe0000554, 0x55
amd_flash.c:198 flash WRITE addr=0x554, val=0x550055
awtel_write16:0xe0000aaa, 0xf0
amd_flash.c:198 flash WRITE addr=0xaaa, val=0xf0
phymap 0 amd_flash_probe: mymtd is 1fcf3a0
Creating 5 MTD partitions on "MX FLASH":
0x00000000-0x00400000 : "Whole partition"
mtd: Giving out device 0 to Whole partition
0x00000000-0x00010000 : "Bios partition"
mtd: Giving out device 1 to Bios partition
0x00010000-0x001f0000 : "Kernel partition"
mtd: Giving out device 2 to Kernel partition
0x00200000-0x003e0000 : "Voip partition"
mtd: Giving out device 3 to Voip partition
0x003e0000-0x003f0000 : "Configuration partition"
mtd: Giving out device 4 to Configuration partition
init_mtdchar: allocated major number 90.
init_mtdblock: allocated major number 131.
.....


#mkfs.jffs2 -l -r /tmp/data/ -o data.jffs2
#dd if=data.jffs2 of=/dev/mtd3 bs=64
#mount -t jffs2 /dev/mtdblock3 /var/flash
# df -h
Filesystem                Size      Used Available Use% Mounted on
rootfs                    3.1M      3.1M         0 100% /
/dev/rom0                 3.1M      3.1M         0 100% /
/dev/mtdblock3            1.9M      1.2M    664.0k  65% /var/flash

#ls  -la /tmp
-rwxrwxrwx    1 0        root       292756 abc

#cp /tmp/abc /var/flash/
cp: write: Input/output error

#ls -la /var/flash
-rwxr-xr-x    1 0        root        42749 abc
drwxr-xr-x    1 0        root           32 usr

# dmesg
......
awtel_write16:0xe0000aaa, 0xaa
amd_flash.c:198 flash WRITE addr=0xaaa, val=0xaa00aa
awtel_write16:0xe0000554, 0x55
amd_flash.c:198 flash WRITE addr=0x554, val=0x550055
awtel_write16:0xe0000aaa, 0xa0
amd_flash.c:198 flash WRITE addr=0xaaa, val=0xa0
awtel_write16:0xe03a59c0, 0x10
amd_flash.c:198 flash WRITE addr=0x3a59c0, val=0x14000010
awtel_read16:0xe03a59c0
amd_flash.c:184 flash READ addr=0x3a59c0, val=0x10
awtel_read16:0xe03a59c0
amd_flash.c:184 flash READ addr=0x3a59c0, val=0x10
awtel_read16:0xe03a59c0
amd_flash.c:184 flash READ addr=0x3a59c0, val=0x10
MX FLASH: write to 0x3a59c0 failed. datum = 14000010, verify = 10
Write of 71 bytes at 0x001a597c failed. returned 0, retlen 68
jffs2_add_physical_node_ref(): Node at 0x1a597c, size 0x48
jffs2_mark_node_obsolete called with already obsolete node at 0x001a597c
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 14, nr_erasing_blocks 0, dirty_size
0x184
jffs2_commit_write(): Not all bytes written. Marking page !uptodate
jffs2_commit_write() returning -5
.........

------------------------------
Please help me if someone overcomes these problem or give me some hints.

+ Why i got errors when i copy files to jffs2 partition even my free space
enough for Garbage collection ( 5*64k = 320k < 664.0k)?
+ "MX FLASH: write to 0x3a59c0 failed. datum = 14000010, verify = 10
    Write of 71 bytes at 0x001a597c failed. returned 0, retlen 68"
    =>Why it write 71 bytes?
+ Did I set up something wrong with my flash?
Thanks a lot.


----mark pham----
