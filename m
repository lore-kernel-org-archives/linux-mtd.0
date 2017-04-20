Received: from 2.mo4.mail-out.ovh.net ([46.105.72.36])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1CWw-0004PK-VC
 for linux-mtd@lists.infradead.org; Thu, 20 Apr 2017 13:53:57 +0000
Received: from player159.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id D74455FC9F
 for <linux-mtd@lists.infradead.org>; Thu, 20 Apr 2017 15:53:30 +0200 (CEST)
Subject: Re: [PATCH 4/4] mtd: spi-nor: aspeed: use command mode for reads
To: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
References: <1492689397-4704-1-git-send-email-clg@kaod.org>
 <1492689397-4704-5-git-send-email-clg@kaod.org>
 <b28c97cc-1daf-c1dd-4a86-4f8bf6c46b2b@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <66e385ec-6688-9ce7-1250-ec840201147e@kaod.org>
Date: Thu, 20 Apr 2017 15:53:23 +0200
MIME-Version: 1.0
In-Reply-To: <b28c97cc-1daf-c1dd-4a86-4f8bf6c46b2b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/20/2017 03:31 PM, Marek Vasut wrote:
> On 04/20/2017 01:56 PM, Cédric Le Goater wrote:
>> When reading flash contents, try to use the "command mode" if the AHB
>> window configured for the flash module is big enough. Else, just fall
>> back to the "user mode" to perform the read.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>
>>  Changes since initial version :
>>
>>  - rebased on current patchset which removed DMA support
>>
>>  drivers/mtd/spi-nor/aspeed-smc.c | 27 ++++++++++++++++++++++++++-
>>  1 file changed, 26 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
>> index 60c020482946..43015aec4557 100644
>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
>> @@ -394,6 +394,31 @@ static ssize_t aspeed_smc_read_user(struct spi_nor *nor, loff_t from,
>>  
>>  	aspeed_smc_read_from_ahb(read_buf, chip->ahb_base, len);
>>  	aspeed_smc_stop_user(nor);
>> +	return 0;
>> +}
>> +
>> +static ssize_t aspeed_smc_read(struct spi_nor *nor, loff_t from, size_t len,
>> +			       u_char *read_buf)
>> +{
>> +	struct aspeed_smc_chip *chip = nor->priv;
>> +
>> +	/*
>> +	 * The AHB window configured for the chip is too small for the
>> +	 * read offset. Use the "User mode" of the controller to
>> +	 * perform the read.
>> +	 */
>> +	if (from >= chip->ahb_window_size) {
>> +		aspeed_smc_read_user(nor, from, len, read_buf);
>> +		goto out;
> 
> What about turning this into dumb if () {} else {} and dropping the goto ?

yes, well, this is because I have other patches adding DMAs :

	https://github.com/legoater/linux/commit/6880924dc2cf7a47c446a708df528b72d9bf9134#diff-e466368d609006970aab53a7b840221fR575

but as of today, the benefits in speed are to be proven and the current 
implementation does not support vmalloc'ed buffers. So I can drop the 
goto without too much regrets (if you insist :)

Cheers,

C.  
 
>> +	}
>> +
>> +	/*
>> +	 * Use the "Command mode" to do a direct read from the AHB
>> +	 * window configured for the chip. This should be the default.
>> +	 */
>> +	memcpy_fromio(read_buf, chip->ahb_base + from, len);
>> +
>> +out:
>>  	return len;
>>  }
>>  
>> @@ -817,7 +842,7 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
>>  		nor->dev = dev;
>>  		nor->priv = chip;
>>  		spi_nor_set_flash_node(nor, child);
>> -		nor->read = aspeed_smc_read_user;
>> +		nor->read = aspeed_smc_read;
>>  		nor->write = aspeed_smc_write_user;
>>  		nor->read_reg = aspeed_smc_read_reg;
>>  		nor->write_reg = aspeed_smc_write_reg;
>>
> 
> 
