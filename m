Subject: Re: [PATCH v2] MTD: fix m25p80 64-bit divisions
From: David Woodhouse <dwmw2@infradead.org>
To: Artem Bityutskiy <dedekind@infradead.org>
In-Reply-To: <20081218110927.29710.97896.sendpatchset@localhost.localdomain>
References: <20081218110927.29710.97896.sendpatchset@localhost.localdomain>
Content-Type: text/plain
Date: Thu, 18 Dec 2008 11:50:34 +0000
Message-Id: <1229601034.4619.987.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-12-18 at 13:09 +0200, Artem Bityutskiy wrote:
> 
> -       dev_info(&spi->dev, "%s (%d Kbytes)\n", info->name,
> -                       flash->mtd.size / 1024);
> +       dev_info(&spi->dev, "%s (%llu Kbytes)\n", info->name,
> +                       flash->mtd.size >> 10);

You can't assume that a uint64_t is unsigned long long. Sometimes it's
just a long. 

I don't think we have format specifiers for uint64_t; I think the best
way to do it is still to cast the argument to unsigned long long:

-       dev_info(&spi->dev, "%s (%d Kbytes)\n", info->name,
-                       flash->mtd.size / 1024);
+       dev_info(&spi->dev, "%s (%llu Kbytes)\n", info->name,
+                       (unsigned long long)flash->mtd.size >> 10);

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
