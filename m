Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3UtV-0002r6-1c
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2015 20:17:53 +0000
Received: by padhx2 with SMTP id hx2so195118390pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 30 Nov 2015 12:17:32 -0800 (PST)
Date: Mon, 30 Nov 2015 12:17:29 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: fix ONFI parameter page layout
Message-ID: <20151130201729.GK64635@google.com>
References: <1448274187-22174-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1448274187-22174-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 23, 2015 at 11:23:07AM +0100, Boris Brezillon wrote:
> src_ssync_features field is only 1 byte large, and the 4th reserved area
> is actually 8 bytes large.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Fixes d1e1f4e42b5 ("mtd: nand: add support for reading ONFI parameters from NAND device")
> Cc: <stable@vger.kernel.org> #v2.6.37+

Did you see an actual problem from this? (And is this deserving of
stable?) I could imagine an out-of-tree driver might try to use t_ald
(which should actually be t_adl, right?) and get the wrong value. But no
one does that in-tree yet.

> ---
>  include/linux/mtd/nand.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 5a9d1d4..93fc372 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -276,7 +276,7 @@ struct nand_onfi_params {
>  	__le16 t_r;
>  	__le16 t_ccs;
>  	__le16 src_sync_timing_mode;
> -	__le16 src_ssync_features;
> +	u8 src_ssync_features;
>  	__le16 clk_pin_capacitance_typ;
>  	__le16 io_pin_capacitance_typ;
>  	__le16 input_pin_capacitance_typ;
> @@ -284,7 +284,7 @@ struct nand_onfi_params {
>  	u8 driver_strength_support;
>  	__le16 t_int_r;
>  	__le16 t_ald;
> -	u8 reserved4[7];
> +	u8 reserved4[8];
>  
>  	/* vendor */
>  	__le16 vendor_revision;

Patch looks good.

Brian
