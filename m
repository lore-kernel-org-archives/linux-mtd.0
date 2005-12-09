Received: from zproxy.gmail.com ([64.233.162.194])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EkXwi-0008BP-6Q
	for linux-mtd@lists.infradead.org; Thu, 08 Dec 2005 21:25:22 -0500
Received: by zproxy.gmail.com with SMTP id i11so784536nzi
	for <linux-mtd@lists.infradead.org>;
	Thu, 08 Dec 2005 18:25:15 -0800 (PST)
Message-ID: <782515bb0512081825w2dde6cebkdf50f6a69f6c62de@mail.gmail.com>
Date: Thu, 8 Dec 2005 20:25:14 -0600
From: nishanth menon <menon.nishanth@gmail.com>
To: "Zhao, Forrest" <forrest.zhao@intel.com>
In-Reply-To: <8126E4F969BA254AB43EA03C59F44E84042155C5@pdsmsx404>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <8126E4F969BA254AB43EA03C59F44E84042155C5@pdsmsx404>
Cc: linux-mtd@lists.infradead.org
Subject: Re: EBH Changes in Jffs2 broke Sibley Nor flash support in CVS
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Forrest,
Yes, this patch did work.
This+ my patch for nodelist allows me to mount umount, copy files,
fill up the fs umount, mount delete, and other normal operations now
:)
Thanks a lot for the help.
Regards,
Nishanth Menon
On 12/8/05, Zhao, Forrest <forrest.zhao@intel.com> wrote:
> Please try the following patch if it fixes the problem
>
> In function jffs2_flash_writev():
> -       if (jffs2_nor_ecc(c)) {
> +       if (jffs2_nor_ecc(c) || jffs2_nor_wbuf_flash(c)) {
>                if (((c->wbuf_ofs % c->sector_size) == 0) && !c->wbuf_len) {
>                        c->wbuf_ofs = PAGE_DIV(to);
>                        c->wbuf_len = PAGE_MOD(to);
>                        memset(c->wbuf,0xff,c->wbuf_pagesize);
>                }
>        }
>
> Thanks,
> Forrest
> -----Original Message-----
> From: nishanth menon [mailto:menon.nishanth@gmail.com]
> Sent: 2005年12月9日 2:10
> To: Zhao, Forrest
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: EBH Changes in Jffs2 broke Sibley Nor flash support in CVS
>
> Hi Forrest,
> > 1 I think the following change is enough:
> > @@ -391,7 +392,7 @@
> >                struct jffs2_raw_ebh ebh = {
> >                        .magic =        cpu_to_je16(JFFS2_MAGIC_BITMASK),
> >                        .nodetype =
> > cpu_to_je16(JFFS2_NODETYPE_ERASEBLOCK_HEADER),
> > -                       .totlen =       cpu_to_je32(sizeof(struct
> > jffs2_raw_ebh)),
> > +                       .totlen =       cpu_to_je32(c->ebh_size),
> >                        .reserved =     0,
> >                        .compat_fset =  JFFS2_EBH_COMPAT_FSET,
> >                        .incompat_fset = JFFS2_EBH_INCOMPAT_FSET, @@ -408,11
> >
> Yes, you are correct, this works fine.
> Issue 2, with this change, copying files crashes.
> The sequence followed is:
> ./flash_eraseall
> mount, touch,umount
> mount, cp files
>
> Regards,
> Nishanth Menon
>
> The following dump shows that the wbuf_ofs is wrong (should have been
> 0x00040400). Need to figure out why.
>
> Function call stack:
> jffs2_flash_writev
> jffs2_write_dnode
> jffs2_write_inode_range
> jffs2_commit_write
> generic_file_buffered_write
> __generic_file_aio_write_nolock
> generic_file_write
>
> Added the following line before the BUG:
>               printk(KERN_CRIT "wbuf was previously
> %08x-%08x[len=0x%08x] to=%08lx, PAD()=0x%08lx\n",
>                                          c->wbuf_ofs,
> c->wbuf_ofs+c->wbuf_len,c->wbuf_len, (unsigned long)to, (unsigned
> long)PAD(c->wbuf_ofs + c->wbuf_len));
>
> O/p: wbuf was previously 00040000-00040000[len=0x00000000]
> to=00040400, PAD()=0x00040000
>
> Dump follows:
> mtd-6-eraseall.raw' -> `/mnt/mtd-6-eraseall.raw'
> <2>jffs2_flash_writev(): Non-contiguous write to 00040400
> jffs2_flash_writev(): Non-contiguous write to 00040400
> <2>wbuf was previously 00040000-00040000[len=0x00000000] to=00040400,
> PAD()=0x00040000
> wbuf was previously 00040000-00040000[len=0x00000000] to=00040400,
> PAD()=0x00040000
> <2>kernel BUG at fs/jffs2/wbuf.c:677!kernel BUG at fs/jffs2/wbuf.c:677!
>
> <1>Unable to handle kernel NULL pointer dereference at virtual address 00000000
> Unable to handle kernel NULL pointer dereference at virtual address 00000000
> <1>pgd = c1b50000
> pgd = c1b50000
> <1>[00000000] *pgd=81afe011[00000000] *pgd=81afe011, *pte=00000000,
> *pte=00000000, *ppte=00000000, *ppte=00000000
>
> Internal error: Oops: 807 [#1]
> Internal error: Oops: 807 [#1]
> Modules linked in:Modules linked in:
>
> CPU: 0
> CPU: 0
> PC is at __bug+0x40/0x54
> PC is at __bug+0x40/0x54
> LR is at schedule+0x4d4/0x55c
> LR is at schedule+0x4d4/0x55c
> pc : [<c00246a0>]    lr : [<c01bd134>]    Not tainted
> sp : c1fadbb4  ip : c1fadb10  fp : c1fadbc4
> pc : [<c00246a0>]    lr : [<c01bd134>]    Not tainted
> sp : c1fadbb4  ip : c1fadb10  fp : c1fadbc4
> r10: c118b7f8  r9 : ffffffff  r8 : c1b40000
> r10: c118b7f8  r9 : ffffffff  r8 : c1b40000
> r7 : c1190b84  r6 : c1b40000  r5 : 00040000  r4 : 00000000
> r7 : c1190b84  r6 : c1b40000  r5 : 00040000  r4 : 00000000
> r3 : 00000000  r2 : 00000000  r1 : 00000000  r0 : 00000001
> r3 : 00000000  r2 : 00000000  r1 : 00000000  r0 : 00000001
> Flags: nZCvFlags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user
>  IRQs on  FIQs on  Mode SVC_32  Segment user
> Control: E5387F  Table: 81B50000  DAC: 00000015
> Control: E5387F  Table: 81B50000  DAC: 00000015
> Process cp (pid: 911, stack limit = 0xc1fac194)
> Process cp (pid: 911, stack limit = 0xc1fac194)
> Stack: (0xc1fadbb4 to 0xc1fae000)
> Stack: (0xc1fadbb4 to 0xc1fae000)
> dba0: dba0:
>                               00040400 000
> 40400 c1fadc40 c1fadc40 c1fadbc8 c1fadbc8
>
> dbc0: dbc0: c00f18c4 c00f18c4 c002466c c002466c 00040400 00040400
> 00040000 00040000 c1e0002c c1e0002c c023a270 c02
> 3a270 c1b40118 c1b40118 00040400 00040400
>
> dbe0: dbe0: 00000000 00000000 00000001 00000001 c1fadccc c1fadccc
> 00000000 00000000 00000000 00000000 00000002 000
> 00002 c1fadc74 c1fadc74 00000000 00000000
>
> dc00: dc00: c2800000 c2800000 c023a270 c023a270 c1fadc38 c1fadc38
> c1fadc18 c1fadc18 c010856c c010856c c010820c c01
> 0820c c1b8a4f4 c1b8a4f4 00040400 00040400
>
> dc20: dc20: 00000000 00000000 c1190b84 c1190b84 c1b40000 c1b40000
> 00000000 00000000 c118b7f8 c118b7f8 c1fadcac c1f
> adcac c1fadc48 c1fadc48 c00e7f74 c00e7f74
>
> dc40: dc40: c00f169c c00f169c 00040400 00040400 00000000 00000000
> c1fadc68 c1fadc68 00000036 00000036 c1fadcac c1f
> adcac 00000002 00000002 00000000 00000000
>
> dc60: dc60: c1288404 c1288404 00000000 00000000 00000000 00000000
> 00000000 00000000 00001000 00001000 c1b8a4f4 c1b
> 8a4f4 00000044 00000044 c1e00000 c1e00000
>
> dc80: dc80: 00000030 00000030 c1fadce0 c1fadce0 c1fadcdc c1fadcdc
> 00000006 00000006 c1b8a4f4 c1b8a4f4 c118b7f8 c11
> 8b7f8 00000000 00000000 c1b40000 c1b40000
>
> dca0: dca0: c1fadd0c c1fadd0c c1fadcb0 c1fadcb0 c00e89c0 c00e89c0
> c00e7d70 c00e7d70 00000030 00000030 00040400 000
> 40400 00000003 00000003 00000000 00000000
>
> dcc0: dcc0: 00000000 00000000 c12e4000 c12e4000 00000030 00000030
> 00001000 00001000 c1e00000 c1e00000 0003fbc4 000
> 3fbc4 00040400 00040400 06f11f0d 06f11f0d
>
> dce0: dce0: 06f11f0d 06f11f0d c1fadd34 c1fadd34 c1b8a518 c1b8a518
> c1b8a51c c1b8a51c 00000000 00000000 c118b7f8 c11
> 8b7f8 c118b824 c118b824 c1b8a4f4 c1b8a4f4
>
> dd00: dd00: c1fadd64 c1fadd64 c1fadd10 c1fadd10 c00e32f4 c00e32f4
> c00e86e4 c00e86e4 0006d000 0006d000 00001000 000
> 01000 c1fadd30 c1fadd30 c026bc80 c026bc80
>
> dd20: dd20: c1b40000 c1b40000 00001000 00001000 00000000 00000000
> c026bc80 c026bc80 00000000 00000000 0000006a 000
> 0006a 0000006a 0000006a c026bc80 c026bc80
>
> dd40: dd40: 00001000 00001000 00000000 00000000 00000000 00000000
> 0006d000 0006d000 00000000 00000000 00001000 000
> 01000 c1fade04 c1fade04 c1fadd68 c1fadd68
>
> dd60: dd60: c005deac c005deac c00e3154 c00e3154 00001000 00001000
> 0000006d 0000006d beffe528 beffe528 c118b824 c11
> 8b824 c01fa9f4 c01fa9f4 c118b8bc c118b8bc
>
> dd80: dd80: c1939200 c1939200 00000001 00000001 c1fade74 c1fade74
> 00000000 00000000 c1fadf14 c1fadf14 00000000 000
> 00000 ff18b868 ff18b868 00000001 00000001
>
> dda0: dda0: 00000000 00000000 c026bc80 c026bc80 c00a180c c00a180c
> c00ef408 c00ef408 0000000f 0000000f 00000000 000
> 00000 c118b824 c118b824 00000001 00000001
>
> ddc0: ddc0: c118b870 c118b870 c118b868 c118b868 0000006a 0000006a
> c1fade08 c1fade08 c1fadddc c1fadddc c0098624 c00
> 98624 c00a17e0 c00a17e0 0006d000 0006d000
>
> dde0: dde0: 00000000 00000000 00000000 00000000 c1fade40 c1fade40
> c118b824 c118b824 c1fade3c c1fade3c c1939200 c19
> 39200 c1fade70 c1fade70 c1fade0c c1fade0c
>
> de00: de00: c005e7b4 c005e7b4 c005db3c c005db3c 0006d000 0006d000
> 00000000 00000000 c1fadf78 c1fadf78 00001000 000
> 01000 00000000 00000000 00000000 00000000
>
> de20: de20: 00000000 00000000 c118b824 c118b824 00001000 00001000
> c1fadf78 c1fadf78 c1fadf14 c1fadf14 c1fade74 c1f
> ade74 00000001 00000001 00001000 00001000
>
> de40: de40: 0006d000 0006d000 00000000 00000000 00000000 00000000
> c1faded4 c1faded4 c1fade74 c1fade74 00000000 000
> 00000 00000000 00000000 beffe528 beffe528
>
> de60: de60: c1fadf78 c1fadf78 c1fadf0c c1fadf0c c1fade74 c1fade74
> c005e864 c005e864 c005e318 c005e318 c1fadf00 c1f
> adf00 c1fadea0 c1fadea0 00000000 00000000
>
> de80: de80: 00000001 00000001 ffffffff ffffffff c1939200 c1939200
> c001ac48 c001ac48 00000000 00000000 00000000 000
> 00000 00000000 00000000 00000000 00000000
>
> dea0: dea0: c01602ac c01602ac c1ce2a80 c1ce2a80 00000000 00000000
> 00000000 00000000 ffffffff ffffffff c19392a0 c19
> 392a0 c001ac48 c001ac48 00000000 00000000
>
> dec0: dec0: c00209e0 c00209e0 00000000 00000000 00000000 00000000
> c1ce2a80 c1ce2a80 c0056318 c0056318 c1faded4 c1f
> aded4 c1faded4 c1faded4 0006e000 0006e000
>
> dee0: dee0: 00000000 00000000 00000000 00000000 c1fadf78 c1fadf78
> c118b88c c118b88c c118b8bc c118b8bc 0006d000 000
> 6d000 c118b824 c118b824 c1939200 c1939200
>
> df00: df00: c1fadf40 c1fadf40 c1fadf10 c1fadf10 c005e9b8 c005e9b8
> c005e7ec c005e7ec c1939200 c1939200 beffe528 bef
> fe528 00001000 00001000 00000000 00000000
>
> df20: df20: c1939200 c1939200 0006d000 0006d000 00000000 00000000
> 00001000 00001000 c1fadf78 c1fadf78 c1fadf74 c1f
> adf74 c1fadf44 c1fadf44 c007c940 c007c940
>
> df40: df40: c005e96c c005e96c c0087320 c0087320 c00870c0 c00870c0
> c1939224 c1939224 c1939200 c1939200 c1fadf78 c1f
> adf78 0006d000 0006d000 00000000 00000000
>
> df60: df60: c1fac000 c1fac000 00000004 00000004 c1fadfa4 c1fadfa4
> c1fadf78 c1fadf78 c007ca3c c007ca3c c007c868 c00
> 7c868 0006d000 0006d000 00000000 00000000
>
> df80: df80: 00000000 00000000 00001000 00001000 00001000 00001000
> beffe528 beffe528 00000004 00000004 c001fac4 c00
> 1fac4 00000000 00000000 c1fadfa8 c1fadfa8
>
> dfa0: dfa0: c001f940 c001f940 c007c9fc c007c9fc 00001000 00001000
> c002651c c002651c 00000004 00000004 beffe528 bef
> fe528 00001000 00001000 00000000 00000000
>
> dfc0: dfc0: 00001000 00001000 00001000 00001000 beffe528 beffe528
> 00000000 00000000 00000004 00000004 00000000 000
> 00000 00000004 00000004 befff5cc befff5cc
>
> dfe0: dfe0: 00000000 00000000 beffe508 beffe508 00003b5c 00003b5c
> 400ec420 400ec420 60000010 60000010 00000004 000
> 00004 00000000 00000000 00000000 00000000
>
> Backtrace: Backtrace:
>
> [<c0024660>] [<c0024660>] (__bug+0x0/0x54) (__bug+0x0/0x54) from
> [<c00f18c4>] from [<c00f18c4>] (jffs2_flash_write
> v+0x238/0x730)
> (jffs2_flash_writev+0x238/0x730)
>  r4 = 00040400  r4 = 00040400
>
> [<c00f1690>] [<c00f1690>] (jffs2_flash_writev+0x4/0x730)
> (jffs2_flash_writev+0x4/0x730) from [<c00e7f74>] from [<c
> 00e7f74>] (jffs2_write_dnode+0x210/0x4d8)
> (jffs2_write_dnode+0x210/0x4d8)
> [<c00e7d64>] [<c00e7d64>] (jffs2_write_dnode+0x0/0x4d8)
> (jffs2_write_dnode+0x0/0x4d8) from [<c00e89c0>] from [<c00
> e89c0>] (jffs2_write_inode_range+0x2e8/0x46c)
> (jffs2_write_inode_range+0x2e8/0x46c)
> [<c00e86d8>] [<c00e86d8>] (jffs2_write_inode_range+0x0/0x46c)
> (jffs2_write_inode_range+0x0/0x46c) from [<c00e32f4>
> ] from [<c00e32f4>] (jffs2_commit_write+0x1ac/0x318)
> (jffs2_commit_write+0x1ac/0x318)
> [<c00e3148>] [<c00e3148>] (jffs2_commit_write+0x0/0x318)
> (jffs2_commit_write+0x0/0x318) from [<c005deac>] from [<c
> 005deac>] (generic_file_buffered_write+0x380/0x5dc)
> (generic_file_buffered_write+0x380/0x5dc)
> [<c005db30>] [<c005db30>] (generic_file_buffered_write+0x4/0x5dc)
> (generic_file_buffered_write+0x4/0x5dc) from [<c
> 005e7b4>] from [<c005e7b4>] (__generic_file_aio_write_nolock+0x4a8/0x4d4)
> (__generic_file_aio_write_nolock+0x4a8/0x4d4)
> [<c005e30c>] [<c005e30c>] (__generic_file_aio_write_nolock+0x0/0x4d4)
> (__generic_file_aio_write_nolock+0x0/0x4d4)
> from [<c005e864>] from [<c005e864>] (__generic_file_write_nolock+0x84/0xb0)
> (__generic_file_write_nolock+0x84/0xb0)
> [<c005e7e0>] [<c005e7e0>] (__generic_file_write_nolock+0x0/0xb0)
> (__generic_file_write_nolock+0x0/0xb0) from [<c00
> 5e9b8>] from [<c005e9b8>] (generic_file_write+0x58/0xe4)
> (generic_file_write+0x58/0xe4)
>  r8 = C1939200  r8 = C1939200  r7 = C118B824  r7 = C118B824  r6 =
> 0006D000  r6 = 0006D000  r5 = C118B8BC
>  r5 = C118B8BC
>  r4 = C118B88C  r4 = C118B88C
>
> [<c005e960>] [<c005e960>] (generic_file_write+0x0/0xe4)
> (generic_file_write+0x0/0xe4) from [<c007c940>] from [<c00
> 7c940>] (vfs_write+0xe4/0x120)
> (vfs_write+0xe4/0x120)
> [<c007c85c>] [<c007c85c>] (vfs_write+0x0/0x120) (vfs_write+0x0/0x120)
> from [<c007ca3c>] from [<c007ca3c>] (sys_wri
> te+0x4c/0x74)
> (sys_write+0x4c/0x74)
> [<c007c9f0>] [<c007c9f0>] (sys_write+0x0/0x74) (sys_write+0x0/0x74)
> from [<c001f940>] from [<c001f940>] (ret_fast_
> syscall+0x0/0x2c)
> (ret_fast_syscall+0x0/0x2c)
>  r8 = C001FAC4  r8 = C001FAC4  r7 = 00000004  r7 = 00000004  r6 =
> BEFFE528  r6 = BEFFE528  r5 = 00001000
>  r5 = 00001000
>  r4 = 00001000  r4 = 00001000
>
> Code: Code: 1b007384 1b007384 e59f0014 e59f0014 eb007382 eb007382
> e3a03000 e3a03000 (e5833000) (e5833000)
>
>  Segmentation fault
>
