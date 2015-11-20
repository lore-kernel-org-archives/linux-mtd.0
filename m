Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzfAL-0006Dl-4q
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 06:27:26 +0000
Received: by wmec201 with SMTP id c201so57557288wme.0
 for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2015 22:27:03 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v4 7/7] mtd: spi-nor: add read loop
To: Brian Norris <computersforpeace@gmail.com>,
 Michal Suchanek <hramrach@gmail.com>
References: <cover.1439543572.git.hramrach@gmail.com>
 <1592668a061137b33c9a6392dfccc67c69fc1fe6.1439543572.git.hramrach@gmail.com>
 <20151119233924.GN64635@google.com>
Cc: Hou Zhiqiang <B48286@freescale.com>, shijie.huang@intel.com,
 David Woodhouse <dwmw2@infradead.org>, Han Xu <han.xu@freescale.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Ben Hutchings <ben@decadent.org.uk>, Marek Vasut <marex@denx.de>,
 Gabor Juhos <juhosg@openwrt.org>, Bean Huo <beanhuo@micron.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Huang Shijie <shijie.huang@arm.com>
Message-ID: <564EBD2B.50101@gmail.com>
Date: Fri, 20 Nov 2015 07:26:51 +0100
MIME-Version: 1.0
In-Reply-To: <20151119233924.GN64635@google.com>
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

Am 20.11.2015 um 00:39 schrieb Brian Norris:
> + Heiner
> 
> On Fri, Aug 14, 2015 at 09:23:09AM -0000, Michal Suchanek wrote:
>> mtdblock and ubi do not handle the situation when read returns less data
>> than requested. Loop in spi-nor until buffer is filled or an error is
>> returned.
> 
> I'm slightly torn on this patch. I believe this is inspired by issues in
> the SPI layer. But I believe there is some agreement from the SPI layer
> that protocol drivers (such as m25p80.c/spi-nor.c) should not have to
> worry about spi_messages getting truncated [1]. Heiner is looking at
> that.
> 
> But on the other hand, it's possible that some non-SPI driver would have
> similar limitations, and so spi-nor.c should be handling the issue.
> 
>> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 20 ++++++++++++++------
>>  1 file changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index e0ae9cf..246fac7 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -738,14 +738,22 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
>>  	if (ret)
>>  		return ret;
>>  
>> -	ret = nor->read(nor, from, len, buf);
>> +	while (len) {
>> +		ret = nor->read(nor, from, len, buf);
>> +		if (ret <= 0)
>> +			goto read_err;
> 
> Do we really want to exit silently when ret==0, but len!=0?
> 
>> +
>> +		BUG_ON(ret > len);
> 
> Maybe the condition here should be 'ret > len || len == 0', since this
> shouldn't happen.
> 
> Also, please don't use BUG_ON(). Even though this is really unexpected,
> we don't need to crash the system. Perhaps:
> 
> 		if (WARN_ON(ret > len || ret == 0)) {
> 			ret = -EIO;
> 			goto read_err;
> 		}
> 
>> +		*retlen += ret;
>> +		buf += ret;
>> +		from += ret;
>> +		len -= ret;
>> +	}
>> +	ret = 0;
>>  
>> +read_err:
>>  	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_READ);
>> -	if (ret < 0)
>> -		return ret;
>> -
>> -	*retlen += ret;
>> -	return 0;
>> +	return ret;
>>  }
>>  
>>  static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
> 
> Brian
> 
> [1] http://www.spinics.net/lists/linux-spi/msg05877.html
>     "RfC: Handle SPI controller limitations like maximum message length"
> 
>     I'm honestly not really sure what the conclusion from that thread
>     is, so far. It seems like the SPI master "should" be exposing its
>     max length to the SPI core, but it's unclear whether that would get
>     propagated as a short write/read (i.e., shorter-than-expected
>     spi_message::actual_length), or whether the SPI core should be
>     somehow splitting up the messages into manageable chunks for us. I'm
>     not even sure if the latter is legal for things like
>     read-from-flash; might this cause the chip select to get toggled,
>     potentially disrupting the operation?

That's exactly my issue with Freescale ESPI.
You provide a message length (up to 64K) to the chip and it sets / resets
CS internally. Resuming a short read requires to set the (SPI NOR)
start address for the next read properly.
And this can be done by the protocol driver only.
Currently the fsl-espi controller driver includes some ugly
(protocol driver) logic to deal with this.
One consequence is that this controller driver can be used with
SPI NOR devices only.

At a first glance I see two options:

1. The controller driver returns an error like EMSGSIZE and the number
   of read bytes. Then the protocol driver can loop and assemble the chunks.

2. The SPI master exposes the SPI message length constraint and the
   protocol driver can proactively deal with this limitation.

I have a little headache with option 1 because I'm not sure that we can
in general rely on the number of read bytes if an error is returned.
Some controller driver might return whatever value assuming that the
caller ignores it anyway if an error is returned.

Options 2 I like better as it doesn't require the controller driver
to handle an error situation like a short read in a specific way.

And it seems like Mark could be fine with an additional member of
spi_master like size_t max_msg_size.
The idea of a struct encapsulating all constraints he didn't like too much.

> 
>     Anyway, in the former case, we need something like your patch. But
>     in the latter case, we actually don't need anything, other than
>     maybe an assertion that ret == len.
> 
