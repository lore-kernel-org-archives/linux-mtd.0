Received: from mail-ob0-x22e.google.com ([2607:f8b0:4003:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vbdn8-0008T1-P0
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2013 21:59:07 +0000
Received: by mail-ob0-f174.google.com with SMTP id vb8so2163469obc.33
 for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2013 14:58:45 -0700 (PDT)
Date: Wed, 30 Oct 2013 17:58:36 -0400
From: Brian Norris <computersforpeace@gmail.com>
To: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] mtd: mxc_nand: Include linux/of.h header
Message-ID: <20131030215836.GB20059@norris.computersforpeace.net>
References: <1382093195-31929-1-git-send-email-sachin.kamat@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1382093195-31929-1-git-send-email-sachin.kamat@linaro.org>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 18, 2013 at 04:16:35PM +0530, Sachin Kamat wrote:
> 'of_match_ptr' is defined in linux/of.h. Include it explicitly to
> avoid build breakage in the future.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  drivers/mtd/nand/mxc_nand.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index ce8242b..1037755 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -32,6 +32,7 @@
>  #include <linux/io.h>
>  #include <linux/irq.h>
>  #include <linux/completion.h>
> +#include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/of_mtd.h>

I'm not really sure this is all that necessary (are of_device.h or
of_mtd.h ever not going to include the appropriate of.h header?), but
since we have the patch (and I see that you've been spamming around the
other subsystems with similar patches)...

Applied to l2-mtd.git.

Brian
