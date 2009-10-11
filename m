Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MwvpL-0001Ht-1V
	for linux-mtd@lists.infradead.org; Sun, 11 Oct 2009 10:39:03 +0000
Subject: Re: [PATCH v3 2/3]: mtdoops: Make page size configurable
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
In-Reply-To: <20091008172701.7fbe0f5e@marrow.netinsight.se>
References: <20091002160510.191ef5a4@marrow.netinsight.se>
	<20091008172516.64b5c462@marrow.netinsight.se>
	<20091008172701.7fbe0f5e@marrow.netinsight.se>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 11 Oct 2009 13:38:52 +0300
Message-Id: <1255257532.16942.28.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Aaro Koskinen <aaro.koskinen@nokia.com>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-10-08 at 17:27 +0200, Simon Kagstrom wrote:
> The main justification for this is to allow catching long messages
> during a panic, where the top part might otherwise be lost since moving
> to the next block can require a flash erase.
> 
> Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
> ---
>  drivers/mtd/mtdoops.c |   83 +++++++++++++++++++++++++++++++-----------------
>  1 files changed, 53 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
> index 435961e..7045578 100644
> --- a/drivers/mtd/mtdoops.c
> +++ b/drivers/mtd/mtdoops.c
> @@ -32,9 +32,14 @@
>  #include <linux/spinlock.h>
>  #include <linux/interrupt.h>
>  #include <linux/mtd/mtd.h>
> +#include <linux/log2.h>
>  
>  #define MTDOOPS_KERNMSG_MAGIC 0x5d005d00
> -#define OOPS_PAGE_SIZE 4096
> +
> +static int mtdoops_page_size = 4096;
> +module_param(mtdoops_page_size, int, 0);
> +MODULE_PARM_DESC(mtdoops_page_size,
> +		"page size for MTD OOPS pages in bytes (default 4096)");

Term "page" is so overloaded. I'd avoid exporting parameters with "page"
in the name. Could we please call them "records"? At least for the names
we export to users. Of course, ideally you would re-name all symbols in
mtdoops which use "page" term to use "record" term.

Also, the module is called "mtdoops", so it makes little sense to prefix
parameter names with "mtdoops". E.g., if you pass the parameter via the
kernel command line, with current naming you will have:

mtdoops.mtdoops_page_size

Too long, unreadable, confusing :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
