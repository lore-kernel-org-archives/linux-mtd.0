Received: from smtp.newsguy.com ([74.209.136.69])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RNxXb-0000gT-6n
 for linux-mtd@lists.infradead.org; Wed, 09 Nov 2011 02:05:28 +0000
Message-ID: <4EB9EDB7.7000600@newsguy.com>
Date: Tue, 08 Nov 2011 19:04:23 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: ubi on MLC nand flash
References: <4EB6A6A8.7010703@newsguy.com>	
 <20111106173528.GA25467@parrot.com> <4EB6EDDE.7020603@newsguy.com>
 <1320788720.17770.43.camel@koala>
In-Reply-To: <1320788720.17770.43.camel@koala>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Ivan Djelic <ivan.djelic@parrot.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/08/2011 01:45 PM, Artem Bityutskiy wrote:
> On Sun, 2011-11-06 at 12:28 -0800, Mike Dunn wrote:
>>> I suggest the following strategy:
>>>
>>> Upon reading, when errors are detected (and corrected by ecc):
>>>  - if (nb of errors <  ecc capability (*)) then no scrubbing, do nothing
>>>  - if (nb of errors == ecc capability (*)) then
>>>     - scrub block, then torture it and compute nb of persistent bitflips
>>>     - if (nb of persistent errors <  ecc capability (*)) then block is OK
>>>     - if (nb of persistent errors == ecc capability (*)) then mark block as bad
>>>       [because a single additional bitflip (e.g. a read disturb) would cause
>>>       data loss]
>>>
>>> (*) In order to improve reliability, thresholds can be used instead of max ecc
>>> capability.
>>
>> One wrinkle is that the torture test is performed over the entire erase block,
>> not just the page(s) with the correctible error(s).  So the biflip stats are
>> cumulative over the entire block, and may not even occur on the same page.  The
>> current UBI policy for the torture test is that *any* bitflips on *any* page
>> following the erasure causes the block to be marked bad.
>>
>> Another complication is that there's currently no way to accurately determine in
>> the UBI code the number of bitflips the read operation caused.  Currently the
>> occurrence of bitflips (one or more) is determined by the return code from the
>> mtd subsystem, which has exclusive access to the device during the read
>> operation.  Just checking the ecc_stats field in the mtd_info structure could
>> include errors in read operations performed by other processes.
> What about something like this.
>
> 1. MTD knows flash's ECC strength (driver sets it)
> 2. MTD sets the scrub level = ECC strength by default
> 3. MTD can expose the scrub level and ECC strength via sysfs and make
>    the scrub level sysfs file writable, so the user can vary it between
>    1 and ECC strength.
> 4. MTD just does not report -EUCEAN if the ECC correction order is
>    less than the scrub level.
>
> Then you do not need to change UBI at all.


That sounds reasonable, but the changes seem broadly consequential.


> WRT blank pages, I guess MTD can gain some internal smartness as well -
> the driver can report to the NAND base that a blank page was read, and
> the ECC correction order, then NAND base will make the decision about
> reporting -EUCLEAN and setting the buffer to all 0xFFs.


I haven't yet surveyed the other drivers regarding ecc and blank page reading. 
I assumed that ecc was disregarded for blank pages, but probably some drivers
are more thoughtful about it than I originally was.


> Also, it sounds like this may require re-working the current MTD
> interface and turn all these function pointers (mtd->read(), etc) into
> normal functions (mtd_read()) which will allow inserting additional
> logic at various levels.


Oofa.  What have I gotten myself into?  I don't have all those devices on which
to test the changes, and I'd hate to break a driver.  But you're right.  Both
mtd and nand interfaces would have to change to provide a mechanism for
returning an error count (corrected or uncorrected) to some
yet-to-be-implemented mtd infrastructure code.  Drivers that don't use the NAND
interface currently return -EUCLEAN directly to the higher layer (e.g. UBI). 
For drivers using the nand interface, nand_base.c handles it. 


> WRT ecc_stats  - IMHO, it is useless and rudimentary thing and could be
> just killed...


Some userspace mtd-utils for nand currently use it, though.

I'm able to at least look into making these changes if you want to go ahead.  My
motivation is to get a robust ubifs on my diskonchip G4.

Thanks,
Mike
