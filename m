Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a50up-0002ux-4X
 for linux-mtd@lists.infradead.org; Sat, 05 Dec 2015 00:41:31 +0000
Date: Sat, 5 Dec 2015 01:41:02 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: <linux-mtd@lists.infradead.org>, Linus Walleij
 <linus.walleij@linaro.org>, Simon Arlott <simon@fire.lp0.eu>
Subject: Re: [PATCH v2 5/6] mtd: partitions: pass around 'mtd_partitions'
 wrapper struct
Message-ID: <20151205014102.0417dfbb@bbrezillon>
In-Reply-To: <20151205013049.0c66d38b@bbrezillon>
References: <1449271518-118900-1-git-send-email-computersforpeace@gmail.com>
 <1449271518-118900-6-git-send-email-computersforpeace@gmail.com>
 <20151205013049.0c66d38b@bbrezillon>
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

On Sat, 5 Dec 2015 01:30:49 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> How about defining a new function to encourage mtd drivers to pass an
> mtd_partitions structure instead of the parts + nr_parts arguments.
> Note that I don't ask to update all call sites, but only to add a new
> function and transform mtd_device_parse_register() into a wrapper.
> 
> int mtd_device_parse_and_register_parts(struct mtd_info *mtd,
> 					const char *const *types,
> 					const struct mtd_partitions *parts)
> {
> 	struct mtd_partitions parsed = { };
> 	int ret;
> 
> 	ret = parse_mtd_partitions(mtd, types, &parsed, parser_data);
> 	if (!ret)

Should be

	if (!ret && parsed.nr_parts > 0)
> 		parts = &parsed;
> 
> 	if (!parts || !parts->nr_parts) {
> 		/* Didn't come up with parsed OR fallback partitions */
>   		pr_info("mtd: failed to find partitions; one or more parsers reports errors (%d)\n",
>   			ret);
>   		/* Don't abort on errors; we can still use unpartitioned MTD */
> 	}
> 
> 	ret = mtd_add_device_partitions(mtd, &parsed);
>   	if (ret)
>   		goto out;

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
