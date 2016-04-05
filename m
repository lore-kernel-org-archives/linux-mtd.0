Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1anXHd-0004Yy-Ho
 for linux-mtd@lists.infradead.org; Tue, 05 Apr 2016 20:09:06 +0000
Received: by mail-wm0-x241.google.com with SMTP id n3so7465114wmn.1
 for <linux-mtd@lists.infradead.org>; Tue, 05 Apr 2016 13:08:44 -0700 (PDT)
Subject: Re: [PATCH 2/2] mtd: m25p80: consider max_transfer_size when reading
To: Brian Norris <computersforpeace@gmail.com>
References: <56D22823.7090005@gmail.com> <20160405193952.GA5243@localhost>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Michal Suchanek <hramrach@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, Marek Vasut <marex@denx.de>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <57041B43.2000109@gmail.com>
Date: Tue, 5 Apr 2016 22:08:35 +0200
MIME-Version: 1.0
In-Reply-To: <20160405193952.GA5243@localhost>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 05.04.2016 um 21:39 schrieb Brian Norris:
> + others
> 
> Hi Heiner,
> 
> On Sat, Feb 27, 2016 at 11:50:11PM +0100, Heiner Kallweit wrote:
>> Some controllers have transfer size limits. To allow to deal with this
>> max_transfer_size was introduced in the SPI core recently.
>> Use this new feature to read in chunks if needed.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> Michal has been working on a similar series, with some differences (I'll
> comment below). I think his latest work is here:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2015-December/063865.html
> 
> Is there a particular reason you've continued on your series instead of
> reviewing/fixing his?
> 
Latest version of Michal's patch set was sent beginning of December and has
received no comment since then, so I assumed it's dead.
If that's not the case, totally fine with me and I'll have a further look at it.

Regards, Heiner

>> ---
>>  drivers/mtd/devices/m25p80.c | 30 +++++++++++++++++++++++++++++-
>>  1 file changed, 29 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>> index c2d1f65..69f3acf 100644
>> --- a/drivers/mtd/devices/m25p80.c
>> +++ b/drivers/mtd/devices/m25p80.c
>> @@ -119,7 +119,7 @@ static inline unsigned int m25p80_rx_nbits(struct spi_nor *nor)
>>   * Read an address range from the nor chip.  The address range
>>   * may be any size provided it is within the physical boundaries.
>>   */
>> -static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
>> +static int _m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
>>  			size_t *retlen, u_char *buf)
>>  {
>>  	struct m25p *flash = nor->priv;
>> @@ -153,6 +153,34 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
>>  	return ret;
>>  }
>>  
>> +/* Read in max_read_len chunks if len > max_read_len */
>> +static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
>> +		       size_t *retlen, u_char *buf)
>> +{
>> +	struct m25p *flash = nor->priv;
>> +	/*
>> +	 * The controller transfer size limit refers to the overall transfer
>> +	 * including read command + actually read data. Therefore subtract
>> +	 * the command size when calculating the max read length.
>> +	 */
>> +	size_t max_read_len = spi_max_transfer_size(flash->spi) -
>> +			      (m25p_cmdsz(nor) + nor->read_dummy / 8);
>> +	size_t read_len;
>> +	int ret;
>> +
>> +	while (len > 0) {
> 
> ^^ I really don't want this loop to be in m25p80.c. This should be in
> the core spi-nor.c, and then the driver (like m25p80.c, but also
> possibly other non-SPI drivers that also use spi-nor.c) can simply
> pass its limitation up the spi-nor.c. (See Michal's patch 10.)
> 
> So I plan to take some form of Michal's and not yours. This will require
> a bit of rebasing.
> 
> Brian
> 
>> +		read_len = min(len, max_read_len);
>> +		ret = _m25p80_read(nor, from, read_len, retlen, buf);
>> +		if (ret)
>> +			return ret;
>> +		from += read_len;
>> +		buf += read_len;
>> +		len -= read_len;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  /*
>>   * board specific setup should have ensured the SPI clock used here
>>   * matches what the READ command supports, at least until this driver
>> -- 
>> 2.7.1
>>
> 
