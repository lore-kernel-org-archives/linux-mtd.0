Message-ID: <4A77F421.4020604@nokia.com>
Date: Tue, 04 Aug 2009 11:41:05 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Kyungmin Park <kmpark@infradead.org>
Subject: Re: 4KiB pagesize and UBIFS
References: <9c9fda240908032328qcd68805haa94fb5f6b209d6f@mail.gmail.com>
In-Reply-To: <9c9fda240908032328qcd68805haa94fb5f6b209d6f@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Bityutskiy Artem \(Nokia-D/Helsinki\)" <Artem.Bityutskiy@nokia.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Kyungmin Park wrote:
> Hi,
> 
> I create the empty ubifs as datafs and then try to mount it
> Of course I turn on all debug message at ubifs.
> 
> As below it try to read unaligned read (not seen at here, driver
> handle it) and linefetch error finally.
> 
> I guest 4KiB pagesize don't support on ubifs.
> 
> How can I handle it?
> 
> Thank you,
> Kyungmin Park
> 
> # mount -t ubifs ubi0!datafs /mnt
> [   12.400000] UBIFS DBG (pid 1039): ubifs_get_sb: name ubi0!datafs, flags 0x800
> 0
> [   12.410000] UBIFS DBG (pid 1039): ubifs_get_sb: opened ubi0_20
> [   12.410000] UBIFS DBG (pid 1039): ubifs_read_node: LEB 0:0, superblock node,
> length 4096
> [   12.420000] UBIFS DBG (pid 1039): ubifs_start_scan: scan LEB 1:0
> [   12.430000] UBIFS DBG (pid 1040): ubifs_bg_thread: background thread "ubifs_b
> gt0_20" started, PID 1040
> [   12.470000] UBIFS DBG (pid 1039): ubifs_scan: look at LEB 1:0 (253952 bytes l
> eft)
> [   12.470000] UBIFS DBG (pid 1039): ubifs_scan_a_node: scanning master node
> [   12.480000] UBIFS DBG (pid 1039): ubifs_scan: look at LEB 1:512 (253440 bytes
>  left)
> [   12.490000] UBIFS DBG (pid 1039): ubifs_scan_a_node: scanning padding node
> [   12.490000] UBIFS DBG (pid 1039): ubifs_scan_a_node: 3556 bytes padded, offse
> t now 4096
> [   12.500000] UBIFS DBG (pid 1039): ubifs_scan: look at LEB 1:4096 (249856 byte
> s left)
> [   12.510000] UBIFS DBG (pid 1039): ubifs_scan_a_node: scanning master node
> [   12.520000] UBIFS DBG (pid 1039): ubifs_scan: look at LEB 1:4608 (249344 byte
> s left)
> [   12.520000] UBIFS DBG (pid 1039): ubifs_scan_a_node: scanning padding node
> [   12.530000] UBIFS DBG (pid 1039): ubifs_scan_a_node: 3556 bytes padded, offse
> t now 8192
> [   12.540000] UBIFS DBG (pid 1039): ubifs_scan: look at LEB 1:8192 (245760 byte
> s left)
> [   12.550000] UBIFS DBG (pid 1039): ubifs_scan_a_node: hit empty space
> [   12.550000] UBIFS DBG (pid 1039): ubifs_end_scan: stop scanning LEB 1 at offs
> et 8192
> [   12.560000] UBIFS DBG (pid 1039): ubifs_start_scan: scan LEB 2:0
> [   12.600000] UBIFS DBG (pid 1039): ubifs_scan: look at LEB 2:0 (253952 bytes l
> eft)
> [   12.600000] UBIFS DBG (pid 1039): ubifs_scan_a_node: scanning master node
> [   12.610000] UBIFS DBG (pid 1039): ubifs_scan: look at LEB 2:512 (253440 bytes
>  left)
> [   12.620000] UBIFS DBG (pid 1039): ubifs_scan_a_node: scanning padding node
> [   12.620000] UBIFS DBG (pid 1039): ubifs_scan_a_node: 3556 bytes padded, offse
> t now 4096
> [   12.630000] UBIFS DBG (pid 1039): ubifs_scan: look at LEB 2:4096 (249856 byte
> s left)
> [   12.640000] UBIFS DBG (pid 1039): ubifs_scan_a_node: scanning master node
> [   12.650000] UBIFS DBG (pid 1039): ubifs_scan: look at LEB 2:4608 (249344 byte
> s left)
> [   12.650000] UBIFS DBG (pid 1039): ubifs_scan_a_node: scanning padding node
> [   12.660000] UBIFS DBG (pid 1039): ubifs_scan_a_node: 3556 bytes padded, offse
> t now 8192
> [   12.670000] UBIFS DBG (pid 1039): ubifs_scan: look at LEB 2:8192 (245760 byte
> s left)
> [   12.680000] UBIFS DBG (pid 1039): ubifs_scan_a_node: hit empty space
> [   12.680000] UBIFS DBG (pid 1039): ubifs_end_scan: stop scanning LEB 2 at offs
> et 8192
> [   12.690000] UBIFS DBG (pid 1039): ubifs_read_node: LEB 12:0, indexing node, l
> ength 48
> [   12.700000] UBIFS: recovery needed
> [   12.700000] UBIFS DBG (pid 1039): ubifs_recover_inl_heads: checking index hea
> d at 12:4096
> [   12.710000] UBIFS DBG (pid 1039): ubifs_recover_inl_heads: checking LPT head
> at 7:4096
> [   12.720000] UBIFS DBG (pid 1039): lpt_init_rd: space_bits 15
> [   12.730000] UBIFS DBG (pid 1039): lpt_init_rd: lpt_lnum_bits 2
> [   12.730000] UBIFS DBG (pid 1039): lpt_init_rd: lpt_offs_bits 18
> [   12.740000] UBIFS DBG (pid 1039): lpt_init_rd: lpt_spc_bits 18
> [   12.750000] UBIFS DBG (pid 1039): lpt_init_rd: pcnt_bits 10
> [   12.750000] UBIFS DBG (pid 1039): lpt_init_rd: lnum_bits 12
> [   12.760000] UBIFS DBG (pid 1039): lpt_init_rd: pnode_sz 18
> [   12.760000] UBIFS DBG (pid 1039): lpt_init_rd: nnode_sz 13
> [   12.770000] UBIFS DBG (pid 1039): lpt_init_rd: ltab_sz 12
> [   12.770000] UBIFS DBG (pid 1039): lpt_init_rd: lsave_sz 387
> [   12.780000] UBIFS DBG (pid 1039): lpt_init_rd: lsave_cnt 256
> [   12.790000] UBIFS DBG (pid 1039): lpt_init_rd: lpt_hght 5
> [   12.790000] UBIFS DBG (pid 1039): lpt_init_rd: big_lpt 0
> [   12.800000] UBIFS DBG (pid 1039): lpt_init_rd: LPT root is at 7:70
> [   12.800000] UBIFS DBG (pid 1039): lpt_init_rd: LPT head is at 7:4096
> [   12.810000] UBIFS DBG (pid 1039): lpt_init_rd: LPT ltab is at 7:83
> [   12.810000] UBIFS DBG (pid 1039): ubifs_read_node: LEB 12:0, indexing node, l
> ength 48
> [   12.820000] UBIFS DBG (pid 1039): read_znode: LEB 12:0, level 0, 1 branch
> [   12.830000] UBIFS DBG (pid 1039): ubifs_add_lpt_dirt: LEB 7 add 13 to 4001
> [   12.840000] UBIFS DBG (pid 1039): ubifs_add_lpt_dirt: LEB 7 add 12 to 4014
> [   12.850000] UBIFS DBG (pid 1039): ubifs_add_lpt_dirt: LEB 7 add 13 to 4026
> [   12.860000] UBIFS DBG (pid 1039): ubifs_add_lpt_dirt: LEB 7 add 13 to 4039
> [   12.870000] UBIFS DBG (pid 1039): ubifs_add_lpt_dirt: LEB 7 add 13 to 4052
> [   12.870000] UBIFS DBG (pid 1039): ubifs_add_lpt_dirt: LEB 7 add 13 to 4065
> [   12.880000] Unhandled fault: external abort on non-linefetch (0x1008) at 0xc5
> 880410
> [   12.890000] Internal error: : 1008 [#1]
> [   12.890000] Modules linked in:
> [   12.890000] CPU: 0    Not tainted  (2.6.31-rc4-g6a8aab3-dirty #768)
> [   12.890000] PC is at memcpy+0xc4/0x330
> [   12.890000] LR is at 0xf80103f5
> [   12.890000] pc : [<c01610e4>]    lr : [<f80103f5>]    psr: 60000013
> [   12.890000] sp : c43e9acc  ip : 00000010  fp : 00000000
> [   12.890000] r10: c5880400  r9 : c4058da8  r8 : c41736a0
> [   12.890000] r7 : c41736a0  r6 : 00000012  r5 : 00000000  r4 : 00000000
> [   12.890000] r3 : c5880400  r2 : 00000000  r1 : c5880410  r0 : c41736b0
> [   12.890000] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
> [   12.890000] Control: 10c5387d  Table: 244a4019  DAC: 00000015
> [   12.890000] Process mount (pid: 1039, stack limit = 0xc43e82e8)
> 

I do not understand why you think this is UBIFS.

"external abort on non-linefetch" is a bus error.

"PC is at memcpy" means it was caused by memcpy.

Have you tried running drivers/mtd/tests/mtd_stresstest for a day?
