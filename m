Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RPXPK-0003Ka-Rc
 for linux-mtd@lists.infradead.org; Sun, 13 Nov 2011 10:35:28 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH v2 13/16] mtd/docg3: add ECC correction code
References: <1320912342-30147-1-git-send-email-robert.jarzmik@free.fr>
 <1320912342-30147-14-git-send-email-robert.jarzmik@free.fr>
 <4EBECDCB.306@newsguy.com>
Date: Sun, 13 Nov 2011 11:35:17 +0100
In-Reply-To: <4EBECDCB.306@newsguy.com> (Mike Dunn's message of "Sat, 12 Nov
 2011 11:49:31 -0800")
Message-ID: <87mxc0ia3e.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mike Dunn <mikedunn@newsguy.com> writes:

> On 11/10/2011 12:05 AM, Robert Jarzmik wrote:
>>  
>> +if MTD_DOCG3
>> +config BCH_CONST_M
>> +	default 14
>> +config BCH_CONST_T
>> +	default 4
>> +endif
>
>
> It might be better to let the user set this in the kernel config.  Doing it here
> precludes the use of the algorithm by any other module that needs to use it with
> different parameters.
You're right.
I'll shift that to mioa701 board code, where I'm sure no other BCH is necessary.

>> +static int doc_ecc_bch_fix_data(struct docg3 *docg3, void *buf, u8 *hwecc)
> Nit: function name in comment is inconsistent with its actual name.
Good catch. Will fix.
>> +	for (i = 0; i < numerrs; i++)
>> +		if (errorpos[i] < DOC_ECC_BCH_COVERED_BYTES*8)
>> +			/* error is located in data, correct it */
>> +			change_bit(errorpos[i], buf);
>> +out:
>> +	doc_dbg("doc_ecc_bch_fix_data: flipped %d bits\n", numerrs);
>> +	return numerrs;
>> +}
>
>
> Where do you check for reads of a blank page?
On stack frame above. Look at doc_read_oob():
		if ((block0 >= DOC_LAYOUT_BLOCK_FIRST_DATA) &&
		    (eccconf1 & DOC_ECCCONF1_BCH_SYNDROM_ERR) &&
		    (eccconf1 & DOC_ECCCONF1_PAGE_IS_WRITTEN) &&
                                \---> this is the key
		    (ops->mode != MTD_OPS_RAW) &&
		    (nbdata == DOC_LAYOUT_PAGE_SIZE)) {
			ret = doc_ecc_bch_fix_data(docg3, buf, hwecc);

Here you see that I'll make the error correction only if the page was written
before. If it's blank, I continue reading without attempting ECC correction.

> Not specifically related to this patch, but... are you sure you want to
> initialize the ecc on every read?  I'm sure it's not necessary; you can just
> leave it on; maybe turn it off if doing raw reads.  I know this is the case for
> both the P3 and G4 when running under PalmOS / TrueFFS library.  I notice that
> this function has delays and polls the status register in between calls to
> cpu_relax(), so the performance hit is probably not insignificant, especiallu
> when done for every 512 byte page.
Well, that's some info.
And yes, it adds some latency.
Now for the necessity, I'm not fully convinced. I know that the ECC register is
set up differently for reads and writes (that's the
DOC_ECCCONF0_READ_MODE). When doc_read_oob() is called, I don't know if the
previous action was a read or a write ...

What I could do to improve performance would be to store in the docg3 private
data if last action was a read or a write, and perform the doc_*_page_ecc_init()
only if action changes. What do you think ?

> Another nit (also not specifically related to this patch): bad name for this
> function.  The ecc being read is not the BCH syndrome, as we now know.  This is
> a pet peeve of mine; M-sys abused that word by misapplying it to the byts read
> from the ecc hw, which confused the hell out of me as I tried to understand what
> the hw was generating.
Yes, I'll change the name to hw_ecc or something like that.

Thanks for the review.

-- 
Robert
