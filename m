Subject: Re: [patch/rfc 2.6.29 1/2] MTD: driver model updates
From: David Woodhouse <dwmw2@infradead.org>
To: David Brownell <david-b@pacbell.net>
In-Reply-To: <200903260042.42091.david-b@pacbell.net>
References: <200903260042.42091.david-b@pacbell.net>
Content-Type: text/plain
Date: Fri, 03 Apr 2009 11:04:22 +0100
Message-Id: <1238753062.3711.109.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Kay Sievers <kay.sievers@vrfy.org>,
	Linux MTD <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-03-26 at 00:42 -0700, David Brownell wrote:
> 
> @@ -343,6 +343,11 @@ static struct mtd_part *add_one_partitio
>         slave->mtd.name = part->name;
>         slave->mtd.owner = master->owner;
>  
> +       /* NOTE:  we don't arrange MTDs as a tree; it'd be error-prone
> +        * to have the same data be in two different partitions.
> +        */
> +       slave->mtd.dev.parent = master->dev.parent;

Can you elaborate on that? I think we _do_ want to arrange partitions as
sub-devices of the master, don't we? And I'd rather not change the way
they appear at a later date; I'd prefer them to be that way from the
beginning.

>         slave->mtd.read = part_read;
>         slave->mtd.write = part_write;
>  
> @@ -493,7 +498,9 @@ out_register:
>   * This function, given a master MTD object and a partition table, creates
>   * and registers slave MTD objects which are bound to the master according to
>   * the partition definitions.
> - * (Q: should we register the master MTD object as well?)
> + *
> + * We don't register the master, or expect the caller to have done so,
> + * for reasons of data integrity.
>   */

Again, can you elaborate?

A lot of devices do just that. Where you have a partition table of some
kind that's actually stored on the flash, that might be the only way to
access it.

I really don't like the way our partitioning works at the moment.

-- 
dwmw2
