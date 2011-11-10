Received: from smtp.newsguy.com ([74.209.136.69])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ROcCi-00063E-Rp
 for linux-mtd@lists.infradead.org; Thu, 10 Nov 2011 21:30:38 +0000
Message-ID: <4EBC504C.5000008@newsguy.com>
Date: Thu, 10 Nov 2011 14:29:32 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v3] mtd: nand: Add driver for M-sys / Sandisk diskonchip G4
References: <1320441908-9684-1-git-send-email-mikedunn@newsguy.com>
 <87lirnkbap.fsf@free.fr>
In-Reply-To: <87lirnkbap.fsf@free.fr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Robert, thanks for taking a look and commenting.

On 11/10/2011 11:49 AM, Robert Jarzmik wrote:
> Mike Dunn <mikedunn@newsguy.com> writes:
>
>> This is a nand driver for the diskonchip G4 in my Palm Treo680.  It's been
>> fairly well tested; it passes the nandtest utility in mtd-utils, and also the
>> kernel tests mtd_pagetest and mtd_readtest.  Common mtd-utils work as well
>> (nanddump, nandwrite, flash_erase, ...).  A ubifs was created on it and seems
>> to be working well, though more stress testing is needed.
> Hi Mike,
>
>> +static void docg4_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
>> +{
>> +	int i;
>> +	struct nand_chip *nand = mtd->priv;
>> +	uint16_t *p = (uint16_t *) buf;
>> +	len >>= 1;
> Is it granted that len is an even number ? Or did you mean here docg4_read_buf16
> as a function name (on the same naming as the writing one below) ?


Yes, len is even, because nand_base knows that buswidth is 16 bits.  Actually
this is not my code.  This and docg4_write_buf16() were cut verbatum from
nand_base.c and renamed.  I had to duplicate this code because nand_scan_ident()
is not called and the defaults are set within that call chain (inappropriate
place, IMHO).  The functions are not exported.  Fortunately these two trivial
functions are the only instances of redundant code.  Good catch, though.  I
should be consistent and call it docg4_read_buf16(), and/or add a comment
explaining count refers to 16 bit half-words.


> ...zip...
>
>> +	writew(DOCG4_SEQ_PAGEPROG, docptr + DOC_FLASHSEQUENCE);
>> +	writew(DOC_CMD_PROG_CYCLE2, docptr + DOC_FLASHCOMMAND);
>> +	doc_nop(docptr);
>> +	doc_nop(docptr);
>> +	docg4_wait(mtd, nand);
>> +	writew(DOCG4_SEQ_FLUSH, docptr + DOC_FLASHSEQUENCE);
>> +	writew(DOC_CMD_READ_STATUS, docptr + DOC_FLASHCOMMAND);
>> +	writew(DOC_ECCCONF0_READ_MODE | 4, docptr + DOC_ECCCONF0);
>> +	doc_nop(docptr);
>> +	doc_nop(docptr);
>> +	doc_nop(docptr);
>> +	doc_nop(docptr);
>> +	doc_nop(docptr);
> Wouldn't that be better doc_nop(docptr, 5) ?


No.  If it's a function that loops, you're inserting too much delay due to loop
overhead (unless the compiler unrolls it, but you don't know that) and you may
as well use some generic delay function and not bother with the nop register at
all.  I wanted to use the precise delay observed in the TrueFFS code to (1)
avoid too much delay for the sake of performance, (2) in case the timing is
critical and too much delay would cause problems, or (3) "nop" really isn't what
it says (i.e. no operation).  If there were a C preprocessor directive
equivalent to the assembly .rept directive, I would use it.


> ...zip...
>
>> +static int docg4_write_oob(struct mtd_info *mtd, struct nand_chip *nand,
>> +			   int page)
>> +{
>> +	/*
>> +	 * This is not really supported, because MLC nand must write oob bytes
>> +	 * at the same time as page data.
> I don't think that's true. The docg3 is an MLC, with NAND memory, and page data
> can be written, and the in a subsequent write oob data can be written.
> I think it's more the NAND kernel interface which drives that (and maybe NAND
> interface specification, I don't know).


No actually ecc.write_oob - which this function defines - is a nand interface
function.  I never observed oob-only writes while reverse engineering (read
oob-only  yes, but not write).  Can you write oob-only on the G3?  Even if it
were possible, the nand_write utility wants to write the oob *before* the page
data.  This hack allows that utility to work.  Maybe the comment should say "oob
can't be written before the page data".


>> +static int __init read_factory_bbt(struct mtd_info *mtd)
>> +{
>> +	/*
>> +	 * The device contains a factory bad block table on page 4, but the
>> +	 * table is not updated by this driver.  Instead, this function is
>> +	 * called during initialization to read it and update the memory-based
>> +	 * bbt accordingly.
>> +	 */
>> +
>> +	/* TODO: figure out how to interpret the table; mine is all ff's */
> If it's the same as on docg3, each bit is a marker for one block, and the
> following formula could apply:
>           is_good = bbt[block >> 3] & (1 << (block & 0x7));


Thanks.  Do any of your devices have bad blocks marked in this table?  Do you
know how to modify the table?


>> +	retval = mtd_device_register(mtd, NULL, 0);
>> +	if (retval)
>> +		goto fail;
>> +
>> +	if (pdata->nr_partitions > 0) {
>> +		int i;
>> +		for (i = 0; i < pdata->nr_partitions; i++)
>> +			pdata->partitions[i].ecclayout = &docg4_oobinfo;
>> +		retval = mtd_device_register(mtd, pdata->partitions,
>> +					     pdata->nr_partitions);
>> +	}
> Why not use mtd_device_parse_register(), which will handle handle partitions and
> device registration at the same time ?


Because I didn't know about it :-)

Thanks again,
Mike
