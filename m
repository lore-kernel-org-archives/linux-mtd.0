Received: from 11.mo7.mail-out.ovh.net ([87.98.173.157])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffAa5-00078k-C4
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2018 20:58:55 +0000
Received: from player693.ha.ovh.net (unknown [10.109.160.54])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 7C970B8F94
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2018 22:58:31 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Mon, 16 Jul 2018 22:58:19 +0200
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH RFC API ONLY] mtd: get parsers from lookup table
In-Reply-To: <20180716182312.74fc55a9@bbrezillon>
References: <20180716111712.7636-1-zajec5@gmail.com>
 <20180716182312.74fc55a9@bbrezillon>
Message-ID: <1b51d369d433ae0093ba4dac1062c9e0@milecki.pl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2018-07-16 18:23, Boris Brezillon wrote:
> Hi Rafal,
> 
> On Mon, 16 Jul 2018 13:17:12 +0200
> Rafał Miłecki <zajec5@gmail.com> wrote:
> 
>> From: Rafał Miłecki <rafal@milecki.pl>
>> 
>> Existing implementation of specifying flash device parsers became a 
>> bit
>> hacky and needs a cleanup. Currently it requires:
>> 1) Passing parsers in a custom platform data by arch code
>> or
>> 2) Hardcoding parsers table in a flash driver
>> 
>> The purpose of the new implementation is to:
>> 1) Clean up flash drivers
>> 2) Have a generic solution
>> 3) Avoid code duplication
>> 
>> That new implementation assigns table of parsers to a MTD's parent
>> device. That way flash driver doesn't have to take care of passing
>> parsers. It's inspired by GPIO lookup table.
>> 
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>> It's obviously a RFC patch only. It doesn't really implement anything.
>> It DOESN'T COMPILE.
>> 
>> I'd like to know if you like this idea and if it's worth for me to
>> actually spend time implementing it.
> 
> I love the idea. Actually, I'd like to extend that to fixed partition
> definitions (those passed to mtd_device_register()) so that they can be
> parsed by the fixed-partition parser (the one already taking care of
> compatible = "fixed-partitions").

That was something I planned to handle next, so it's great to hear we
share the ideas for further improvements! That will extremely simplify
mtd_device_register().


> One comment below.
> 
>> ---
>>  arch/arm/mach-pxa/corgi.c | 21 +++++++++++++--------
>>  drivers/mtd/mtdpart.c     |  4 ++++
>>  2 files changed, 17 insertions(+), 8 deletions(-)
>> 
>> diff --git a/arch/arm/mach-pxa/corgi.c b/arch/arm/mach-pxa/corgi.c
>> index 9a5a35e90769..0ff77e078d2b 100644
>> --- a/arch/arm/mach-pxa/corgi.c
>> +++ b/arch/arm/mach-pxa/corgi.c
>> @@ -615,16 +615,8 @@ static struct nand_bbt_descr sharpsl_bbt = {
>>  	.pattern = scan_ff_pattern
>>  };
>> 
>> -static const char * const probes[] = {
>> -	"cmdlinepart",
>> -	"ofpart",
>> -	"sharpslpart",
>> -	NULL,
>> -};
>> -
>>  static struct sharpsl_nand_platform_data sharpsl_nand_platform_data = 
>> {
>>  	.badblock_pattern	= &sharpsl_bbt,
>> -	.part_parsers		= probes,
>>  };
>> 
>>  static struct resource sharpsl_nand_resources[] = {
>> @@ -688,6 +680,16 @@ static struct i2c_board_info __initdata 
>> corgi_i2c_devices[] = {
>>  	{ I2C_BOARD_INFO("wm8731", 0x1b) },
>>  };
>> 
>> +static struct mtd_parser_lookup_table corgi_mtd_parser_lookup_table = 
>> {
>> +	.dev_name = NULL, /* Set with registered name */
> 
> Can't you guess the device name? It's really weird that you have to
> register the lookup table after the device has been registered. I
> already had a similar discussion on GPIO lookup tables registration on
> ams-delta here [1], and I think my comments apply to this case as well.
> 
> (...)
> 
> [1]https://patchwork.ozlabs.org/patch/920798/

Thanks for link to that discussion!

I saw a possible race problem regarding registering lookup table and
probing a platform (?) device/driver. I thought we can just depend on
arch code being executed very early.

Your solution with guessing device name should work in 99% of cases. If
you ls /sys/devices/platform/, you'll see that names are assigned using
name.<index> pattern.

In 99% cases there is only one place in the code registering a given
platform device. As there is only one place registering "sharpsl-nand"
device, we can assume the resulting name will be "sharpsl-nand.0".

If there was another code doing the same, you couldn't know if you
should expect "sharpsl-nand.0" or "sharpsl-nand.1".

I believe we should be fine guessing in these 99% cases and only depend
on order (semi-risking a race) in that 1% (or less).
