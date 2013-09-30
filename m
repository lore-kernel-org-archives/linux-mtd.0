Received: from mail-oa0-x230.google.com ([2607:f8b0:4003:c02::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VQmgx-0001xO-Bt
 for linux-mtd@lists.infradead.org; Mon, 30 Sep 2013 23:15:52 +0000
Received: by mail-oa0-f48.google.com with SMTP id m6so4189731oag.7
 for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2013 16:15:30 -0700 (PDT)
Date: Mon, 30 Sep 2013 16:15:26 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v4 00/12] About the SLC/MLC
Message-ID: <20130930231526.GP23337@ld-irv-0074.broadcom.com>
References: <1380092301-21924-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1380092301-21924-1-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 25, 2013 at 02:58:09PM +0800, Huang Shijie wrote:
> In current mtd code, the MTD_NANDFLASH is used to represent both the
> SLC nand MLC(including the TLC). But we already have the MTD_MLCNANDFLASH
> to stand for the MLC. What is worse is that the JFFS2 may run on the MLC
> nand with current code. For the reason of READ/WRITE disturbance, the JFFS2
> should runs on the SLC only,
>        
> This patch set tries to make clear what is the SLC/MLC by adding the macros,
> adding helpers, adding the comments. ..
> 
> After this patch set, the gpmi can support the JFFS2 for some SLC NAND now 
> (only when the left oob area is big enough).

...

> Huang Shijie (12):
>   mtd: nand: add a helper to check the SLC/MLC nand chip
>   mtd: nand: rename the cellinfo to bits_per_cell
>   mtd: nand: add the "bits per cell" info for legacy ID NAND
>   mtd: nand: set the cell information for ONFI nand
>   mtd: nand: print out the cell information for nand chip
>   mtd: gpmi: rewrite the gpmi_ecc_write_oob() to support the jffs2
>   mtd: nand: add more comment for MTD_NANDFLASH/MTD_MLCNANDFLASH
>   mtd: nand: add a helper to detect the nand type
>   mtd: mtd-abi: add a helper to detect the nand type
>   mtd: add MTD_MLCNANDFLASH case for mtd_type_show()
>   jffs2: do not support the MLC nand
>   mtd: nand: fix the wrong mtd->type for nand chip

Pushed the whole series to l2-mtd.git, with a few amendments of my own
to fix trivial issues.

Are the mtd-utils fixes still applicable as-is? I'll review them next,
since we should get mtd-utils updated before the kernel changes make it
to mainline.

Brian
