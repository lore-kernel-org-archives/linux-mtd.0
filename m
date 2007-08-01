Received: from nz-out-0506.google.com ([64.233.162.225])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IGJ8f-0000IO-TD
	for linux-mtd@lists.infradead.org; Wed, 01 Aug 2007 14:41:45 -0400
Received: by nz-out-0506.google.com with SMTP id z3so127618nzf
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Aug 2007 11:41:40 -0700 (PDT)
Message-ID: <8c7950360708011141w3a716a8aua185e9f1931f17e3@mail.gmail.com>
Date: Wed, 1 Aug 2007 14:41:40 -0400
From: shanevolpe@gmail.com
To: linux-mtd@lists.infradead.org
Subject: Re: jffs2 kernel dump with 2.6.22-rc7
In-Reply-To: <8c7950360707091227v14daf14cs48fb1377e903be6c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <8c7950360707091227v14daf14cs48fb1377e903be6c@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I changed the debug level for JFFS2 in the kernel from 0 to 1
(CONFIG_JFFS2_FS_DEBUG=1) and now the kernel seems stable.  I also
verified that it is stable with a debug level of 2.

The actions leading up to the core dump do not cause any debug
information to be displayed so I do not believe it is the actual debug
code but maybe some race condition.

I verified the above statement by setting the debug level to 0 then
copying a large file (which causes the kernel to core dump and then
setting the debug level to 2 and repeating the same copy.  The second
copy with the debug level set to 2 did not cause the core dump and
there were NO JFFS2 debug messages displayed.  I repeated the above
events several times and in different orders, the results were the
same.
Regards,
Shane

On 7/9/07, shanevolpe@gmail.com <shanevolpe@gmail.com> wrote:
> I'm working on an embedded system which uses the PXA270 (xscale) processor with NOR flash0.  I just updated the kernel to 2.6.22-rc7 from 2.6.20.14 (however the jffs2 was first created with  2.6.19) and now two things are happening.
> 1.)  I 'm getting the following message during system boot:
>             jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00c4531c: 0x0044 instead
>             Further such events for this erase block will not be printed
>             Old JFFS2 bitmask found at 0x00c45720
>             you cannot use older JFFS2 file systems with newer kernels
> 2.) I'm getting a core dump when writing to the file system, I have appended the core dump to the end of this message.
>      Also it seems as if the reported blocks in issue 1, increases every time the core dump of issue 2 happens.
>
> This problem is very repeatable and I have recreated it on two systems now.
> Regards,
> Shane
>
> **********************CORE DUMP****************************
>
>
>
>
> <4>argh. node added in wrong place
>
> <4>argh. node added in wrong place
>
> <1>Unable to handle kernel NULL pointer dereference at virtual address  00000000
>
> <1>pgd = c32e8000
>
> <1> [00000000] *pgd=a3214031, *pte=00000000, *ppte=00000000
>
> < 4>Internal error: Oops: 817 [#1] PREEMPT
>
> <4 >Modules linked in: ucb1400_ts
>
> <4>CPU: 0    Not tainted  (2.6 .22-rc7 #16)
>
> <4>PC is at jffs2_link_node_ref+0x20/0x1d0
>
>  <4>LR is at jffs2_add_physical_node_ref+0xb4/0x178
>
> <4>pc : [<c01073d4> ]    lr : [<c01094e4>]    psr: 60000013
>
> <4>sp : c32c7b98  ip :  00000000  fp : c32c7bcc
>
> <4>r10: c06123c8  r9 : c2bf8478  r8 : c06123c8
>
> < 4>r7 : 00b7d082  r6 : c0630c00  r5 : c0596924  r4 : c0596924
>
> <4>r3 : 000009e0  r2 : 00b7d082  r1 : c0596924  r0 : c0630c00
>
> <4>Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user
>
> <4>Control: 0000397f  Table: a32e8000  DAC:  00000015
>
> <4>Process ipkg (pid: 13880, stack limit = 0xc32c6268 )
>
> <4>Stack: (0xc32c7b98 to 0xc32c8000)
>
> < 4>7b80:                                                       c32c7c34 c246d995
>
> <4>7ba0: c03f0bf8 00000002 c32c7c20 c32c6000 c0596924 c0630c00 00b7d082 000009e0
>
> <4>7bc0: c32c7bfc c32c7bd0 c01094e4 c01073c0 c06123c8 c246d000 00000000 c249e528
>
>  <4>7be0: 00b7d080 00000000 00b7d080 c0630c00 c32c7c64 c32c7c00 c010c334 c010943c
>
> <4>7c00: 00b7d080  00000000 c32c7c34 00000b18 000009dd c322d898 00000000 00000002
>
> <4>7c20: c249e528  00000044 c246d000 00000999 c24f1000 000009dd c0107b68 00000000
>
> <4>7c40:  00000010 00000000 00000000 00000000 c249e528 c2bf8478 c32c7cd4 c32c7c68
>
> < 4>7c60: c010cab8 c010bf98 00000999 00000003 00000000 00000099 00000000  00000000
>
> <4>7c80: 00000070 00000006 c24f1000 c0630c00 00000000  00000000 00000999 00001000
>
> <4>7ca0: 00002fc0 c246d000 00007000  00000000 c249e550 c249e528 c2bf84a8 c044be20
>
> <4>7cc0: 00000000 00000000 c32c7d24 c32c7cd8 c0106b70 c010c7c8  00007000 00001000
>
> <4>7ce0: c32c7cf4 00000007 00001000  c0630c00 00000000 00000000 c32c7d24 c02d1c20
>
> <4>7d00: 00001000 c044be20  00001000 c03ef678 00000000 c32c6000 c32c7dcc c32c7d28
>
> <4>7d20: c00635d4 c01069e8  00000001 c32c7ea0 00000001 00001000 c37bf660 c2bf8540
>
> <4>7d40: c02d1c20 c2bf84a8  00000000 be8626f0 c32c7f30 00000000 c004844c 00000001
>
> <4>7d60: 00000000  c044be20 c04d6820 c32c7da8 00000000 00007000 c32c7da4 c32c7d88
>
> <4>7d80: c003f220 c003ea00  00000799 1f9e8785 c2be801c c2bf84a8 c32c7dcc e52c7da8
>
> <4>7da0: c009b0a0 ffffffff c2bf84a8 00007000  00000000 00000000 00000000 00001000
>
> <4>7dc0: c32c7e54 c32c7dd0 c0063cec c0063154  00007000 00000000 c32c7ef0 00001000
>
> <4>7de0: 00000000  c32c7df0 c003f220 c32c7ef0 c32c7f30 c32c7ea0 c30a7848 c3483478
>
> <4>7e00: c37bf660 c2bf8540 00000000 00000001  00000799 1f05f105 00000799 1f05f105
>
> <4>7e20: 00000400  00001000 c32c7e94 c2bf8514 c32c7ea0 c2bf84a8 c32c7f30 00007000
>
> <4>7e40: 00000000  00000001 c32c7e94 c32c7e58 c0063dd0 c0063820 00000001 c32c6000
>
> <4>7e60: c37bf660 c2bf8540 00000000  c32c7ea0 c37bf660 c32c7f78 00000000 c00230a8
>
> <4>7e80: c32c6000 00000000 c32c7f54 c32c7e98 c0084970 c0063d68  00007000 00000000
>
> <4>7ea0: c32c7ebc c32c7eb0 00000000  00000001 ffffffff c37bf660 00000000 00000000
>
> <4>7ec0: 00000000  00000000 c04d6820 00000817 00000000 00000000 c037dffc c04d6820
>
> <4>7ee0: c0050070 c32c7ee4 c32c7ee4 4014e000  00007000 00000000 c0022264 c0029d3c
>
> <4>7f00: c0075124 c0072c88 00100073  00001000 00000000 0004001f 00000000 ffffffff
>
> <4>7f20: 000000c5 c00230a8  00000001 00000001 be8626f0 00001000 c37bf660 c37bf660
>
> <4>7f40: be8626f0 c32c7f78 c32c7f74 c32c7f58 c00851b4 c00848cc c00539c8 c37bf660
>
> <4>7f60: fffffff7 00007000 c32c7fa4 c32c7f78 c00856c8 c008510c 00007000 00000000
>
> <4>7f80: 00000000 00000000 00042040 00001000  be8626f0 00000004 00000000 c32c7fa8
>
> <4>7fa0: c0022f00 c0085690 00042040  00001000 00000006 be8626f0 00001000 00000000
>
> <4>7fc0:  00042040 00001000 be8626f0 00000004 00001000 00000000 4014e000 00042040
>
> <4>7fe0: 00000004 be861668 400a49f4 400e801c 60000010 00000006  00000000 00000000
>
> <4>Backtrace:
>
> <4> [<c01073b4>] (jffs2_link_node_ref+0x0/0x1d0) from [<c01094e4>]  (jffs2_add_physical_node_ref+0xb4/0x178)
>
> <4> r8:000009e0 r7:00b7d082 r6:c0630c00 r5:c0596924 r4:c32c6000
>
> <4>[<c0109430>] (jffs2_add_physical_node_ref+0x0/0x178)  from [<c010c334>] (jffs2_write_dnode+0x3a8/0x450)
>
> < 4>[<c010bf8c>] (jffs2_write_dnode+0x0/0x450) from [<c010cab8> ] (jffs2_write_inode_range+0x2fc/0x484)
>
> <4>[<c010c7bc> ] (jffs2_write_inode_range+0x0/0x484) from [<c0106b70>] (jffs2_commit_write+0x194/0x2dc )
>
> <4>[<c01069dc>] (jffs2_commit_write+0x0/0x2dc ) from [<c00635d4>] (generic_file_buffered_write+0x48c/0x6cc)
>
>  <4>[<c0063148>] (generic_file_buffered_write+0x0/0x6cc) from [ <c0063cec>] (__generic_file_aio_write_nolock+0x4d8/0x548)
>
> <4> [<c0063814>] (__generic_file_aio_write_nolock+0x0/0x548) from [<c0063dd0>]  (generic_file_aio_write+0x74/0xe8)
>
> <4>[<c0063d5c>]  (generic_file_aio_write+0x0/0xe8) from [<c0084970>] (do_sync_write+0xb0/0x100)
>
> <4>[<c00848c0>] (do_sync_write+0x0/0x100) from  [<c00851b4>] (vfs_write+0xb4/0xdc)
>
> <4> r6:c32c7f78 r5:be8626f0 r4:c37bf660
>
> <4>[<c0085100>] (vfs_write+0x0/0xdc) from  [<c00856c8>] (sys_write+0x44/0x70)
>
> <4> r6: 00007000 r5:fffffff7 r4:c37bf660
>
> <4>[<c0085684>]  (sys_write+0x0/0x70) from [<c0022f00>] (ret_fast_syscall+0x0/0x2c)
>
> <4> r7:00000004 r6:be8626f0 r5:00001000 r4:00042040
>
> < 4>Code: e591c024 e1a04001 e59b8004 e35c0000 (058cc000)
>
> <6>note: ipkg [13880] exited with preempt_count 1
>
> <3>BUG: scheduling while atomic: ipkg/0x40000001/ 13880
>
> <3>BUG: scheduling while atomic: ipkg/0x40000001/13880
>



-- 
Registered Linux User: #293401
