Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b1DbJ-0003s5-L9
 for linux-mtd@lists.infradead.org; Fri, 13 May 2016 13:57:58 +0000
Subject: Re: UBIFS automatic recovery
To: Johan Borkhuis <maillist@borkhuis.com>
References: <29b499402bf5243cadea2c294833cd36.squirrel@www.borkhuis.com>
 <CAFLxGvwDGBnf61eco1tQwRCC_BvUZTBF0Q4bLpB74JkRb3JP2g@mail.gmail.com>
 <ca3ebf4848d4ed80b1f98b3677dc765e.squirrel@www.borkhuis.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <5735DD4C.4030409@nod.at>
Date: Fri, 13 May 2016 15:57:32 +0200
MIME-Version: 1.0
In-Reply-To: <ca3ebf4848d4ed80b1f98b3677dc765e.squirrel@www.borkhuis.com>
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

Johan,

Am 13.05.2016 um 12:27 schrieb Johan Borkhuis:
>> This should not happen. Either the UBIFS is broken and not mountable
>> or it can recover.
>> Something else seems to interact here.
> 
> This was also what I was expecting, and why I was surprised when units
> started to recover.

Maybe a temporary issue with your NAND.

>>> When it fails it shows the following during a mount (also shown
>>> sometimes for LEB 3 and 6):
>>> UBIFS: recovery needed
>>> UBIFS error (pid 640): ubifs_recover_log_leb: unrecoverable log
>>> corruption
>>> in LEB 5
>>>
>>> Another UBIFS message I see during a failed mount is:
>>> UBIFS error (pid 637): ubifs_recover_master_node: dumping first master
>>> node
>>>
>>> As long the mount fails the same message is repeated.
>>
>> UBIFS must not break due to power cuts.
>> So, something else is broken.
>> Do both MTD and UBI tests pass?
> 
> You mean the kernel startup? Or some specific MTD/UBI test tools?
> On startup there is no difference in the console-output between a good and
> bad startup, so MTD and UBI are initialised correctly. The first sign is
> the fact that a mount fails.

In the kernel tree we have a set of tests, MTD tests.
See CONFIG_MTD_TESTS.
UBI tests are part of the mtd-utils source package.

>>> Or is there another way to fix/repair a broken partition without loosing
>>> the data that is stored on it?
>>
>> No. What you need is figuring out *why* UBIFS breaks while doing
>> power cuts. Both UBI and UBIFS are power cut aware by design.
>> In most cases UBIFS suffers from MTD problems. May it a faulty driver
>> or bad hardware...
> 
> We are using a Micon 2Mb flash chip and the kernel sources from TI. The
> output during boot:
> omap2-nand driver initializing
> NAND device: Manufacturer ID: 0x2c, Chip ID: 0xca (Micron )
> Creating 6 MTD partitions on "omap2-nand.0":

*maybe* a driver issue.
First of all you need to find out what exactly is broken.
i.e. analyze the contents of the NAND upon failure.

Thanks,
//richard
