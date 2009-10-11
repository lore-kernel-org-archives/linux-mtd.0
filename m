Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mwvgd-0000ht-8I
	for linux-mtd@lists.infradead.org; Sun, 11 Oct 2009 10:30:05 +0000
Subject: Re: [PATCH v3 1/3]: mtdoops: Keep track of clean/dirty mtdoops
	pages in an array
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
In-Reply-To: <20091008172628.12daa757@marrow.netinsight.se>
References: <20091002160510.191ef5a4@marrow.netinsight.se>
	<20091008172516.64b5c462@marrow.netinsight.se>
	<20091008172628.12daa757@marrow.netinsight.se>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 11 Oct 2009 13:29:48 +0300
Message-Id: <1255256988.16942.21.camel@localhost>
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

On Thu, 2009-10-08 at 17:26 +0200, Simon Kagstrom wrote:
> This patch makes mtdoops keep track of clean/dirty pages in an array
> instead of scanning the flash after a write. The advantage with this
> approach is that it avoids calling mtd->read on a panic, which is not
> possible for all mtd drivers.
> 
> Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
> ---
>  drivers/mtd/mtdoops.c |   48 +++++++++++++++++++++++++++++-------------------
>  1 files changed, 29 insertions(+), 19 deletions(-)

> diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
> index ac67833..435961e 100644
> --- a/drivers/mtd/mtdoops.c
> +++ b/drivers/mtd/mtdoops.c
> @@ -44,6 +44,7 @@ static struct mtdoops_context {
>  	int oops_pages;
>  	int nextpage;
>  	int nextcount;
> +	u8 *oops_page_dirty;
>  	char *name;

So basically, you want to keep a per-page array which contains free/used
mtd oops page status. I find the term "dirty" a bit confusing. Could we
please instead use "used" or "free" or something like that?

Also, is it possible to make it 1 bit per oops page, not 1 byte? Just
less wasteful.

> @@ -428,6 +435,7 @@ static int __init mtdoops_console_init(void)
>  		printk(KERN_ERR "Failed to allocate mtdoops buffer workspace\n");
>  		return -ENOMEM;
>  	}
> +	cxt->oops_page_dirty = NULL;

Minor nitpick: this initialization is unnecessary.

[snip]

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
