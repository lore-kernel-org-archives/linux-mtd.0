Received: from mail-vw0-f202.google.com ([209.85.212.202])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MYzLN-0003E9-QH
	for linux-mtd@lists.infradead.org; Thu, 06 Aug 2009 09:33:10 +0000
Received: by vws40 with SMTP id 40so702154vws.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 06 Aug 2009 02:33:04 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <4A77F421.4020604@nokia.com>
References: <9c9fda240908032328qcd68805haa94fb5f6b209d6f@mail.gmail.com>
	<4A77F421.4020604@nokia.com>
Date: Thu, 6 Aug 2009 18:33:03 +0900
Message-ID: <9c9fda240908060233y5fd17cc0o73462e500496a3f8@mail.gmail.com>
Subject: Re: 4KiB pagesize and UBIFS
From: Kyungmin Park <kmpark@infradead.org>
To: Adrian Hunter <adrian.hunter@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
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

On Tue, Aug 4, 2009 at 5:41 PM, Adrian Hunter<adrian.hunter@nokia.com> wrot=
e:
> ext Kyungmin Park wrote:
>>
>> Hi,
>>
>> I create the empty ubifs as datafs and then try to mount it
>> Of course I turn on all debug message at ubifs.
>>
>> As below it try to read unaligned read (not seen at here, driver
>> handle it) and linefetch error finally.
>>
>> I guest 4KiB pagesize don't support on ubifs.
>>
>> How can I handle it?
>>
>> Thank you,
>> Kyungmin Park
>>
>> # mount -t ubifs ubi0!datafs /mnt
>> [ =A0 12.400000] UBIFS DBG (pid 1039): ubifs_get_sb: name ubi0!datafs, f=
lags
>> 0x800
>> 0
>> [ =A0 12.410000] UBIFS DBG (pid 1039): ubifs_get_sb: opened ubi0_20
>> [ =A0 12.410000] UBIFS DBG (pid 1039): ubifs_read_node: LEB 0:0, superbl=
ock
>> node,
>> length 4096
>> [ =A0 12.420000] UBIFS DBG (pid 1039): ubifs_start_scan: scan LEB 1:0
>> [ =A0 12.430000] UBIFS DBG (pid 1040): ubifs_bg_thread: background threa=
d
>> "ubifs_b
>> gt0_20" started, PID 1040
>> [ =A0 12.470000] UBIFS DBG (pid 1039): ubifs_scan: look at LEB 1:0 (2539=
52
>> bytes l
>> eft)
>> [ =A0 12.470000] UBIFS DBG (pid 1039): ubifs_scan_a_node: scanning maste=
r
>> node
>> [ =A0 12.480000] UBIFS DBG (pid 1039): ubifs_scan: look at LEB 1:512 (25=
3440
>> bytes
>> =A0left)
>> [ =A0 12.490000] UBIFS DBG (pid 1039): ubifs_scan_a_node: scanning paddi=
ng
>> node
>> [ =A0 12.490000] UBIFS DBG (pid 1039): ubifs_scan_a_node: 3556 bytes pad=
ded,
>> offse
>> t now 4096
>> [ =A0 12.500000] UBIFS DBG (pid 1039): ubifs_scan: look at LEB 1:4096
>> (249856 byte
>> s left)
>> [ =A0 12.510000] UBIFS DBG (pid 1039): ubifs_scan_a_node: scanning maste=
r
>> node
>> [ =A0 12.520000] UBIFS DBG (pid 1039): ubifs_scan: look at LEB 1:4608
>> (249344 byte
>> s left)
>> [ =A0 12.520000] UBIFS DBG (pid 1039): ubifs_scan_a_node: scanning paddi=
ng
>> node
>> [ =A0 12.530000] UBIFS DBG (pid 1039): ubifs_scan_a_node: 3556 bytes pad=
ded,
>> offse
>> t now 8192
>> [ =A0 12.540000] UBIFS DBG (pid 1039): ubifs_scan: look at LEB 1:8192
>> (245760 byte
>> s left)
>> [ =A0 12.550000] UBIFS DBG (pid 1039): ubifs_scan_a_node: hit empty spac=
e
>> [ =A0 12.550000] UBIFS DBG (pid 1039): ubifs_end_scan: stop scanning LEB=
 1
