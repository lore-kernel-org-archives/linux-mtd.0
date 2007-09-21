Received: from adicia.telenet-ops.be ([195.130.132.56])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IYdiT-0007Kz-75
	for linux-mtd@lists.infradead.org; Fri, 21 Sep 2007 04:18:30 -0400
Date: Fri, 21 Sep 2007 10:18:05 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
Sender: geert@linux-m68k.org
To: Matteo Croce <technoboy85@gmail.com>
Subject: Re: [PATCH][MIPS][2/7] AR7: mtd partition map
In-Reply-To: <200709202129.12261.technoboy85@gmail.com>
Message-ID: <Pine.LNX.4.64.0709211017120.5097@anakin>
References: <200709201728.10866.technoboy85@gmail.com>
	<20070920175204.GA26132@lst.de>
	<200709202034.21764.technoboy85@gmail.com>
	<200709202129.12261.technoboy85@gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mips@linux-mips.org, Felix Fietkau <nbd@openwrt.org>,
	Eugene Konev <ejka@imfi.kspu.ru>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>, dwmw2@infradead.org,
	Christoph Hellwig <hch@lst.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 20 Sep 2007, Matteo Croce wrote:
> +static int create_mtd_partitions(struct mtd_info *master,
> +				 struct mtd_partition **pparts,
> +				 unsigned long origin)
> +{

    [...]

> +		master->read(master, offset,
> +			sizeof(header), &len, (u_char *)&header);
                                              ^^^^^^^^^^^
Probably we should teach mtd to use `void *' for read and write buffers,
so all these ugly casts can go away...

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
