Received: from [2a01:4f8:131:30e2::2] (helo=nbd.name)
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T6gF2-0006r8-51
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2012 11:15:25 +0000
Message-ID: <503DF956.6030308@openwrt.org>
Date: Wed, 29 Aug 2012 13:13:26 +0200
From: John Crispin <blogic@openwrt.org>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] mtd: m25p80: add support for the EON EN25Q64 chip
References: <1345970251-2029-1-git-send-email-juhosg@openwrt.org>
 <1346238245.2848.468.camel@sauron.fi.intel.com>
In-Reply-To: <1346238245.2848.468.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Gabor Juhos <juhosg@openwrt.org>, emong@vip.qq.com,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 29/08/12 13:04, Artem Bityutskiy wrote:
> On Sun, 2012-08-26 at 10:37 +0200, Gabor Juhos wrote:
>> Signed-off-by: Gabor Juhos <juhosg@openwrt.org>
>> ---
>>  drivers/mtd/devices/m25p80.c |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>> index 5d0d68c..d812552 100644
>> --- a/drivers/mtd/devices/m25p80.c
>> +++ b/drivers/mtd/devices/m25p80.c
>> @@ -638,6 +638,7 @@ static const struct spi_device_id m25p_ids[] = {
>>  	{ "en25p32", INFO(0x1c2016, 0, 64 * 1024,  64, 0) },
>>  	{ "en25q32b", INFO(0x1c3016, 0, 64 * 1024,  64, 0) },
>>  	{ "en25p64", INFO(0x1c2017, 0, 64 * 1024, 128, 0) },
>> +	{ "en25q64", INFO(0x1c3017, 0, 64 * 1024, 128, SECT_4K) },
> I've already pushed a similar patch from "John Crispin
> <blogic@openwrt.org>", but it did not have "SECT_4K". So I am not
> picking this one.
>

Hi Artem,

the patch is based on this ticket ->
https://dev.openwrt.org/ticket/12077

i verified it against the datasheet. the datasheet indicates that
SECT_4K should work, but as the patch was only runtime tested without
the SECT_4K i did not add it.

Gabor told me that the SECT_4K was runtime tested on the en25q32 which
is from the same family.

I have put the submitter of  patch in CC, maybe he can test with the
SECT_4K set.

Thanks,
John
