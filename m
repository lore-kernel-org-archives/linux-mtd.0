Subject: Re: [PATCH v7 3/5]: mtdoops: Make page (record) size configurable
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
In-Reply-To: <20091015094739.3728e731@marrow.netinsight.se>
References: <20091015094057.7298e0d7@marrow.netinsight.se>
	<20091015094739.3728e731@marrow.netinsight.se>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 23 Oct 2009 07:13:49 +0300
Message-Id: <1256271229.29885.179.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-10-15 at 09:47 +0200, Simon Kagstrom wrote:
> The main justification for this is to allow catching long messages
> during a panic, where the top part might otherwise be lost since moving
> to the next block can require a flash erase.
> 
> Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
> Reviewed-by: Anders Grafstrom <anders.grafstrom@netinsight.net>

What will happen if I have a partition with 8192-bytes records, and then
attach it to mtdoops with default 4096 ?

>  	cxt->mtd = mtd;
>  	if (mtd->size > INT_MAX)
> -		cxt->oops_pages = INT_MAX / OOPS_PAGE_SIZE;
> +		cxt->oops_pages = INT_MAX / record_size;
>  	else
> -		cxt->oops_pages = (int)mtd->size / OOPS_PAGE_SIZE;
> +		cxt->oops_pages = (int)mtd->size / record_size;

BTW, this INT_MAX and the (int) cast also suggests we need to limit the
maximum partition size and add a check for this.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
