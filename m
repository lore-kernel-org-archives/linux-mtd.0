Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.66 #1 (Red Hat Linux))
	id 1Ip3HV-0000FL-Sh
	for linux-mtd@lists.infradead.org; Mon, 05 Nov 2007 09:50:32 -0500
Message-ID: <472F2CB5.6090409@nokia.com>
Date: Mon, 05 Nov 2007 16:46:13 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: =?UTF-8?B?ZXh0IErDtnJuIEVuZ2Vs?= <joern@logfs.org>
Subject: Re: [PATCH] [MTD] [OneNAND] Do not stop reading for ECC errors
References: <472B0A3C.4010103@nokia.com>
	<20071105132512.GA19232@lazybastard.org>
In-Reply-To: <20071105132512.GA19232@lazybastard.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Jörn Engel wrote:
> On Fri, 2 November 2007 13:30:04 +0200, Adrian Hunter wrote:
>> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
>> index dd28355..616747c 100644
>> --- a/drivers/mtd/onenand/onenand_base.c
>> +++ b/drivers/mtd/onenand/onenand_base.c
>> @@ -855,6 +855,8 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
>>  			this->command(mtd, ONENAND_CMD_READ, from, writesize);
>>   			ret = this->wait(mtd, FL_READING);
>>   			onenand_update_bufferram(mtd, from, !ret);
>> +			if (ret == -EBADMSG)
>> +				ret = 0;
> 
> Why is -EBADMSG dropped here?

-EBADMSG is an ECC error.

ret must be non-zero to indicate that the bufferram is invalid.  Otherwise
if we read from the same location again, the data would be taken from bufferram
and no ECC error would be reported.  However we need to keep reading (see nand_base.c)
so ret is set to zero as though no error occured.  Finally mtd->ecc_stats.failed
is examined to determine ECC errors. i.e.

static int onenand_read(struct mtd_info *mtd, loff_t from, size_t len,
	size_t *retlen, u_char *buf)
{
	...
	stats = mtd->ecc_stats;
	...
 	while (!ret) {
		...
 		ret = this->wait(mtd, FL_READING);
 		onenand_update_bufferram(mtd, from, !ret);
		if (ret == -EBADMSG)
			ret = 0;
 	}
	*retlen = read;
	if (mtd->ecc_stats.failed - stats.failed)
		return -EBADMSG;
	if (ret)
		return ret;
	return mtd->ecc_stats.corrected - stats.corrected ? -EUCLEAN : 0;
}

> 
>> @@ -988,18 +995,16 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
>>  		onenand_update_bufferram(mtd, from, 0);
>>  
>>  		ret = this->wait(mtd, FL_READING);
>> -		/* First copy data and check return value for ECC handling */
>> +		if (ret && ret != -EBADMSG) {
>> +			printk(KERN_ERR "onenand_read_oob_nolock: read failed = 0x%x\n", ret);
>> +			break;
>> +		}
> 
> What about -EUCLEAN?

The wait function doesn't return -EUCLEAN.  It increments mtd->ecc_stats.corrected and returns
zero for correctable ECC errors.

File systems (like say JFFS2 for example) don't expect -EUCLEAN from mtd->read_oob and would treat
it as a fatal error, so it must not be returned in this case.

> 
> Jörn
> 
