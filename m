Received: from verein.lst.de ([213.95.11.210] helo=mail.lst.de)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IYRow-0000MM-2H
	for linux-mtd@lists.infradead.org; Thu, 20 Sep 2007 15:36:21 -0400
Date: Thu, 20 Sep 2007 21:35:49 +0200
From: Christoph Hellwig <hch@lst.de>
To: Matteo Croce <technoboy85@gmail.com>
Subject: Re: [PATCH][MIPS][2/7] AR7: mtd partition map
Message-ID: <20070920193547.GA911@lst.de>
References: <200709201728.10866.technoboy85@gmail.com>
	<20070920175204.GA26132@lst.de>
	<200709202034.21764.technoboy85@gmail.com>
	<200709202129.12261.technoboy85@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200709202129.12261.technoboy85@gmail.com>
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

On Thu, Sep 20, 2007 at 09:29:11PM +0200, Matteo Croce wrote:
> +#ifdef CONFIG_CPU_LITTLE_ENDIAN
> +#define LOADER_MAGIC1	0xfeedfa42
> +#define LOADER_MAGIC2	0xfeed1281
> +#else
> +#define LOADER_MAGIC1	0x42faedfe
> +#define LOADER_MAGIC2	0x8112edfe
> +#endif

Please keep only one defintion and use le/be32_to_cpu on it.

> +struct ar7_bin_rec {
> +	unsigned int checksum;
> +	unsigned int length;
> +	unsigned int address;
> +};

Wich means you'd need an endianess annotation here.  What about the
length and address fields, are they always native-endian unlike
the checksum field or will the need to be byte-swapped aswell?
