Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYq4q-000500-CG
 for linux-mtd@lists.infradead.org; Mon, 17 Dec 2018 10:24:46 +0000
Date: Mon, 17 Dec 2018 11:24:18 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] mtd: implement proper partition handling
Message-ID: <20181217112418.754d37ee@bbrezillon>
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

>  /* Returns the size of the entire flash chip */
>  uint64_t mtd_get_device_size(const struct mtd_info *mtd)
>  {
>  	if (!mtd_is_partition(mtd))
>  		return mtd->size;
>  
> -	return mtd_get_device_size(mtd_to_part(mtd)->parent);
> +	return mtd_get_device_size(mtd->parent);

Not really related to the patch, but this function only works if you
have a single level of partitioning. If we want it to work for
recursive partitioning we should have something like this:

u64 mtd_get_device_size(const struct mtd_info *mtd)
{
	while (mtd->parent)
		mtd = mtd->parent;

	return mtd->size;
}
