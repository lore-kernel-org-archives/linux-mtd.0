Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ObWnl-0006iw-RT
	for linux-mtd@lists.infradead.org; Wed, 21 Jul 2010 10:45:26 +0000
Subject: Re: [patch 4/4] mtdpart: memory accessor interface for MTD layer
From: Artem Bityutskiy <dedekind1@gmail.com>
To: akpm@linux-foundation.org
In-Reply-To: <201007202224.o6KMO2dm021391@imap1.linux-foundation.org>
References: <201007202224.o6KMO2dm021391@imap1.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 Jul 2010 13:38:33 +0300
Message-ID: <1279708713.2306.9.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: sudhakar.raj@ti.com, khilman@deeprootsystems.com, david-b@pacbell.net,
	linux-mtd@lists.infradead.org, cbouatmailru@gmail.com, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-07-20 at 15:24 -0700, akpm@linux-foundation.org wrote:
> From: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
> 
> Implement a memory accessor interface in the MTD layer which enables the
> kernel to access flash data.
> 
> This patch adds two new members to the mtd_partition structure, a function
> handler which will be called during setup of the partition and an argument
> to be passed to this setup function.
> 
> Example:
> +static struct mtd_partition spi_flash_partitions[] = {
> +       [0] = {
> +               .name       = "U-Boot",
> +               .offset     = 0,
> +               .size       = SZ_256K,
> +               .mask_flags = MTD_WRITEABLE,
> +       },
...

Will push this to my l2-mtd-2.6 / dunno

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
