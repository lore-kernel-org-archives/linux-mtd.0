Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SDmlY-0003e9-Vz
 for linux-mtd@lists.infradead.org; Sat, 31 Mar 2012 01:06:05 +0000
Message-ID: <4F765873.6090209@newsguy.com>
Date: Fri, 30 Mar 2012 18:05:55 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 4/4] MTD: drivers return max_bitflips, mtd returns -EUCLEAN
References: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
 <1331500873-9792-5-git-send-email-mikedunn@newsguy.com>
 <CAN8TOE_Zwg1evBBCSY3zcV6=O07WVyXf2ZOtgf7qgKGLUBcBrQ@mail.gmail.com>
In-Reply-To: <CAN8TOE_Zwg1evBBCSY3zcV6=O07WVyXf2ZOtgf7qgKGLUBcBrQ@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <David.Woodhouse@intel.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/29/2012 10:30 AM, Brian Norris wrote:
> On Sun, Mar 11, 2012 at 2:21 PM, Mike Dunn <mikedunn@newsguy.com> wrote:
>> The drivers' read methods, absent an error, return a non-negative integer
>> indicating the maximum number of bit errors that were corrected in any one
>> writesize region.  MTD returns -EUCLEAN if this is >= euclean_threshold, 0
>> otherwise.  Note that this is a subtle change to the driver interface.
>>
>> This and the preceeding patches in this set were tested ubi on top of the
>> nandsim and docg4 devices, running the ubi test io_basic from mtd-utils.
> 
> Did you test any non-NAND devices? I'm getting the feeling that some
> of this is misguided or at least needs some fixing. See below.


No, not tested on non-nand yet.


> 
>> We may want to also change the name of the macro mtd_is_bitflip(), since this is
>> not really correctly named anymore.
> 
> What sort of name change? Shouldn't EUCLEAN still mean bitflip? We are
> just masking the bitflips below a threshold. Anyway, if you have a
> better name, bring it up! I think I changed the name from my original
> choice based on Artem's suggestions, so I'm open to anything with more
> merit :)
> 
>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>> index 5bbd717..6871658 100644
>> --- a/drivers/mtd/mtdcore.c
>> +++ b/drivers/mtd/mtdcore.c
>> @@ -789,12 +789,24 @@ EXPORT_SYMBOL_GPL(mtd_get_unmapped_area);
>>  int mtd_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
>>             u_char *buf)
>>  {
>> +       int ret_code;
>>        *retlen = 0;
>>        if (from < 0 || from > mtd->size || len > mtd->size - from)
>>                return -EINVAL;
>>        if (!len)
>>                return 0;
>> -       return mtd->_read(mtd, from, len, retlen, buf);
>> +
>> +       /*
>> +        * In the absence of an error, drivers return a non-negative integer
>> +        * representing the maximum number of bitflips that were corrected on
>> +        * any one writesize region (typically a NAND page).
>> +        */
>> +       ret_code = mtd->_read(mtd, from, len, retlen, buf);
>> +
>> +       if (unlikely(ret_code < 0))
>> +               return ret_code;
>> +
>> +       return ret_code >= mtd->euclean_threshold ? -EUCLEAN : 0;
>>  }
> 
> This seems wrong in the case that mtd->euclean_threshold == 0. 


You are correct!  Thanks.  Devices with no ecc (for which euclean_threshold ==
0) will always return 0 (absent an error), which will result in mtd always
returning -EUCLEAN.  Oops! Thanks again.


> This could be the case for any of the following:
> (1) NAND that uses ECC_NONE
> (2) NAND drivers with HW_ECC that don't initialize chip->ecc.strength
> (3) MTD without ECC (e.g., NOR)
> (4) Other drivers that might have missed initializing mtd->ecc_strength
> 
> Regarding (1): although ECC_NONE is not recommended, it's possible. I
> don't think this deserves an EUCLEAN message.
> 
> Regarding (2): I notice that your nand_base.c code (patch 2) leaves
> ecc.strength initialization up to the driver. I think a sanity check
> could be provided in those cases. For instance, in the NAND_ECC_HW*
> cases, you could warn or error out on 'chip->ecc.strength == 0'.


Yes, I'll include sanity checks in next patches.


> If I'm correct, (3) is quite significant, since non-ECC'd MTDs would
> produce EUCLEAN statuses on every read.


Yup.  Again, oops!

Artem, what are your thoughts on fixing these patches, given that many nand
drivers will have to be touched?  I'm willing to see it through.

Thanks again Brian,
Mike
