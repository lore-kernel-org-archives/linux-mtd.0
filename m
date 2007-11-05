Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1Ip2FN-0005hE-1S
	for linux-mtd@lists.infradead.org; Mon, 05 Nov 2007 08:44:15 -0500
Date: Mon, 5 Nov 2007 14:25:12 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
Subject: Re: [PATCH] [MTD] [OneNAND] Do not stop reading for ECC errors
Message-ID: <20071105132512.GA19232@lazybastard.org>
References: <472B0A3C.4010103@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <472B0A3C.4010103@nokia.com>
Cc: kmpark@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2 November 2007 13:30:04 +0200, Adrian Hunter wrote:
> 
> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
> index dd28355..616747c 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -855,6 +855,8 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
>  			this->command(mtd, ONENAND_CMD_READ, from, writesize);
>   			ret = this->wait(mtd, FL_READING);
>   			onenand_update_bufferram(mtd, from, !ret);
> +			if (ret == -EBADMSG)
> +				ret = 0;

Why is -EBADMSG dropped here?

> @@ -988,18 +995,16 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
>  		onenand_update_bufferram(mtd, from, 0);
>  
>  		ret = this->wait(mtd, FL_READING);
> -		/* First copy data and check return value for ECC handling */
> +		if (ret && ret != -EBADMSG) {
> +			printk(KERN_ERR "onenand_read_oob_nolock: read failed = 0x%x\n", ret);
> +			break;
> +		}

What about -EUCLEAN?

Jörn

-- 
It is better to die of hunger having lived without grief and fear,
than to live with a troubled spirit amid abundance.
-- Epictetus
