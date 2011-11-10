Received: from smtp1-g21.free.fr ([212.27.42.1])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ROadB-00023f-J5
 for linux-mtd@lists.infradead.org; Thu, 10 Nov 2011 19:49:50 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH v3] mtd: nand: Add driver for M-sys / Sandisk diskonchip G4
References: <1320441908-9684-1-git-send-email-mikedunn@newsguy.com>
Date: Thu, 10 Nov 2011 20:49:34 +0100
In-Reply-To: <1320441908-9684-1-git-send-email-mikedunn@newsguy.com> (Mike
 Dunn's message of "Fri, 4 Nov 2011 14:25:08 -0700")
Message-ID: <87lirnkbap.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mike Dunn <mikedunn@newsguy.com> writes:

> This is a nand driver for the diskonchip G4 in my Palm Treo680.  It's been
> fairly well tested; it passes the nandtest utility in mtd-utils, and also the
> kernel tests mtd_pagetest and mtd_readtest.  Common mtd-utils work as well
> (nanddump, nandwrite, flash_erase, ...).  A ubifs was created on it and seems
> to be working well, though more stress testing is needed.
Hi Mike,

> +static void docg4_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
> +{
> +	int i;
> +	struct nand_chip *nand = mtd->priv;
> +	uint16_t *p = (uint16_t *) buf;
> +	len >>= 1;
Is it granted that len is an even number ? Or did you mean here docg4_read_buf16
as a function name (on the same naming as the writing one below) ?

...zip...

> +	writew(DOCG4_SEQ_PAGEPROG, docptr + DOC_FLASHSEQUENCE);
> +	writew(DOC_CMD_PROG_CYCLE2, docptr + DOC_FLASHCOMMAND);
> +	doc_nop(docptr);
> +	doc_nop(docptr);
> +	docg4_wait(mtd, nand);
> +	writew(DOCG4_SEQ_FLUSH, docptr + DOC_FLASHSEQUENCE);
> +	writew(DOC_CMD_READ_STATUS, docptr + DOC_FLASHCOMMAND);
> +	writew(DOC_ECCCONF0_READ_MODE | 4, docptr + DOC_ECCCONF0);
> +	doc_nop(docptr);
> +	doc_nop(docptr);
> +	doc_nop(docptr);
> +	doc_nop(docptr);
> +	doc_nop(docptr);
Wouldn't that be better doc_nop(docptr, 5) ?

...zip...

> +static int docg4_write_oob(struct mtd_info *mtd, struct nand_chip *nand,
> +			   int page)
> +{
> +	/*
> +	 * This is not really supported, because MLC nand must write oob bytes
> +	 * at the same time as page data.

I don't think that's true. The docg3 is an MLC, with NAND memory, and page data
can be written, and the in a subsequent write oob data can be written.
I think it's more the NAND kernel interface which drives that (and maybe NAND
interface specification, I don't know).

> +static int __init read_factory_bbt(struct mtd_info *mtd)
> +{
> +	/*
> +	 * The device contains a factory bad block table on page 4, but the
> +	 * table is not updated by this driver.  Instead, this function is
> +	 * called during initialization to read it and update the memory-based
> +	 * bbt accordingly.
> +	 */
> +
> +	/* TODO: figure out how to interpret the table; mine is all ff's */
If it's the same as on docg3, each bit is a marker for one block, and the
following formula could apply:
          is_good = bbt[block >> 3] & (1 << (block & 0x7));

> +	retval = mtd_device_register(mtd, NULL, 0);
> +	if (retval)
> +		goto fail;
> +
> +	if (pdata->nr_partitions > 0) {
> +		int i;
> +		for (i = 0; i < pdata->nr_partitions; i++)
> +			pdata->partitions[i].ecclayout = &docg4_oobinfo;
> +		retval = mtd_device_register(mtd, pdata->partitions,
> +					     pdata->nr_partitions);
> +	}
Why not use mtd_device_parse_register(), which will handle handle partitions and
device registration at the same time ?

Cheers.

-- 
Robert
