Received: from wf-out-1314.google.com ([209.85.200.174])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jwujk-00076g-Hf
	for linux-mtd@lists.infradead.org; Fri, 16 May 2008 07:52:20 +0000
Received: by wf-out-1314.google.com with SMTP id 28so39490wfc.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 16 May 2008 00:52:18 -0700 (PDT)
Message-ID: <9c9fda240805160052o1754f1beke7053ffdfbd1c8af@mail.gmail.com>
Date: Fri, 16 May 2008 16:52:18 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: "Adrian Hunter" <ext-adrian.hunter@nokia.com>
Subject: Re: [RFC][PATCH][MTD][OneNAND] Fix OneNAND byte access
In-Reply-To: <482D36FD.6050506@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20080516044508.GA28048@party> <482D36FD.6050506@nokia.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> It's only optimization at driver level
>>
>> I think it's the best that it handles at UBIFS itself
>> e.g., Now it passed down from name handling
>> If the size of name is odd how about pad it even?
>
> It would be a lot of work to change UBIFS.
>
> It is really a driver problem.  For example OMAP2
> does not have the problem, so it should be fixed at
> the driver level.
>

I'm not sure it makes a problem but potentially it access wrongly.
Well I will check it at omap2 driver

>>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
>> index 5d7965f..49194b6 100644
>> --- a/drivers/mtd/onenand/onenand_base.c
>> +++ b/drivers/mtd/onenand/onenand_base.c
>> @@ -509,9 +509,23 @@ static int onenand_read_bufferram(struct mtd_info *mtd, int area,
>>
>>       bufferram += onenand_bufferram_offset(mtd, area);
>>
>> +     if (ONENAND_CHECK_BYTE_ACCESS(offset)) {
>> +             unsigned short word;
>> +             printk("%s[%d] %d %zd\n", __func__, __LINE__, offset, count);
>> +
>> +             /* Align with word(16-bit) size */
>> +             /* Read word and save byte */
>> +             word = this->read_word(bufferram + offset - 1);
>> +             buffer[0] = (word & 0xff00) >> 8;
>> +             buffer++;
>> +             offset++;
>> +             count--;
>> +     }
>> +
>>       if (ONENAND_CHECK_BYTE_ACCESS(count)) {
>>               unsigned short word;
>>
>> +             printk("%s[%d] %d %zd\n", __func__, __LINE__, offset, count);
>>               /* Align with word(16-bit) size */
>>               count--;
>>
>>
>
> I presume you will remove the printks.
>

Sure, it remains only for checking for you. Must be removed at patch.

Thank you,
Kyungmin Park