>> at offs
>> et 8192
>> [ =A0 12.560000] UBIFS DBG (pid 1039): ubifs_start_scan: scan LEB 2:0
>> [ =A0 12.600000] UBIFS DBG (pid 1039): ubifs_scan: look at LEB 2:0 (2539=
52
>> bytes l
>> eft)
>> [ =A0 12.600000] UBIFS DBG (pid 1039): ubifs_scan_a_node: scanning maste=
r
>> node
>> [ =A0 12.610000] UBIFS DBG (pid 1039): ubifs_scan: look at LEB 2:512 (25=
3440
>> bytes
>> =A0left)
>> [ =A0 12.620000] UBIFS DBG (pid 1039): ubifs_scan_a_node: scanning paddi=
ng
>> node
>> [ =A0 12.620000] UBIFS DBG (pid 1039): ubifs_scan_a_node: 3556 bytes pad=
ded,
>> offse
>> t now 4096
>> [ =A0 12.630000] UBIFS DBG (pid 1039): ubifs_scan: look at LEB 2:4096
>> (249856 byte
>> s left)
>> [ =A0 12.640000] UBIFS DBG (pid 1039): ubifs_scan_a_node: scanning maste=
r
>> node
>> [ =A0 12.650000] UBIFS DBG (pid 1039): ubifs_scan: look at LEB 2:4608
>> (249344 byte
>> s left)
>> [ =A0 12.650000] UBIFS DBG (pid 1039): ubifs_scan_a_node: scanning paddi=
ng
>> node
>> [ =A0 12.660000] UBIFS DBG (pid 1039): ubifs_scan_a_node: 3556 bytes pad=
ded,
>> offse
>> t now 8192
>> [ =A0 12.670000] UBIFS DBG (pid 1039): ubifs_scan: look at LEB 2:8192
>> (245760 byte
>> s left)
>> [ =A0 12.680000] UBIFS DBG (pid 1039): ubifs_scan_a_node: hit empty spac=
e
>> [ =A0 12.680000] UBIFS DBG (pid 1039): ubifs_end_scan: stop scanning LEB=
 2
>> at offs
>> et 8192
>> [ =A0 12.690000] UBIFS DBG (pid 1039): ubifs_read_node: LEB 12:0, indexi=
ng
>> node, l
>> ength 48
>> [ =A0 12.700000] UBIFS: recovery needed
>> [ =A0 12.700000] UBIFS DBG (pid 1039): ubifs_recover_inl_heads: checking
>> index hea
>> d at 12:4096
>> [ =A0 12.710000] UBIFS DBG (pid 1039): ubifs_recover_inl_heads: checking=
 LPT
