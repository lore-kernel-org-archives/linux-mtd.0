Message-ID: <4D08C61B.8010006@atmel.com>
Date: Wed, 15 Dec 2010 14:43:55 +0100
From: Nicolas Ferre <nicolas.ferre@atmel.com>
MIME-Version: 1.0
To: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [PATCH] MTD: m25p80: add debugging trace in sst_write()
References: <1292414372-17085-1-git-send-email-nicolas.ferre@atmel.com>
	<4D08C1C8.3090100@ru.mvista.com>
In-Reply-To: <4D08C1C8.3090100@ru.mvista.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 15/12/2010 14:25, Sergei Shtylyov :
> Hello.
> 
> On 15-12-2010 14:59, Nicolas Ferre wrote:
> 
>> Add a DEBUG(MTD_DEBUG_LEVEL2, ..) trace at beginning of sst_write()
>> function as
>> it is done in m25p80_write() function.
> 
>> Signed-off-by: Nicolas Ferre<nicolas.ferre@atmel.com>
> [...]
> 
>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>> index bf5a002..e6b5707 100644
>> --- a/drivers/mtd/devices/m25p80.c
>> +++ b/drivers/mtd/devices/m25p80.c
>> @@ -482,6 +482,10 @@ static int sst_write(struct mtd_info *mtd, loff_t
>> to, size_t len,
>>       size_t actual;
>>       int cmd_sz, ret;
>>
>> +    DEBUG(MTD_DEBUG_LEVEL2, "%s: %s %s 0x%08x, len %zd\n",
>> +            dev_name(&flash->spi->dev), __func__, "to",
> 
>    What's the point of printing "to" as variable? :-)

Good question... Maybe a way to have the same shape of messages...

In my patch it is for sure to comply with this driver way of dealing
with DEBUG messages.
It is "to" in this function like its sister m25p80_write(). But it is
also "from" or "at" in others...

>> +            (u32)to, len);
>> +

Cheers,
-- 
Nicolas Ferre
