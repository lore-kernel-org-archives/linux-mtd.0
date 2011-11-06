Received: from smtp.newsguy.com ([74.209.136.69])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RN8P3-00041X-6l
 for linux-mtd@lists.infradead.org; Sun, 06 Nov 2011 19:29:15 +0000
Message-ID: <4EB6EDDE.7020603@newsguy.com>
Date: Sun, 06 Nov 2011 12:28:14 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: Re: ubi on MLC nand flash
References: <4EB6A6A8.7010703@newsguy.com> <20111106173528.GA25467@parrot.com>
In-Reply-To: <20111106173528.GA25467@parrot.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi and thanks again, Ivan,

On 11/06/2011 09:35 AM, Ivan Djelic wrote:
> On Sun, Nov 06, 2011 at 03:24:24PM +0000, Mike Dunn wrote:
>> Hi everyone,
>>
>> I recently started to do serious testing of UBI on the diskonchip G4 MLC nand
>> driver I'm finishing up.  I started with the io_basic ubi test in mtd-utils. 
>> What I find is that, after a few minutes, enough PEBs are marked as bad to
>> exhaust the reserve PEB pool, UBI switches to r/o mode, and the test fails.  The
>> reason is that - on this device at least - bit flips seem to be persistent;
>> i.e., you will get e.g. 1 bit flip every time you read a certain page. 
>> Consequently, when the bit flip occurs and the PEB gets scrubbed, the torture
>> test fails because the bit flip reoccurs, and the PEB is marked bad.
> Hi Mike,
> I had the same results on recent (34 nm) SLC devices.
>  
>> I expected that eventually I might have to dig into the "program disturb",
>> "read-disturb" or "paired pages" MLC issues, but the problem seems more
>> fundamental.  My general impression is that UBI is too unforgiving for this
>> device.  The ecc can correct up to 4 bit flips, so 1 bit flip seems to not be a
>> big deal.  I'm new to UBI so this is not a critique or a proposal, I'm just
>> hoping some experts can offer some advice or opinions.  The obvious remedy is to
>> set a higher threshold for marking a PEB as bad, say 2 or 3 bit flips.
> I discussed the matter with a nand manufacturer a while ago; the information I
> could get (for SLC devices, not MLC) can be summarized as follows:
>
> 1. A block should be marked bad if a number of bitflips greater than what ecc
> is able to correct has been detected after erase/program; or if the operation
> failed with a status error
>
> 2. If the maximum number of correctable bitflips is reached during a read
> operation, data should be relocated to another block, without marking the block
> as bad
>
> I could not get definitive information about the handling of persistent
> bitflips, apart from the fact that they are expected and should not cause a
> block to be marked as bad (as long as the ecc capability is not exceeded).
> Most nand datasheets I had in my hands are also vague on the subject; they lack
> a precise error handling strategy description for multi-bitflip devices.
>
> Point 2 above seems reasonable as long as bitflips are reversible (i.e.
> cancelled by an erase operation); but what if the maximum number of correctable
> errors is reached during a read, those errors being caused by persistent
> bitflips ? Should the block be considered bad (IMHO it should be scrubbed then
> marked bad), or should data be simply relocated ?
> When I asked the latter question to a nand manufacturer, his recommendation
> was (quoting):
> "(...) not to mark the block bad (because the error is correctable), and
> to keep a copy of critical data in another location as backup" (!).


Assign each block a reliability rating, and data a criticality rating?  UBI and
file I/O would get pretty bureaucratic.    :-) 


> I suggest the following strategy:
>
> Upon reading, when errors are detected (and corrected by ecc):
>  - if (nb of errors <  ecc capability (*)) then no scrubbing, do nothing
>  - if (nb of errors == ecc capability (*)) then
>     - scrub block, then torture it and compute nb of persistent bitflips
>     - if (nb of persistent errors <  ecc capability (*)) then block is OK
>     - if (nb of persistent errors == ecc capability (*)) then mark block as bad
>       [because a single additional bitflip (e.g. a read disturb) would cause
>       data loss]
>
> (*) In order to improve reliability, thresholds can be used instead of max ecc
> capability.


One wrinkle is that the torture test is performed over the entire erase block,
not just the page(s) with the correctible error(s).  So the biflip stats are
cumulative over the entire block, and may not even occur on the same page.  The
current UBI policy for the torture test is that *any* bitflips on *any* page
following the erasure causes the block to be marked bad.

Another complication is that there's currently no way to accurately determine in
the UBI code the number of bitflips the read operation caused.  Currently the
occurrence of bitflips (one or more) is determined by the return code from the
mtd subsystem, which has exclusive access to the device during the read
operation.  Just checking the ecc_stats field in the mtd_info structure could
include errors in read operations performed by other processes.


> I'm interested to hear opinions from mtd users/nand experts on the subject; I
> know that at least a few of us had to implement ecc thresholds recently. And
> UBI/mtd should be modified to support this (IIRC Artem was pushing in that
> direction a while ago).
>
>

Thanks,
Mike