>> head
>> at 7:4096
>> [ =A0 12.720000] UBIFS DBG (pid 1039): lpt_init_rd: space_bits 15
>> [ =A0 12.730000] UBIFS DBG (pid 1039): lpt_init_rd: lpt_lnum_bits 2
>> [ =A0 12.730000] UBIFS DBG (pid 1039): lpt_init_rd: lpt_offs_bits 18
>> [ =A0 12.740000] UBIFS DBG (pid 1039): lpt_init_rd: lpt_spc_bits 18
>> [ =A0 12.750000] UBIFS DBG (pid 1039): lpt_init_rd: pcnt_bits 10
>> [ =A0 12.750000] UBIFS DBG (pid 1039): lpt_init_rd: lnum_bits 12
>> [ =A0 12.760000] UBIFS DBG (pid 1039): lpt_init_rd: pnode_sz 18
>> [ =A0 12.760000] UBIFS DBG (pid 1039): lpt_init_rd: nnode_sz 13
>> [ =A0 12.770000] UBIFS DBG (pid 1039): lpt_init_rd: ltab_sz 12
>> [ =A0 12.770000] UBIFS DBG (pid 1039): lpt_init_rd: lsave_sz 387
>> [ =A0 12.780000] UBIFS DBG (pid 1039): lpt_init_rd: lsave_cnt 256
>> [ =A0 12.790000] UBIFS DBG (pid 1039): lpt_init_rd: lpt_hght 5
>> [ =A0 12.790000] UBIFS DBG (pid 1039): lpt_init_rd: big_lpt 0
>> [ =A0 12.800000] UBIFS DBG (pid 1039): lpt_init_rd: LPT root is at 7:70
>> [ =A0 12.800000] UBIFS DBG (pid 1039): lpt_init_rd: LPT head is at 7:409=
6
>> [ =A0 12.810000] UBIFS DBG (pid 1039): lpt_init_rd: LPT ltab is at 7:83
>> [ =A0 12.810000] UBIFS DBG (pid 1039): ubifs_read_node: LEB 12:0, indexi=
ng
>> node, l
>> ength 48
>> [ =A0 12.820000] UBIFS DBG (pid 1039): read_znode: LEB 12:0, level 0, 1
>> branch
>> [ =A0 12.830000] UBIFS DBG (pid 1039): ubifs_add_lpt_dirt: LEB 7 add 13 =
to
>> 4001
>> [ =A0 12.840000] UBIFS DBG (pid 1039): ubifs_add_lpt_dirt: LEB 7 add 12 =
to
>> 4014
>> [ =A0 12.850000] UBIFS DBG (pid 1039): ubifs_add_lpt_dirt: LEB 7 add 13 =
to
>> 4026
>> [ =A0 12.860000] UBIFS DBG (pid 1039): ubifs_add_lpt_dirt: LEB 7 add 13 =
to
>> 4039
>> [ =A0 12.870000] UBIFS DBG (pid 1039): ubifs_add_lpt_dirt: LEB 7 add 13 =
to
>> 4052
>> [ =A0 12.870000] UBIFS DBG (pid 1039): ubifs_add_lpt_dirt: LEB 7 add 13 =
to
>> 4065
>> [ =A0 12.880000] Unhandled fault: external abort on non-linefetch (0x100=
8)
>> at 0xc5
>> 880410
>> [ =A0 12.890000] Internal error: : 1008 [#1]
>> [ =A0 12.890000] Modules linked in:
>> [ =A0 12.890000] CPU: 0 =A0 =A0Not tainted =A0(2.6.31-rc4-g6a8aab3-dirty=
 #768)
>> [ =A0 12.890000] PC is at memcpy+0xc4/0x330
>> [ =A0 12.890000] LR is at 0xf80103f5
>> [ =A0 12.890000] pc : [<c01610e4>] =A0 =A0lr : [<f80103f5>] =A0 =A0psr: =
60000013
>> [ =A0 12.890000] sp : c43e9acc =A0ip : 00000010 =A0fp : 00000000
>> [ =A0 12.890000] r10: c5880400 =A0r9 : c4058da8 =A0r8 : c41736a0
>> [ =A0 12.890000] r7 : c41736a0 =A0r6 : 00000012 =A0r5 : 00000000 =A0r4 :=
 00000000
>> [ =A0 12.890000] r3 : c5880400 =A0r2 : 00000000 =A0r1 : c5880410 =A0r0 :=
 c41736b0
>> [ =A0 12.890000] Flags: nZCv =A0IRQs on =A0FIQs on =A0Mode SVC_32 =A0ISA=
 ARM
>> =A0Segment user
>> [ =A0 12.890000] Control: 10c5387d =A0Table: 244a4019 =A0DAC: 00000015
>> [ =A0 12.890000] Process mount (pid: 1039, stack limit =3D 0xc43e82e8)
>>
>
> I do not understand why you think this is UBIFS.

Right, UBIFS is working, I check it.
>
> "external abort on non-linefetch" is a bus error.

Right, s5pc110 has some strange. it occurs bus error even though it's
right access. umm why?

>
> "PC is at memcpy" means it was caused by memcpy.
>
> Have you tried running drivers/mtd/tests/mtd_stresstest for a day?

Passed. I confirmed it's working.

Thank you,
Kyungmin Park
