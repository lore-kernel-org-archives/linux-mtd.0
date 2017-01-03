Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cOMmN-0004HI-Io
 for linux-mtd@lists.infradead.org; Tue, 03 Jan 2017 10:57:22 +0000
Date: Tue, 3 Jan 2017 11:56:48 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: fix nand.h kernel-doc warnings
Message-ID: <20170103115648.5f7025d8@bbrezillon>
In-Reply-To: <131b4b61-e800-2343-14d4-ab8e128126ea@infradead.org>
References: <131b4b61-e800-2343-14d4-ab8e128126ea@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 21 Nov 2016 18:32:08 -0800
Randy Dunlap <rdunlap@infradead.org> wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix kernel-doc warnings in <linux/mtd/nand.h>:
> 
> ..//include/linux/mtd/nand.h:658: warning: No description found for parameter 'tCEH_min'
> ..//include/linux/mtd/nand.h:877: warning: No description found for parameter 'data_interface'
> 

Applied.

Thanks,

Boris

> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
>  include/linux/mtd/nand.h |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> I haven't been able to find tCEH_min in any NAND datasheets (yet).
> 
> --- lnx-49-rc6.orig/include/linux/mtd/nand.h
> +++ lnx-49-rc6/include/linux/mtd/nand.h
> @@ -589,7 +589,7 @@ struct nand_buffers {
>   * @tALS_min: ALE setup time
>   * @tAR_min: ALE to RE# delay
>   * @tCEA_max: CE# access time
> - * @tCEH_min:
> + * @tCEH_min: CE# XXX time
>   * @tCH_min:  CE# hold time
>   * @tCHZ_max: CE# high to output hi-Z
>   * @tCLH_min: CLE hold time
> @@ -771,6 +771,7 @@ nand_get_sdr_timings(const struct nand_d
>   *			supported, 0 otherwise.
>   * @jedec_params:	[INTERN] holds the JEDEC parameter page when JEDEC is
>   *			supported, 0 otherwise.
> + * @data_interface:	[INTERN] NAND interface timing information
>   * @read_retries:	[INTERN] the number of read retry modes supported
>   * @onfi_set_features:	[REPLACEABLE] set the features for ONFI nand
>   * @onfi_get_features:	[REPLACEABLE] get the features for ONFI nand
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
