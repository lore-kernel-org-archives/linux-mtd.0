Received: from ironport2-out.pppoe.ca ([206.248.154.182]
	helo=ironport2-out.teksavvy.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KVS2b-0000vQ-AM
	for linux-mtd@lists.infradead.org; Tue, 19 Aug 2008 14:18:33 +0000
Message-ID: <3771.128.100.203.197.1219156923.squirrel@128.100.203.197>
In-Reply-To: <3744.128.100.203.197.1219155830.squirrel@128.100.203.197>
References: <3744.128.100.203.197.1219155830.squirrel@128.100.203.197>
Date: Tue, 19 Aug 2008 10:42:03 -0400 (EDT)
Subject: Re: JFFS2 BUG ?
From: "Jesse Malone" <jmalone@jsoft.ca>
To: jmalone@jsoft.ca
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: jmalone@jsoft.ca
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

...sorry that earlier version was 2.6.24.3


AUTHOR wrote Jesse Malone
> Hello,
>
> I've been seeing jffs2 kernel oopses in kernel 2.6.25.10 (also in earlier
> kernels, specifically 2.5.24.3). Here's the oops:
>
> JFFS2 error: (309) jffs2_get_inode_nodes: can .
> ------------[ cut here ]------------
> kernel BUG at fs/jffs2/readinode.c:542!
> Oops: Kernel BUG, sig: 9 [#1]
> FRAME_POINTER chip: 0x01f:0x1e82 rev 2
> Modules linked in:
> PC is at jffs2_free_tmp_dnode_info_list+0x44/0x54
> LR is at 0x0
> pc : [<900aa384>]    lr : [<00000000>]    Not tainted
> sp : 91dc1e04  r12: 901e72e8  r11: 9024ee00
> r10: 91d70e20  r9 : 91d70e20  r8 : 00000012
> r7 : 91dc1e04  r6 : 91d70e00  r5 : 91dc1e70  r4 : 00000000
> r3 : 91cf4000  r2 : 91d70e00  r1 : 91da842c  r0 : 00570cb4
> Flags: qvnzC
> Mode bits: hjmde....g
> CPU Mode: Supervisor
> Process: jffs2_gcd_mtd3 [309] (task: 91c17600 thread: 91dc0000)
> Stack: (0x91dc1e04 to 0x91dc2000)
> 1e00:          900ab378 91dc1e40 00570ab4 00000037 00000000 00000000
> 91dc1e70
> 1e20: 91d3b600 91d3b200 0000008c fffffffb 00000151 91da8420 00000420
> 00000000
> 1e40: 900ab3dc 91dc1e94 91dc1e70 91dc1eb8 00000000 91d3b200 91d3b600
> 900b0560
> 1e60: 91d3b200 00000000 91dc2f18 00000000 91d11ac0 00000000 000008cb
> 00000000
> 1e80: 00000000 00000000 00000000 91dc1eac 901fe690 900abd36 91dc1efc
> 91d3b600
> 1ea0: 91d2f9f0 00000000 91d3b200 91d3b200 900b0560 91d3b200 901fe690
> 00000000
> 1ec0: ffffe000 91dc0000 91c1774c 91d3b200 90019b6a 91dc1ee4 901fe660
> 91c17628
> 1ee0: 00000000 9017abe6 91dc1f10 901fe660 91c17600 00000000 ffffe000
> 900af3e4
> 1f00: 91dc1f38 91d2f9f0 91d3b22c 00000000 00000001 91d3b200 900b0560
> 91d3b200
> 1f20: 900247b0 91dc1f34 91dc0000 91d3b200 00000000 9001f146 900b0642
> 91dc1fdc
> 1f40: 91dc0000 91d3b200 00000000 ffffe000 91dc0000 900b0560 91d3b200
> 007707d7
> 1f60: 007707d8 007707d9 007707da 007707db 007707dc 007707dd 007707de
> 007707df
> 1f80: 007707e0 007707e1 007707e2 007707e3 90000 00000000 00000000 00000000
> 9002
> Call trace:
>  [<900ab378>] jffs2_get_inode_nodes+0xd3c/0xd7c
>  [<900ab3dc>] jffs2_do_read_inode_internal+0x24/0x7d8
>  [<900abd36>] jffs2_do_crccheck_inode+0x3a/0x70
>  [<900af3e4>] jffs2_garbage_collect_pass+0x138/0x52c
>  [<900b0642>] jffs2_garbage_collect_thread+0xe2/0x108
>  [<90020058>] do_exit+0x0/0x438
>
>
> What do you make of this?
>
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
