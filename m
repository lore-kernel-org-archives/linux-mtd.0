Subject: Re: [PATCH] mtd: misplaced parenthesis in find_boot_record()
From: David Woodhouse <dwmw2@infradead.org>
To: Roel Kluin <roel.kluin@gmail.com>
In-Reply-To: <4B79C344.60908@gmail.com>
References: <4B79C344.60908@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 26 Feb 2010 13:08:40 +0000
Message-ID: <1267189720.30247.10867.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-02-15 at 22:57 +0100, Roel Kluin wrote:
> The parenthesis was misplaced, upon error a one was shown.
> 
> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>

> ---
> diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
> index 32e82ae..a269c62 100644
> --- a/drivers/mtd/inftlmount.c
> +++ b/drivers/mtd/inftlmount.c
> @@ -102,7 +102,7 @@ static int find_boot_record(struct INFTLrecord *inftl)
>  		/* To be safer with BIOS, also use erase mark as discriminant */
>  		if ((ret = inftl_read_oob(mtd, block * inftl->EraseSize +
>  					  SECTORSIZE + 8, 8, &retlen,
> -					  (char *)&h1) < 0)) {
> +					  (char *)&h1)) < 0) {

Ick.

This code is broken because it's fugly. You can see the causality just
by looking at it.

Why on earth would you fix the bug but not fix the fugliness which
caused it?

   ret = inftl_read_oob(...);
   if (ret < 0) {



-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
