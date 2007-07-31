Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
From: David Woodhouse <dwmw2@infradead.org>
To: Jared Hulbert <jaredeh@gmail.com>
In-Reply-To: <6934efce0707261704p5e46e238i5b7ee433fc4f5bda@mail.gmail.com>
References: <6934efce0707261704p5e46e238i5b7ee433fc4f5bda@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Jul 2007 12:55:32 +0100
Message-Id: <1185882932.3083.98.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dhowells <dhowells@redhat.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-07-26 at 17:04 -0700, Jared Hulbert wrote:
> +/*
> + * Allow other modules to get the physical address of a given partition
> + */
> +void *mtd_get_partition_physaddr(struct mtd_info *mtd)
> +{
> +       struct mtd_part *part = PART(mtd);
> +       struct map_info *map = part->master->priv;
> +       
> +       return (void *)(map->phys + part->offset);
> +}
> +EXPORT_SYMBOL_GPL(mtd_get_partition_physaddr); 

The problem with this is that it expects the caller to 'know' that the
mtd device it's using is in fact a partition. If we have to do this, I'd
rather see it done generically. Jörn is probably right that it should be
available from (whatever replaces) the point() method.

-- 
dwmw2
