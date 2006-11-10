Received: from mgw-ext14.nokia.com ([131.228.20.173])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GiRSD-0001PJ-Ex
	for linux-mtd@lists.infradead.org; Fri, 10 Nov 2006 03:09:51 -0500
Subject: Re: Kernel oops in jffs2 mount - any ideas?
From: Artem Bityutskiy <dedekind@infradead.org>
To: robin.gilks@tait.co.nz
In-Reply-To: <4553C6CB.2040207@tait.co.nz>
References: <4553C6CB.2040207@tait.co.nz>
Content-Type: text/plain; charset=utf-8
Date: Fri, 10 Nov 2006 10:09:29 +0200
Message-Id: <1163146170.3925.7.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: MTD mail list <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-11-10 at 13:24 +1300, Robin Gilks wrote:
> [   13.244977] [C0325BC0] [C00BCBCC] jffs2_do_mount_fs+0x180/0x8ec
> [   13.256728] [C0325BF0] [C00BF05C] jffs2_do_fill_super+0xbc/0x244
> [   13.268650] [C0325C10] [C00BF868] jffs2_get_sb_mtd+0xfc/0x19c
> [   13.280055] [C0325C50] [C00BFB14] jffs2_get_sb+0x180/0x228
> [   13.290941] [C0325CE0] [C005A42C] vfs_kern_mount+0x5c/0xbc
> [   13.301828] [C0325D00] [C005A4C8] do_kern_mount+0x3c/0x60
> [   13.312542] [C0325D30] [C0072374] do_mount+0x394/0x680
> [   13.322736] [C0325EB0] [C00729F8] sys_mount+0x98/0xe8
> [   13.332759] [C0325EF0] [C021A864] do_mount_root+0x2c/0xc4
> [   13.343472] [C0325F10] [C021A9C0] mount_block_root+0xc4/0x248
> [   13.354878] [C0325F60] [C021AE3C] prepare_namespace+0xb8/0x190
> [   13.366455] [C0325F80] [C0002494] init+0x254/0x2e4
> [   13.375959] [C0325FF0] [C000514C] kernel_thread+0x44/0x60
> [   13.386658] Instruction dump:
> [   13.392537] 38800003 38a00001 4bf5b645 80010014 38210010 7c0803a6=20
> 4e800020 816300ec
> [   13.407914] 548915fa 7c69582e 2f030000 4d9a0020 <8003000c> 7f802040=20
> 409c0014 80630010
> [   13.425346] Kernel panic - not syncing: Attempted to kill init!
> [   13.436809]  <0>Rebooting in 1 seconds..

Enabling debugging messages and providing flash type and how to
reproduce information would be helpful.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
