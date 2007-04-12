Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HbuUH-0007RW-69
	for linux-mtd@lists.infradead.org; Thu, 12 Apr 2007 04:17:05 -0400
Subject: Re: Strange flash errors starting to appear
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1175700307.12080.67.camel@gentoo-jocke.transmode.se>
References: <1175700307.12080.67.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Thu, 12 Apr 2007 10:16:47 +0200
Message-Id: <1176365807.12080.112.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-04-04 at 17:25 +0200, Joakim Tjernlund wrote:
> Just got this on two boards(lots of them):
> TMCU Flash Map Info: Waiting for chip to be ready timed out. Status c320
> Write of 52 bytes at 0x0771392c failed. returned -5, retlen 0
> Not marking the space at 0x0771392c as dirty because the flash driver returned retlen zero
> 
> Status c320 varies between boots. Seen
> 7574, 3034 and 5f32
> 
> Kernel 2.6.20, no summary, Powerpc, cfi_cmdset_0001(Intel P30, 16 bits wide)
> I have removed SUMMARY support from my kernel recently.
> 
>  Ideas?

Got some more info about this problem now.
get_chip() in cfi_cmdset_0001 thinks the flash is in FL_STATUS and
keeps querying the chip for status and eventually times out. Looking
closer at the the chip I found that the real state is READY so  
status = map_read(map, adr); actually reads flash contents instead.
If I force the flash into status mode inside the timeout code, it
recovers:
	if (time_after(jiffies, timeo)) {
				printk(KERN_ERR "%s: Waiting for chip to be ready timed out. Status %lx\n",
				       map->name, status.x[0]);
				map_write(map, CMD(0x70), adr); /* force into status */
				status = map_read(map, adr);
				if (map_word_andequal(map, status, status_OK, status_OK)) {
					printk(KERN_ERR "Status(%lx) OK for adr:%lx\n", status.x[0], adr);
					//BUG();
					break;
				}
				return -EIO;
			}


uncommenting the BUG(), I get these traces which shows that the error
appers in do_write_buffer() as it calls get_chip()

All this makes me think there is a race somewhere that puts the flash 
into READY mode, but I am unable to find the cause. I really need some
help one this one.

