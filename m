Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CWBmJ-0007o9-Lf
	for linux-mtd@lists.infradead.org; Mon, 22 Nov 2004 05:50:41 -0500
From: Ian Campbell <icampbell@arcom.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1101119250.2922.276.camel@icampbell-debian>
References: <20041118163528.GA9471@synertronixx3>
	<1100959034.8600.33.camel@localhost.localdomain>
	<20041120145020.GA15782@synertronixx3>
	<1100962661.8600.41.camel@localhost.localdomain>
	<20041120163510.GD7984@ku-gbr.de>
	<1100968467.7949.8.camel@localhost.localdomain>
	<1101119250.2922.276.camel@icampbell-debian>
Content-Type: text/plain
Date: Mon, 22 Nov 2004 10:50:37 +0000
Message-Id: <1101120637.2922.283.camel@icampbell-debian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: jffs2 Oops on 2.6.10-rc2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-11-22 at 10:27 +0000, Ian Campbell wrote:
> On Sat, 2004-11-20 at 16:34 +0000, David Woodhouse wrote:
> > On Sat, 2004-11-20 at 17:35 +0100, Konstantin Kletschke wrote:
> > > Sadly I overlooked your other (cvs comitted) patch this evening and I am
> > > at home now, what a pity... That would have cleared the situation up in
> > > 5 minutes :/
> > 
> > No it wouldn't -- that isn't the problem either. I _think_ this is...
> 
> Just FYI, either this fix (to build.c) or the other one (to nodemgmt.c)
> also fixed the BUG_ON I reported earlier in the month...

Gah! Looks like I spoke to soon. Even with both of these patches I still
see the BUG_ON, I've turned off pre-empt as well.

