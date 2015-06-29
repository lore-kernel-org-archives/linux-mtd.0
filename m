Received: from gproxy9-pub.mail.unifiedlayer.com ([69.89.20.122])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z9eFL-0004NJ-Ue
 for linux-mtd@lists.infradead.org; Mon, 29 Jun 2015 18:57:37 +0000
Message-ID: <559194D8.30001@tanglebridge.com>
Date: Mon, 29 Jun 2015 11:56:24 -0700
From: Willem Atsma <willem.atsma@tanglebridge.com>
MIME-Version: 1.0
To: pekon <pekon@pek-sem.com>
Subject: Re: [PATCH] Bug fix in kernel nand driver code for ONFI flash with
 unconfigured buswidth
References: <1435276006-804-1-git-send-email-willem.atsma@tanglebridge.com>
 <55918E99.4030701@pek-sem.com>
In-Reply-To: <55918E99.4030701@pek-sem.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thank you for reviewing my patch and the feedback. I understand I am 
creating a "false pass" and that the check is in fact needed to ensure 
the initial setup was correct.  My patch incorrectly fixes this bug as 
configuration fails without a fix.

With the nand I have the configuration will succeed under the following 
conditions:

  - I force ONFI to fail (i.e. make nand_flash_detect_onfi() return 0)
  - Set the options structure as indicated (and create the false pass).

In nand_get_flash_type() a successful call to nand_flash_detect_onfi() 
results in a jump to ident_done, skipping code that would otherwise 
correctly initialize the chip, including buswidth. This suggested to me 
that:

  - the driver configuration is correctly configured;
  - failure results from (in this instance) inappropriate comparison 
between ONFI setting and buswidth setting done up to this point.

 From this I understand that the driver setting should have been set to 
NAND_BUSWIDTH_AUTO. The chip can in fact handle either 8 or 16 and is 
connected with 16.

Where do I correct/find DT and/or platform-data?

With thanks,

Willem


On 15-06-29 11:29 AM, pekon wrote:
> Hi Willem,
>
> On Friday 26 June 2015 05:16 AM, Willem Atsma wrote:
>> Previously, when ONFI configuration succeeds the driver configuration 
>> might
>> still fail in the calling function nand_get_flash_type() if the
>> chip->options was not configured for the detected busw (8 or 16bit). 
>> With
>> ONFI present the hardware driver does not need to be configured. However
>> downstream the driver uses the chip->options field, so this patch 
>> updates
>> the bits when ONFI detection succeeds.
>>
>> This fixes nand driver configuration on the overo-earth platform with
>> micron nand flash.
>>
>> Signed-off-by: Willem Atsma <willem.atsma@tanglebridge.com>
>> ---
>>   drivers/mtd/nand/nand_base.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index ceb68ca..7b20471 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -3218,6 +3218,11 @@ static int nand_flash_detect_onfi(struct 
>> mtd_info *mtd, struct nand_chip *chip,
>>       else
>>           *busw = 0;
>>
>> +    /* Set the chip option here since ONFI succeeded and non-ONFI 
>> config may
>> +     * be incomplete:
>> +     */
>> +    chip->options |= *busw;
>> +
>>       if (p->ecc_bits != 0xff) {
>>           chip->ecc_strength_ds = p->ecc_bits;
>>           chip->ecc_step_ds = 512;
>>
> This patch actually causes a false-pass to the following check when 
> Hardware driver incorrectly configures NAND-device width.
>
> nand_base.c @@nand_get_flash_type(...)
> ------------------------------------------------------
> } else if (busw != (chip->options & NAND_BUSWIDTH_16)) {
>         /*
>          * Check, if buswidth is correct. Hardware drivers should set
>          * chip correct!
>          */
>         pr_info("device found, Manufacturer ID: 0x%02x, Chip ID: 
> 0x%02x\n",
>             *maf_id, *dev_id);
>         pr_info("%s %s\n", nand_manuf_ids[maf_idx].name, mtd->name);
>         pr_warn("bus width %d instead %d bit\n",
>                (chip->options & NAND_BUSWIDTH_16) ? 16 : 8,
>                busw ? 16 : 8);
>         return ERR_PTR(-EINVAL);
>     }
> ------------------------------------------------------
>
> This check was added to find out if there is any mis-match because 
> driver's bus-width and actual device's bus-width
> (a) Driver setting (from DT or platform-data) is in chip->options
> (b) Actual NAND device-width as detected from ONFI params is in *busw.
>
> This check was explicitly added as some controllers like GPMC need to 
> be pre-configured via DT or platform-data with correct bus-width even 
> before the nand_probe(). So nand_probe() should check that both (a) 
> and (b) are matching.
>
> Hence, updating chip->options just after ONFI detection is not 
> correct. Anyways NAND driver is not doing any other access apart from 
> ONFI reads so existing implementation should be okay.
>
> Also, as per spec all ONFI reads should work at x8 bus-width. Refer
>     commit 64b37b2a63eb2f80b65c7185f0013f8ffc637ae3
>     Author:     Matthieu CASTET <matthieu.castet at parrot.com>
>     mtd: nand: add NAND_BUSWIDTH_AUTO to autodetect bus width
>
>
> with regards, pekon

-- 
Willem Atsma, PhD
R&D Consultant
Willem.Atsma@tanglebridge.com

Tanglebridge Research
www.tanglebridge.com
