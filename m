Received: from relay1.mentorg.com ([192.94.38.131])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9xRC-0000v4-Ed
 for linux-mtd@lists.infradead.org; Sat, 10 Jan 2015 14:54:52 +0000
Message-ID: <54B13D13.6020406@mentor.com>
Date: Sat, 10 Jan 2015 16:54:11 +0200
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
To: <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: don't return found by JEDEC ID a non-JEDEC
 flash
References: <1418511647-24736-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <20150109222310.GY9759@ld-irv-0074>
In-Reply-To: <20150109222310.GY9759@ld-irv-0074>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <shijie.huang@intel.com>, dwmw2@infradead.org,
 zajec5@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On 10.01.2015 00:28, Brian Norris wrote:
> On Sun, Dec 14, 2014 at 01:00:47AM +0200, Vladimir Zapolskiy wrote:
>> In attempt to spi_nor_scan() for an expected JEDEC compliant device by
>> reading RDID register don't return the first found non-JEDEC device
>> entry from spi_nor_ids[] table, if RDID is zero.
>>
>> First of all zeroes in RDID may be evidence for not correctly working
>> SPI, secondly empty RDID can not be used to select a particular JEDEC
>> non-compliant device correctly.
>>
>> The best possible solution is
>> * not to rely on spi_nor_read_id(), if expected device is non-JEDEC,
>> * not to substitute an expected JEDEC device with some arbitrary
>>   chosen non-JEDEC device, if RDID is zero.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> 
> This patch doesn't apply to the latest tree. I think this commit
> probably already fixes your issue:
> 
>   https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=09ffafb6977dc930770af2910edc3b469651131d
> 
>   commit 09ffafb6977dc930770af2910edc3b469651131d
>   Author: Huang Shijie <shijie.huang@intel.com>
>   Date:   Thu Nov 6 07:34:01 2014 +0100
> 
>       mtd: spi-nor: add id/id_len for flash_info{}

thank you for review.

09ffafb69 fixes my problem (and more), however regarding to my problem
it does it in non-optimal way. If read JDID is zero, then there is no
need to iterate over spi_nor_ids array to return ERR_PTR(-ENODEV).

Assuming that zero JEDEC ID is a relatively rare situation, do you think
it makes sense to add a preceding check for such case before entering
the loop like it is done in my patch?

If no, I'm fine, if yes, I'll rebase the change.

>> ---
>>  drivers/mtd/spi-nor/spi-nor.c |    6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index c51ee52..119ace9 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -661,6 +661,12 @@ static const struct spi_device_id *spi_nor_read_id(struct spi_nor *nor)
>>  
>>  	ext_jedec = id[3] << 8 | id[4];
>>  
>> +	/* Non-JEDEC flash memory can not be detected correctly */
>> +	if (!jedec && !ext_jedec) {
>> +		dev_err(nor->dev, "JEDEC compliant device is not found\n");
>> +		return ERR_PTR(-ENODEV);
>> +	}
>> +
>>  	for (tmp = 0; tmp < ARRAY_SIZE(spi_nor_ids) - 1; tmp++) {
>>  		info = (void *)spi_nor_ids[tmp].driver_data;
>>  		if (info->jedec_id == jedec) {
> 
> Brian
> 

--
With best wishes,
Vladimir
