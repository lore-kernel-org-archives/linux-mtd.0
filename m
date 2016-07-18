Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bP3Yb-0004DN-SP
 for linux-mtd@lists.infradead.org; Mon, 18 Jul 2016 08:05:43 +0000
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [RFC][PATCH] ubi: Implement a read cache
From: David Gstir <david@sigma-star.at>
In-Reply-To: <1468587454-7590-1-git-send-email-richard@nod.at>
Date: Mon, 18 Jul 2016 10:05:18 +0200
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com,
 computersforpeace@gmail.com
Content-Transfer-Encoding: 7bit
Message-Id: <EE3158AD-DBBB-489A-8075-8DD32BC5AAF0@sigma-star.at>
References: <1468587454-7590-1-git-send-email-richard@nod.at>
To: Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

> On 15.07.2016, at 14:57, Richard Weinberger <richard@nod.at> wrote:

<snip>

> +static int read_cache_init(struct ubi_device *ubi)
> +{
> +	int i;
> +	struct ubi_read_cache_line *line;
> +	struct ubi_read_cache *read_cache = kzalloc(sizeof(*read_cache),
> +						    GFP_KERNEL);
> +
> +	if (!read_cache)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < UBI_READ_CACHE_LINES; i++) {
> +		line = &read_cache->lines[i];
> +
> +		mutex_init(&line->line_lock);
> +		line->buf = kmalloc(ubi->mtd->writesize, GFP_KERNEL);
> +		line->pnum = line->offset = -1;
> +		if (!line->buf)
> +			goto err_nomem;
> +	}
> +
> +	read_cache->buflen = ubi->mtd->writesize;
> +
> +	ubi->read_cache = read_cache;
> +
> +	return 0;
> +
> +err_nomem:
> +	for (i = 0; i < UBI_READ_CACHE_LINES; i++) {
> +		line = &read_cache->lines[i];
> +		kfree(line->buf);
> +	}

You're missing a kfree(read_cache); here. :)

> +
> +	return -ENOMEM;
> +}
> 

Will test the patch today.

-David