kernel BUG at /home/icampbell/devel/kernel/arm/2.6/fs/jffs2/nodemgmt.c:609!
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c3b58000
[00000000] *pgd=a3a87011, *pte=00000000, *ppte=00000000
Internal error: Oops: 807 [#1]
Modules linked in: ds1307
CPU: 0
PC is at __bug+0x40/0x54
LR is at 0x1
pc : [<c0023274>]    lr : [<00000001>]    Not tainted
sp : c3b1fc14  ip : 60000093  fp : c3b1fc24
r10: c3cc4d04  r9 : c3b1fc44  r8 : c3c47400
r7 : c02c12c0  r6 : c3b1fc3c  r5 : 00000000  r4 : 00000000
r3 : 00000000  r2 : 00000000  r1 : 60000013  r0 : 00000001
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: 397F  Table: A3B58000  DAC: 00000015
Process rpc.statd (pid: 1011, stack limit = 0xc3b1e190)
Stack: (0xc3b1fc14 to 0xc3b20000)
fc00:                                              c3cc4cf4 c3b1fc78 c3b1fc28
fc20: c00b9764 c0023240 c3b1fc3c c3b1fc44 00000000 00000000 c3c47400 0000000c
fc40: c3b1c002 c0021985 00000048 d22144a5 c3f52ccc c3f52ccc c3f52dac 00000004
fc60: c3805844 c3c47400 c3f9fe24 c3b1fc8c c3b1fc7c c00b9dec c00b9174 00000004
fc80: c3b1fcb8 c3b1fc90 c00ba11c c00b9da8 c3f9fe24 00000000 00000000 c00184f4
fca0: c3805830 00000000 c3c47400 c3b1fd18 c3b1fcbc c00bbdd4 c00b9e0c 00000004
fcc0: 01da5b58 00000003 00000000 00000000 c3ab7000 00000004 00000004 c3ab7000
fce0: 0001a4a8 01da5b58 86dabaa9 86dabaa9 c3b1fd3c c001851c c0018518 c00184f4
fd00: c3805858 00000000 c02706e0 c3b1fd6c c3b1fd1c c00b75b8 c00bba94 00000000
fd20: 00000004 c3b1fd38 c3c47400 c3805830 00000004 00000000 00000000 41a1a5a0
fd40: 41a1a5a0 c02706e0 00000004 00000000 00000000 00000000 00000000 00000004
fd60: c3b1fe0c c3b1fd70 c004e818 c00b741c 00000004 00000000 00018310 c3805858
fd80: c01b4d88 c38058f0 c38c5ae0 00000001 c3b1fe78 00000000 c3b1ff18 00000000
fda0: 1b80589c 00000000 00000000 c3b1fdb8 c0089828 c00c1d4c c02706e0 00000000
fdc0: c3805858 00000001 c38058a4 c380589c 41a1a5a0 c3b1fe10 c3b1fde4 c00814d0
fde0: c00897fc 00000000 00000000 00000000 c38c5ae0 c3b1fe40 00000000 00000000
fe00: c3b1fe74 c3b1fe14 c004f060 c004e4cc 00000000 00000000 c3b1ff78 00000004
fe20: 00000000 00000000 c3805858 00000004 c3b1ff78 c3b1ff18 c3b1fe78 00000001
fe40: 00000004 00000000 00000000 c3f7fd00 c3b1fed8 c3b1fe78 00000000 00000000
fe60: c3b1e000 c3b1ff78 c3b1ff10 c3b1fe78 c004f110 c004ec24 c3f7fd00 00000000
fe80: 00000000 00000001 ffffffff c38c5ae0 c3fec3e4 00000000 c3b1e000 00000000
fea0: c004f568 c3a0dff8 c3f7fd00 00000000 00000000 beffe000 c3a0dff8 c01eb614
fec0: c3b1ff04 c3b1fed0 c005c0c0 c0024ab8 c3f7fd00 c004743c c3b1fed8 c3b1fed8
fee0: 00000000 c3fef46c beffe000 c3b1e000 c38058c0 c38058f0 00000000 c3805858
ff00: c38c5ae0 c3b1ff44 c3b1ff14 c004f270 c004f098 00000006 00018310 00000004
ff20: c38c5ae0 00000000 00000000 00000004 c3b1ff78 00018310 c3b1ff74 c3b1ff48
ff40: c0067d24 c004f220 c3b1ff54 c0067580 c38c5b04 c38c5ae0 c3b1ff78 00000000
ff60: 00000000 00000001 c3b1ffa4 c3b1ff78 c0067e08 c0067c4c 00000000 00000000
ff80: 00000000 00018310 00000006 00017d9c 00000004 c001ea24 00000000 c3b1ffa8
ffa0: c001e8a0 c0067dc8 00018310 c00251e0 00000006 00018310 00000004 00000000
ffc0: 00018310 00000006 00017d9c 0001830c 4016b074 0000b6dc 00000001 000181c4
ffe0: 00000000 befff8d4 00002678 40109a20 60000010 00000006 00000000 00000000
Backtrace:
[<c0023234>] (__bug+0x0/0x54) from [<c00b9764>] (jffs2_mark_node_obsolete+0x5fc/0x6ec)
 r4 = C3CC4CF4
[<c00b9168>] (jffs2_mark_node_obsolete+0x0/0x6ec) from [<c00b9dec>] (jffs2_obsolete_node_frag+0x50/0x64)
[<c00b9d9c>] (jffs2_obsolete_node_frag+0x0/0x64) from [<c00ba11c>] (jffs2_add_full_dnode_to_inode+0x31c/0x440)
 r4 = 00000004
[<c00b9e00>] (jffs2_add_full_dnode_to_inode+0x0/0x440) from [<c00bbdd4>] (jffs2_write_inode_range+0x34c/0x460)
[<c00bba88>] (jffs2_write_inode_range+0x0/0x460) from [<c00b75b8>] (jffs2_commit_write+0x1a8/0x304)
[<c00b7410>] (jffs2_commit_write+0x0/0x304) from [<c004e818>] (generic_file_buffered_write+0x35c/0x5b8)
[<c004e4c0>] (generic_file_buffered_write+0x4/0x5b8) from [<c004f060>] (__generic_file_aio_write_nolock+0x448/0x474)
[<c004ec18>] (__generic_file_aio_write_nolock+0x0/0x474) from [<c004f110>] (__generic_file_write_nolock+0x84/0xb0)
[<c004f08c>] (__generic_file_write_nolock+0x0/0xb0) from [<c004f270>] (generic_file_write+0x5c/0xec)
 r8 = C38C5AE0  r7 = C3805858  r6 = 00000000  r5 = C38058F0
 r4 = C38058C0
[<c004f214>] (generic_file_write+0x0/0xec) from [<c0067d24>] (vfs_write+0xe4/0x108)
[<c0067c40>] (vfs_write+0x0/0x108) from [<c0067e08>] (sys_write+0x4c/0x74)
[<c0067dbc>] (sys_write+0x0/0x74) from [<c001e8a0>] (ret_fast_syscall+0x0/0x2c)
 r8 = C001EA24  r7 = 00000004  r6 = 00017D9C  r5 = 00000006
 r4 = 00018310
Code: 1b00434a e59f0014 eb004348 e3a03000 (e5833000)



-- 
Ian Campbell, Senior Design Engineer
                                        Web: http://www.arcom.com
Arcom, Clifton Road,                    Direct: +44 (0)1223 403 465
Cambridge CB1 7EA, United Kingdom       Phone:  +44 (0)1223 411 200
