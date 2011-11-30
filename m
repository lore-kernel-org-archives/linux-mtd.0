Received: from smtp1.newsguy.com ([74.209.136.71])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RVnwE-0000GS-OT
 for linux-mtd@lists.infradead.org; Wed, 30 Nov 2011 17:27:19 +0000
Message-ID: <4ED66140.8020008@newsguy.com>
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/5] MTD: modify mtd api to return bitflip info on read
 operations
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Cc: thomas.petazzoni@free-electrons.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Wed, 30 Nov 2011 17:27:19 -0000

Thanks Thomas.  For some reason this post never made it to my inbox.  Pasted from the list archive...

Le Mon, 28 Nov 2011 17:01:17 -0800,
Mike Dunn <mikedunn at newsguy.com <http://lists.infradead.org/mailman/listinfo/linux-mtd>> a écrit :

>/ +	/*
/>/ +	 * max_bitflips returns to caller the greatest number of bit errors
/>/ +	 * corrected on any one minimum i/o unit (e.g., nand page)
/>/ +	 */
/>/ +	int (*read) (struct mtd_info *mtd, loff_t from, size_t len,
/>/ +		     size_t *retlen, u_char *buf, unsigned int *max_bitflips);
/>/  
/>/ -	int (*read) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
/
> Making this change in patch 1 will break the build if someone bisects
> kernel changes between patch 1 and your other patches.


Then I guess it should be a single patch.  As a general rule, should individual patches 
not be interdependent?


> Also, seeing the large number of users that don't use/need the new
> max_bitflips argument, wouldn't it be better to add a new, separate
> ->readext() operation (or another better name) ? This would probably
> reduce the patch size quite a bit.


Well, then it wouldn't be a generic mtd read operation, and higher layers would have to be 
aware of the type of device and call the appropriate read function.
Fewer drivers would need to be patched, but patches to infrastructure code would be complicated 
and make the resulting code ugly, I think.


> Also, another option is to allow max_bitflips to be NULL, which would
> simplify things such as :

> +	unsigned int max_bitflips;
 
> -	ret = mtd->read(mtd, ptr, sizeof(fs), &sz, (u_char *) &fs);
> +	ret = mtd->read(mtd, ptr, sizeof(fs), &sz, (u_char *) &fs,
> +			&max_bitflips);


> to

> -	ret = mtd->read(mtd, ptr, sizeof(fs), &sz, (u_char *) &fs);
> +	ret = mtd->read(mtd, ptr, sizeof(fs), &sz, (u_char *) &fs,
> +			NULL);

> and would therefore avoid the need for defining an useless variable.


Yes, you're right.  I will do this in the next patch.


> Another question: is the max_bitflips information sufficient (i.e on a
> large read with multiple pages, you will only get the value for the
> worst page) ? Don't you need the bitflip count on a per-page basis ?


I'm not a flash expert, but I think that the greatest number of bitflips on any one page 
is a sufficient diagnostic of the integrity of an eraseblock.  One bad page will make the 
entire eraseblock unusable, so I'm not sure it's useful to report bitflips for specific pages.  
Maybe some other statistics would be useful, such as the total number of bitflips during the 
read operation, but I didn't want to make it unnecesarily complicated, and it's a vast 
improvement over the current state of affairs.

Thanks again Thomas.  I hope some others will offer opinions.  Resolving this is the first step toward 
getting a robust ubifs on my nand flash!

Mike
