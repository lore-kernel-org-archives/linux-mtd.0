Received: from mail-bn1on0116.outbound.protection.outlook.com
 ([157.56.110.116] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ywpsr-00022p-De
 for linux-mtd@lists.infradead.org; Mon, 25 May 2015 10:45:29 +0000
From: Wang Haikun <Haikun.Wang@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v1] mtd: spi-nor: Specify wait ready time for every chip
Date: Mon, 25 May 2015 10:44:57 +0000
Message-ID: <BN1PR0301MB0612D2174E627ECB5075A0E9F8CD0@BN1PR0301MB0612.namprd03.prod.outlook.com>
References: <1431593152-30642-1-git-send-email-haikun.wang@freescale.com>
 <20150520214420.GO11598@ld-irv-0074>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/21/2015 5:44 AM, Brian Norris wrote:=0A=
> On Thu, May 14, 2015 at 04:45:52PM +0800, Haikun Wang wrote:=0A=
>> Chip erase cycle time is different among different chips.=0A=
>> Cycle time is also differnet among different operations for a special ch=
ip.=0A=
>> So we had better use corresponding timeout value for a specail chip and=
=0A=
>> a special operation when wait chip ready.=0A=
>> This patch add the method to specify the timeout value and use them=0A=
>> when wait chip ready.=0A=
>=0A=
> (Might want to spell-check your comments above.)=0A=
>=0A=
> I can't take this until you show me a real user for this. Right now,=0A=
> there is no example demonstrating why you need to make these delays=0A=
OK, we have a flash "n25q512a" on our LS2085ARDB board.=0A=
Its typical chip erase cycle time is 240s, max is 480s.=0A=
=0A=
m25p80 spi0.0: found n25q512a, expected m25p80=0A=
m25p80 spi0.0: n25q512a (65536 Kbytes)=0A=
> configurable. And I'm not at all convinced that we need them. If you=0A=
> need a few extra seconds for the timeout, we might as well just increase=
=0A=
> it for all chips. We shouldn't be running up against the timeout in=0A=
> practice anyway, so this is just an error handling parameter.=0A=
I approve of what you said. But if we increase it to 480s, we need wait =0A=
480s in case of program a page fail, its max cycle time is less than 1s =0A=
usually.=0A=
>=0A=
>> Signed-off-by: Haikun Wang <haikun.wang@freescale.com>=0A=
>> ---=0A=
>>   drivers/mtd/spi-nor/spi-nor.c | 60 ++++++++++++++++++++++++++++++++---=
--------=0A=
>>   include/linux/mtd/spi-nor.h   |  4 +++=0A=
>>   2 files changed, 49 insertions(+), 15 deletions(-)=0A=
>>=0A=
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor=
.c=0A=
>> index 14a5d23..63a7488 100644=0A=
>> --- a/drivers/mtd/spi-nor/spi-nor.c=0A=
>> +++ b/drivers/mtd/spi-nor/spi-nor.c=0A=
>> @@ -46,6 +46,14 @@ struct flash_info {=0A=
>>   	u16		page_size;=0A=
>>   	u16		addr_width;=0A=
>>=0A=
>> +	/*=0A=
>> +	 * common_wait, wait ready time applying to most operations .=0A=
>> +	 * max_wait defines the max wait ready time.=0A=
>> +	 * Specified in seconds.=0A=
>> +	 */=0A=
>=0A=
> These comments are extremely non-specific. You need to be more precise=0A=
> than "most". Also, split the comments up to describe each field=0A=
> separately, instead of trying to tackle both fields in one comment=0A=
> block.=0A=
>=0A=
> Brian=0A=
>=0A=
>> +	s16		common_wait;=0A=
>> +	s16		max_wait;=0A=
>> +=0A=
>>   	u16		flags;=0A=
>>   #define	SECT_4K			0x01	/* SPINOR_OP_BE_4K works uniformly */=0A=
>>   #define	SPI_NOR_NO_ERASE	0x02	/* No erase command needed */=0A=
>> @@ -231,12 +239,15 @@ static int spi_nor_ready(struct spi_nor *nor)=0A=
>>    * Service routine to read status register until ready, or timeout occ=
urs.=0A=
>>    * Returns non-zero if error.=0A=
>>    */=0A=
>> -static int spi_nor_wait_till_ready(struct spi_nor *nor)=0A=
>> +static int spi_nor_wait_till_ready(struct spi_nor *nor, int wait_time)=
=0A=
>>   {=0A=
>>   	unsigned long deadline;=0A=
>>   	int timeout =3D 0, ret;=0A=
>>=0A=
>> -	deadline =3D jiffies + MAX_READY_WAIT_JIFFIES;=0A=
>> +	if (wait_time > 0)=0A=
>> +		deadline =3D jiffies + wait_time * HZ;=0A=
>> +	else=0A=
>> +		deadline =3D jiffies + MAX_READY_WAIT_JIFFIES;=0A=
>>=0A=
>>   	while (!timeout) {=0A=
>>   		if (time_after_eq(jiffies, deadline))=0A=
>> @@ -326,7 +337,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struc=
t erase_info *instr)=0A=
>>   			goto erase_err;=0A=
>>   		}=0A=
>>=0A=
>> -		ret =3D spi_nor_wait_till_ready(nor);=0A=
>> +		ret =3D spi_nor_wait_till_ready(nor, nor->max_wait);=0A=
>>   		if (ret)=0A=
>>   			goto erase_err;=0A=
>>=0A=
>> @@ -348,7 +359,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struc=
t erase_info *instr)=0A=
>>   			addr +=3D mtd->erasesize;=0A=
>>   			len -=3D mtd->erasesize;=0A=
>>=0A=
>> -			ret =3D spi_nor_wait_till_ready(nor);=0A=
>> +			ret =3D spi_nor_wait_till_ready(nor, nor->common_wait);=0A=
>>   			if (ret)=0A=
>>   				goto erase_err;=0A=
>>   		}=0A=
>> @@ -467,8 +478,9 @@ static int spi_nor_unlock(struct mtd_info *mtd, loff=
_t ofs, uint64_t len)=0A=
>>   	return ret;=0A=
>>   }=0A=
>>=0A=
>> -/* Used when the "_ext_id" is two bytes at most */=0A=
>> -#define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\=0A=
>> +/* Used when the "_ext_id" is two bytes at most, WATTM: wait time */=0A=
>> +#define INFO_WATTM(_jedec_id, _ext_id, _sector_size, _n_sectors,	\=0A=
>> +		   _common_wait, _max_wait, _flags)			\=0A=
>>   	((kernel_ulong_t)&(struct flash_info) {				\=0A=
>>   		.id =3D {							\=0A=
>>   			((_jedec_id) >> 16) & 0xff,			\=0A=
>> @@ -481,10 +493,13 @@ static int spi_nor_unlock(struct mtd_info *mtd, lo=
ff_t ofs, uint64_t len)=0A=
>>   		.sector_size =3D (_sector_size),				\=0A=
>>   		.n_sectors =3D (_n_sectors),				\=0A=
>>   		.page_size =3D 256,					\=0A=
>> +		.common_wait =3D (_common_wait),				\=0A=
>> +		.max_wait =3D (_max_wait),				\=0A=
>>   		.flags =3D (_flags),					\=0A=
>>   	})=0A=
>>=0A=
>> -#define INFO6(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\=
=0A=
>> +#define INFO6_WATTM(_jedec_id, _ext_id, _sector_size, _n_sectors,	\=0A=
>> +		    _common_wait, _max_wait, _flags)			\=0A=
>>   	((kernel_ulong_t)&(struct flash_info) {				\=0A=
>>   		.id =3D {							\=0A=
>>   			((_jedec_id) >> 16) & 0xff,			\=0A=
>> @@ -498,6 +513,8 @@ static int spi_nor_unlock(struct mtd_info *mtd, loff=
_t ofs, uint64_t len)=0A=
>>   		.sector_size =3D (_sector_size),				\=0A=
>>   		.n_sectors =3D (_n_sectors),				\=0A=
>>   		.page_size =3D 256,					\=0A=
>> +		.common_wait =3D (_common_wait),				\=0A=
>> +		.max_wait =3D (_max_wait),				\=0A=
>>   		.flags =3D (_flags),					\=0A=
>>   	})=0A=
>>=0A=
>> @@ -510,6 +527,16 @@ static int spi_nor_unlock(struct mtd_info *mtd, lof=
f_t ofs, uint64_t len)=0A=
>>   		.flags =3D (_flags),					\=0A=
>>   	})=0A=
>>=0A=
>> +#define DEFAULT_WAIT_TIME	40 /* in seconds */=0A=
>> +=0A=
>> +#define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\=0A=
>> +	INFO_WATTM(_jedec_id, _ext_id, _sector_size, _n_sectors,	\=0A=
>> +		    DEFAULT_WAIT_TIME, DEFAULT_WAIT_TIME, _flags)=0A=
>> +=0A=
>> +#define INFO6(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\=
=0A=
>> +	INFO6_WATTM(_jedec_id, _ext_id, _sector_size, _n_sectors,	\=0A=
>> +		      DEFAULT_WAIT_TIME, DEFAULT_WAIT_TIME, _flags)=0A=
>> +=0A=
>>   /* NOTE: double check command sets and memory organization when you ad=
d=0A=
>>    * more nor chips.  This current list focusses on newer chips, which=
=0A=
>>    * have been converging on command sets which including JEDEC ID.=0A=
>> @@ -756,7 +783,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to=
, size_t len,=0A=
>>=0A=
>>   		/* write one byte. */=0A=
>>   		nor->write(nor, to, 1, retlen, buf);=0A=
>> -		ret =3D spi_nor_wait_till_ready(nor);=0A=
>> +		ret =3D spi_nor_wait_till_ready(nor, nor->common_wait);=0A=
>>   		if (ret)=0A=
>>   			goto time_out;=0A=
>>   	}=0A=
>> @@ -768,7 +795,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to=
, size_t len,=0A=
>>=0A=
>>   		/* write two bytes. */=0A=
>>   		nor->write(nor, to, 2, retlen, buf + actual);=0A=
>> -		ret =3D spi_nor_wait_till_ready(nor);=0A=
>> +		ret =3D spi_nor_wait_till_ready(nor, nor->common_wait);=0A=
>>   		if (ret)=0A=
>>   			goto time_out;=0A=
>>   		to +=3D 2;=0A=
>> @@ -777,7 +804,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to=
, size_t len,=0A=
>>   	nor->sst_write_second =3D false;=0A=
>>=0A=
>>   	write_disable(nor);=0A=
>> -	ret =3D spi_nor_wait_till_ready(nor);=0A=
>> +	ret =3D spi_nor_wait_till_ready(nor, nor->common_wait);=0A=
>>   	if (ret)=0A=
>>   		goto time_out;=0A=
>>=0A=
>> @@ -788,7 +815,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to=
, size_t len,=0A=
>>   		nor->program_opcode =3D SPINOR_OP_BP;=0A=
>>   		nor->write(nor, to, 1, retlen, buf + actual);=0A=
>>=0A=
>> -		ret =3D spi_nor_wait_till_ready(nor);=0A=
>> +		ret =3D spi_nor_wait_till_ready(nor, nor->common_wait);=0A=
>>   		if (ret)=0A=
>>   			goto time_out;=0A=
>>   		write_disable(nor);=0A=
>> @@ -834,7 +861,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_=
t to, size_t len,=0A=
>>   			if (page_size > nor->page_size)=0A=
>>   				page_size =3D nor->page_size;=0A=
>>=0A=
>> -			ret =3D spi_nor_wait_till_ready(nor);=0A=
>> +			ret =3D spi_nor_wait_till_ready(nor, nor->common_wait);=0A=
>>   			if (ret)=0A=
>>   				goto write_err;=0A=
>>=0A=
>> @@ -844,7 +871,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_=
t to, size_t len,=0A=
>>   		}=0A=
>>   	}=0A=
>>=0A=
>> -	ret =3D spi_nor_wait_till_ready(nor);=0A=
>> +	ret =3D spi_nor_wait_till_ready(nor, nor->common_wait);=0A=
>>   write_err:=0A=
>>   	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_WRITE);=0A=
>>   	return ret;=0A=
>> @@ -860,7 +887,7 @@ static int macronix_quad_enable(struct spi_nor *nor)=
=0A=
>>   	nor->cmd_buf[0] =3D val | SR_QUAD_EN_MX;=0A=
>>   	nor->write_reg(nor, SPINOR_OP_WRSR, nor->cmd_buf, 1, 0);=0A=
>>=0A=
>> -	if (spi_nor_wait_till_ready(nor))=0A=
>> +	if (spi_nor_wait_till_ready(nor, nor->common_wait))=0A=
>>   		return 1;=0A=
>>=0A=
>>   	ret =3D read_sr(nor);=0A=
>> @@ -931,7 +958,7 @@ static int micron_quad_enable(struct spi_nor *nor)=
=0A=
>>   		return ret;=0A=
>>   	}=0A=
>>=0A=
>> -	ret =3D spi_nor_wait_till_ready(nor);=0A=
>> +	ret =3D spi_nor_wait_till_ready(nor, nor->common_wait);=0A=
>>   	if (ret)=0A=
>>   		return ret;=0A=
>>=0A=
>> @@ -1184,6 +1211,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *=
name, enum read_mode mode)=0A=
>>=0A=
>>   	nor->read_dummy =3D spi_nor_read_dummy_cycles(nor);=0A=
>>=0A=
>> +	nor->common_wait =3D info->common_wait;=0A=
>> +	nor->max_wait =3D info->max_wait;=0A=
>> +=0A=
>>   	dev_info(dev, "%s (%lld Kbytes)\n", id->name,=0A=
>>   			(long long)mtd->size >> 10);=0A=
>>=0A=
>> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h=
=0A=
>> index e540952..a0f29c7 100644=0A=
>> --- a/include/linux/mtd/spi-nor.h=0A=
>> +++ b/include/linux/mtd/spi-nor.h=0A=
>> @@ -158,6 +158,8 @@ enum spi_nor_option_flags {=0A=
>>    * @lock:		[FLASH-SPECIFIC] lock a region of the SPI NOR=0A=
>>    * @unlock:		[FLASH-SPECIFIC] unlock a region of the SPI NOR=0A=
>>    * @priv:		the private data=0A=
>> + * @common_wait:	wait ready time applying to most operations, in second=
s=0A=
>> + * @max_wait:		max wait ready time of all operations, in seconds=0A=
>>    */=0A=
>>   struct spi_nor {=0A=
>>   	struct mtd_info		*mtd;=0A=
>> @@ -195,6 +197,8 @@ struct spi_nor {=0A=
>>   	int (*flash_unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);=
=0A=
>>=0A=
>>   	void *priv;=0A=
>> +	s16			common_wait;=0A=
>> +	s16			max_wait;=0A=
>>   };=0A=
>>=0A=
>>   /**=0A=
>=0A=
=0A=
