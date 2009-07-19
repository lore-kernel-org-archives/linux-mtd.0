Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MSOaK-0004ii-Lp
	for linux-mtd@lists.infradead.org; Sun, 19 Jul 2009 05:05:20 +0000
Subject: Re: UBIFS corrupt when do bonnie++ test
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jason Liu <liu.h.jason@gmail.com>
In-Reply-To: <e8775dd00907170817t7a7340a6qb8ede2fa20a11253@mail.gmail.com>
References: <e8775dd00907170817t7a7340a6qb8ede2fa20a11253@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 19 Jul 2009 08:04:20 +0300
Message-Id: <1247979860.11353.191.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-07-17 at 23:17 +0800, Jason Liu wrote:
> [<c002c7ec>] (dump_stack+0x0/0x14) from [<c015a454>]
> (ubifs_check_node+0x29c/0x2e4)
> [<c015a1b8>] (ubifs_check_node+0x0/0x2e4) from [<c015a70c>]
> (ubifs_read_node+0x270/0x36c)
>  r8:00000041 r7:00000002 r6:ded0c120 r5:dea13a60 r4:00000000
> [<c015a49c>] (ubifs_read_node+0x0/0x36c) from [<c015bd54>]
> (ubifs_read_node_wbuf+0x224/0x424)
> [<c015bb30>] (ubifs_read_node_wbuf+0x0/0x424) from [<c017f5b0>]
> (ubifs_tnc_read_node+0x50/0x1d4)
> [<c017f560>] (ubifs_tnc_read_node+0x0/0x1d4) from [<c015e0a0>]
> (tnc_read_node_nm+0xd4/0x228)
>  r8:de376000 r7:ded0c120 r6:ded0c120 r5:de376000 r4:dea13a60
> [<c015dfcc>] (tnc_read_node_nm+0x0/0x228) from [<c015f374>]
> (ubifs_tnc_next_ent+0x238/0x290)
>  r7:dea13a00 r6:ded0c120 r5:00000060 r4:dea13a60
> [<c015f13c>] (ubifs_tnc_next_ent+0x0/0x290) from [<c01533a8>]
> (ubifs_readdir+0x5a4/0x670)
> [<c0152e04>] (ubifs_readdir+0x0/0x670) from [<c00b1530>] (vfs_readdir+0x74/0xa8)
> [<c00b14bc>] (vfs_readdir+0x0/0xa8) from [<c00b168c>] (sys_getdents+0x6c/0xb4)
> [<c00b1620>] (sys_getdents+0x0/0xb4) from [<c0028f00>]
> (ret_fast_syscall+0x0/0x2c)
>  r7:0000008d r6:00000002 r5:0002cfc0 r4:0002cfc8
> UBIFS error (pid 4139): ubifs_read_node: expected node type 2
> UBIFS error (pid 4139): ubifs_readdir: cannot find next direntry, error -117
> 
> The nand driver has passed the following nand_tests without errors
> mtd_oobtest.ko      mtd_speedtest.ko   mtd_readtest.ko
> mtd_pagetest.ko     mtd_stresstest.ko   mtd_torturetest,ko
> 
> Could  you please give me some hint about what's going wrong with UBIFS? Thanks

As this states:
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_mlc

we have never tested UBIFS on MLC. UBIFS finds a corrupted node, just
out of the blue. This is probably related to read or program disturb.

I'd suggest you to investigate those aspects, write a small test program
to reproduce them. You should investigate these aspects. Paired page is
another aspect UBIFS does not support. I'd be happy to look at MLC
closer, but I do not have the HW.

Do you have your MLC Flash manual publicly available?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
