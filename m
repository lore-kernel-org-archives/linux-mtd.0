Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Ffc8s-00019W-3m
	for linux-mtd@lists.infradead.org; Mon, 15 May 2006 08:25:44 -0400
Date: Mon, 15 May 2006 14:25:35 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Belyakov, Alexander" <alexander.belyakov@intel.com>
Message-ID: <20060515122535.GA26656@wohnheim.fh-wedel.de>
References: <F048F58F304F0040BC3E937DE4E231E701F9F027@NNSMSX401>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F048F58F304F0040BC3E937DE4E231E701F9F027@NNSMSX401>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: mtdconcat NAND/Sibley support (revised)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 5 May 2006 16:08:21 +0400, Belyakov, Alexander wrote:
> 
> +concat_writev_ecc (struct mtd_info *mtd, const struct kvec *vecs,
> unsigned long count, 

Your mailer is eating this patch.  Can you either fix your mailer and
resend, resend with a different mailer or resend as attachment?
Inline patch is preferred.

Also, the lines were >80 columns before your mailer mangled them.

> +	return (concat_writev_ecc(mtd, vecs, count, to, retlen, NULL,
> NULL));

Remove redundant brackets.

> +concat_writev_ecc (struct mtd_info *mtd, const struct kvec *vecs,
                    ^
Remove space

> unsigned long count, 
> +		loff_t to, size_t * retlen, u_char *eccbuf, struct
                                   ^
and here.

> +	/* Calculate total length of data */
> +	for (i = 0; i < count; i++)
> +		total_len += vecs[i].iov_len;
> +		
   ^^^^^^^^^^^^^
Remove whitespace damage

> +		DEBUG (MTD_DEBUG_LEVEL0, "concat_writev_ecc(): Attempted
                     ^
> +    
   ^^^^

etc.

For some things, I'd like to apply the patch and use tkdiff to see
more than three lines of context.  So this is not a final review, but
just a "resend with sane mailer" plus a few cosmetics, while we're at
it.

Jörn

-- 
Beware of bugs in the above code; I have only proved it correct, but
not tried it.
-- Donald Knuth
