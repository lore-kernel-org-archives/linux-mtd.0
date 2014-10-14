Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xe3HO-0003a5-Mv
 for linux-mtd@lists.infradead.org; Tue, 14 Oct 2014 14:40:51 +0000
Date: Tue, 14 Oct 2014 11:39:02 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Tanya Brokhman <tlinder@codeaurora.org>
Subject: Re: [PATCH v4] mtd: ubi: Extend UBI layer debug/messaging capabilities
Message-ID: <20141014143902.GA9768@arch.hh.imgtec.org>
References: <1413296037-22346-1-git-send-email-tlinder@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1413296037-22346-1-git-send-email-tlinder@codeaurora.org>
Cc: dedekind1@gmail.com, Richard Weinberger <richard@nod.at>,
 open list <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 14 Oct 05:13 PM, Tanya Brokhman wrote:
> diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
> index 8876c7d..3532f8a 100644
> --- a/drivers/mtd/ubi/block.c
> +++ b/drivers/mtd/ubi/block.c
> @@ -111,12 +111,12 @@ static int __init ubiblock_set_param(const char *val,
>  
>  	len = strnlen(val, UBIBLOCK_PARAM_LEN);
>  	if (len == 0) {
> -		ubi_warn("block: empty 'block=' parameter - ignored\n");
> +		pr_warn("block: empty 'block=' parameter - ignored\n");

No, this is wrong. The message should say something like "UBI: block", or
otherwise the user will think this comes from the block subsystem.

Please use some pr_fmt for this. Something like this before the headers
should be enough:

#define pr_fmt(fmt) "UBI: block:" fmt

You can then use pr_{info,warn,err} without the prefix like this:

  pr_info("whatever");

Which prints "UBI: block: whatever".

See arch/arm/kernel/perf_event.c for an example of how this works.

Also:

>       if (len == UBIBLOCK_PARAM_LEN) {
> -             ubi_err("block: parameter \"%s\" is too long, max. is %d\n",
> +             pr_warn("block: parameter \"%s\" is too long, max. is %d\n",
>                       val, UBIBLOCK_PARAM_LEN);
>               return -EINVAL;
>       }

Please replace the level properly ubi_err -> pr_err, ubi_warn -> pr_warn, etc.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
