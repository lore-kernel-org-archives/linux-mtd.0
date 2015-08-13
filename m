Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPhFO-0004dS-V3
 for linux-mtd@lists.infradead.org; Thu, 13 Aug 2015 01:23:59 +0000
Received: by pacrr5 with SMTP id rr5so25838093pac.3
 for <linux-mtd@lists.infradead.org>; Wed, 12 Aug 2015 18:23:34 -0700 (PDT)
Date: Wed, 12 Aug 2015 18:23:28 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-mtd@lists.infradead.org, antoine.tenart@free-electrons.com,
 robert.jarzmik@free.fr
Subject: Re: [PATCH 1/2] nand: pxa3xx: Increase READ_ID buffer and make the
 size static
Message-ID: <20150813012328.GA104137@google.com>
References: <1438612286-16070-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1438612286-16070-2-git-send-email-ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438612286-16070-2-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 03, 2015 at 11:31:25AM -0300, Ezequiel Garcia wrote:
> The read ID count should be made as large as the maximum READ_ID size,
> so there's no need to have dynamic size. This commit sets the hardware
> maximum read ID count, which should be more than enough on all cases.
> Also, we get rid of the read_id_bytes, and use a macro instead.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 28 ++++++----------------------
>  1 file changed, 6 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 1259cc5..0815f11 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -126,6 +126,8 @@
>  #define EXT_CMD_TYPE_LAST_RW	1 /* Last naked read/write */
>  #define EXT_CMD_TYPE_MONO	0 /* Monolithic read/write */
>  
> +#define READ_ID_BYTES		7 /* Large enough to read 'JEDEC' */
> +

For the future: nand_base likes to read 8 bytes of ID for
regular ID decoding. But pxa3xx_nand doesn't use the standard ID code
still, so that's not a problem yet.

Brian
