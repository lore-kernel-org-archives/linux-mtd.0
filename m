Received: from n19.bullet.mail.mud.yahoo.com ([68.142.206.146])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M6wIw-00037m-TM
	for linux-mtd@lists.infradead.org; Thu, 21 May 2009 00:38:45 +0000
From: David Brownell <david-b@pacbell.net>
To: davinci-linux-open-source@linux.davincidsp.com,
 nsnehaprabha@ti.com
Subject: Re: [PATCH 2.6.30-rc6 3/3] NAND: Add 4-bit ECC support for large page
	NAND chips
Date: Wed, 20 May 2009 17:38:24 -0700
References: <1242682705-19845-1-git-send-email-nsnehaprabha@ti.com>
In-Reply-To: <1242682705-19845-1-git-send-email-nsnehaprabha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200905201738.24479.david-b@pacbell.net>
Cc: dwmw2@infradead.org, tglx@linutronix.de, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Minor comment:  $SUBJECT should say it adds this "for DaVinci".  ;)

To recap other discussion (I hope), this needs to be reissued since:

On Monday 18 May 2009, nsnehaprabha@ti.com wrote:
> +static struct nand_ecclayout hwecc4_2048 __initconst = {
> +       .eccbytes = 40,
> +       .eccpos = { 0, 1, 2, 3, 4,

Byte 0 -- for 8-bit large-page parts which need this patch -- is
the manufacturer bad block marker, and the idea was to *not* clobber
it.  Those bytes need to be skipped.

Will the 40 bytes of ECC data now be stored at offsets 24..63,
matching Troy's patches?

	0..1	manufacturer badblock markers
	8..11	BBT marker ("free" oob data)
	16..23	JFFS2 stuff ("free" oob data)
	24..63	ECC data

And for 4KB pages, it would be the same -- except that
there would be 80 bytes of ECC data, from 48..127 (too
much to fit into the eccpos array).


> +               /* offset 5 holds the badblock marker */
> +               6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
> +               /* 8 bytes at offset 16 hold JFFS2 clean markers */
> +               24, 25, 26, 27, 28,
> +               29, 30, 31, 32, 33, 34, 35, 36, 37, 38,
> +               39, 40, 41, 42, 43, 44, 45, 46, 47, 48, },
> +       .oobfree = {
> +               {.offset = 16, .length = 8, },
> +               {.offset = 49, },
> +       },
> +};
