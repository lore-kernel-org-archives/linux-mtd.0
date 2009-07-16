Received: from smtpauth00.csee.onr.siteprotect.com ([64.26.60.144])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MRaoi-0002xs-PM
	for linux-mtd@lists.infradead.org; Thu, 16 Jul 2009 23:56:53 +0000
Message-ID: <4A5FBE35.1030908@boundarydevices.com>
Date: Thu, 16 Jul 2009 16:56:37 -0700
From: Troy Kisky <troy.kisky@boundarydevices.com>
MIME-Version: 1.0
To: nsnehaprabha@ti.com
Subject: Re: [PATCH v3 3/3] mtd-nand: DaVinci: Add 4-bit ECC support for large
	page NAND chips
References: <1247781590-11323-1-git-send-email-nsnehaprabha@ti.com>
In-Reply-To: <1247781590-11323-1-git-send-email-nsnehaprabha@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: davinci-linux-open-source@linux.davincidsp.com,
	Sandeep Paulraj <s-paulraj@ti.com>,
	linux-mtd@lists.infradead.org, tglx@linutronix.de,
	dwmw2@infradead.org, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nsnehaprabha@ti.com wrote:
> +/* An ECC layout for using 4-bit ECC with large-page (2048bytes) flash,
> + * storing ten ECC bytes plus the manufacturer's bad block marker byte,
> + * and not overlapping the default BBT markers.
> + */
> +static struct nand_ecclayout hwecc4_2048 __initconst = {
> +	.eccbytes = 40,
> +	.eccpos = {
> +		/* at the end of spare sector */
> +		24, 25, 26, 27, 28, 29,	30, 31, 32, 33,
> +		34, 35, 36, 37, 38, 39,	40, 41, 42, 43,
> +		44, 45, 46, 47, 48, 49, 50, 51, 52, 53,
> +		54, 55, 56, 57, 58, 59, 60, 61, 62, 63,
> +		},
> +	.oobfree = {
> +		/* 1 byte at offset 0 holds manufacturer badblock marker */
> +		{.offset = 1, .length = 23, },
> +		/* 5 bytes at offset 8 hold BBT markers */
> +		/* 8 bytes at offset 16 hold JFFS2 clean markers */
> +	},
> +};

I hate to sound like a broken record, but

If the bad block marker is only 1 byte. Don't you need to override

static struct nand_bbt_descr largepage_flashbased = {
	.options = NAND_BBT_SCAN2NDPAGE,
	.offs = 0,
	.len = 2,
	.pattern = scan_ff_pattern
};

I think it is easier just to leave it as 2 bytes. That may
allow substituting a different manufacturers chip too.
