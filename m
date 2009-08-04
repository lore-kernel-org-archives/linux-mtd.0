Received: from mail-yx0-f174.google.com ([209.85.210.174])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MYPIB-0007v0-AI
	for linux-mtd@lists.infradead.org; Tue, 04 Aug 2009 19:03:27 +0000
Received: by yxe4 with SMTP id 4so5977704yxe.28
	for <linux-mtd@lists.infradead.org>;
	Tue, 04 Aug 2009 12:03:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3972542e0908040621y551af6edna10c8e8d089ff544@mail.gmail.com>
References: <3972542e0907301124n104c9eafnc99e989d1a9f8d51@mail.gmail.com>
	<200907302036.24243.marek.vasut@gmail.com>
	<3972542e0907301314p4a8c9539uc7b5fdd80abec443@mail.gmail.com>
	<20090730202637.GH16220@n2100.arm.linux.org.uk>
	<3972542e0907301408r7ae0c06bkf4417724dcec9459@mail.gmail.com>
	<20090730212155.GI16220@n2100.arm.linux.org.uk>
	<3972542e0907301429n45c4597ar36907386bf00637e@mail.gmail.com>
	<4A7705A9.3040402@users.sourceforge.net>
	<3972542e0908040621y551af6edna10c8e8d089ff544@mail.gmail.com>
