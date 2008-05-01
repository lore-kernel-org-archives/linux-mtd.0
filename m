Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JrfLX-0001Sw-KO
	for linux-mtd@lists.infradead.org; Thu, 01 May 2008 20:25:40 +0000
Date: Thu, 1 May 2008 22:25:28 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: [PATCH][RFC] NAND subpage read feature. Take 2.
Message-ID: <20080501202523.GA17828@logfs.org>
References: <Pine.LNX.4.64.0804301301360.6788@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.64.0804301301360.6788@pentafluge.infradead.org>
Cc: dwmw2@infradead.org, tglx@linutronix.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 30 April 2008 13:13:24 +0100, Alexey Korolev wrote:
> 
> This patch enables NAND subpage read functionality. 

...and creates a peculiar conflict of interests in me.  I've added full
caching of the complete mtd in logfs, which gave a huge speedup to some
of my testcases.  However caching is done in page granularity, therefore
it would completely defeat this patch, which also gives a speedup.

But until I can figure out how to combine both benefits, this looks
rather promising and should clearly get in.

>  /**
> + * nand_read_subpage - [REPLACABLE] software ecc based sub-page read function
> + * @mtd:	mtd info structure
> + * @chip:	nand chip info structure
> + * @dataofs	offset of requested data within the page 
> + * @readlen	data length 
> + * @buf:	buffer to store read data
> + */
> +static int nand_read_subpage(struct mtd_info * mtd,struct nand_chip *chip, uint32_t data_offs, uint32_t readlen, uint8_t *bufpoi)
                                                 ^   ^^
A linebreak would help.  The indicated space should move five bytes to
the right.  And there are a few similar stylistic things below.  If you
feed this through checkpatch.pl, you should find them all.

buf and bufpoi should be the same name (I personally would prefer buf).
And you should document that the buffer has to be bigger than readlen.
There is just a single caller, but such a counter-intuitive detail can
easily cause bugs some years from now.

> +{
> +	int start_step, end_step, num_steps;
> +	uint32_t *eccpos = chip->ecc.layout->eccpos;
> +	uint8_t *p;
> +	int data_col_addr, i, gaps = 0;
> +	int datafrag_len, eccfrag_len, aligned_len, aligned_pos;
> +	int busw = (chip->options & NAND_BUSWIDTH_16) ? 2 : 1;
> +	
> +	/* Column address wihin the page aligned to ECC size (256bytes). */

within

> +	start_step = data_offs / chip->ecc.size;
> +	end_step = (data_offs + readlen - 1) / chip->ecc.size;

Divisions are fairly expensive computations.  Can they be replaced by
shifts?

Rest looks good to me, apart from some checkpatch-type details.
Although I am tired and could have missed something.

Jörn

-- 
Joern's library part 9:
http://www.scl.ameslab.gov/Publications/Gus/TwelveWays.html
