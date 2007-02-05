From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Adrian Hunter'" <ext-adrian.hunter@nokia.com>,
	<linux-mtd@lists.infradead.org>
References: <45C2EE39.7050909@nokia.com>
Subject: RE: [PATCH] [MTD] OneNAND: Do not allow oob write past end of page
Date: Mon, 5 Feb 2007 15:38:32 +0900
Message-ID: <003a01c748f0$48530620$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <45C2EE39.7050909@nokia.com>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Adrian

Umm Why is it required in OneNAND? Even though OneNAND is based on NAND. We
regard it as NOR
So we don't need this patch.

Thank you,
Kyungmin Park

> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org 
> [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of 
> Adrian Hunter
> Sent: Friday, February 02, 2007 4:55 PM
> To: linux-mtd@lists.infradead.org
> Subject: [PATCH] [MTD] OneNAND: Do not allow oob write past 
> end of page
> 
> >From ba01b89188f21ca9a982e33452217e5c6874fd0b Mon Sep 17 
> 00:00:00 2001
> From: Adrian Hunter <ext-adrian.hunter@nokia.com>
> Date: Thu, 1 Feb 2007 16:04:50 +0200
> Subject: [MTD] OneNAND: Do not allow oob write past end of page
> 
> OneNAND can write oob to successive pages, but NAND does not 
> do that.  For compatibility, disallow OneNAND from writing 
> past the end of the page.
> 
> Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
> ---
>  drivers/mtd/onenand/onenand_base.c |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/onenand/onenand_base.c 
> b/drivers/mtd/onenand/onenand_base.c
> index 9ec28bb..b7da84a 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -1191,6 +1191,13 @@ static int onenand_do_write_oob(struct m
>  		return -EINVAL;
>  	}
>  
> +	/* For compatibility with NAND: Do not allow write past 
> end of page */
> +	if (column + len > oobsize) {
> +		DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_oob: "
> +		      "Attempt to write past end of page\n");
> +		return -EINVAL;
> +	}
> +
>  	/* Do not allow reads past end of device */
>  	if (unlikely(to >= mtd->size ||
>  		     column + len > ((mtd->size >> this->page_shift) -
> --
> 1.4.3
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