Date: Tue, 4 Aug 2009 14:03:20 -0500
Message-ID: <3972542e0908041203x43f07103v6739f4adf6909eac@mail.gmail.com>
Subject: Re: Internal error: Oops: 817 [#1]
From: E Robertson <e.robertson.svg@gmail.com>
To: =?ISO-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Marek Vasut <marek.vasut@gmail.com>,
	Russell King - ARM Linux <linux@arm.linux.org.uk>,
	linux-arm-kernel@lists.arm.linux.org.uk, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 4, 2009 at 8:21 AM, E Robertson<e.robertson.svg@gmail.com> wrot=
e:
> On Mon, Aug 3, 2009 at 10:43 AM, Anders
> Grafstr=F6m<grfstrm@users.sourceforge.net> wrote:
>> E Robertson wrote:
>>> On Thu, Jul 30, 2009 at 4:21 PM, Russell King - ARM
>>> Linux<linux@arm.linux.org.uk> wrote:
>>>> It's worth pointing out that media errors should not cause a kernel
>>>> oops or BUG() - especially in the case of a synchronous write.
>>>>
>>>> So one way to look at this is you have the perfect setup at the moment
>>>> for jffs2 developers to fix this problem in addition to locating what
>>>> ever is causing the CRC errors.
>>>>
>>>
>>> agree. I'll test on this with 2.6.28.4/ .31-rc4.
>>
>> Could you try this patch?
>>
>> http://lists.infradead.org/pipermail/linux-mtd/2009-August/026754.html
>>
>>
>
> I have tried this patch before. I think I found a post in april for
> it. With it, on occasions it worked but other times
> it did not. I will retry it a few more times to refresh myself to be
> sure it was not an unrelated issue.
>

Here are the results with the above patch.

About to refile bad block at 09fa0000
Unable to handle kernel paging request at virtual address 00200200
pgd =3D c0004000
[00200200] *pgd=3D00000000
Internal error: Oops: 805 [#1]
CPU: 0    Not tainted  (2.6.28.4 #460)
PC is at jffs2_block_refile+0x40/0x18c
LR is at release_console_sem+0x1b0/0x1ec
pc : [<c012f988>]    lr : [<c00917ac>]    psr: 80000013
sp : c1c49c74  ip : c1c49bac  fp : c1c49c90
r10: 09fa0800  r9 : 09f80874  r8 : 00000001
r7 : 00000000  r6 : c1d74200  r5 : c1d50364  r4 : 00000000
r3 : 00100100  r2 : 00100100  r1 : 00200200  r0 : 00000029
Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
Control: 0005317f  Table: 21cb8000  DAC: 00000017
Process pdflush (pid: 113, stack limit =3D 0xc1c48260)
Stack: (0xc1c49c74 to 0xc1c4a000)
9c60:                                              c01b7090 09fa0800 c1d503=
64
9c80: c1d74200 c1c49cf8 c1c49c94 c012fcc8 c012f958 c1c49ccc c1c89800 0ffa00=
00
9ca0: fffffffb c1c49cc8 c1c49cb4 00020000 09f80000 c1d74200 c1d50364 000000=
00
9cc0: 09f80874 09fa0800 c1c49ce8 00000800 00020000 09f80000 c1d74200 09f808=
74
9ce0: 00000000 09f80874 09fa0800 c1c49d44 c1c49cfc c0130ae4 c012fae4 c1c49d=
30
9d00: c1c49d0c 00000001 c1c49d58 c1d7431c 00000074 c1c49d30 c1c49d24 09f808=
74
9d20: 00000000 c1c49d94 c1d74200 c1cb6000 00000874 c1027dec c1c49d78 c1c49d=
4c
9d40: c0130e60 c01309f8 09f80874 00000000 c1c49d94 00000000 c1cb6000 000008=
74
9d60: 00000000 09f80874 00000001 c1c49dc0 c1c49d7c c0128914 c0130e18 c1c49d=
94
9d80: c1cb6000 c10103e0 00000000 00000000 0001f78c 00000874 c1cb03c8 c1027d=
ec
9da0: c1f32428 00000001 00000000 c181004c c181005c c1c49ea4 c1c49dc4 c0128f=
d0
9dc0: c012869c c1c49dd0 c00e5154 c00e4e14 c1d74000 00000002 c1027dec c1d742=
00
9de0: c1d50364 c1d74200 00000000 c1c49e6c 00000000 c012c118 c00e512c c1c49e=
80
9e00: c1c49e0c c0091d80 c009160c 00000007 60000013 0000005d 00021e8f 000010=
00
9e20: c1c49e58 c1c49e30 c00917ac c00913a8 c02bd818 00000000 c02bd83f c1c49e=
ec
9e40: 36b4a597 89705f41 00000000 00000002 00000000 c1027dec c1d74200 000000=
28
9e60: c1c49ea4 c1c49e70 c012cf54 c00e672c c1d7422c c1c49e94 c1c49e84 c18100=
4c
9e80: c1d50364 c1027dec c1d74200 c181004c 0001f78c c1d7422c c1c49ef4 c1c49e=
a8
9ea0: c012a4c4 c0128c24 00000002 0001f78c c1d742a4 c1d742dc c02a75d4 000000=
01
9ec0: 00000000 c1c49ee4 c1c49ed4 c1d74200 09fa0800 00000000 c1d7422c c02a75=
d4
9ee0: 00000001 00000000 c1c49f14 c1c49ef8 c0130f5c c0129df8 c1d74200 000000=
00
9f00: c02ab3d0 c1c49f4c c1c49f2c c1c49f18 c012c05c c0130ed8 c1d74000 c1d740=
3c
9f20: c1c49f48 c1c49f30 c00d67bc c012c020 c1c49f4c c1c48000 c1c49fa4 c1c49f=
94
9f40: c1c49f4c c00baa80 c00d6758 00000000 00000000 c1c49f74 00000000 000000=
00
9f60: 00000000 00000000 00000000 00000000 00000025 c1c49fa4 c02ab084 c1c480=
00
9f80: c1c49fa4 c02c0414 c1c49fd8 c1c49f98 c00bb198 c00baa38 c1c439a0 c00baa=
28
9fa0: 00000000 c1c49fa4 c1c49fa4 fffecf8f c1c48000 00000000 c00bb080 000000=
00
9fc0: 00000000 00000000 00000000 c1c49ff4 c1c49fdc c00a4194 c00bb090 000000=
00
9fe0: 00000000 00000000 00000000 c1c49ff8 c0093b90 c00a414c 04b00092 0c104c=
00
Backtrace:
[<c012f948>] (jffs2_block_refile+0x0/0x18c) from [<c012fcc8>]
(__jffs2_flush_wbuf+0x1f4/0xf10)
 r6:c1d74200 r5:c1d50364 r4:09fa0800
[<c012fad4>] (__jffs2_flush_wbuf+0x0/0xf10) from [<c0130ae4>]
(jffs2_flash_writev+0x100/0x424)
[<c01309e8>] (jffs2_flash_writev+0x4/0x424) from [<c0130e60>]
(jffs2_flash_write+0x58/0x60)
[<c0130e08>] (jffs2_flash_write+0x0/0x60) from [<c0128914>]
(jffs2_garbage_collect_pristine+0x288/0
x418)
 r6:00000001 r5:09f80874 r4:00000000
[<c012868c>] (jffs2_garbage_collect_pristine+0x0/0x418) from
[<c0128fd0>] (jffs2_garbage_collect_li
ve+0x3bc/0x11d4)
[<c0128c14>] (jffs2_garbage_collect_live+0x0/0x11d4) from [<c012a4c4>]
(jffs2_garbage_collect_pass+
0x6dc/0x828)
[<c0129de8>] (jffs2_garbage_collect_pass+0x0/0x828) from [<c0130f5c>]
(jffs2_flush_wbuf_gc+0x94/0x1
30)
[<c0130ec8>] (jffs2_flush_wbuf_gc+0x0/0x130) from [<c012c05c>]
(jffs2_write_super+0x4c/0x54)
 r7:c1c49f4c r6:c02ab3d0 r5:00000000 r4:c1d74200
[<c012c010>] (jffs2_write_super+0x0/0x54) from [<c00d67bc>]
(sync_supers+0x74/0xb0)
 r5:c1d7403c r4:c1d74000
[<c00d6748>] (sync_supers+0x0/0xb0) from [<c00baa80>] (wb_kupdate+0x58/0x15=
8)
 r6:c1c49fa4 r5:c1c48000 r4:c1c49f4c
[<c00baa28>] (wb_kupdate+0x0/0x158) from [<c00bb198>] (pdflush+0x118/0x1d0)
 r7:c02c0414 r6:c1c49fa4 r5:c1c48000 r4:c02ab084
[<c00bb080>] (pdflush+0x0/0x1d0) from [<c00a4194>] (kthread+0x58/0x90)
[<c00a413c>] (kthread+0x0/0x90) from [<c0093b90>] (do_exit+0x0/0x6ac)
 r6:00000000 r5:00000000 r4:00000000
Code: 159f3140 15951004 15952000 03a03000 (15812000)
---[ end trace 3595c81699da333e ]---
------------[ cut here ]------------
WARNING: at kernel/exit.c:1005 do_exit+0x38/0x6ac()
[<c007f74c>] (dump_stack+0x0/0x14) from [<c0091180>]
(warn_on_slowpath+0x48/0x64)
[<c0091138>] (warn_on_slowpath+0x0/0x64) from [<c0093bc8>] (do_exit+0x38/0x=
6ac)
 r6:0000000b r5:c1c439a0 r4:c1c48000
[<c0093b90>] (do_exit+0x0/0x6ac) from [<c007f654>] (die+0x1b0/0x1fc)
[<c007f4a4>] (die+0x0/0x1fc) from [<c0080c64>] (__do_kernel_fault+0x6c/0x7c=
)
[<c0080bf8>] (__do_kernel_fault+0x0/0x7c) from [<c0080e90>]
(do_page_fault+0x21c/0x23c)
 r7:c1c49c2c r6:c1c439a0 r5:c02a3e50 r4:ffffffff
[<c0080c74>] (do_page_fault+0x0/0x23c) from [<c0080f4c>]
(do_translation_fault+0x18/0x80)
[<c0080f34>] (do_translation_fault+0x0/0x80) from [<c007b234>]
(do_DataAbort+0x3c/0xa0)
 r4:ffffffff
[<c007b1f8>] (do_DataAbort+0x0/0xa0) from [<c007b9c0>] (__dabt_svc+0x40/0x6=
0)
Exception stack(0xc1c49c2c to 0xc1c49c74)
9c20:                            00000029 00200200 00100100 00100100 000000=
00
9c40: c1d50364 c1d74200 00000000 00000001 09f80874 09fa0800 c1c49c90 c1c49b=
ac
9c60: c1c49c74 c00917ac c012f988 80000013 ffffffff
 r8:00000001 r7:00000000 r6:c1d74200 r5:c1c49c60 r4:ffffffff
[<c012f948>] (jffs2_block_refile+0x0/0x18c) from [<c012fcc8>]
(__jffs2_flush_wbuf+0x1f4/0xf10)
 r6:c1d74200 r5:c1d50364 r4:09fa0800
[<c012fad4>] (__jffs2_flush_wbuf+0x0/0xf10) from [<c0130ae4>]
(jffs2_flash_writev+0x100/0x424)
[<c01309e8>] (jffs2_flash_writev+0x4/0x424) from [<c0130e60>]
(jffs2_flash_write+0x58/0x60)
[<c0130e08>] (jffs2_flash_write+0x0/0x60) from [<c0128914>]
(jffs2_garbage_collect_pristine+0x288/0
x418)
 r6:00000001 r5:09f80874 r4:00000000
[<c012868c>] (jffs2_garbage_collect_pristine+0x0/0x418) from
[<c0128fd0>] (jffs2_garbage_collect_li
ve+0x3bc/0x11d4)
[<c0128c14>] (jffs2_garbage_collect_live+0x0/0x11d4) from [<c012a4c4>]
(jffs2_garbage_collect_pass+
0x6dc/0x828)
[<c0129de8>] (jffs2_garbage_collect_pass+0x0/0x828) from [<c0130f5c>]
(jffs2_flush_wbuf_gc+0x94/0x1
30)
[<c0130ec8>] (jffs2_flush_wbuf_gc+0x0/0x130) from [<c012c05c>]
(jffs2_write_super+0x4c/0x54)
 r7:c1c49f4c r6:c02ab3d0 r5:00000000 r4:c1d74200
[<c012c010>] (jffs2_write_super+0x0/0x54) from [<c00d67bc>]
(sync_supers+0x74/0xb0)
 r5:c1d7403c r4:c1d74000
[<c00d6748>] (sync_supers+0x0/0xb0) from [<c00baa80>] (wb_kupdate+0x58/0x15=
8)
 r6:c1c49fa4 r5:c1c48000 r4:c1c49f4c
[<c00baa28>] (wb_kupdate+0x0/0x158) from [<c00bb198>] (pdflush+0x118/0x1d0)
 r7:c02c0414 r6:c1c49fa4 r5:c1c48000 r4:c02ab084
[<c00bb080>] (pdflush+0x0/0x1d0) from [<c00a4194>] (kthread+0x58/0x90)
[<c00a413c>] (kthread+0x0/0x90) from [<c0093b90>] (do_exit+0x0/0x6ac)
 r6:00000000 r5:00000000 r4:00000000
---[ end trace 3595c81699da333e ]---

cp: write error: Input/output error
