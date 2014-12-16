Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0p8Q-0004TT-6X
 for linux-mtd@lists.infradead.org; Tue, 16 Dec 2014 10:13:43 +0000
Message-ID: <5490059F.903@huawei.com>
Date: Tue, 16 Dec 2014 18:12:47 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] UBI: add ubi_err() to report the failure of leb read
References: <548FE51D.60707@huawei.com> <548FF41F.3030902@nod.at>
In-Reply-To: <548FF41F.3030902@nod.at>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/12/16 16:58, Richard Weinberger wrote:
> Am 16.12.2014 um 08:54 schrieb hujianyang:
>> If an error occur while reading from PEBs, for example, an ECC error,
>> ubi_io_read() will print some error messages. But it's not enough for
>> debugging. These messages don't show the mapping info for a read from
>> UBIFS layer.
>>
>> Although UBIFS will soon print its error messages after catching the
>> return value from UBI layer,  multi-path reading will confuse the
>> relationship between LEBs and PEBs showed by these messages.
>>
>> This patch adds an ubi_err() to report reading errors in the function
>> ubi_eba_read_leb(). The mapping info of LEB and PEB is showed by
>> this error message.
>>
>> Signed-off-by: hujianyang <hujianyang@huawei.com>
>> ---
>>  drivers/mtd/ubi/eba.c |    2 ++
>>  1 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
>> index b698534..b4e69e1 100644
>> --- a/drivers/mtd/ubi/eba.c
>> +++ b/drivers/mtd/ubi/eba.c
>> @@ -477,6 +477,8 @@ out_free:
>>  	ubi_free_vid_hdr(ubi, vid_hdr);
>>  out_unlock:
>>  	leb_read_unlock(ubi, vol_id, lnum);
>> +	ubi_err(ubi, "err %d while reading %d bytes from offset %d of LEB %d:%d, PEB %d",
>> +		err, len, offset, vol_id, lnum, pnum);
> 
> This label will also be reached if we run out of memory.

Yes, but I think it's OK. Because a read operation is really failed
by some errors. We can print these errors not only in case of MTD
errors but also in case of CRC errors, ENOMEM or others.

> Please make sure that the new ubi_err() can only be reached in case of an MTD error.
> Also make sure that the function prints only one message and not two.

Er, At first, I want to print just MTD error, perform ubi_err() in
mtd_is_eccerr() case, for example. But I found it's not easy to print
it only once. The *retry* label makes it difficulty to determine when
this function, ubi_eba_read_leb() returns, this message will print
two times or none.

So at last, I move this ubi_err() to the end of error handling path
for easy. ^.^

What's your opinion?

Hu
