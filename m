Received: from smtp2-g21.free.fr ([212.27.42.2])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c4ZLO-0003gb-Bv
 for linux-mtd@lists.infradead.org; Wed, 09 Nov 2016 20:19:39 +0000
Subject: Re: [RFC] Special handling for NAND_CMD_PAGEPROG and NAND_CMD_READ0
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
Cc: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>,
 Richard Weinberger <richard@nod.at>, Sebastian Frias <sf84@laposte.net>
References: <58236370.1050105@sigmadesigns.com>
 <20161109194903.1c4ee5a3@bbrezillon>
From: Mason <slash.tmp@free.fr>
Message-ID: <582384B3.7040106@free.fr>
Date: Wed, 9 Nov 2016 21:18:59 +0100
MIME-Version: 1.0
In-Reply-To: <20161109194903.1c4ee5a3@bbrezillon>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/11/2016 19:49, Boris Brezillon wrote:

> Marc Gonzalez <marc_gonzalez@sigmadesigns.com> wrote:
> 
>> Sample code to generate some discussion around having the framework
>> send I/O commands (for read_page and write_page) when it is dealing
>> with "high-level" NFCs that send the commands themselves.
>> ---
>>  drivers/mtd/nand/nand_base.c  | 6 ++++--
>>  drivers/mtd/nand/tango_nand.c | 7 ++++++-
>>  include/linux/mtd/nand.h      | 6 ++++++
>>  3 files changed, 16 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index 50cdf37cb8e4..b4149101342c 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -1970,7 +1970,8 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
>>  						 __func__, buf);
>>  
>>  read_retry:
>> -			chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
>> +			if (!(chip->options & NAND_FOO))
>> +				chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
>>  
> 
> You'll have to patch the standard implementations provided by the core
> (nand_read/write_page_xx()) to send these READ0/SEQIN/PAGEPROG commands
> when the NAND_FOO flag is set.

Thanks, I had completely overlooked that part.


>> @@ -2681,7 +2682,8 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>>  
>>  	if (!cached || !NAND_HAS_CACHEPROG(chip)) {
>>  
>> -		chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
>> +		if (!(chip->options & NAND_FOO))
>> +			chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> 
> If you ask the core to not send NAND_CMD_PAGEPROG, it should also not
> send the SEQIN command.

OK.


>>  static int tango_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
>>  		const uint8_t *buf, int oob_required, int page)
>>  {
>> -	return raw_write(chip, buf, chip->oob_poi);
>> +	/* what about NAND_CMD_SEQIN ? */
> 
> You should send SEQIN as well, and patch the core to not send it when
> NAND_FOO is set.

OK.


>> +/*
>> + * Controller sends NAND_CMD_PAGEPROG (write_page) and NAND_CMD_READ0 (read_page)
>> + * therefore the framework should not send these commands.
>> + */
>> +#define NAND_FOO		0x00400000
>> +
> 
> Nice name :-).

I was worried there might be some bike-shedding :-)
Is this the right place to put it? And the right bit to use?
Would anyone care to suggest a good name?

I've thought of
NAND_DONT_SEND_RW_CMD
NAND_ZEALOUS_NFC
NAND_HIGH_LEVEL_NFC
NAND_HIGH_LEVEL_RW
NAND_COMPLEX_RW

Something else?

Regards.
