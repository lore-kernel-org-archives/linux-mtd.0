Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYrQ4-000761-O8
 for linux-mtd@lists.infradead.org; Mon, 17 Dec 2018 11:50:46 +0000
Date: Mon, 17 Dec 2018 12:50:31 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] mtd: implement proper partition handling
Message-ID: <20181217125031.4ebe9542@bbrezillon>
In-Reply-To: <20181211174302.9913-1-miquel.raynal@bootlin.com>
References: <20181211174302.9913-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 11 Dec 2018 18:43:02 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

>  int del_mtd_partitions(struct mtd_info *mtd)
>  {
> -	struct mtd_part *slave, *next;
> -	int ret, err = 0;
> +	int ret;
> +
> +	pr_info("Deleting MTD partitions on \"%s\":\n", mtd->name);
>  
>  	mutex_lock(&mtd_partitions_mutex);

Can we find a way to turn this global lock into a per-mtd-object lock?
It probably requires reworking the implementation to make lockdep
happy, but that should be doable.

> -	list_for_each_entry_safe(slave, next, &mtd_partitions, list)
> -		if (slave->parent == mtd) {
> -			ret = __mtd_del_partition(slave);
> -			if (ret < 0)
> -				err = ret;
> -		}
> +	ret = __del_mtd_partitions(mtd);
>  	mutex_unlock(&mtd_partitions_mutex);
>  
> -	return err;
> +	return ret;
>  }
>  

Do you have a good reason for creating __del_mtd_partitions()? Looks
like it's only used by del_mtd_partitions().
