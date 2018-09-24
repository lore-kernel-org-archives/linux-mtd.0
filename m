Received: from mail.bugwerft.de ([2a03:6000:1011::59])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4Wza-0000gZ-WB
 for linux-mtd@lists.infradead.org; Mon, 24 Sep 2018 19:58:04 +0000
Subject: Re: Trouble with new marvell_nand driver on PXA3xx
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd@lists.infradead.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>
References: <f3cf564d-7976-5b2e-ca07-ea872c165396@zonque.org>
 <20180924092031.3d4af408@xps13>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <7843c6db-e466-9d17-39e5-570135006a0c@zonque.org>
Date: Mon, 24 Sep 2018 21:57:20 +0200
MIME-Version: 1.0
In-Reply-To: <20180924092031.3d4af408@xps13>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miquel,

On 24/9/2018 9:20 AM, Miquel Raynal wrote:
> Right now I have no idea of what happens, but you might want to add a
> dump_stack() at the "Timeout waiting for RB signal" error to see what
> path in the driver failed.

I've triggered it several times now, and all traces show 
marvell_nfc_hw_ecc_hmg_write_page() as a stack parent.

So it seems to affect the writing routines only.


Any idea yet?

Thanks,
Daniel


> [  365.951351] WARNING: CPU: 0 PID: 1305 at drivers/mtd/nand/raw/marvell_nand.c:629 marvell_nfc_wait_op+0x88/0xb8
> [  365.961375] Modules linked in: pxamci
> [  365.965047] CPU: 0 PID: 1305 Comm: bonnie++ Not tainted 4.19.0-rc5+ #445
> [  365.971768] Hardware name: Marvell PXA3xx (Device Tree Support)
> [  365.977712] Backtrace: 
> [  365.980192] [<c0106120>] (dump_backtrace) from [<c01063dc>] (show_stack+0x18/0x1c)
> [  365.987789]  r6:00000000 r5:c07eb850 r4:00000000 r3:c6923b63
> [  365.993437] [<c01063c4>] (show_stack) from [<c0686c04>] (dump_stack+0x20/0x28)
> [  366.000716] [<c0686be4>] (dump_stack) from [<c0112054>] (__warn+0xe0/0x10c)
> [  366.007724] [<c0111f74>] (__warn) from [<c011219c>] (warn_slowpath_null+0x44/0x50)
> [  366.015249]  r9:89705f41 r8:36b4a597 r7:00000042 r6:c07eb850 r5:00000275 r4:c0450a48
> [  366.023033] [<c0112158>] (warn_slowpath_null) from [<c0450a48>] (marvell_nfc_wait_op+0x88/0xb8)
> [  366.031754]  r6:c64a8c90 r5:c64a8c70 r4:00000000
> [  366.036362] [<c04509c0>] (marvell_nfc_wait_op) from [<c0450e78>] (marvell_nfc_hw_ecc_hmg_do_write_page+0x19c/0x1cc)
> [  366.046801]  r7:c0a03008 r6:c64a8c70 r5:00000028 r4:c6610010
> [  366.052438] [<c0450cdc>] (marvell_nfc_hw_ecc_hmg_do_write_page) from [<c0450f38>] (marvell_nfc_hw_ecc_hmg_write_page+0x3c/0x54)
> [  366.063912]  r10:c674a000 r9:00000800 r8:00000000 r7:c674a000 r6:c68bbb4c r5:c674a000
> [  366.071753]  r4:c6610010
> [  366.074304] [<c0450efc>] (marvell_nfc_hw_ecc_hmg_write_page) from [<c0444d7c>] (nand_do_write_ops+0x3a0/0x3ec)
> [  366.084304]  r5:00000800 r4:c6610010
> [  366.087948] [<c04449dc>] (nand_do_write_ops) from [<c04467ac>] (nand_write_oob+0x68/0x84)
> [  366.096080]  r10:c0a03008 r9:c674a000 r8:c68bbbc4 r7:00000000 r6:05d1e000 r5:c6610010
> [  366.104243]  r4:c68bbb4c
> [  366.106896] [<c0446744>] (nand_write_oob) from [<c043908c>] (part_write_oob+0x38/0x40)
> [  366.114770]  r7:00000000 r6:05bfe000 r5:00000000 r4:00120000
> [  366.120492] [<c0439054>] (part_write_oob) from [<c0435a70>] (mtd_write+0xdc/0x12c)
> [  366.128087]  r5:c661dc00 r4:00000800
> [  366.131670] [<c0435994>] (mtd_write) from [<c045d074>] (ubi_io_write+0x3e8/0x6bc)
> [  366.139178]  r10:0001e000 r9:00000000 r8:0001e000 r7:00000000 r6:000002df r5:00000000
> [  366.147025]  r4:05bfe000
> [  366.149561] [<c045cc8c>] (ubi_io_write) from [<c045a11c>] (ubi_eba_write_leb+0xc0/0x6f8)
> [  366.157672]  r10:00000000 r9:c68c0600 r8:0000002e r7:0000002e r6:c6755c00 r5:c664f000
> [  366.165444]  r4:00000000
> [  366.168042] [<c045a05c>] (ubi_eba_write_leb) from [<c0458994>] (ubi_leb_write+0xc4/0xdc)
> [  366.176090]  r10:00000000 r9:c68c0600 r8:00000800 r7:0000002e r6:00000080 r5:c674a000
> [  366.183928]  r4:000007ff
> [  366.186463] [<c04588d0>] (ubi_leb_write) from [<c02d9420>] (ubifs_leb_write+0x88/0xf8)
> [  366.194394]  r6:0001d000 r5:c664a000 r4:c674a000
> [  366.199061] [<c02d9398>] (ubifs_leb_write) from [<c02da5b0>] (ubifs_wbuf_write_nolock+0x328/0x704)
> [  366.208035]  r8:00000190 r7:c68bbdc0 r6:00000190 r5:c664a000 r4:c674fa80
> [  366.214730] [<c02da288>] (ubifs_wbuf_write_nolock) from [<c02cd260>] (write_head.constprop.1+0x3c/0x5c)
> [  366.224132]  r10:00000000 r9:c68c0650 r8:c18d8848 r7:c68bbdc0 r6:c19826a0 r5:c68c0600
> [  366.231973]  r4:c674fa80
> [  366.234508] [<c02cd224>] (write_head.constprop.1) from [<c02cd5dc>] (ubifs_jnl_update+0x35c/0x5ec)
> [  366.243470]  r4:c664a000 r3:c68bbd48
> [  366.247109] [<c02cd280>] (ubifs_jnl_update) from [<c02d3ce0>] (ubifs_create+0x134/0x1ec)
> [  366.255154]  r10:c18d89c8 r9:c18d89b0 r8:c19733b8 r7:c664a000 r6:c19826a0 r5:00000000
> [  366.262989]  r4:c18d8848
> [  366.265529] [<c02d3bac>] (ubifs_create) from [<c01d0ba0>] (path_openat+0x770/0xe3c)
> [  366.273214]  r10:c18d8848 r9:c19733b8 r8:00000241 r7:c19733b8 r6:00000000 r5:c666a640
> [  366.281054]  r4:c68bbe98
> [  366.283586] [<c01d0430>] (path_openat) from [<c01d12b8>] (do_filp_open+0x4c/0xb0)
> [  366.291098]  r10:00020000 r9:c68ba000 r8:c6068000 r7:00000001 r6:c68bbf50 r5:c0a03008
> [  366.298939]  r4:00000004
> [  366.301472] [<c01d126c>] (do_filp_open) from [<c01befac>] (do_sys_open+0x124/0x1e0)
> [  366.309150]  r7:00000241 r6:ffffff9c r5:c0a03008 r4:00000004
> [  366.314778] [<c01bee88>] (do_sys_open) from [<c01bf0dc>] (sys_creat+0x28/0x30)
> [  366.322026]  r10:00020000 r9:c68ba000 r8:c01011e4 r7:00000008 r6:00000000 r5:00009f74
> [  366.329869]  r4:00052c48
> [  366.332400] [<c01bf0b4>] (sys_creat) from [<c0101000>] (ret_fast_syscall+0x0/0x50)
> [  366.339980] Exception stack(0xc68bbfa8 to 0xc68bbff0)
> [  366.345009] bfa0:                   00052c48 00009f74 00052c48 00000180 00000064 00000000
> [  366.353205] bfc0: 00052c48 00009f74 00000000 00000008 beba98bc 0002da58 00000000 0002c170
> [  366.361396] bfe0: 00028010 beba9850 00013f3c b6cfe648
> [  366.366421] ---[ end trace c36e65bc21373d32 ]---
