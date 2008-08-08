Received: from smtpeu1.atmel.com ([195.65.72.27] helo=bagnes.atmel.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KRRf0-00061N-H8
	for linux-mtd@lists.infradead.org; Fri, 08 Aug 2008 13:05:39 +0000
Date: Fri, 8 Aug 2008 15:05:24 +0200
From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
To: "Eirik Aanonsen" <eaa@wprmedical.com>
Subject: Re: Jffs2 crach in 2.6.25.6.atmel.1
Message-ID: <20080808150524.5263de89@hskinnemo-gx745.norway.atmel.com>
In-Reply-To: <6B5648EA2E2C2D42AF2FF7691522AD92417C1C@wpr01.wprmedical.local>
References: <6B5648EA2E2C2D42AF2FF7691522AD92417C1C@wpr01.wprmedical.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, kernel@avr32linux.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[Cc'ing mtd list. On the face of it, this doesn't look avr32-specific]

"Eirik Aanonsen" <eaa@wprmedical.com> wrote:
> 
> Jffs2 crach in 2.6.25.6.atmel.1. The flash partition is 84% full and I
> am trying to do a small change in /etc/profile. When I try to write the
> change to file this happens. After a reboot the file is empty.
> 
> ____________________________________________________
>  
> Eirik Aanonsen
> SW Developer
> E-mail: eaa@wprmedical.com 
> Phone: +47 90 68 11 92
> Fax: +47 37 03 56 77
> ____________________________________________________
> 
>  
> 
> JFFS2 error: (349) __jffs2_dbg_acct_sanity_check_nolock: eeep, space
> accounting for block at 0xffffffff is screwed.
> JFFS2 error: (349) __jffs2_dbg_acct_sanity_check_nolock: free 0x443f3bc
> + dirty 0x00021a + used 0xfffffde3 + wasted 0x000000 + unchecked
> 0xffffffff != total 0x020000.
> ------------[ cut here ]------------
> kernel BUG at fs/jffs2/debug.c:34!
> Oops: Kernel BUG, sig: 9 [#1]
> FRAME_POINTER chip: 0x01f:0x1e82 rev 2
> Modules linked in: wpr_msp430 wpr_event wpr_power wpr_gpio wpr_debug
> ubifs crc16 ubi
> PC is at __jffs2_dbg_acct_sanity_check_nolock+0x6a/0xf4
> LR is at release_console_sem+0x14e/0x154
> pc : [<9008d9e2>]    lr : [<9001b79a>]    Not tainted
> sp : 916fbd28  r12: 000000aa  r11: 00001ec7
> r10: ffffffff  r9 : 00000000  r8 : 00400004
> r7 : 916fbd54  r6 : 916fa000  r5 : 9008da74  r4 : 916fbe68
> r3 : 91c0a09c  r2 : 91ce6678  r1 : 91cc8800  r0 : 00000040
> Flags: qvnzc
> Mode bits: hjmde....g
> CPU Mode: Supervisor
> Process: vi [349] (task: 916c0000 thread: 916fa000)
> Stack: (0x916fbd28 to 0x916fc000)
> bd20:                   0000015d 9008da74 0443f3bc 0000021a fffffde3
> 00000000
> bd40: ffffffff 00020000 0000015d 9008da74 ffffffff 9008659e 916fbd90
> 91c0a09c
> bd60: 91cc8800 916fbe68 0000021b 91ce6678 0000021c 00000040 918169c0
> 00000000
> bd80: 91cc9000 0049bcf8 91cc8800 916e1c60 9008546c 916fbdb4 916d50d8
> 916d50d8
> bda0: 916fbe68 00000000 918169d4 91cc8800 00000040 900858a0 916fbdc8
> 00000000
> bdc0: 916d50d8 916fbe68 9008d0f0 916fbe0c 00000000 91cc9000 916fbe68
> 918169c0
> bde0: 918169ec 916e1c60 00000040 916fbe68 00000008 91cc8800 00000000
> 00000000
> be00: 00000000 00004308 9010f9b0 9008d230 916fbe30 91864380 916fbe68
> 000b6f00
> be20: 916fbe68 918169ec 000081ed 91864380 9005c818 916fbe44 00008068
> 00000008
> be40: 000b6f00 9004e900 916fbe9c 00008068 91864380 000b6f00 00000000
> 91864380
> be60: 91864380 916fa000 00008068 918169ec 00000000 000b6f00 00000000
> 00000000
> be80: 00000040 00000000 00000040 00000000 00000040 00000000 000b6f00
> 90054992
> bea0: 916fbeb0 00000200 918169ec 000b6f00 900566b4 916fbef8 00000000
> 916fbf1c
> bec0: 000b6f00 91806680 000001b6 91864380 916fa000 000001b6 00008242
> 00000002
> bee0: 00000000 00000000 00000000 9004129e 91c78080 91864380 9004e53a
> 916fbf6c
> bf00: 00008241 916fbf1c 000b6f00 91c26000 000001b6 ffffff9c 916fa000
> 91c78080
> bf20: 91864380 fd9bf736 00000007 91c26000 00000300 00000000 00000000
> 916fbf5c
> bf40: 00000003 91c5b3c8 000b6f00 00008241 91c5b3c0 916fa000 916fa000
> 9004f20e
> bf60: 00008242 000001b6 916f5e80 9004f21e 916fbf80 00008241 00000003
> 000b6f00
> bf80: 9004f25e 916fbfa4 0009a8e0 000b727b 000b6f00 00000021 7faf4c98
> 80000000
> bfa0: 916fa000 90010132 00000000 0009a8e0 000b727b 000b6f00 00000000
> 00020ea2
> bfc0: 0000d0e0 7faf4bc4 000b9708 00008241 000001b6 000001b6 00000005
> 000b60d8
> bfe0: 0009a8e0 000b727b 000b6f00 00000021 7faf4c98 000b6f00 000b9708
> 000b9708
> Call trace:
>  [<9008659e>] jffs2_mark_node_obsolete+0x12a/0x3a0
>  [<9008546c>] jffs2_obsolete_node_frag+0x20/0x38
>  [<900858a0>] jffs2_truncate_fragtree+0x4c/0x98
>  [<9008d0f0>] jffs2_do_setattr+0x58c/0x658
>  [<9008d230>] jffs2_setattr+0x18/0x1c
>  [<9005c818>] notify_change+0xd8/0xfc
>  [<9004e900>] do_truncate+0x54/0x64
>  [<90054992>] may_open+0x10e/0x128
>  [<900566b4>] open_namei+0x1f4/0x4c4
>  [<9004e53a>] do_filp_open+0x1e/0x2c
>  [<9004f21e>] do_sys_open+0x32/0x5c
>  [<9004f25e>] sys_open+0xe/0x10
>  [<90010132>] syscall_return+0x0/0x12
> 
> Killed
> _______________________________________________
> Kernel mailing list
> Kernel@avr32linux.org
> http://duppen.flaskehals.net/cgi-bin/mailman/listinfo/kernel
