Received: from [69.90.147.196] (helo=mail.kenati.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gk45R-0002Rx-D9
	for linux-mtd@lists.infradead.org; Tue, 14 Nov 2006 14:36:56 -0500
Message-ID: <455A1D14.7040202@kenati.com>
Date: Tue, 14 Nov 2006 11:46:28 -0800
From: Carlos Munoz <carlos@kenati.com>
MIME-Version: 1.0
To: robin.gilks@tait.co.nz
Subject: Re: Kernel oops in jffs2 mount - any ideas?
References: <4553C6CB.2040207@tait.co.nz>
	<1163146170.3925.7.camel@sauron>	<4557E56F.8070100@tait.co.nz>
	<1163411683.3925.31.camel@sauron> <4559412C.8080102@tait.co.nz>
In-Reply-To: <4559412C.8080102@tait.co.nz>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: MTD mail list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Robin Gilks wrote:

>Artem Bityutskiy wrote:
>
>  
>
>>So the crash is somewhere in the CFI code. You should try to dig it and
>>realize why it oopses.
>>    
>>
>
>Pretty much at the same point except now its the garbage collector 
>crashing and leaving a lock on an inode so the kernel stalls.
>
>No clues as to what is going on though :-(
>
>[   13.591311] jffs2_scan_eraseblock(): Node at 0x0004aff8 {0x1985, 
>0xe001, 0x0000002d) has invalid CRC 0xd7218112 (calculated 0x05000000)
>[   13.617310] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found 
>at 0x0004b000: 0xd721 instead
>[   13.638175] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found 
>at 0x0004b010: 0x4558 instead
>[   13.656489] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found 
>at 0x0004b014: 0x0502 instead
>[   13.674599] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found 
>at 0x0004b018: 0xbf85 instead
>[   13.692594] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found 
>at 0x0004b01c: 0x584a instead
>[   13.710884] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found 
>at 0x0004b020: 0x7474 instead
>[   13.728881] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found 
>at 0x0004b024: 0x31ff instead
>[   15.178914] Oops: kernel access of bad area, sig: 11 [#1]
>[   15.189159] NIP: C0113524 LR: C0114128 CTR: C0113524
>[   15.199017] REGS: c3cafcd0 TRAP: 0300   Not tainted  (2.6.18-buildroot)
>[   15.212119] MSR: 00009032 <EE,ME,IR,DR>  CR: 22008028  XER: 0000005F
>[   15.224743] DAR: FF80101B, DSISR: C0000000
>[   15.232877] TASK = c036e410[280] 'jffs2_gcd_mtd1' THREAD: c3cae000
>[   15.244778] GPR00: 00000000 C3CAFD80 C036E410 FF800FFF C3C2E678 
>00000000 C0352A44 E67B3F7B
>[   15.261366] GPR08: 000DF464 C01AF99C FF800FFF C0113524 22008024 
>00000000 C3CAFE38 00000000
>[   15.277955] GPR16: C3CAFE24 C01C0000 C3CAFDA8 00000000 C3CAFE28 
>C3C2E640 C0352A20 00000000
>[   15.294544] GPR24: 000DF464 C3C2E640 00000028 00000000 000DF464 
>C3C2E678 C03FEC14 C3C2E678
>[   15.311479] NIP [C0113524] put_chip+0xa0/0x2e8
>[   15.320294] LR [C0114128] cfi_intelext_read+0x1a0/0x240
>[   15.330656] Call Trace:
>[   15.335509] [C3CAFD80] [C3C2E640] 0xc3c2e640 (unreliable)
>[   15.346223] [C3CAFDA0] [C0114128] cfi_intelext_read+0x1a0/0x240
>[   15.357974] [C3CAFDF0] [C010C8A0] part_read+0x84/0xe0
>[   15.367997] [C3CAFE10] [C00B6AD4] 
>jffs2_do_read_inode_internal+0x12c/0x1124
>[   15.381821] [C3CAFE90] [C00B7B30] jffs2_do_crccheck_inode+0x64/0xc0
>[   15.394262] [C3CAFF00] [C00BBF9C] jffs2_garbage_collect_pass+0x194/0x8a4
>[   15.407568] [C3CAFF50] [C00BDE04] jffs2_garbage_collect_thread+0xa8/0x178
>[   15.421046] [C3CAFFF0] [C000514C] kernel_thread+0x44/0x60
>[   15.431745] Instruction dump:
>[   15.437622] 3863a000 4beffdf5 387f001c 38800003 38a00001 38c00000 
>4befb5d5 80010024
>[   15.453000] 83e1001c 38210020 7c0803a6 4e800020 <800a001c> 2f800000 
>419effd0 7d435378
>[   15.470060] VFS: Mounted root (jffs2 filesystem).
>[   15.479675] Freeing unused kernel memory: 92k init
>[   15.488661] jffs2_lookup()
>[   15.493994] jffs2_read_inode(): inode->i_ino == 3
>[   15.503383] [JFFS2 DBG] (1) jffs2_do_read_inode: read inode #3
>[   15.514963] [JFFS2 DBG] (1) jffs2_do_read_inode_internal: ino #3 
>nlink is 1
>[   15.528803] [JFFS2 DBG] (1) jffs2_get_inode_nodes: ino #3
>[   15.539699] [JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 
>0x04b868(2).
>[   15.554222] [JFFS2 DBG] (1) jffs2_alloc_full_dirent: c3ca4ee0
>[   15.565732] [JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "zero", 
>ino #166
>[   15.579790] [JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 
>0x04b7f0(2).
>[   15.594479] [JFFS2 DBG] (1) jffs2_alloc_full_dirent: c3ca4fe0
>[   15.605904] [JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent 
>"urandom", ino #165
>[   15.620569] [JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 
>0x04b778(2).
>[   15.635260] [JFFS2 DBG] (1) jffs2_alloc_full_dirent: c3ca43e0
>[   15.646848] [JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "ttyp9", 
>ino #164
>[   15.661007] [JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 
>0x04b700(2).
>[   15.675722] [JFFS2 DBG] (1) jffs2_alloc_full_dirent: c3ca4760
>...
>...
>...
>[   20.078514] jffs2_read_inode(): inode->i_ino == 12
>[   20.087997] [JFFS2 DBG] (1) jffs2_do_read_inode: read inode #12
>[   20.099752] [JFFS2 DBG] (1) jffs2_do_read_inode: waiting for ino #12 
>in state 1
>
>HELP!
>
>  
>
I was seeing the same error:

[   13.617310] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found 
at 0x0004b000: 0xd721 instead

and it turned out to be the flash I was using was mis configured. I was 
using the SST 39VF3201 flash which supports erase sectors (4KB) and 
erase blocks (64KB). The jffs2 file system was built with an erase block 
size of 64KB. However, cfi_cmdset_0002.c was hard coded to use erase 
sectors (4KB). I modified the do_erase_oneblock() function as follows:

 #ifdef ERASE_BLOCK_SIZE_4KB
    map_write(map, CMD(0x30), adr);
#else
    map_write(map, CMD(0x50), adr);
#endif

The datasheet specified that 0x30 is used for sector erase (4KB) and 
0x50 for block erase (64KB). You need to look at the datasheet for your 
part and verify the command sequence.

Also, since I use jedec probing instead of cfi I needed to add the 
mapping for the flash to jedec_probe.c:

       }, {
              .mfr_id         = MANUFACTURER_SST,     /* should be CFI */
              .dev_id         = SST39VF3201,
                .name           = "SST 39VF3201",
                .uaddr          = {
                        [0] = MTD_UADDR_0x5555_0x2AAA,  /* x8 */
                        [1] = MTD_UADDR_0x5555_0x2AAA   /* x16 */
                },
                .DevSize        = SIZE_4MiB,
                .CmdSet         = P_ID_AMD_STD,
                .NumEraseRegions= 2,
                .regions        = {
                        ERASEINFO(0x8000,2),
                        ERASEINFO(0x10000,63)
                }
       }, {

Note the the first block has to regions of 32KB each and the rest of the 
blocks are 64KB. Again, look at your datasheet to configure the erase 
regions.


Carlos
