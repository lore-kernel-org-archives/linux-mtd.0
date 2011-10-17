Received: from smtp.newsguy.com ([74.209.136.69])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RFv0r-0008Nq-Qm
	for linux-mtd@lists.infradead.org; Mon, 17 Oct 2011 21:46:27 +0000
Message-ID: <4E9CA204.8000904@newsguy.com>
Date: Mon, 17 Oct 2011 14:45:40 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] Add driver for M-sys / Sandisk diskonchip G4 nand flash
References: <1318258091-12670-1-git-send-email-mikedunn@newsguy.com>
	<8762jtlx19.fsf@free.fr>
In-Reply-To: <8762jtlx19.fsf@free.fr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: marek.vasut@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Robert,

Thanks for looking through the code.  Most of your review points are well
taken.  I'm curious about where you came up with the names you suggest for the
hard-coded values.  You may have more insight into the inner workiings of the
device than I do.  Let me digest them, and also look through your G3 code to try
to gain some of that insight myself.

A few responses below...

i
On 10/12/2011 02:28 PM, Robert Jarzmik wrote:
>
>> +static int docg4_wait(struct mtd_info *mtd, struct nand_chip *nand)
>> +{
>> +	uint16_t flash_status;
>> +	struct docg4_priv *doc = nand->priv;
>> +	void __iomem *docptr = doc->virtadr;
>> +	unsigned long timeo = jiffies + (HZ * 10);
> Does that work with NO_HZ configurations ?


Not sure.  I'm currently not too knowlegeable on timers, and I'm not using this
config option in my kernel.  Will look into this.  Meantime, suggestions,
pointers to reference docs, etc greatly appreciated!


> Why not use a loop of mdelay() or msleep() or doc_nops() bellow ?
> I would prefer doc nops, as the time of these is controlled by the chip itself,
> and thus less dependant on the CPU frequency.


I'm not simply delaying, I'm polling register 0x1038 (I'm calling it
DOCG4_CONTROL_STATUS).  The diskonchip P3 uses this same register in exactly the
same way, so it's likely the G3 does as well.  With regard to the diskonchip nop
register, I was careful to preserve the same number of reads of that register in
the same places as was observed during reverse engineering, to prevent
timing-related failures.


>
>
>> +
>> +	if (doc->status) {
>> +		int stat = doc->status;
>> +		doc->status = 0;
>> +		return stat;
>> +	}
>> +
>> +	/* hardware quirk of g4 requires reading twice initially */
>> +	flash_status = readw(docptr + DOCG4_CONTROL_STATUS);
>> +	flash_status = readw(docptr + DOCG4_CONTROL_STATUS);
>> +
>> +	while (!(flash_status & DOCG4_FLASH_READY)) {
>> +		if (time_after(jiffies, timeo)) {
>> +			printk(KERN_ERR "docg4: docg4_wait timed out\n");
>> +			return NAND_STATUS_FAIL;
>> +		}
>> +		udelay(1);
>> +		cond_resched();
>> +		flash_status = readb(docptr + DOCG4_CONTROL_STATUS);
>> +	}
> This would be a loop, and if you perform too many iterations (ie. 10000
> iterations of 1ms), you return NAND_STATUS_FAIL, else 0.


Is this a question, a statement, suggestion, ...?  I must confess that I just
pasted this from another driver; exactly which one I don't recall.  I'm not sure
why the call to udelay() is there.  Will look into it.  But rescheduling is
appropriate.  Again, a status register is being polled, and I know from the
reverse engineering effort that some operations (e.g. block erase) take a long
time.  The timeout value was arrived at by trial-and-error, BTW.


>> +
>> +	return 0;
>> +}
>> +
>> +static void docg4_reset(struct mtd_info *mtd, struct nand_chip *nand)
>> +{
>> +	struct docg4_priv *doc = nand->priv;
>> +	void __iomem *docptr = doc->virtadr;
>> +	u16 dummy;
>> +
>> +	writew(DOCG4_RESET, docptr + DOCG4_CONTROL);
>> +	writew(~DOCG4_RESET, docptr + DOCG4_CONTROL_CONFIRM);
>> +	writew(0, docptr + DOCG4_NOP);
>> +	writew(DOCG4_NORMAL, docptr + DOCG4_CONTROL);
>> +	writew(~DOCG4_NORMAL, docptr + DOCG4_CONTROL_CONFIRM);
>> +
>> +	/* TODO: this may not be necessary... */
>> +	dummy = readw(docptr + DOCG4_CHIP_ID_0);
>> +	dummy = readw(docptr + DOCG4_MYSTERY_REG);
>> +	writew(0, docptr + DOCG4_NOP);
>> +	dummy = readw(docptr + DOCG4_CHIP_ID_0);
>> +	dummy = readw(docptr + DOCG4_MYSTERY_REG);
>> +	writew(0, docptr + DOCG4_DEV_ID_SELECT);
> The DEV_ID_SELECT part is necessary to select the correct floor I think. 


I left support for multiple cascaded chips ("floors") as a TODO.  Not aware of
any products that use multiple chips.  Are you?


> All the
> other reads could be replaced by doc_nops() I think.
> And you have docg4_select_chip() already, why not use it ?


Yeah, why DEVICE_ID_SELECT in reset?  You are correct that it is for selecting
the chip in a cascaded configuration.  I need to revisit this; hence the
"TODO"s.  But as I said, I'm not sure support for a cascaded configuration will
be useful to anyone.


>> +
>> +	/* TODO: enables ecc? Should be done prior to read? */
>> +	/* writew(0x07, docptr + DOCG4_ECC_CONTROL_1); */
>> +	writew(0x27, docptr + DOCG4_ECC_CONTROL_1); /* what's the difference? */
> This is :
>   write(DOC_ECCCONF1_PAGE_IS_WRITTEN | 7, DOCG4_ECC_CONTROL_1)
> Normally, the DOC_ECCCONF1_PAGE_IS_WRITTEN is a readonly bit, which means that
> the previously read page is not blank (has been written since erasure).


Ah, interesting.  Are you sure about read-only bit?  I observed both values
(0x07, 0x27) being written.  I'll revisit this and try to shed some more light.


>> +
>> +static int docg4_correct_data(struct mtd_info *mtd, uint8_t *buf, int page)
>> +{
>> +	struct nand_chip *nand = mtd->priv;
>> +	struct docg4_priv *doc = nand->priv;
>> +	void __iomem *docptr = doc->virtadr;
>> +	uint16_t edc_err;
>> +	int i, numerrs, errpos[5];
>> +
>> +	/* hardware quirk: read twice */
>> +	edc_err = readw(docptr + DOCG4_ECC_CONTROL_1);
>> +	edc_err = readw(docptr + DOCG4_ECC_CONTROL_1);
>> +
>> +	if (unlikely(debug))
>> +		printk(KERN_DEBUG "docg4_correct_data: "
>> +		       "status = 0x%02x\n", edc_err);
>> +
>> +	if (!(edc_err & 0x80)) { /* no error bits */
> 0x80 = DOC_ECCCONF1_BCH_SYNDROM_ERR here, which means that the hardware ecc
> verification has one not null syndrom I think.


Don't quite parse that statement, but I'm certain bit 7 is set when an ecc error
is detected.


> +
>> +static void docg4_select_chip(struct mtd_info *mtd, int chip)
>> +{
>> +#if 0
>> +	/* TODO: necessary? if so, don't just write 0! */
>> +	struct nand_chip *nand = mtd->priv;
>> +	struct docg4_priv *doc = nand->priv;
>> +	void __iomem *docptr = doc->virtadr;
>> +	writew(0, docptr + DOCG4_DEV_ID_SELECT);
> This one is necessary, but in the form :
>   writew(numFloor, docptr + DOCG4_DEV_ID_SELECT);
> You could have a look at docg3.c, function doc_set_device_id().
>
> This is necessary once, to activate the chip, or maybe after a chip full reset.


Isn't this to ensure that a process has exclusive access to the device?  This is
something a core mtd developer could answer.  Definitely need to look into
this.  I'll check your implementation as well.


>> +	writew(0x50, docptr + DOCG4_CONTROL_STATUS);
> This is :
>   writew(DOC_CTRL_CE | 0x40, docptr + DOCG4_CONTROL_STATUS)
> Which enables the chip, and for 0x40 I don't know, sorry.


Curious how you know this.  This register is not one of the ones in the M-Sys
"datasheet".  Nearly every operation starts out writing 0x50 to this register.


> +
>> +static int docg4_read_progstatus(struct docg4_priv *doc)
>> +{
>> +	/* This apparently checks the status of programming.
>> +	 * Called after an erasure, and after page data is written.
>> +	 */
>> +	void __iomem *docptr = doc->virtadr;
>> +
>> +	/* status is read from I/O reg */
>> +	uint16_t status1 = readw(docptr + DOCG4_IO);
>> +	uint16_t status2 = readw(docptr + DOCG4_IO);
>> +	uint16_t status3 = readw(docptr + DOCG4_MYSTERY_REG);
>> +
>> +	/* TODO: better way to determine failure?
>> +	   Does CONTROL_STATUS (poll_1038) indicate failure after this?
>> +	   If so, can read it from docg4_command(NAND_CMD_STATUS) ? */
>> +	if (status1 != 0x51 || status2 != 0xe0 || status3 != 0xe0) {
> This is one of the things that I don't understand yet. I'll check my write code
> and report later.


Ok thanks.  The only behaviour I ever saw was reading these values, or reading
all 0xff when an error occurred.  Need to experiment a little to answer the
question I ask.


>
>> +	writew(0, docptr + DOCG4_NOP);
>> +	writew(0, docptr + DOCG4_NOP);
>> +	docg4_wait(mtd, nand);
>> +
>> +	writew(0x29, docptr + DOCG4_SEQUENCE);
>   -> writew(DOCG4_SEQ_PROG_STATUS, docptr + DOCG4_SEQUENCE)
>> +	writew(0x70, docptr + DOCG4_COMMAND);
>   -> writew(DOC_CMD_READ_STATUS, docptr + DOCG4_SEQUENCE)
>
>> +	writew(0x8004, docptr + DOCG4_ECC_CONTROL_0);
>   -> writew(DOC_ECCCONF0_READ_MODE | 4, docptr + DOCG4_ECC_CONTROL_0)


Where did you get these names?  Can you shed light on what is being done?


>> +	writew(0, docptr + DOCG4_NOP);
>> +	writew(0, docptr + DOCG4_NOP);
>> +	writew(0, docptr + DOCG4_NOP);
>> +	writew(0, docptr + DOCG4_NOP);
>> +	writew(0, docptr + DOCG4_NOP);
> These would deserve a doc_delay(doc, 5) or doc_nops(doc, 5), which could be used
> everywhere to issue NOP commands to the chip.


Agreed.


>> +	writew(0x50, docptr + DOCG4_CONTROL_STATUS);
>> +	writew(0x00, docptr + DOCG4_SEQUENCE);
>> +	writew(0xff, docptr + DOCG4_COMMAND);
>> +	writew(0, docptr + DOCG4_NOP);
>> +	writew(0, docptr + DOCG4_NOP);
>> +	docg4_wait(mtd, nand);
> This is the sequence reset, and would deserve a doc_seq_reset() or similar name.
> It triggers :
>  - a sequence reset
>  - and more important, clears SEQUENCE error and PROTECTION error in the control
>  register.


Interesting.  Yes, that sequence of three writes to the three registers occurs
at the start of a page read, a page write, and a block erase.  So I agree should
be consolidated.  Again, you seem to have some insight into the inner workings. 
Will look through your driver code and follow up with more questions.


>> +
>> +#if 0
>> +	/* TODO: sometimes written here by TrueFFS library */
>> +	writew(0x3f, docptr + DOCG4_SEQUENCE);
>> +	writew(0xa4, docptr + DOCG4_COMMAND);
>> +	writew(0, docptr + DOCG4_NOP);
>> +#endif
> I don't understand that, but if it is not usefull, I'd recommand to remove it.


Couldn't figure out under what circumstances the extra writes occurred.  After
more testing, I'll stop wondering and remove it.


>> +
>> +	writew(0, docptr + DOCG4_NOP);
>> +	writew(0x03, docptr + DOCG4_SEQUENCE);
>> +	writew(0x00, docptr + DOCG4_COMMAND);
>> +	writew(0, docptr + DOCG4_NOP);
>> +
>> +	docg4_write_addr(doc, docg4_addr);
>> +
>> +	writew(0, docptr + DOCG4_NOP);
>> +	writew(0x30, docptr + DOCG4_COMMAND);
>   -> writew(DOC_CMD_READ_ALL_PLANES, docptr + DOCG4_COMMAND)


The G4 doesn't have planes, but the read part is probably right.


>> +	/*  TODO: 0x820f, 0xb20f, what's the difference? M512_HAMMING_EN? */
>> +	/* writew(0x820f, docptr + DOCG4_ECC_CONTROL_0) */
>> +	writew(0xb20f, docptr + DOCG4_ECC_CONTROL_0);
> Here I'm lazy with the namings, you will certainly rename these *_LEN things.
> I think that is 0x820f
>   -> writew(DOC_ECCCONF0_READ_MODE |
>             (PAGE_LEN + INFO_LEN + HAMMING_BYTE_LEN + BCH_LEN,
>             docptr + DOCG4_ECC_CONTROL_0)


This is another case where I saw both values being written at different times,
and couldn't divine the difference.  Either works, IIRC.


>
>> +
>> +	chip->cmdfunc(mtd, NAND_CMD_READ0, chip->ecc.size, page);
>> +
>> +	writew(0x8010, docptr + DOCG4_ECC_CONTROL_0);
> Here I'm lazy with the namings, you will certainly rename these *_LEN things.
>   -> writew(DOC_ECCCONF0_READ_MODE |
>             (INFO_LEN + HAMMING_BYTE_LEN + BCH_LEN + UNUSED_BYTE_len)
>             docptr + DOCG4_ECC_CONTROL_0)
>
>
>
>> +
>> +	writew(0x320f, docptr + DOCG4_ECC_CONTROL_0);
> Here I'm lazy with the namings, you will certainly rename these *_LEN things.
>   -> writew(0x2000 | DOC_ECCCONF0_HAMMING_ENABLE |
>             (PAGE_LEN + INFO_LEN + HAMMING_BYTE_LEN + BCH_LEN,
>             docptr + DOCG4_ECC_CONTROL)
> +
>> +	/* update bbt in memory */
>> +	if (chip->bbt)
>> +		chip->bbt[block >> 2] |= 0x01 << ((block & 0x03) << 1);
> This formula looks a bit obfuscated to me. Maybe a comment would enlighten me
> here.


I agree that some commentary is in order.  I believe I pasted that from code in
nand_base.c.  Also the test is probably innecessary (I should know if I have a
memory bbt).  I'm reviewing my bad block implementation, and also want to add
code to read the factory bad block tablle on page 4 and update the memory bbt
accordingly.  I believe you know how to interpret that table.  Will check you
code.  My device's table is all ff's (no bad bliocks), so I'm not sure how bad
blocks are marked.


>
> Funny, as MSystems was swallowed by Sandisk :)


And tomorrow maybe they'll be Micron :)  Using the original company name is
usually clearest.


If you're still reading, thanks again!

Mike
