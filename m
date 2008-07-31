Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KOQwC-0001ht-O0
	for linux-mtd@lists.infradead.org; Thu, 31 Jul 2008 05:43:00 +0000
Subject: Re: [patch 02/13] jffs2 summary allocation: don't use vmalloc()
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Brownell <david-b@pacbell.net>
In-Reply-To: <200807302210.00307.david-b@pacbell.net>
References: <200807301934.m6UJYvtA012276@imap1.linux-foundation.org>
	<20080730223924.3C51136129C@adsl-69-226-248-13.dsl.pltn13.pacbell.net>
	<20080730154618.65a25c67.akpm@linux-foundation.org>
	<200807302210.00307.david-b@pacbell.net>
Content-Type: text/plain; charset=utf-8
Date: Thu, 31 Jul 2008 08:37:41 +0300
Message-Id: <1217482661.9048.74.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, trimarchimichael@yahoo.it,
	Andrew Morton <akpm@linux-foundation.org>, dwmw2@infradead.org,
	jwboyer@gmail.com, rmk@arm.linux.org.uk
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 2008-07-30 at 22:10 -0700, David Brownell wrote:
> -	int (*read) (struct mtd_info *mtd, loff_t from, size_t len, size_t *ret=
len, u_char *buf);
> -	int (*write) (struct mtd_info *mtd, loff_t to, size_t len, size_t *retl=
en, const u_char *buf);
> +	/*
> +	 * Read/write operations are given *VIRTUAL* addresses, which
> +	 * must not be passed as-is to dma mapping operations.
> +	 */
> +	int (*read) (struct mtd_info *mtd, loff_t from,
> +			size_t len, size_t *retlen, u_char *virt);
> +	int (*write) (struct mtd_info *mtd, loff_t to,
> +			size_t len, size_t *retlen, const u_char *virt);
> =20
>  	/* In blackbox flight recorder like scenarios we want to make successfu=
l
>  	   writes in interrupt context. panic_write() is only intended to be

Can SPI driver detect if the memory was kmalloc()'ed or vmalloc()'ed? Or
if not, we could add one more argument to read()/write() which tells
whether the memory is contiguous or not. Then the driver would chose how
to deal with the buffer.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
