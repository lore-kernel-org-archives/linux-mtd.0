Received: from borkhuis.xs4all.nl ([212.238.181.189] helo=borkhuis.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b1AEH-0001u5-QA
 for linux-mtd@lists.infradead.org; Fri, 13 May 2016 10:21:58 +0000
Message-ID: <ca3ebf4848d4ed80b1f98b3677dc765e.squirrel@www.borkhuis.com>
In-Reply-To: <CAFLxGvwDGBnf61eco1tQwRCC_BvUZTBF0Q4bLpB74JkRb3JP2g@mail.gmail.com>
References: <29b499402bf5243cadea2c294833cd36.squirrel@www.borkhuis.com>
 <CAFLxGvwDGBnf61eco1tQwRCC_BvUZTBF0Q4bLpB74JkRb3JP2g@mail.gmail.com>
Date: Fri, 13 May 2016 12:27:35 +0200
Subject: Re: UBIFS automatic recovery
From: "Johan Borkhuis" <maillist@borkhuis.com>
To: "Richard Weinberger" <richard.weinberger@gmail.com>
Cc: "Johan Borkhuis" <maillist@borkhuis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Richard,

Thanks for your quick response!

> On Fri, May 13, 2016 at 10:47 AM, Johan Borkhuis <maillist@borkhuis.com>
> wrote:
>> However, when I continue to pull the power on a system with a broken
>> partition (without running the test-application, this is only started
>> when
>> all partitions are mounted correctly) after some time (this can be a few
>> reboots, or a couple of 100 reboots) the system fixes the partition
>> itself, and I can access the data again, without any indications in the
>> log.
>
> This should not happen. Either the UBIFS is broken and not mountable
> or it can recover.
> Something else seems to interact here.

This was also what I was expecting, and why I was surprised when units
started to recover.

>> When it fails it shows the following during a mount (also shown
>> sometimes for LEB 3 and 6):
>> UBIFS: recovery needed
>> UBIFS error (pid 640): ubifs_recover_log_leb: unrecoverable log
>> corruption
>> in LEB 5
>>
>> Another UBIFS message I see during a failed mount is:
>> UBIFS error (pid 637): ubifs_recover_master_node: dumping first master
>> node
>>
>> As long the mount fails the same message is repeated.
>
> UBIFS must not break due to power cuts.
> So, something else is broken.
> Do both MTD and UBI tests pass?

You mean the kernel startup? Or some specific MTD/UBI test tools?
On startup there is no difference in the console-output between a good and
bad startup, so MTD and UBI are initialised correctly. The first sign is
the fact that a mount fails.

>> Or is there another way to fix/repair a broken partition without loosing
>> the data that is stored on it?
>
> No. What you need is figuring out *why* UBIFS breaks while doing
> power cuts. Both UBI and UBIFS are power cut aware by design.
> In most cases UBIFS suffers from MTD problems. May it a faulty driver
> or bad hardware...

We are using a Micon 2Mb flash chip and the kernel sources from TI. The
output during boot:
omap2-nand driver initializing
NAND device: Manufacturer ID: 0x2c, Chip ID: 0xca (Micron )
Creating 6 MTD partitions on "omap2-nand.0":
....

Regards,
    Johan
