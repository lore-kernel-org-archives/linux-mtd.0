Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jt5LB-0007B3-Iu
	for linux-mtd@lists.infradead.org; Mon, 05 May 2008 18:23:09 +0000
Date: Mon, 5 May 2008 20:23:00 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Justin Treon <justin_treon@yahoo.com>
Subject: Re: [Patch][MTD][NAND] Rodan NAND controller
Message-ID: <20080505182300.GA18494@logfs.org>
References: <567477.3675.qm@web43132.mail.sp1.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <567477.3675.qm@web43132.mail.sp1.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2 May 2008 15:04:39 -0700, Justin Treon wrote:
>
> +const static struct mtd_partition partition_info[] = {
> +	{
> +	 .name = "IMFT NAND",
> +	 .offset = 0,
> +	 .size = 256 * 1024 * 1024}
> +};

It took me a third look to find the closing brace.

> +	/* Initialize structures */
> +	memset((char *)rodan_mtd, 0, sizeof(struct mtd_info));
> +	memset((char *)this, 0, sizeof(struct nand_chip));

The casts don't seem necessary.

Otherwise looks fine to me.  So module the cosmetics, it is
Acked-By: Joern Engel <joern@logfs.org>

Jörn

-- 
Do not stop an army on its way home.
-- Sun Tzu