------------[ cut here ]------------
kernel BUG at drivers/mtd/chips/cfi_cmdset_0001.c:732!
Oops: Exception in kernel mode, sig: 5 [#1]

NIP: C0138170 LR: C0138170 CTR: C00F62B4
REGS: cf50ba80 TRAP: 0700   Not tainted  (2.6.20)
MSR: 00029032 <EE,ME,IR,DR>  CR: 24000422  XER: 00000000
TASK = ce53e7b0[511] 'mgmt_backupd' THREAD: cf50a000
GPR00: C0138170 CF50BB30 CE53E7B0 00000021 00001A87 FFFFFFFF C010F5C8
C024911C 
GPR08: 00001A87 C0260000 00000000 C0250000 24000422 1003CCB8 10020000
10036008 
GPR16: 10020000 FFFFFFFF FFFFFFFF 10020000 CF50BD1C 00000001 06231D00
00000080 
GPR24: C0250000 C07EABA0 C013A178 FFFF9AA5 00000000 00000080 00000007
CFF19ED4 
NIP [C0138170] get_chip+0x4fc/0x578
LR [C0138170] get_chip+0x4fc/0x578
Call Trace:
[CF50BB30] [C0138170] get_chip+0x4fc/0x578 (unreliable)
[CF50BC40] [C0138D70] do_write_buffer+0x78/0x588
[CF50BD10] [C0139358] cfi_intelext_writev+0xd8/0x138
[CF50BD50] [C0130DFC] part_writev+0x44/0x60
[CF50BD60] [C00D80A0] jffs2_flash_direct_writev+0xf0/0x104
[CF50BDA0] [C00D1F48] jffs2_write_dnode+0x160/0x1a4
[CF50BE00] [C00D26E0] jffs2_do_create+0xa4/0x2c4
[CF50BE30] [C00CC0E4] jffs2_create+0xac/0x154
[CF50BE50] [C0064180] vfs_create+0x98/0x100
[CF50BE70] [C0064A20] open_namei+0x638/0x6b4
[CF50BEB0] [C0059448] do_filp_open+0x30/0x78
[CF50BF20] [C00597C4] do_sys_open+0x70/0x110
[CF50BF40] [C000F144] ret_from_syscall+0x0/0x38


------------[ cut here ]------------
kernel BUG at drivers/mtd/chips/cfi_cmdset_0001.c:732!
Oops: Exception in kernel mode, sig: 5 [#1]

NIP: C0138170 LR: C0138170 CTR: C00F62B4
REGS: cf08da40 TRAP: 0700   Not tainted  (2.6.20)
MSR: 00029032 <EE,ME,IR,DR>  CR: 24822222  XER: 00000000
TASK = ce4f63e0[532] 'mv' THREAD: cf08c000
GPR00: C0138170 CF08DAF0 CE4F63E0 00000021 00001A87 FFFFFFFF C010F5C8
C024911C 
GPR08: 00001A87 C0260000 00000000 C0250000 24822222 1007762C 00000003
CFF19E00 
GPR16: CF08DD70 00000070 CFF19E9C 0022F094 00000037 00000001 0622F080
00000080 
GPR24: C0250000 C07EABA0 C013A104 FFFF9CC2 00000000 00000080 00000007
CFF19ED4 
NIP [C0138170] get_chip+0x4fc/0x578
LR [C0138170] get_chip+0x4fc/0x578
Call Trace:
[CF08DAF0] [C0138170] get_chip+0x4fc/0x578 (unreliable)
[CF08DC00] [C0138DC8] cfi_intelext_writev+0x12c/0x6a8
[CF08DD00] [C0130DFC] part_writev+0x44/0x60
[CF08DD10] [C00D80A0] jffs2_flash_direct_writev+0xf0/0x104
[CF08DD50] [C00D20BC] jffs2_write_dirent+0x130/0x398
[CF08DDB0] [C00D2CE0] jffs2_do_link+0x110/0x1e4
[CF08DDF0] [C00CD050] jffs2_rename+0x88/0x394
[CF08DE20] [C0065E1C] vfs_rename+0x384/0x400
[CF08DE60] [C0066050] sys_renameat+0x1b8/0x200
[CF08DF40] [C000F144] ret_from_syscall+0x0/0x38
--- Exception: c01 at 0xff02fdc
    LR = 0x10014410
Instruction dump:
7fa0b838 93a10094 7f970000 92e10098 90010090 900100a0 409efce4 3c60c021 
7fa4eb78 7ec5b378 38631d68 4bee40b1 <0fe00000> 48000000 380000d0
7f43d378



kernel BUG at drivers/mtd/chips/cfi_cmdset_0001.c:729!
Oops: Exception in kernel mode, sig: 5 [#1]

NIP: C0137D44 LR: C0137D44 CTR: C00F62B4
REGS: cf63baa0 TRAP: 0700   Not tainted  (2.6.20)
MSR: 00029032 <EE,ME,IR,DR>  CR: 24000422  XER: 00000000
TASK = c04be7f0[777] 'mgmt_backupd' THREAD: cf63a000
GPR00: C0137D44 CF63BB50 C04BE7F0 00000021 0000166A FFFFFFFF C010F5C8 C024911C 
GPR08: 0000166A C0260000 00000000 C0250000 24000422 1003CCB8 00000003 CFF19E00 
GPR16: CF63BDC0 00000070 CFF19E9C 00238BAC 00000044 00000001 06238B80 00000080 
GPR24: C0250000 C07EABA0 C0139CD8 FFFFA13B 00000000 00000080 00000007 CFF19ED4 
NIP [C0137D44] get_chip+0x4a0/0x51c
LR [C0137D44] get_chip+0x4a0/0x51c
Call Trace:
[CF63BB50] [C0137D44] get_chip+0x4a0/0x51c (unreliable)
[CF63BC50] [C013899C] cfi_intelext_writev+0x12c/0x6a8
[CF63BD50] [C0130DFC] part_writev+0x44/0x60
[CF63BD60] [C00D80A0] jffs2_flash_direct_writev+0xf0/0x104
[CF63BDA0] [C00D1F48] jffs2_write_dnode+0x160/0x1a4
[CF63BE00] [C00D26E0] jffs2_do_create+0xa4/0x2c4
[CF63BE30] [C00CC0E4] jffs2_create+0xac/0x154
[CF63BE50] [C0064180] vfs_create+0x98/0x100
[CF63BE70] [C0064A20] open_namei+0x638/0x6b4
