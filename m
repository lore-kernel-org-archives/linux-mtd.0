Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SDlpL-0002J3-Ef
 for linux-mtd@lists.infradead.org; Sat, 31 Mar 2012 00:05:56 +0000
Message-ID: <4F764A59.1030908@newsguy.com>
Date: Fri, 30 Mar 2012 17:05:45 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 2/4] MTD: flash drivers set ecc strength
References: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
 <1331500873-9792-3-git-send-email-mikedunn@newsguy.com>
 <CAN8TOE_BxgTMJb0beyDC17jcmavmuz0WGvLw3NbJRCiuvB4VnA@mail.gmail.com>
In-Reply-To: <CAN8TOE_BxgTMJb0beyDC17jcmavmuz0WGvLw3NbJRCiuvB4VnA@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Ivan Djelic <ivan.djelic@parrot.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/29/2012 10:24 AM, Brian Norris wrote:
> Hi Mike, Artem, David,
> 
> Sorry for the late review here. It looks like this is already queued
> up for merging soon by David...


Thanks for having a look Brian.


> (BTW, patch 1 and 2 seem to do nothing by themselves; should they
> really be merged in the 3.4 window?)


Correct; it's just cruft currently.  There is a flaw in the patchset that was
pointed out by Ivan.  Basically, the threshold should be determined based on the
ecc strength of each ecc step, not on the aggregate ecc strength of the entire
page.  Since no one is clamoring for this change, I figured I'd wait until this
merge window passed before following up.  Fixing this flaw will require patching
many individual drivers.  The scope of the original patches was limited to the
nand infrastructure code.


> 
> On Sun, Mar 11, 2012 at 2:21 PM, Mike Dunn <mikedunn@newsguy.com> wrote:
>> Flash device drivers initialize 'ecc_strength' in struct mtd_info, which is the
>> maximum number of bit errors that can be corrected in one writesize region.
>>
>> Drivers using the nand interface intitialize 'strength' in struct nand_ecc_ctrl,
>> which is the maximum number of bit errors that can be corrected in one ecc step.
>> Nand infrastructure code translates this to 'ecc_strength'.
>>
>> Also for nand drivers, the nand infrastructure code sets ecc.strength for ecc
>> modes NAND_ECC_SOFT, NAND_ECC_SOFT_BCH, and NAND_ECC_NONE.  It is set in the
>> driver for all other modes.
> 
> I agree that the other modes should be set by the driver, but is there
> any kind of sanity check? We've seen problems with the addition of the
> mtd->writebufsize parameter that didn't get caught as uninitialized in
> a large number of drivers. I don't think your later patches handle the
> case that mtd->ecc_strength is not initialized or is 0.


I'll look into adding sanity checks.


> 
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index 1e907dc..8008853 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -3350,6 +3350,7 @@ int nand_scan_tail(struct mtd_info *mtd)
>>                if (!chip->ecc.size)
>>                        chip->ecc.size = 256;
>>                chip->ecc.bytes = 3;
>> +               chip->ecc.strength = 1;
>>                break;
>>
>>        case NAND_ECC_SOFT_BCH:
>> @@ -3384,6 +3385,8 @@ int nand_scan_tail(struct mtd_info *mtd)
>>                        pr_warn("BCH ECC initialization failed!\n");
>>                        BUG();
>>                }
>> +               chip->ecc.strength =
>> +                       chip->ecc.bytes*8 / fls(8*chip->ecc.size);
> 
> Isn't this spacing against coding style? I'd suggest spaces around the
> '*'. Also, after a few minutes, I have no idea where this calculation
> comes from. But I'm not familiar with SOFT_BCH. Maybe a comment is in
> order?
> 
>> @@ -3397,6 +3400,7 @@ int nand_scan_tail(struct mtd_info *mtd)
>>                chip->ecc.write_oob = nand_write_oob_std;
>>                chip->ecc.size = mtd->writesize;
>>                chip->ecc.bytes = 0;
>> +               chip->ecc.strength = 0;
>>                break;
> 
> This will cause problems with your patch 4, I think. I'll comment on
> the other email.
> 
> Brian
> 
> 
