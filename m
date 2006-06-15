Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fql0b-0005x7-Rx
	for linux-mtd@lists.infradead.org; Thu, 15 Jun 2006 02:07:21 -0400
Message-ID: <4490F943.7060302@ru.mvista.com>
Date: Thu, 15 Jun 2006 10:08:03 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: tglx@linutronix.de
Subject: Re: [PATCH] NAND: fix reading/writing OOB for syndrome: next iteration
References: <20060614194520.ee6c500f.vwool@ru.mvista.com>
	<1150303481.5257.460.camel@localhost.localdomain>
In-Reply-To: <1150303481.5257.460.camel@localhost.localdomain>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:
> *smdcmd ?
>
> s/void nand_.../int nand.../
>   
Agreed.
>   
>> +		chip->cmdfunc(mtd, NAND_CMD_READOOB, offs, page);
>> +		*sndcmd = 0;
>> +	}
>> +	chip->read_buf(mtd, buf, length);
>> +}
>> +static void (*nand_read_oob_swecc) (struct mtd_info *mtd,
>> +				    struct nand_chip *chip, uint8_t *buf,
>> +				    int offs, int length, int page,
>> +				    int *sndcmd) =
>> +    &nand_read_oob_raw;
>>     
>
> What is this for ? We can put nand_read_oob_raw into the chip->ecc.xxx
> pointer directly
>   
Agreed.
>> +static void nand_read_oob_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
>> +				   uint8_t *buf, int offs, int length,
>> +				   int page, int *sndcmd)
>> +{
>> +	int portion = chip->ecc.bytes + chip->ecc.prepad + chip->ecc.postpad;
>> +	uint8_t *bufpoi = buf;
>> +	int i, toread;
>> +
>> +	for (i = 0; i < chip->ecc.steps; i++) {
>> +		if (offs) {
>> +			while (portion < offs) {
>> +				offs -= portion;
>> +				i++;
>> +			}
>> +		}
>>     
>
> That breaks, if portion is < oobsize / ecc.steps and the offset is in
> the last area. I gave you a hint for the correct code before.
>   
Yup, thanks for pointing that out.
>   
>> +		chip->cmdfunc(mtd, NAND_CMD_READ0,
>> +				(i + 1) * chip->ecc.size + i * portion + offs,
>> +				page);
>>     
>
> We should use the random in command for the second read, as it is faster
>   
Ok
>   
>> +		toread = min_t(int, length, portion - offs);
>> +		chip->read_buf(mtd, bufpoi, toread);
>> +		bufpoi += toread;
>> +		length -= toread;
>> +		offs = 0;
>> +	}
>> +	if (length > 0)
>> +		chip->read_buf(mtd, bufpoi, length);
>>     
>
> When offset is far enough off, you need to reposition the flash
> pointer. 
>   
Depends on the previous code

>> +	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
>> +	status = chip->waitfunc(mtd, chip, FL_WRITING);
>> +
>> +	/* See if device thinks it succeeded */
>> +	if (status & NAND_STATUS_FAIL)
>> +		DEBUG(MTD_DEBUG_LEVEL0, "%s: Failed write, page 0x%08x\n",
>> +		      __FUNCTION__, page);
>> +
>> +	return status & NAND_STATUS_FAIL ? -EIO : 0;
>>     
>
> Why is the pageprog command and the status wait in every implementation
> and not in the calling code ?
>   
It's because the READ/READOOB and SEQIN commands are to be in every 
implementation, so it's keeping the integrity.
Having SEQIN in every implementation and PAGEPROG elsewhere would have 
been misleading IMHO.

Vitaly
