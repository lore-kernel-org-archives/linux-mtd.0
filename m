Received: from chamillionaire.breakpoint.cc ([85.10.199.196])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P1ErE-0003iZ-Dt
	for linux-mtd@lists.infradead.org; Thu, 30 Sep 2010 08:51:17 +0000
Date: Thu, 30 Sep 2010 10:51:11 +0200
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 3/5] mtd/nand: add support for BBT without OOB
Message-ID: <20100930085111.GA12354@Chamillionaire.breakpoint.cc>
References: <1285782234-32509-1-git-send-email-bigeasy@linutronix.de>
	<1285782234-32509-4-git-send-email-bigeasy@linutronix.de>
	<1285791064.1776.35.camel@brekeke>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1285791064.1776.35.camel@brekeke>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-mtd@lists.infradead.org, tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Artem Bityutskiy | 2010-09-29 23:11:04 [+0300]:

>Few minor things.
>
>First, is it please possible to add more descriptive comment into the
>code. Something like you put to the patch description, may be even a bit
>more descriptive. May be to the header of nand_bbt.c?
We usually don't have description in C code. Usually there is kernel doc
which describe the function and some description in Documentation/
which describes how should work. I could add something to the header of
the file and we move it leater to Doc*/mtd/bbt_hadling.txt ?

>The idea is that the BBT code is quite difficult to follow, and you make
>it even more complex, so a comment describing various flavors of BBT
>would be very useful.
Okay.

>And then several stylistic nitpicks.
>
>>  	while (totlen) {
>> +
>>  		len = min(totlen, (size_t) (1 << this->bbt_erase_shift));
>
>These extra whits spaces are not really needed. Ideally, your patch
>should make checkpatch.pl happy.
I can get rid of a few extra lines. checkpatch was happy with the patch
except with one >80 line which had 81.

>> +
>> +		if (marker_len) {
>> +			/*
>> +			 * In case the BBT marker is not in the OOB area it
>> +			 * will be just in the first page
>> +			 */
>
>Yes, this is the right multi-line comment. You may also put a dot at the
>end. But in other places you used not the right multi-line comments.
The missing dot is probally easy to fix. Other place where I did not use
correct multi-line comments are the .h file were I successfully
attempted to follow the style there. I'm going to fix it as well.

>
>> +		} else if (td->options & NAND_BBT_NO_OOB) {
>> +
>> +			ooboffs = 0;
>
>Extra blank line.
>
>> +			offs = td->len;
>> +			/* the version byte */
>> +			if (td->options & NAND_BBT_VERSION)
>> +				offs++;
>> +			/* Calc length */
>> +			len = (size_t) (numblocks >> sft);
>> +			len += offs;
>> +			/* Make it page aligned ! */
>> +			len = ALIGN(len, mtd->writesize);
>> +			/* Preset the buffer with 0xff */
>> +			memset(buf, 0xff, len);
>> +			/* Pattern is located at the begin of first page */
>> +			memcpy(buf, td->pattern, td->len);
>> +
>>  		} else {
>
>And here.
Both gone.

>
>> -/* Use a flash based bad block table. This option is passed to the
>> - * default bad block table function. */
>> +/* Use a flash based bad block table. OOB identifier is saved in OOB area.
>> + * This option is passed to the default bad block table function. */
>
>Would be nice to convert this to the right multi-line comment.
Will do in this patch.

>>  #define NAND_USE_FLASH_BBT	0x00010000
>>  /* This option skips the bbt scan during initialization. */
>>  #define NAND_SKIP_BBTSCAN	0x00020000
>> @@ -215,6 +215,9 @@ typedef enum {
>>  #define NAND_OWN_BUFFERS	0x00040000
>>  /* Chip may not exist, so silence any errors in scan */
>>  #define NAND_SCAN_SILENT_NODEV	0x00080000
>> +/* If passed additionally to NAND_USE_FLASH_BBT then BBT code will not touch
>> + * the OOB area */
>
>And this. Yeah, I know this file uses different styles, but you could
>convert even all of them.
I would prefer to send a cleanup afterwards and not mixing code changes
with no changes.
You want someone to keep checkpatch shut for other files as well or just
this one?

Sebastian
