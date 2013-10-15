Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VW5S4-00018a-FY
 for linux-mtd@lists.infradead.org; Tue, 15 Oct 2013 14:18:25 +0000
Message-ID: <525D4E87.7010908@newsguy.com>
Date: Tue, 15 Oct 2013 07:17:43 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: "Shah, Minal" <minal.shah@ti.com>
Subject: Re: MTD utils v1.5.0: MEMERASE64 ioctl failed error
References: <566CE8F1DB913147957287757DA6396B3E9D5FD4@DBDE04.ent.ti.com>
 <20131011222459.GQ23337@ld-irv-0074.broadcom.com>
 <566CE8F1DB913147957287757DA6396B3E9D6A93@DBDE04.ent.ti.com>
In-Reply-To: <566CE8F1DB913147957287757DA6396B3E9D6A93@DBDE04.ent.ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Mike Frysinger <vapier@gentoo.org>, "Mukherjee, Somnath" <somnath@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, Brian Norris <computersforpeace@gmail.com>, "Parikh,
 Urmil" <urmil@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/15/2013 01:32 AM, Shah, Minal wrote:
> Hi Brian,
> Thanks a lot for the explanation; I understood the reason for failure.
> 
>> So why do you want to erase bad blocks?
> The reason why I want to erase bad blocks is because they actually don't seem to be bad. 
> Block0 itself is shown as bad.
> I have few partitions (like MLO and u-boot env) of size equal to 1 erase block. The block is marked as bad and hence I cannot write anything to this partition. 
> One of the solutions is to increase that partition size to 2 blocks so even if 1 block is bad then it will atleast be able to write to the other block of the same partition. But I don't think I should do this while the block is not really bad (what if all the blocks for some reason are marked as bad while they are actually not).
> 
> This question came in my mind from the fact that "nand scrub" command is allowed from u-boot which allows to also completely erase all the bad blocks; so why not from the kernel level.
> 
> Regards,
> Minal
> 
> -----Original Message-----
> From: Brian Norris [mailto:computersforpeace@gmail.com] 
> Sent: Saturday, October 12, 2013 3:55 AM
> To: Shah, Minal
> Cc: Mike Frysinger; Mukherjee, Somnath; linux-mtd@lists.infradead.org; Gupta, Pekon; Parikh, Urmil
> Subject: Re: MTD utils v1.5.0: MEMERASE64 ioctl failed error
> 
> Hi Minal,
> 
> On Wed, Oct 09, 2013 at 05:05:11AM +0000, Shah, Minal wrote:
>> I am using MTD utils version 1.5.0 for DRA7 (Vayu) platform.
>>
>> I have bad blocks in some of my NAND partitions which I am not able to erase from linux kernel.
> 
> MTD does not allow erasing bad blocks. This is prohibited by NAND
> datasheets. There are occasions where, for debugging purposes, one might
> need to erase a "bad" block that is not actually bad, but MTD does not
> provide an interface for doing this. An interface for doing so was
> discussed a while back, but nothing was merged.


Yes, this is a shortcoming in mtd, I think.  Blocks can be marked as bad, but
never "un-marked".  This is the reason I needed a module parameter
"ignore_badblocks" in the docg4 driver.

But any solution is complicated by the diversity of methods for marking bad
blocks (fixed or relocatable flash table, oob marker), and various reasons why
it is so marked (factory, user).  This is why u-boot says that 'nand scrub' is
potentially "unsafe".  You have to know the internals of your device.

Mike
