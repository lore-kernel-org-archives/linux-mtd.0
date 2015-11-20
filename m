Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzrRe-0001MO-Sf
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 19:34:07 +0000
Received: by pabfh17 with SMTP id fh17so128967378pab.0
 for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2015 11:33:44 -0800 (PST)
Date: Fri, 20 Nov 2015 11:33:42 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Cc: dwmw2@infradead.org, michals@xilinx.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
 kpc528@gmail.com, kalluripunnaiahchoudary@gmail.com,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] mtd: Expand the ecc placement locations to 1216
Message-ID: <20151120193342.GX64635@google.com>
References: <1446742735-20824-1-git-send-email-punnaia@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446742735-20824-1-git-send-email-punnaia@xilinx.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 05, 2015 at 10:28:55PM +0530, Punnaiah Choudary Kalluri wrote:
> Device like MT29F32G08ABCDBJ4 have a writesize/oobsize of 16K/1216 Bytes.
> So, increasing the maximum ecc placement locations to 1216

I'd really prefer not increasing the size of the internal arrays any
more. The structures should be rewritten to be dynamic.

> Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> ---
>  include/linux/mtd/mtd.h    | 2 +-
>  include/uapi/mtd/mtd-abi.h | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index f17fa75..1fd3cc6 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -95,7 +95,7 @@ struct mtd_oob_ops {
>  };
>  
>  #define MTD_MAX_OOBFREE_ENTRIES_LARGE	32
> -#define MTD_MAX_ECCPOS_ENTRIES_LARGE	640
> +#define MTD_MAX_ECCPOS_ENTRIES_LARGE	1216
>  /*
>   * Internal ECC layout control structure. For historical reasons, there is a
>   * similar, smaller struct nand_ecclayout_user (in mtd-abi.h) that is retained
> diff --git a/include/uapi/mtd/mtd-abi.h b/include/uapi/mtd/mtd-abi.h
> index 763bb69..c4d592c 100644
> --- a/include/uapi/mtd/mtd-abi.h
> +++ b/include/uapi/mtd/mtd-abi.h
> @@ -220,8 +220,8 @@ struct nand_oobfree {
>  	__u32 length;
>  };
>  
> -#define MTD_MAX_OOBFREE_ENTRIES	8
> -#define MTD_MAX_ECCPOS_ENTRIES	64
> +#define MTD_MAX_OOBFREE_ENTRIES	32
> +#define MTD_MAX_ECCPOS_ENTRIES	1216

NAK. This is part of the ABI, and changing this will break user space.
If you actually bothered to read code, you might understand why there
are now internal and external versions of this struct. The external
(user space) version cannot be changed. The internal version can be
refactored, as long as the external version still maintains some sanity,
at least for old/small devices.

>  /*
>   * OBSOLETE: ECC layout control structure. Exported to user-space via ioctl
>   * ECCGETLAYOUT for backwards compatbility and should not be mistaken as a

Brian
