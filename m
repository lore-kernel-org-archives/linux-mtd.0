Received: from mail-vc0-x236.google.com ([2607:f8b0:400c:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WdXCD-0007IK-9F
 for linux-mtd@lists.infradead.org; Fri, 25 Apr 2014 03:53:05 +0000
Received: by mail-vc0-f182.google.com with SMTP id lf12so1860209vcb.13
 for <linux-mtd@lists.infradead.org>; Thu, 24 Apr 2014 20:52:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5359C361.9000302@freescale.com>
References: <1398375634-24759-1-git-send-email-kdasu.kdev@gmail.com>
 <5359C361.9000302@freescale.com>
Date: Thu, 24 Apr 2014 23:52:41 -0400
Message-ID: <CAC=U0a0OwJe4f4ZC6GBWzrVZ6fF1Lq=QB1E0ZBANww=k7L4cXA@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: nand: Add support to use nand_base poi databuf as
 bounce buffer
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Huang,

"could you show us how do the driver use the highmem buffer?"

This is the stack on a BMIPS platform we are doing a read dma transaction.
drv_*  calls are from out of tree nand controller  driver. This
example shows the driver trying to map
highmem virtual address(0xfe1141e0)  for DMA operation passed from
higher layer, and we get an oops.

[<80010764>] mips_dma_map_page+0x64/0x1f8
[<80394a80>] drv_nand_dma_trans+0xd0/0x23c
[<80394f60>] drv_nand_read+0x374/0x3dc
[<8039536c>] drv_nand_read_page+0x78/0x84
[<803903c8>] nand_do_read_ops+0x1c0/0x48c
[<80390b2c>] nand_read+0xbc/0xec
[<8036df10>] part_read+0x7c/0x128
[<8039fa48>] ubi_io_read+0x98/0x1bc
[<8039d954>] ubi_eba_read_leb+0x130/0x320
[<8039cd80>] ubi_leb_read+0xf8/0x164
[<803a5034>] gluebi_read+0xf0/0x148
[<801d2b9c>] jffs2_flash_read+0x74/0x284
[<801c5930>] jffs2_read_dnode+0x140/0x3d0
[<801c5c88>] jffs2_read_inode_range+0xc8/0x1d0
[<801c3d0c>] jffs2_do_readpage_nolock+0x5c/0x208
[<801c4270>] jffs2_do_readpage_unlock+0x14/0x34
[<80088b68>] do_read_cache_page+0xa4/0x23c
[<80088d50>] read_cache_page_async+0x20/0x2c
[<801d0740>] jffs2_gc_fetch_page+0x2c/0x5c
[<801cc958>] jffs2_garbage_collect_live+0x55c/0xfb0
[<801cd810>] jffs2_garbage_collect_pass+0x464/0x894
[<801cf2f8>] jffs2_garbage_collect_thread+0x108/0x224
[<800481fc>] kthread+0x90/0x98
[<8000698c>] kernel_thread_helper+0x10/0x18

"In the gpmi driver, i do a memcpy for the highmem buffer passed from
upper layer."

In the nand controller driver that needs to bounce buffer the
"chip->option |=3D NAND_USE_BOUNCE_BUFFER" can be set during
initialization, nand_base uses the already allocated databuf and does
the memcpy. Much like the unaligned access case. So multiple drivers
can use this
generic feature on other platforms as well.

Thanks
Kamal

On Thu, Apr 24, 2014 at 10:07 PM, Huang Shijie <b32955@freescale.com> wrote=
:
> =E4=BA=8E 2014=E5=B9=B404=E6=9C=8825=E6=97=A5 05:40, Kamal Dasu =E5=86=99=
=E9=81=93:
>
>> + * This option is defined to protect against kmapped buffers
>> + * being passed from highmem when using DMA
>
> the dma API can not support the highmem.
>
> could you show us how do the driver use the highmem buffer?
>
> In the gpmi driver, i do a memcpy for the highmem buffer passed from uppe=
r
> layer.
>
> thanks
> Huang Shijie
>
>
